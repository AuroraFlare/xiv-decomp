# Local crafting guildleve material collection and delivery

## Evidence

The current reconstruction distinguishes two crafting commission families. The recovered journal and dialogue support a distinction between client pickup and delivery commissions, including beginner commissions whose pickup contact is at a camp. The client presentation scripts do not themselves recover the original server's material-grant timing. See the [full 152-commission pickup evidence audit](local_guildleve_pickup_evidence_2026-09-07.md) for the Manine/Ayled question, source confidence, and remaining original-footage gap.

| Family | Plate | Commissions | Materials | Finished work |
|---|---:|---:|---|---|
| `PgConv` | 20033 | 64 | Collect from the named client | Return to that client |
| `PgAeth` | 20034 | 88 | Supplied at acceptance | Deliver to the named camp contact |

The local runtime `Map Server/bin/Debug/staticactors.bin`, decoded using `Actors/StaticActors.cs`, maps every published ID to the family above. `Data/sql/gamedata_passivegl_craft.sql` supplies the delivery display-name ID and four dialogue IDs previously called `unk1` through `unk4`: welcome, supplies/incomplete, reminder, and completed delivery. These are dialogue stages, independent of the four recipe variants.

Examples from the original English client text:

- **Baderon's New Counter (120007)**: `PgConv`, Didiwai (`1400065`), text rows `361/362/363/364` in `docs/Dat Mining/pgConv.csv`. Didiwai supplies camp stock and inspects the completed work for Baderon.
- **The Mad Fisher (120017)**: `PgConv`, Bango Zango (`1400104`), rows `333/334/335/336` in `pgConv.csv`.
- **Building Bridges (120039)**: `PgAeth`, E'ptolmi (`1900056`), rows `105/107/108/106` in `docs/Dat Mining/pgAeth.csv`. The order is significant: completion uses column four, not a calculated text offset.

`tools/outputs/lpb/decomp_more_20260617/lua/quest/passiveguildleve/passiveguildlevebaseclass.lua` recovers `welcomeTalk`, `processPgEvent`, and `finishTalkTurn`. `NpcBaseClass.delegateEvent` supplies the interacting player and NPC to those functions. The server uses these original client functions and text rather than requiring a new widget or client overlay.

## Implemented behavior

- Acceptance costs one allowance and occupies one of eight local slots. The cost and commission save commit together. Only `PgAeth` starts with usable supplies.
- Talking to the correct nearby client collects `PgConv` supplies. Supplies and products remain commission state, separate from ordinary inventory and crystals.
- Requested Items synthesis requires the assigned class and tool, collected supplies, an active commission, and remaining attempts. Each synthesis saves a spent attempt before the UI opens, including canceled or interrupted attempts; only saved successes advance the requested quantity. Unused attempts can still be used after meeting the quota.
- Talking to the named client delivers completed work through an atomic reward transaction. Item stacks, durability, configured currency/EXP/merits, completion history, and commission removal commit together. Failed delivery retains the work. The publisher no longer completes commissions.
- Random reward selection persists across failed deliveries and reconnects. Further successful synthesis can change the performance result. Completion flags reload from history and are preserved when regional history is exchanged.
- Talking opens the existing quest selector for actionable local commissions, even when only one is available. Selecting a leve collects or delivers only that commission. The menu pages four entries at a time. Cancelling, in-progress work, and failed transactions leave the NPC's ordinary services available. Push/notice/emote events are not treated as deliveries.
- Collection and completion recheck the live NPC, current talk owner, distance, and delivery display-name ID. Repeated collection does not refill supplies; completed or abandoned commissions cannot be reused.
- Existing saves retain explicit material grants and crafting progress. Newly accepted pickup commissions require the client visit. Older installations without the `questData` column must run the idempotent upgrade in `Data/sql/characters_quest_guildleve_local.sql` before using local leves.
- The existing local journal receives the selected variant, completed item count, remaining supplies, and delivery map marker; see [journal protocol and verification](local_guildleve_journal.md).

All 26 contacts are already represented in actor-class and event-NPC spawn SQL. The three relevant NPC bases are `PopulaceStandard`, `PopulaceCampMaster`, and `PopulaceCampSubMaster`.

