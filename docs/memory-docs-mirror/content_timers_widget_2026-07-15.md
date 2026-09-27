# FFXIV 1.x Attributes / Timers widget

## Result

The client does not keep a separate unlock bit for these rows.  Except for
Levequests, each row is controlled by one of the timestamps supplied in the
20-element `Player_work` timer array:

- `0`: hide the row.
- Nonzero and later than server time: show a countdown.
- Nonzero and equal to or earlier than server time: keep the row and show
  **Available**.

This means an expired cooldown is also the persistent evidence that the row has
been discovered.  Clearing expired values to zero was incorrect: it made a
discovered row vanish.

Levequests is the one always-visible row.  It does not use the player timer
array; `worldMaster:getGuildleveTime()` calculates the next global allowance
boundary.  Return is the inverse special case: slot 18 is in the same array but
drives the main-menu Return recast, not a row on the Timers tab.

The recovered behavior is in
`tools/outputs/lpb/decomp_further_20260617/lua/widget/statuswidget.lua` in
`StatusWidget.updateContents` and `StatusWidget.setContentsListItem`.

## Complete visual order

| Order | Client title | Content ID | Player timer slot | Normal first source of a nonzero value |
|---:|---|---:|---:|---|
| 1 | Levequests | - | - | Always shown; calculated global boundary |
| 2 | Behests | - | 16 | Speaking to a supported Battlewarden (emulator discovery rule) |
| 3 | Company Behests | - | 17 | Unresolved legacy/client-supported field |
| 4 | The Thousand Maws of Toto-Rak | 1 | 0 | Entering/finishing the instanced raid |
| 5 | Dzemael Darkhold | 2 | 1 | Entering/finishing the instanced raid |
| 6 | The Bowl of Embers | 4 | 3 | Entering/finishing the battle |
| 7 | The Bowl of Embers (Hard) | 3 | 2 | Entering/finishing the battle |
| 8 | Thornmarch | 5 | 4 | Entering/finishing the battle |
| 9 | Aurum Vale | 6 | 5 | Entering/finishing the instanced raid |
| 10 | Cutter's Cry | 7 | 6 | Entering/finishing the instanced raid |
| 11 | The Battle for Aleport | 8 | 7 | Participating in Hamlet Defense |
| 12 | The Battle for Hyrstmill | 9 | 8 | Participating in Hamlet Defense |
| 13 | The Battle for the Golden Bazaar | 10 | 9 | Participating in Hamlet Defense |
| 14 | The Howling Eye | 12 | 11 | Entering/finishing the battle |
| 15 | The Howling Eye (Hard) | 11 | 10 | Entering/finishing the battle |
| 16 | Castrum Novum Transmission Tower | 13 | 12 | Entering/finishing the battle |
| 17 | The Bowl of Embers (Extreme) | 14 | 13 | Entering/finishing the battle |
| 18 | Rivenroad | 15 | 14 | Entering/finishing the battle |
| 19 | Rivenroad (Hard) | 16 | 15 | Entering/finishing the battle |
| 20 | Skirmish | - | 19 | Participating in Skirmish |

The positive content-ID names come directly from
`docs/Dat Mining/xtx_raidDungeon.csv`.  The three Hamlet rows have additional
client logic: outside their active 25-hour phase, the ordinary cooldown is
replaced by the time until that hamlet's next defense phase in the 75-hour
rotation.

## What retail evidence says about discovery

The client only proves the timestamp rule.  Quest prerequisites establish
access to content; they are not client-side row conditions.  The likely retail
sequence is therefore **gain access -> participate -> server writes retry/end
timestamp -> row remains visible as Available after expiry**.

- Patch 1.18 introduced the tab with guildleve refresh, behest retry, and
  instanced-raid retry information.  It explicitly associates the Behests timer
  with players who participate.  Toto-Rak access came from one city's
  **Imperial Devices** quest; Dzemael access came from one city's **Into the
  Dark** quest.  Their original retry delay was five minutes.
- Bowl of Embers access was **It Kills with Fire**; Hard was **Ifrit Bleeds, We
  Can Kill It** after completing the normal quest.
