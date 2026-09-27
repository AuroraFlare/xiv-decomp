# Blm0j4 The Voidgate Breathes Gloomy (111264) indepth decomp - 2026-09-27 (JOB BLM)

Lv45. Dozol Meloc -> moss-covered stela NW of Turning Leaf (West Shroud),
Gem of Shatotto activation -> next quest at Da Za. Status: HOLD (interaction
actor unrecoverable; everything recoverable is staged, nothing fabricated).

## Client scenario (contract from audit; chunk decomp absent)

- Offer `processEventDOZOLMELOCStart`: TWO independent questions - NPC
  `ask(quest,29,2)` (text 3 vs 32 on result 1) and later a separate stored
  `showQuestInfomation()` result (text 15 vs 14 + return value). A single
  reused choice would miss mixed-answer paths.
- `processEvent000_SEKIHI`: world text 33 only (inactive mossy stela).
- `processEvent005`: the ACTIVE interaction - world text 24, then
  `sayFreeDisplayName(4000257,quest,25)`. 4000257 is a display name, NEVER an
  actor-class ID.
- `processEvent000_DOZOLMELOC/_LALAI/_KAZAGGCHAH/_DAZA` enforce no itinerary.
- Rewards: long text 40/wait 8, then ability `(27317,2)`/wait 6. No NQ scene.
- One offer line mentions a lurking beast, but the journal defines a stela
  task and the chunk has no battle transition: no enemy/trigger/instance.

## Stages / markers / positions

- Sequences: 0 Dozol offer -> 6 interaction (hard stop, no objectives) ->
  completion owned by the interaction itself.
- Marker 11223301: m00013/103/304, X/Z -1691.359985/124.540001 (West Shroud).
- Ground truth: zone-153 navmesh recording has ZERO nodes near the stela
  (nearest ~1045 yalms away); map tool leaves height unresolved. Y/rotation
  require in-game GM verification and are NOT guessed here.

## NPCs / objects

- Dozol Meloc 1060037, spawn row 2456, zone 172 (-1364.3, 18.729, -169.688).
- Stela: NO actor class / unique ID / spawn / push owner recovered. The only
  guildleve-treasure object actor (1200161) is explicitly not a substitute.

## Rewards

- EXP 5340; action 27317; interactionComplete hooks
  (onJobQuestCompleteFirst/Second). Gem 11000556 (granted by Blm0j1's
  completion) is the activation key, already real inventory.

## What enabling requires (adapter spec, not done)

1. GM `!where` at (-1691.36, ?, 124.54) zone 153 for ground Y + facing.
2. Recover or author a stela object actor (model + class + unique ID).
3. Add the spawn row + `interactions.objectives = {{actor, marker 11223301,
   item = nil, event = "processEvent005"}}`; template onPush/flags/counter
   machinery already handles grant-once, inventory-full retry, and
   completion (proven by the Blm0j4 synthetic-actor test).

## Addendum 2026-09-27 (implement-blm-b pass; HOLD reaffirmed)

- Web (inspected bodies): Final Fantasy Wiki "Black Mage Quests (version
  1.0)" journal - Dozol Meloc sends the player to a stela NW of Turning
  Leaf, West Shroud; reward Sleepga + ~5,340 EXP; next quest from Da Za.
  Matches staged offer/EXP/action surface. No 1.0-era YouTube footage
  found (results are ARR only); no lurking-beast fight evidenced - the
  single offer line stays flavor, no battle staged.
- Coordinates (mob_map_coordinates.md "All-zone interface" + "Agent
  workflow" `locate`): zone 153 (-1691.36, 124.54) -> map (14.13, 39.33),
  0 recorded nodes in selection, nearest node 121 `!pos 153 -1939.459
  0.147 -891.202` at 1045.6 yalms. Height stays unresolved; GM `!where`
  capture still required. No public/private placement is supportable.
- Actor search (gamedata_actor_class.sql): no Stela/Stele/StoneTablet
  class; only guildleve-treasure object is 1200161
  (GuildleveBonusTreasureBox) - still explicitly not a substitute. No
  blm0j4/5 scenario chunk exists in lpb outputs (only blm0j1/blm0j6
  recovered), so offer text IDs 3/32/15/14 and world texts 24/25/33 are
  audit-carried, not chunk-verified.
- Registry: quest_availability 111264 stays "Partially implemented"
  (commented, validator-enforced); template row stays marker-only HOLD.
  Enabling without a recovered stela actor + transform would be
  fabrication and breaks tools/validate_job_af_interaction_runtime.py
  (Blm0j4 rows PASS as held this pass).