## Verification and deployment

```powershell
dotnet run --project tools/local-guildleve-tests/LocalGuildleveTests.csproj
python -B tools/validate_local_and_fieldcraft_guildleves.py
```

The focused executable links production commission state, data loading, and NPC authorization code, with database/world services stubbed. Its 124 assertions include journal responses/actions, crafting, interruptions, retry and reward-selection persistence. The Lua NPC fixture additionally exercises single/multiple choices, pagination, cancellation, malformed selections, stale transactions, and service fallthrough. The [database integration harness](../tools/local-guildleve-integration-tests/README.md) has 67 assertions covering actual MySQL transactions and production inventory planning, including facility purchases, injected failures and concurrent deliveries. The Python audit checks every published commission, all dialogue references, contact spawns, NPC hooks, and recipe variants, plus existing fieldcraft coverage.

The selection-menu and [crafting facility changes](crafting_facilities.md) added later on September 7 have been built and tested in isolation. They have **not** been deployed or verified in-game. The deployment record below describes the earlier handoff implementation.

The Map Server builds successfully. The Release build was deployed on 2026-09-07 after a graceful shutdown with zero connected sessions. Startup completed at 00:11:37 America/New_York with no ERROR/FATAL entries. The server reads `Data/local/map_config.ini` and the repository's `Data/scripts`; its live MySQL 8.4.7 schema already had `questData`, so no live SQL migration was needed. All 169 passive rows (152 published commissions / 608 published variants) matched the audited SQL exactly. The updated database harness also passed its 54 assertions against a disposable schema on that runtime database service.

The executable backup and hash manifest are under `.codex-build/local-guildleve-runtime/`; `deployment.json` names the backup directory and `deployed.json` records the new process. Only the Map Server was restarted. World reconnects on demand through `ZoneServer.Connect`/`ZoneServer.SendPacket`.

On 2026-09-07, the user tested **A Mother's Booties (120204), variant 1** in
the connected client. The screenshot showed Manine's material-pickup dialogue;
the database then recorded `hasMaterials=true`, four available attempts and no
products yet. The user subsequently confirmed crafting and handing in the work.
A read-only database check found no active 120204 row, a completion-history row,
and the configured Bronze Head Knife reward (6050009, quantity 1) in inventory.
This verifies one pickup-family acceptance-to-delivery flow in the reconstructed
server; it does not independently establish the original retail NPC sequence. Other variants,
the supplied-material family, map rendering and interruption/retry edge cases
still require the remaining client checks.

Suggested client check: accept Baderon's New Counter, confirm Requested Items refuses crafting before visiting Didiwai, collect supplies, reconnect, craft the quota, and return to Didiwai. Also test Building Bridges, which should be craftable immediately and delivered to E'ptolmi. Revisit the publisher and delivery client to verify rewards cannot repeat. Existing estimates or gaps in gil, completion EXP, and performance reward probabilities are unchanged.

### Connected-client checklist

| Step | Expected observation |
|---|---|
| Accept one pickup leve and one supplied-material leve at the guild counter | Each costs one allowance and appears in the local journal. |
| Open each journal entry and its map | The selected item/quantity and named contact appear; the map points to that contact. |
| Use Requested Items before pickup, then collect and reconnect | The pickup leve is unavailable before collection; collection survives reconnect. The supplied leve is available immediately with the proper tool/class. |
| Succeed, fail or cancel, then reopen the journal | Every started attempt spends one supply; only successful product quantity advances Items Complete. Ordinary materials/crystals are unaffected. |
| Exhaust an unfinished leve, then retry | Retry costs one allowance, resets that commission and refreshes its journal. Abandon removes it and stays removed after reconnect. |
| Deliver a completed quota to the named contact, then revisit and reconnect | Reward items are granted once, the active entry disappears, and completion remains recorded. |

Record the leve name, step, expected/actual behavior and approximate time for any
failure so the corresponding server events can be inspected. This checklist is
partially complete as recorded above; startup and automated checks do not
substitute for the remaining observations.