- Thornmarch used **A Feast of Fools**, after **It Kills with Fire**.
- Aurum Vale and Cutter's Cry were level-45 raids.  The Patch 1.21 table lists
  completion of any **Into the Dark** as Aurum Vale's additional condition and
  no additional quest condition for Cutter's Cry.
- Howling Eye used **In for Garuda Wakening**; Hard used **Taming the Tempest**
  after completing the normal quest.
- Castrum Novum Transmission Tower is the battle in **United We Stand**.
- Bowl of Embers (Extreme) was entered through the **A Relic Reborn** chain
  after satisfying its relic conditions.
- Patch 1.23a says completing **Living on a Prayer** unlocks both Rivenroad
  repeatable battles.  Rivenroad (Hard) used the repeatable **The Raven,
  Nevermore** and had a 15-minute victory / 5-minute defeat retry.
- Hamlet Defense has the strongest explicit discovery wording: Patch 1.22b says
  a player must have participated at least once for the "next beastman strike"
  timer to appear.  The client and database keep one value per hamlet, so the
  safest reconstruction is per-hamlet discovery.
- Skirmish required level 45, four to eight players, and full Grand Company
  enlistment.  Patch 1.23 specifies 15-minute victory / 5-minute defeat retry
  delays, but does not explicitly state its row's first-appearance condition.
  The nonzero-field rule makes first participation the best-supported behavior.
- **Company Behests** is real client UI, with its own getter and timer slot, but
  no matching final-1.x producer or authoritative unlock note has been recovered
  yet.  It should be treated as a dormant/legacy-capable row, not silently
  equated with company leves.

Official patch references:

- [Patch 1.18](https://forum.square-enix.com/ffxiv/threads/17007-patch1.18-Patch-1.18-Notes)
- [Patch 1.19](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes)
- [Patch 1.21](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes?p=580985&viewfull=1)
- [Patch 1.22b](https://forum.square-enix.com/ffxiv/threads/47128?langid=2)
- [Patch 1.23](https://forum.square-enix.com/ffxiv/threads/50278-patch1.23-Patch-1.23-Notes)
- [Patch 1.23a](https://forum.square-enix.com/ffxiv/threads/51545)

## Emulator controls

The GM command `!contenttimers` reports all 20 backing slots and whether each is
hidden, available, or on cooldown.

```text
!contenttimers
!contenttimers unlockall
!contenttimers unlock behest
!contenttimers cooldown skirmish 15
!contenttimers hide companybehest
```

`unlockall` writes the stable past timestamp `1` into every zero-valued Timers
tab slot.  It deliberately does not touch Return slot 18.  The command persists
the values immediately, but the widget reads native `Player_work` getters and
the recovered `requestedData` callback has no timer handler.  Relog after a
mutation so actor initialization rebuilds the client values authoritatively.

This command reveals the UI for research without granting quests, changing
content-access flags, or pretending the unresolved Company Behests system is
implemented.

### Automatic behavior currently wired

- Speaking to a supported Battlewarden discovers the Behests row before any
  dialogue choice, including declined signup, closed recruitment, a full site,
  and an unmet minimum level. Existing cooldowns remain intact. The saved value
  is refreshed against the half-hour recruitment schedule. This is an emulator
  discovery rule added on 2026-09-13, not a claim about retail discovery.
  As with the GM command above, native client timer values currently refresh on
  player-actor initialization; relog if the newly discovered row is not visible.
- Behest registration writes the fixed 25-minute personal retry timestamp. Cancelling restores
  the exact value that existed before registration, so an older Available row
  cannot be accidentally hidden.
- Entering Toto-Rak, including joining an already-running party instance, starts
  its five-minute retry timestamp. This both enforces re-entry and discovers the
  row. Timeout refreshes the same five-minute retry.
- Beginning Hamlet Defense discovers that specific hamlet row immediately, as
  required by the Patch 1.22b participation wording. Victory or defeat later
  replaces the Available sentinel with its actual retry timestamp.
- Other listed raids, trials, Rivenroad, and Skirmish retain their recovered
  slots and debug controls, but their complete production content lifecycles are
  not yet present in this emulator. `unlockall` is therefore the intentional way
  to inspect those client rows without fabricating quest completion.

Focused verification can be run independently of the generated gathering data:

```text
dotnet run --project "Fishing Tests/Fishing Tests.csproj" -- --content-timers-only
```
