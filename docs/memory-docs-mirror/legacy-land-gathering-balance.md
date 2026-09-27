# Legacy Land Gathering Balance

This project treats gathering grade as a difficulty band, not a hard Miner or
Botanist rank requirement. A low-rank player with the correct class and tools
may attempt a higher-grade node, but consumes Remainder faster and has a lower
chance to complete each gather.

## Recovered rank anchors

The exact-grade Lay of the Land, Arbor Call, and Gulleye abilities provide the
surviving progression anchors used by `LandGatheringBalance`:

| Grade | Recommended rank |
| ---: | ---: |
| 1 | 1 |
| 2 | 8 |
| 3 | 18 |
| 4 | 28 |
| 5 | 38 |
| 6 | 48 |
| 7 | 58 |
| 8 | 68 |
| 9 | 78 |
| 10 | 88 |

Final normal 1.x Miner and Botanist content used grades 1-5. The client and
command data retain higher-grade definitions, so the balance helper keeps the
full 1-10 sequence without changing the server's independent class-level cap.

## Runtime behavior

- **Grade and rank:** determine difficulty. Being below the recommended rank is
  a penalty, not an access denial.
- **Gathering (Mine/Log):** reduces Remainder spent by each unsuccessful strike.
- **Aim (Mine/Log):** the phase-one widget value selects entries at their exact
  recovered signed `-5..+5` target; unknown entries remain aim-neutral.
- **Gathering (Quarry/Harvest):** increases the one-shot off-hand success chance.
- **Output:** adds Mine/Log gathers at a node; Quarry/Harvest remain one-shot.
- **Perception:** rolls for the +3 quality tier on ordinary nodes.
- **Truth-only nodes:** remain hidden HQ spots and guarantee +3 quality when
  revealed through the appropriate ability path.
- **Core attribute:** Vitality for Miner and Strength for Botanist contributes to
  the main-hand success relationship recovered in patch 1.17.

HarvestJudge starts each main-hand gather with 100 Remainder. Misses reduce it;
reaching zero consumes that gather with no item. A success or failure then
starts the next available gather at 100. Generated point and pool data keeps
`minLevel = 0` so importing future zones preserves the same soft-grade rules.

The roles and item-specific aim table are recovered, but Square Enix's exact
success and Remainder coefficients are not. The signed table is checked in as
`Data/gather_aim.csv`; tunable formulas and target quantization are centralized
in `Map Server/DataObjects/LandGatheringData.cs` and covered by deterministic
tests in `Fishing Tests/Program.cs`. Quarry and Harvest deliberately ignore the
table because their recovered path is a one-shot action without an aim widget.

## Evidence

- `docs/Dat Mining/harvestJudge.csv`: item targeting, repeated strikes,
  Remainder loss, failure at zero, result messages, and remaining gathers.
- `docs/patches/Patch_1.17.md`: grade, class rank, and core attribute determine
  the fixed gathering sweet spot.
- `Data/gather_aim.csv`: signed per-item targets recovered from
  `https://ffxiv.mozk-tabetai.com/` on 2026-07-14.
- `docs/patches/Patch_1.20.md`: tool quality affects Output and Perception and
  secondary-tool success was increased.
- `Data/sql/server_battle_commands.sql`: exact-grade search ability unlock ranks.
- [Official forum: Gathering Stats and You](https://forum.square-enix.com/ffxiv/threads/26648):
  contemporary stat-role explanation.
- [Official forum: Gathering grades IV-V](https://forum.square-enix.com/ffxiv/threads/52681-Gathering-grades-IV-V):
  contemporary players gathering grade 5 before receiving its rank-38 search ability.
