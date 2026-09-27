# Fsh200 - To Fight a Fishback (110500) - VERIFIED

- SQL (VERIFIED, `gamedata_quests.sql`): `(110500, 'To Fight a Fishback',
  'Fsh200', 0, 20)`. No chain prerequisite.
- Availability (VERIFIED): ENABLED (`110500` uncommented in
  `quest_availability.lua`).
- Script: `Data/scripts/quests/fsh/fsh200.lua` + `fsh_quest_helpers.lua`.
  Status: playable, bespoke (not driver-based).

## Sequence flow (VERIFIED)

- `SEQ_ACCEPT` (offer): N'nmulika (1000153). Gate: Fisher (class 41) level 20+
  (`FshHasClassAndLevel`). Accept requires delegate result `== 1`, then
  `player:AcceptQuest`, `quest:UpdateENPCs`, `player:EndEvent`.
- `SEQ_BRIEFING` (0): Maisie (1000173), `QFLAG_TALK`. Talk plays
  `processEvent010`, snapshots owned Pixie Remora into `COUNTER_BASELINE`,
  advances to `SEQ_FISHING`.
- `SEQ_FISHING` (1): Maisie `QFLAG_TALK` until ready, then `QFLAG_REWARD`.
  Ready = net gain >= 5 AND owned >= 5. Reward talk plays `processEvent020`,
  grants Yew Fishing Rod (7030011) once (`FLAG_ROD_GRANTED` retry guard),
  consumes 5x Pixie Remora (11000127), plays `sqrwa` EXP event, single
  `player:CompleteQuest`, `player:AddExp(1760, FshClassId, 0)`.
- `onFishCatch` (optional fanout): progress fanfare only; credit never depends
  on it. No `EndEvent` (catch opens no client event).
- Abandon (`onFinish`): owned fish stay; re-accept re-snapshots at briefing,
  so pre-briefing fish never count. VERIFIED safe.

## Delegate events (VERIFIED)

`processEventNnmulikaStart` (offer), `processEvent010` (briefing + progress
reminder), `processEvent020` (delivery), `sqrwa` (EXP presentation).

## ENPC IDs (VERIFIED)

- 1000153 N'nmulika: public spawn row 325, zone 230
  (-612.9, 4.55, 341.42). VERIFIED in `server_eventnpc_spawn_locations.sql`.
- 1000173 Maisie: public spawn row 401, zone 230 (-603.64, 6.25, 355.46).
  VERIFIED.

## Markers (RECOVERED, script constants)

- Briefing: 11050001. Return: 11050003. Waters: 11050004-11050008, returned as
  five multi-return values (MoonSharp-safe, no bare `unpack`). VERIFIED form.

## Counters/flags (VERIFIED)

- Counter 0: briefing-time owned baseline. Flag 0: rod-granted guard.

## Journal hooks (VERIFIED)

- `getJournalInformation`: clamped net catch `(min(caught,5), 0,0,0,5)`.
- `getJournalMapMarkerList`: briefing / ready-return / five waters.

## Gather items + delivery (VERIFIED + SQL)

- Item 11000127 Pixie Remora x5, net-gain credit (`max(0, owned - baseline)`),
  NQ (quality 1) + HQ (quality 4) counted/consumed separately with a
  capability-probed 3-arg overload fallback. Delivery consumes 5 after the rod
  grant (full-inventory safe).
- Fishing bindings (VERIFIED, `server_fishing.sql` main file): pool entries
  `(10051/10061/10081, 11000127, weight 100, ...)` = Bearded Rock / Skull
  Valley / Bloodshore quest waters. Depth band (2,2,-3) and difficulty/minRank
  are reconstruction defaults, marked in the SQL comment.

## Rewards (VERIFIED, no double-grant)

- Script: Yew Fishing Rod 7030011 + 1760 EXP.
- Central (`gamedata_quest_rewards.sql`): 20000 gil + 2000 Fishing marks
  (item 1000123). Script grants neither. VERIFIED consistent.

## Prereq chain

None (level 20 Fisher only). Feeds Fsh300 (110501, HOLD).

## Kills

None. No BNPC surface needed.
