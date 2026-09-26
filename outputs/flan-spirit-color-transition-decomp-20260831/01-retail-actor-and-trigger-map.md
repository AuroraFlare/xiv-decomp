
# Retail actor and trigger map

## m049 flans / Prison Pudding

- Prison Pudding uses BNPC class `2303401`, base model `10049` (`m049`),
  size 2, BODYGEAR 1024.
- The Totorak director now rolls each Prison Pudding independently between
  lightning, wind, and fire, pairing the selected spell/absorption profile
  with m049 model states 3, 4, and 1 respectively.
- Retail m049 BID data exposes model states 0..6, while the installed e001
  `top_tex1` material bank identifies states 1..6 as Fire, Ice, Lightning,
  Wind, Earth, and Water. Toto-Rak can therefore pair its randomized Fire,
  Lightning, and Wind gameplay profiles with states 1, 3, and 4 exactly.

Primary server locations:

- `Data/scripts/directors/Occupancy/TotorakEncounter.lua`
- `Map Server/Actors/Chara/Npc/BattleNpc.cs`
- `Data/sql/gamedata_actor_appearance.sql`

## Spirit of the Wood

- Actor class `2105201` is
  `/Chara/Npc/Monster/Elemental/ElementalScenarioGridaniaLv20`.
- BNPC `1364` is `spirit_of_the_wood`; current skill list `5021` contains
  Aetherial Barrier `23152`.
- The live director starts Wind and rotates Wind -> Earth -> Water every
  30 seconds. The current implementation maps these to BODYGEAR
  `2080 -> 2112 -> 1088`, from neutral/scenario BODYGEAR 1120.
- Retail appearance rows also establish Fire 1024, Lightning 1056,
  Water 1088, scenario 1120, Ice 2048, Wind 2080, and Earth 2112 for m508.

Primary server locations:

- `Data/scripts/directors/Quest/QuestDirectorMan2g001.lua`
- `Data/scripts/quests/man/man2g0.lua`
- `Data/sql/gamedata_actor_class.sql`
- `Data/sql/server_battlenpc_mob_types.sql`
- `Data/sql/server_battlenpc_skill_list.sql`
- `Data/sql/gamedata_actor_appearance.sql`

## Retail evidence boundary

The asset graph proves how each presentation *can* run. It does not prove the
exact live-combat packet train for the Totorak elemental assignment or that
retail Spirit combat issued the same BODYGEAR sequence as the current server.
That final association needs a retail capture. The cutscene package does prove
the authored m508 appearance effect itself and its actor binding.
