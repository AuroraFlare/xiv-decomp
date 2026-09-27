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

## Addendum 2026-09-27 (implement-blm-b pass; HOLD reaffirmed)

- Web (inspected bodies): Final Fantasy Wiki "Black Mage Quests (version
  1.0)" journal - Da Za's tablet names four garb destinations: Aurum
  Vale (W of Camp Ever Lakes), Dusk Vigil (N of Camp Riversmeet), cave W
  of Camp Brittlebark, cave S of Camp Broken Water; rewards Wizard's
  Crakows/Gloves/Petasos/Tonban + ~5,340 EXP. Matches the staged set and
  four markers. No coffer visuals/positions published.
- Coordinates (mob_map_coordinates.md "All-zone interface" + "Agent
  workflow" `locate`; center heights unresolved per "nearby heights
  belong only to their recorded positions"):
  - 11223401 zone 147 (-368.99, 1397.95) -> map (33.43, 35.42), 2 pts
    in radius.
  - 11223402 zone 148 (-1838.30, -703.93) -> map (18.74, 14.40), 31 pts
    in radius.
  - 11223403 zone 190 (191.11, 608.84) -> map (14.71, 19.53), 35 pts
    in radius.
  - 11223404 zone 174 (1761.81, 1428.56) -> map (44.49, 45.01), 11 pts
    in radius.
  Area/entrance X/Z confirmed; coffer transforms and marker-to-item
  binding still unknown, so no placement (public SQL or private JSON)
  is supportable.
- Actor search: no quest-coffer class in gamedata_actor_class.sql; only
  1200161 (GuildleveBonusTreasureBox) - still explicitly not a legal
  substitute. No blm0j5 scenario chunk in lpb outputs.
- Registry: quest_availability 111265 stays "Partially implemented"
  (commented, validator-enforced); template row stays marker-only HOLD.
  A parallel MNK worker's capture-gated 1200161 objectives for Mnk0j5
  currently break tools/validate_job_af_interaction_runtime.py; BLM rows
  PASS as held. BLM enablement needs the same live-capture +
  validator-coordination route, not taken here.
