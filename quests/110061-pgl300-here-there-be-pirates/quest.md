# 110061 Here There Be Pirates — `pgl300` (normalized from Batch A)

- Class: PUG 2 | Level: 30 | Offer: Gagaruna 1000862 | Availability: disabled
- Lua: thin stub + `class_quest_template.lua:Pgl300` (template route).
- SQL prereq: 0 in Lua (no prior-quest gate; melee doc s1). SQL row not re-mined: OPEN.

## Sequence flow (VERIFIED: melee sequences.csv + indepth s3 + ge-walkthrough)
- ACCEPT Gagaruna -> [1] Waekbyrt 1000003 {11006101} `020` -> [2] Mytesyn
  1000167 {11006102,11006103} `025` + afterEvent `030` -> battle {11006103}
  -> [20] Titinin 1000934 {11006104} `040` + afterEvent `050` -> [21] Hurrey
  1000603 {11006105} Echo (requiredResult 1) -> [22] Melisie 1001009
  {11006106} Echo gate -> [23] Halstein 1001007 {11006107} Echo gate ->
  [24] Gagaruna {11006108} reward `090`.

## Delegate events (VERIFIED: melee process_events.csv)
Wired: GagarunaStart/020/025/030/040/050/060/070/080/090. Ambient
010_*/020_*/050_*/060_2/070_2/080_2 unbound (no owners).

## Actors/markers (VERIFIED: melee actors.csv + markers.csv DAT rows)
Gagaruna 1000862; Waekbyrt 1000003/1600217; Mytesyn 1000167/1600123; Titinin
1000934/1400021; Hurrey 1000603/2200172; Melisie 1001009/1300104; Halstein
1001007/1000134. Live 11006101-08 (Waekbyrt, Mytesyn, ship object, Titinin,
Hurrey, Melisie, Halstein, Gagaruna); 11006109-20 filler.

## Fight (VERIFIED: melee fight_waves.csv + ge-walkthrough 5x lv25)
5x 2280217/mob 3066 Kraken Deckhand, lv 25, skill 15, requireAllTargets.
Director 10 -> 20 -> retry 0. 600 s, party 3 (INFERRED). Mold stays corpse loot.

## Rewards (VERIFIED: melee rewards.csv)
Central gil 30000 + PUG marks 1000101x3000; Lua EXP 3420 (`sqrwa`+`AddExp`;
no central Exp row).

## Edge handling (VERIFIED: indepth s11)
Class+level gates; Echo asks decline-hold; ship-object interaction guarded
single (QuestObjectPgl300 has no server callback: scaffold); UpdateENPCs +
EndEvent on all paths. No chocobo.

## Open gaps
- Ship-object server callback unrecovered; Hurrey Y/rotation scaffold.
- `validate_pgl300_route.py` PASS (batch A).
