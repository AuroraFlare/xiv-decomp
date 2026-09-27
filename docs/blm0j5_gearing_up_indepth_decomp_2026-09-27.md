# Blm0j5 Gearing Up (111265) indepth decomp - 2026-09-27 (JOB BLM)

Lv45. Da Za -> four AF coffers (Aurum Vale, Dusk Vigil, cave W of Camp
Brittlebark, cave S of Camp Broken Water) -> fourth-acquisition completion.
Status: HOLD (coffer actors unrecoverable; set + destinations staged).

## Client scenario (contract from audit; chunk decomp absent)

- Offer `processEvent_DAZA_Start` (offer EQ at pc120); three tribal Follow
  methods are comments, not staged deliveries. No NQ scene.
- `processEvent_getAF_info(quest,player,eventOwner,arg1)`: owner scheduler +
  `showGetJobItemWidget(player,arg1,0)` + return. Item is caller-supplied;
  no branch/counter/grant/warp/completion here.
- Known set: 8051407 Tonban / 8071407 Gloves / 8081807 Crakows / 8013507
  Petasos. Marker order 11223401-04 does NOT map items to coffers.

## Stages / markers / positions

- Sequences: 0 Da Za offer -> 6 interaction (hard stop) -> in-place
  completion on fourth acquisition (no return NPC).
- 11223401 Aurum Vale (zone 147): -368.989990/1397.949951.
- 11223402 Dusk Vigil (zone 148): -1838.300049/-703.929993.
- 11223403 W of Camp Brittlebark (zone 190): 191.110001/608.840027.
- 11223404 S of Camp Broken Water (zone 174): 1761.810059/1428.560059.
- All four are area/entrance X/Z only; Y/rotation/coffer transforms unknown.

## NPCs / objects

- Da Za (269th Order Mendicant) 1060038, spawn row 2457, zone 172
  (-1374.58, 18.79, -164.009).
- Coffers: NO actor classes / unique IDs / push owners. Generic
  GuildleveBonusTreasureBox 1200161 is explicitly not a substitute.

## Rewards

- EXP 5340; four AF pieces via per-coffer widget + grant.

## What enabling requires (adapter spec, not done)

1. Recover/author four coffer object actors (one per destination) with full
   transforms + marker-to-item bindings (order NOT inferable from IDs).
2. Add spawn rows + `interactions.objectives` (4x {actor, marker, item,
   event getAF_info}); template machinery already handles unordered
   acquisition bits, inventory-full retry, and fourth-pickup completion.
