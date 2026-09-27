# Shared base: moonfire_base.lua (Moonfire Faire quest driver)

- File: `Data/scripts/quests/spl/moonfire_base.lua` (59 lines, VERIFIED read)
- Role: INFRASTRUCTURE, not a quest. Required by `spl0i1.lua` (`InitMoonfireQuest("moonfire2011")`)
  and `spl102.lua` (`InitMoonfireQuest("moonfire2012")`) (VERIFIED).
- Config/data: `Data/scripts/moonfire_event_data.lua` (profiles, runners, reward labels, delegate names).
  Exchange runtime: `Data/scripts/moonfire_event_npcs.lua` (`claimUniform`, `exchange`, `handleEvent`).
  C# authority: `TryClaimSeasonalUniform` / `TryExchangeSeasonalReward` + `SeasonalRewardCatalog`
  (prices/gender re-resolved server-side; client rows are labels only).

## Sequences (VERIFIED)

| Seq | Meaning |
|---|---|
| ACCEPT | Runner offers city-specific start event; `AcceptQuest` on return 1, then uniform claim |
| 0 | Exchange loop. First successful ash exchange calls `CompleteQuest`; later exchanges stay available via `MoonfireEventNpcs.handleEvent` completed-player service (no second completion) |

- 2011 profile: `processEventSUMFESStart` accept; runners 1001669 (Limsa, city 0) / 1001671
  (Gridania, city 1) / 1001670 (Ul'dah, city 2) — VERIFIED in `moonfire_event_data.lua`.
  Display-name join: 1900175/1100355/1300152 (VERIFIED SQL `gamedata_actor_class.sql:1695-1697`).
  Uniform: 8032405+8051305 (M) / 8032410+8051310 (F) per `docs/moonfire_quest_runtime_2026-09-25.md`.
- 2012 profile: per-city start events `processEventStartSea/Fst/Wil`; runners 1002081-1002083
  (same display-name IDs — VERIFIED SQL lines 2072-2074). Gendered yukata/drawers/clogs/Bombard Bloom
  for Bombard Ash 10011253 at prices 1/30/50/1/30/50/5/1 (doc, INFERRED-era source, preserved as labels).
  Markers: native `{11501101, 11501102, 11501103}`, city-filtered per player at send time
  (`quest_map_marker_filter.lua` + built-in rows). 2011 returns `{}` (VERIFIED).

## Delegates / journal / rewards (VERIFIED)

- Delegates branch on `accepted == 1` and on C# result codes 0/1/2/4 (success/full/unique/insufficient).
- Journal: all zeros. `onTalk` is `pcall`-wrapped; `UpdateENPCs` + `Moonfire.finish`
  (`CustomMenu.finish` + `EndEvent`) run even on error.
- No SQL reward rows for 110799/110860 (VERIFIED zero hits) — `CompleteQuest` auto-grants nothing;
  all items come from the C# exchange APIs. No double-grant.

## Hardening verdict (PART 2) — extra care applied (two quests depend on this file)

- SEQ_ACCEPT gating: VERIFIED (`quest:GetSequence() == SEQ_ACCEPT` branch; seq-0 branch for exchange).
- Single `CompleteQuest` per quest lifetime: only inside `exchange(..., completeQuest=true)` on
  result 0; completed-player path passes `completeQuest=false`. VERIFIED.
- Colon-form throughout; `UpdateENPCs`/finish coverage on all paths including pcall failure.
- Abandon/re-accept: uniform claim persists on quest flag 7 with per-piece flags 8-9 and retries
  missing pieces after inventory failure (C# `Player.Seasonal.cs:91+`); re-accept re-runs claim. Safe.
- No changes made. No chocobos, no kills.

## Open gaps (reasons)

- Bombard-ash acquisition (field combat?) is NOT quest-tracked: no `onKillBNpc` exists, and
  `server_seasonal_battlenpc_spawn_locations.sql` contains no moonfire/bombard rows (VERIFIED).
  The "open-world fight + mob kill/drop" availability labels (quest_availability.lua:742,757) describe
  event-era activity, not a recovered quest kill objective — do not invent one.
- Native reward-selector layout is damaged decomp; the launcher menu is a compatibility choice
  (see moonfire runtime doc). Exact retail packet order/visuals unverified.
