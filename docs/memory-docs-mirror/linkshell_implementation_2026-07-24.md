# Linkshell implementation handoff (2026-07-24)

## Recovered client contract

- A player can hold up to 8 linkshells; a linkshell can hold up to 128 members.
- Names are 3-31 ASCII characters: letters, digits, and single interior spaces.
  Leading, trailing, and repeated spaces are rejected.
- Crest IDs occupy the recovered 58-by-10 client range: 1-580.
- Known member ranks are guest `1`, member `4`, leader `7`, and master `10`.
  The member action UI changes ordinary members between ranks `4` and `7`.
- Recovered command IDs are:
  - `24213` NPC linkpearl chat
  - `24231` appoint/demote
  - `24232` invite
  - `24233` cancel invite
  - `24234` kick
  - `24235` resign
  - `24236` set current linkshell

## Implemented server paths

### Map server and Lua

- Added missing command-actor fallbacks for every recovered linkshell command ID.
- Added invite-by-character-name alongside invite-by-actor-ID.
- Added opaque linkshell-identifier routing for crest changes and disbanding.
- Corrected the modify packet's fixed-name boundary and expanded the modify,
  delete, and invite world packets for identifier/name payloads.
- Scoped linkshell-creation result signals to the requesting character.
- Corrected NPC linkpearl indexing, range validation, state validation, and
  calling-state authorization.

### World server

- Uses the authenticated connection session as linkshell-chat sender authority.
- Maintains each online player's client-visible linkshell slot order so that a
  linkshell can occupy different chat tabs for different players.
- Validates names, crest IDs, member limits, membership limits, ranks, and
  manager/master permissions at the mutation boundary.
- Revalidates an inviter's leader permission when an invitation is accepted.
- Supports actor-ID and character-name invites plus string and opaque linkshell
  identifiers across modify/delete/invite handlers.
- Batches member-rank work updates in groups of 16, allowing all 128 ranks to be
  synchronized without overflowing a group-work packet.
- Refreshes linkshell online presence and work values on login and logout.
- Checks persistence failures before reporting active-linkshell, join, ownership
  transfer, or leave success.

## Build validation

The following completed with zero errors on 2026-07-24:

```powershell
dotnet build 'World Server\World Server.csproj' --no-restore
dotnet build 'Map Server\Map Server.csproj' --no-restore
git diff --check
```

The builds retain the repository's existing target-framework, reference,
analyzer, and package-vulnerability warnings.

## Runtime verification checklist

1. Create linkshells with valid letters/digits/spaces and reject invalid spacing,
   punctuation, out-of-range crest IDs, duplicate names, and a ninth membership.
2. Invite an online player once by actor and once by typed name; exercise accept,
   decline, cancellation, full-player, full-linkshell, and demoted-inviter paths.
3. Give two players the same linkshell in different local slots and confirm chat
   arrives in each recipient's correct linkshell tab without sender spoofing.
