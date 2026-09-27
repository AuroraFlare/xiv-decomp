# 110060 The House Always Wins — `pgl200` (normalized from Batch A)

- Class: PUG 2 | Level: 20 | Offer: Gagaruna 1000862 | Availability: disabled
- Lua: `Data/scripts/quests/pgl/pgl200.lua` (bespoke). No template config.
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s2 + wiki s20)
- ACCEPT Gagaruna `processEventGagarunaStart` (nil/1 accepts) -> 0 Titinin
  (Platinum Ledger msg 25246, `processEvent010`) -> 5 Esperaunce x3 talks
  (counters; 3rd plays `processEvent020`) -> 10 private-area 5 coin pickups
  (flags 0-4, `pgl200_coin_1..5`) + Esperaunce `020_2`/`030` completion and warp
  to public -> 15 Wise Miser `040` ask (`paid==1` advances, decline holds) ->
  25 PGL trigger 1090042 `050` -> 30 Singleton `050_4` confirm + `060` private
  fight -> 35 Titinin `070` reward + `sqrwa 1760`.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: GagarunaStart/010/020/020_2/030/040/050/060/070 +
ambient 005_2..005_8, 010_2..010_5, 060_2..060_8.

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Gagaruna 1000862; Titinin 1000934; Esperaunce 1000954; Naida Zamaida (Wise
Miser) 1000955; Singleton 1001445; triggers 1090058/1090042/1090199; exit
1290002. Live markers 11006001-08 (Titinin, GSM objective, Esperaunce x2,
Wise Miser, PGL entrance, Singleton, Titinin reward); 11006009-20 filler.

## Fight (VERIFIED: melee fight_waves.csv)
`QuestDirectorClassPgl200`: 2289013/mob 3108 Toothless Gladiator, lv 20,
skill 15, single kill. Expected 30 -> success 35 -> retry 30. 600 s, party 3
(INFERRED adapter defaults). Quest `onKillBNpc` inert; director credits kill.

## Rewards (VERIFIED: melee rewards.csv + gamedata_quest_rewards.sql)
Central: gil 20000 + PUG marks 1000101x2000 + Spiked Knuckles 4020208x1 +
Exp 1760. Lua plays `sqrwa` only, no `AddExp` (no double-pay).

## Edge handling (VERIFIED: indepth s2/s11)
Class+level gates on all six guards; coin flags stop double-push; Esperaunce
talk-locked until 5/5; stale-actor push retires actor; UpdateENPCs+EndEvent
on every path. No chocobo (0 hits over quest+director).

## Open gaps
- Live-client acceptance of fight/scenes (formation offsets).
- `validate_pgl200_coin_objective.py` PASS (batch A, 2026-09-27).
