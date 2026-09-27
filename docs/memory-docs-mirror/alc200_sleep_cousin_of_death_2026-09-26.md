# Alc200 Sleep, Cousin of Death — implementation

Implemented: 2026-09-26. Offer enabled (`offer = true`).

## Retail route (DAT `docs/Dat Mining/alc200.csv`, quest 110420)

1. Nogeloix (1000597) offer at the Phrontistery reception, `processEventNogeloixStart`
   into scene `alc20010`. She hands over the medicine formula (text row 13).
2. Camp Black Brush: merchant Nomomo (1001392) grants the Mummified Mole
   (11000076), `processEvent010` (text row 16).
3. The player procures Eye Drops (3020401, "with your own money", text row 95)
   and synthesizes Potent Medication (11000077) per the Patch-1.21 recipe:
   Mummified Mole + Eye Drops. The pre-1.21 JP text names Illuminating Salts
   (10009011) instead; EN/DE/FR (post-1.21) name Eye Drops.
4. Nogeloix inspects the finished medication, `processEvent015`, and keeps it
   in the player's pack for the ward visit (journal state 7).
5. Children's ward corridor: Healer S'lyhhia (1000932) by the back door asks
   ask 44 ("Allow Healer S'lyhhia to guide you?"). On accept she takes the
   medication and guides the player in; scene `alc20020` (Damielliot's
   sickroom, initial-town branch for Ul'dah starters who met him before).
6. Report to Nogeloix, `processEvent030` into scene `alc20030`: Damielliot
   woke briefly, Assessor Saulette's refused examination, reward.

## Driver mapping (`Alc200` in `class_quest_template.lua`)

- Step 1: Nomomo, markers {11042001, 11042002}, `processEvent010`,
  `grant = {{11000076, 1}}`.
- Step 2: Nogeloix, marker {11042003}, `processEvent015`,
  `inspect = {item = 11000077, count = 1}` (possession gate, no consume).
- Step 3: S'lyhhia, markers {11042004, 11042005}, `processEvent015_6`,
  `requiredResult = 1`, `delivery = {item = 11000077, count = 1}`
  (declining holds the step and keeps the medication),
  `afterEvents = {"processEvent020"}` (ward scene; Gla300/Lnc306 precedent).
- Step 4: Nogeloix, marker {11042006}, `processEvent030` (reward boundary).
- Rewards: EXP 1760 (post-1.20 maximum), Iron Alembic 6070011
  (script-owned; era caveat below), 20,000 gil + 2,000 marks centrally
  (`gamedata_quest_rewards` rows already present).

## Grounding

- Nogeloix spawn 150 zone 209 (-211.67, 229.6, 279.04) — retail catalog row.
- Nomomo spawn 2390 zone 170 (23.404, 200, -476.668) — retail catalog row,
  13u from the Black Brush fishing/gathering anchor (35.806, -479.864).
- NEW S'lyhhia spawn 3327 zone 209 (-215.88, 229.5, 300.48): 0.7u off the
  retail `MAN0u1_ALCH_TRIGG` actor (250) at the room's high-z extreme, the
  DAT "back door" (text rows 19/67/69). Guild-floor Y 228-231 throughout
  the room cluster; no quicknavmesh coverage on this floor, so placement
  is actor-relative per the adjacent-floor precedent. Rotation 0.000 and
  last-column 0 follow the quest-NPC spawn convention.
- NEW recipe 5385: ALC ('G') 21, CC, Potent Medication x1 from Mummified
  Mole + Eye Drops, Water Shard + Lightning Shard x1. Output/materials are
  DAT-recovered; the shard pair mirrors the sibling ALC-medicine recipe
  4943 (Eye Drops) and the L21 sample 4997 — documented default.
- Eye Drops fallback craft 4943 (ALC 11, Blindfish + Rock Salt) exists;
  Rock Salt sits in Black Brush mining pool 30061, so the chain is
  completable by gathering + crafting with no fabricated vendor.
- Availability row flipped to Implemented (comment convention).

## Unbound (live-server verification or engine work)

- Ward `afterWarp`/private-area lifetime for `alc20020` (same live-only gap
  class as the CNJ/THM/LNC after-warp scenes).
- Initial-town branch feed (`$E4($E8(1),1)`) for scenes 020/030.
- Prerequisite-conflict ruling (SQL 0 vs archive 110013).
- Marker 11042002 exact actor (surfaced with the field step).
- Linkpearl grant; Iron Alembic reward-era confirmation.
- Markers 11042007-20 stay rejected filler.

## Verification

`python -B tools/validate_alc200_route.py` → PASS (route fragments,
offer/complete hooks, driver grant/inspect/delivery gates, availability,
three spawn rows, recipes 5385 + 4943, four item rows, central rewards).
