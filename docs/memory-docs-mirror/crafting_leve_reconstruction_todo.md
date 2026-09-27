# Crafting Leve Reconstruction TODO

This tracker is separate from the combat encounter-position reconstruction pass.

## Scope

This is for craft-focused levequest work only (non-combat objectives, gathering/crafting flows, and any NPC interaction routing tied to crafting leves).

Crafting leves are currently out of scope for the combat `server_guildleve_position_seeds` work.

## Current State

- The [2026-09-07 full catalog/offer audit](local_guildleve_catalog_audit_2026-09-07.md) remains the historical evidence gap for **exact retail rank grouping and offer rotation**. The implementation now preserves all eight native card slots, keeps empty placeholders in their original positions, and reaches the full-inventory return-one-to-make-room path. The server's current deterministic catalog slicing is still a reconstruction; it must not be described as recovered retail rotation, so a live/native offer-seed source is still needed.
- All 152 published crafting commissions and their 608 variants are covered by the [local guildleve archive](elemen-local-guildleves/README.md).
- Client material collection and delivery are implemented; see [handoff evidence, behavior, and verification](local_guildleve_handoffs.md).
- The original local journal page is now supplied with progress and destination-map responses; see [journal protocol and checks](local_guildleve_journal.md). Client rendering still needs an in-game check.
- Acceptance/retry allowance spending and delivery rewards now use database transactions. The disposable MySQL harness passes 54 assertions, including injected failures and concurrent delivery; the focused Lua/C# harness passes 118 assertions.
- Crafting data is complete across all eight DoH classes and every published 1.x recommendation tier through 50 (152 commissions and 608 variants). The Release build was deployed on 2026-09-07; runtime startup and live commission-data checks passed. The user subsequently completed A Mother's Booties in the client; material pickup and the persisted delivery/reward were confirmed. Remaining client scenarios are listed below.
- No confirmed combat anchors are required for this track.

## What to Reconstruct First

0. Recover the exact native/server rank-pack grouping and offer-refresh seed. Keep the implemented fixed eight-card slot mapping and return-one-to-make-room path intact; do not sort or regroup variants solely by their recommended level without evidence.
1. Verify the pickup/crafting/delivery sequence in a running 1.23b client, including reconnecting after material collection.
2. Check journal progress display and NPC handoff dialogue for both `PgConv` and `PgAeth` commissions. All 26 delivery contacts already have NPC spawn records.
3. Recover remaining exact currency and completion-EXP reward values separately from the NPC handoff work.
4. Exercise local retry/abandon, canceled and interrupted synthesis, and reconnect persistence in the connected client. Server state and real database transaction tests pass; the complete networked sequence has not been exercised.

## Recommended Data Sources

- `docs/Dat Mining/guildleve.csv`
- `docs/Dat Mining/xtx_guildleve.csv`
- `docs/Dat Mining/xtx_displayName.csv`
- `Data/sql/gamedata_guildleves.sql`

## Capture Template

```text
Leve ID:
Leve Name:
Objective Type:
Primary NPC:
Zone ID:
Interaction Point 1:
Interaction Point 2:
Notes:
```

## Notes

- Keep this file as a separate decision log from combat families (`Broken Water`, `Bloodshore`, etc.) in [position_reconstruction_todo.md](/\daniel-pc\C\Users\drime\source\repos\AuroraFlare\FF14-Memory\docs\position_reconstruction_todo.md).
