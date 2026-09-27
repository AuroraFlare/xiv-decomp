# Party guildleve arrival and relogin widget

The supplied 2026-09-19 log reports player 1 teleporting from zone 155 to zone
150 while party member 12 owns running guildleve 12426. Relevant ordering:

- 15:08:57.133: client reload latch published.
- 15:08:57.176: player 1 added to the running guildleve with progress 0/6.
- 15:08:57.386: destination SetMap published.
- 15:08:59.397 onward: destination player/scene snapshots published.
- 15:09:05.197: participant removed during disconnect cleanup.
- 15:09:15.047: staged transition aborted with deferred packets discarded.

The user also reports being in the leve after relogin without its widget.
The log establishes premature participation/bootstrap during loading; it does
not contain a native crash stack or prove the exact crashing client instruction.

## Correction

`GuildleveDirector` admission now requires the player's session to be ready for
actor visibility and to own that exact player object. PartySync and explicit
join requests cannot publish director/group/widget packets during loading.
This also excludes a player still loading when another party member starts a
leve. Existing area, party, owner and ended-state admission rules remain intact.

`Player.SendZoneInGroupPacketsAfterClientReady` re-evaluates the current party's
live leve after destination readiness, when no leve director is already owned.
This applies to teleport arrival and a fresh session after relogin. No stale
director or party is captured in a delayed callback. A leve ending, a player
leaving the party, or a destination area mismatch cannot force the deferred join.

Normal admission then publishes the director, content group and current
objectives before the widget start notification. A newly admitted player skips
the additional retained-duty refresh in the same arrival callback. Existing
death Return participants continue through RefreshGuildleveAfterZoneIn without
recreating the retained duty group. Timer, objectives, roster SQL and loot rules
are unchanged.

## Verification

- Isolated Map Server/Fishing Tests build succeeded; existing build warnings
  remain. No live binaries or processes were replaced.
- `--guildleve-widget-only`: startup with 1/4/8 participants; retained Return;
  loading admission; ready arrival; fresh relogin; existing objective progress;
  unchanged owner timer; ended/left-party/session-identity rejection; late party
  sync and idempotent repeated party sync all pass.
- The new production-path fixture isolates Lua actor-binding setup and social
  party packet output. It exercises actual admission, destination callback,
  leve group serialization and ordered widget property/start packets. It is
  not a native-client rendering test.
- `--teleport-handoff-only` passed.
- Guildleve completion harness passed 58 checks, including participant isolation
  and staged camp-return routing.
- `tools/validate_guildleve_encounter_framework.ps1` passed.
- Targeted diff whitespace check passed.

Deploy a rebuilt Map Server on the affected installation. Retest teleporting
into a friend's active leve, relogging while that friend keeps it running, and
death Return. Confirm the widget appears with the existing timer/progress only
after loading completes and that the friend remains in the same running leve.
Client crash resolution and visible widget acceptance await that live retest.
