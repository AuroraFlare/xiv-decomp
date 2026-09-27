# Quest Fight Implementation Backlog - 2026-06-30

Generated from `outputs/quest-master-gap-atlas-20260630/fight_readiness_by_quest.csv` and the fight/BNPC/SQB queues in `outputs/quest-next-runtime-unlock-atlas-20260630`.

## Totals

- Total fight-surface quests: 94
- SQB: 56
- BNPC_objective: 32
- bespoke_content: 6

## Manual Addendum: Court In The Sands

`Court in the Sands` is not a guildleve. The similarly named `Guildleve: Court in the Sands` rows in the mob audit are a separate wiki/mob-source signal and should not drive the main-scenario implementation.

This quest was missed by the generated fight detector because its fight surface is handwritten inside `man0u1` rather than exposed as SQB/BNPC objective data. Count it as an additional manual fight backlog row outside the generated totals above.

| Code | Quest ID | Quest | Lane | Current Evidence | Needed Implementation Proof |
|---|---:|---|---|---|---|
| `man0u1` | 110010 | Court in the Sands | `scripted_coliseum_private_area` | `SEQ_015` coliseum fight note; live script still skips `COL_TRIG` to `processEvent035`; GM checkpoints stage `coliseum` and `postcoliseum`; decomp confirms `processEvent035 -> man0u135` | Dynamic/server-created Tourney Gladiator or equivalent arena opponent; kill callback owns win state; safe post-kill owner context for `delegateEvent(..., "processEvent035")`; cleanup/warp to post-fight trigger; no reward/progression until live packet proof |

The useful comparison is the recovered `PrivateGLBattle*` leve/director family: borrow its server-authoritative spawn/objective/kill-counter ideas, but do not blindly use a visible `GuildleveDirector` or content group for this quest. The current Court-specific notes favor a static `PrivateAreaMasterPast` arena plus a small server-side quest fight controller, with the post-kill cutscene launched later from a clean NPC/director owner event.

## First Runtime/Implementation Wave

### SQB private materialization first wave (6)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `com0g1` | 111601 | Breaking the Seals | 2202206 | drake_familiar | live_required |
| `com0l1` | 111401 | The Price of Integrity | 2200708 | peiste_familiar | live_required |
| `com0u1` | 111801 | Career Opportunities | 2200205 | anole_familiar | live_required |
| `com0u4` | 111804 | Arms Race | 2109801 | hellhound | live_required |
| `com0u6` | 111806 | Know Your Enemy | 2289025 |  | blocked_log_only |
| `man0u0` | 110009 | Flowers for All | director GOOBBUE 2203301 |  | positive_control_live_required |

### Applied private SQB mob proof (4)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `com0g1` | 111601 | Breaking the Seals | 2202206 | Drake Familiar |  |
| `com0l1` | 111401 | The Price of Integrity | 2200708 | Peiste Familiar |  |
| `com0u1` | 111801 | Career Opportunities | 2200205 | Anole Familiar |  |
| `com0u4` | 111804 | Arms Race | 2109801 | Hellhound |  |

### World BNPC callback probe queue (19)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `etc1g2` | 110656 | A Well-Balanced Diet | 2100509 | Popoto-opoto | probe_before_sql_or_spawn |
| `etc1g5` | 110659 | The Search for Sicksa | 2104022 | Bristletail Marmot | probe_before_sql_or_spawn |
| `etc1g6` | 110660 | The Ultimate Prank | 2101908 | Wandering Wight | probe_before_sql_or_spawn |
| `etc1g8` | 110662 | Say it with Wolf Tails | 2100609 | Gnawing Gnat | probe_before_sql_or_spawn |
| `etc1l0` | 110633 | Assessing the Damage | 2105409 | Jetsam Jelly | probe_before_sql_or_spawn |
| `etc1l1` | 110634 | Bridging the Gap | 2100113 | Toll Puk | probe_before_sql_or_spawn |
| `etc1l5` | 110638 | Till Death Do Us Part | 2102717 | Musk Roseling | probe_before_sql_or_spawn |
| `etc1l6` | 110639 | Beryl Overboard | 2107613 |  | probe_before_sql_or_spawn |
| `etc1l7` | 110640 | Have You Seen My Son | 2101609 |  | probe_before_sql_or_spawn |
| `etc1u0` | 110675 | A Knock in the Night | 2101711 |  | probe_before_sql_or_spawn |
| `etc1u2` | 110677 | Dressed to Be Killed | 2101816 |  | probe_before_sql_or_spawn |
| `etc2g0` | 110664 | A Forbidden Love | 2102708 |  | probe_before_sql_or_spawn |
| `etc2g1` | 110665 | Last Respects | 2100512 |  | probe_before_sql_or_spawn |
| `etc2g2` | 110666 | Stone Deaf | 2100502 |  | probe_before_sql_or_spawn |
| `etc2i0` | 110706 | Counting Sheep | 2101403 |  | probe_before_sql_or_spawn |
| `etc2u1` | 110686 | Freedom Isn't Free | 2106541 |  | probe_before_sql_or_spawn |
| `etc3u9` | 110734 | Monster of Maw Most Massive | 2102717 |  | probe_before_sql_or_spawn |
| `wld0u2` | 110754 | Sanguine Studies | 2106537 |  | probe_before_sql_or_spawn |
| `wld0u4` | 110756 | Rustproof | 2106542 |  | probe_before_sql_or_spawn |

### World BNPC callback deferred (7)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `etc2g1` | 110665 | Last Respects | 2100512 |  | probe_before_sql_or_spawn |
| `etc2g2` | 110666 | Stone Deaf | 2100502 |  | probe_before_sql_or_spawn |
| `etc2i0` | 110706 | Counting Sheep | 2101403 |  | probe_before_sql_or_spawn |
| `etc2u1` | 110686 | Freedom Isn't Free | 2106541 |  | probe_before_sql_or_spawn |
| `etc3u9` | 110734 | Monster of Maw Most Massive | 2102717 |  | probe_before_sql_or_spawn |
| `wld0u2` | 110754 | Sanguine Studies | 2106537 |  | probe_before_sql_or_spawn |
| `wld0u4` | 110756 | Rustproof | 2106542 |  | probe_before_sql_or_spawn |

### Blocked SQB actor recovery (1)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `com0u6` | 111806 | Know Your Enemy | 2289025 | Charledore | do not add SQL row, spawn, loot, reward, or quest completion for blank/property-zero actor path |

### Blocked BNPC actor recovery (6)

| Code | Quest ID | Quest | Actor/Class | Target | Status |
|---|---:|---|---:|---|---|
| `etc1l3` | 110636 | Revenge on the Reavers | 2180301 |  | blocked_log_only |
| `etc1l3` | 110636 | Revenge on the Reavers | 2180302 |  | blocked_log_only |
| `etc1l3` | 110636 | Revenge on the Reavers | 2180303 |  | blocked_log_only |
| `etc1u4` | 110679 | The Customer Comes First | 2180210 |  | blocked_log_only |
| `etc1u4` | 110679 | The Customer Comes First | 2180211 |  | blocked_log_only |
| `etc1u4` | 110679 | The Customer Comes First | 2180212 |  | blocked_log_only |

## Full Fight-Surface Backlog

### SQB (56)

| Code | Quest ID | Quest | Category | Readiness | Actor IDs / Director / Content | Blocking Gaps | Hint |
|---|---:|---|---|---:|---|---|---|
| `blm0j1` | 111261 | Hearing Voices | job | 15 | questdirectorblm0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `brd0j1` | 111301 | A Song of Bards and Bowmen | job | 15 | questdirectorbrd0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `brd0j4` | 111304 | Doing It the Bard Way | job | 15 | questdirectorbrd0j401 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `com0g1` | 111601 | Breaking the Seals | grand_company | 35 | 2202206 | mob type; spawn/content; content map; kill route unreachable; return flow | first real SQB target after smoke adapter |
| `com0g4` | 111604 | The Mail Must Get Through | grand_company | 35 | questdirectorcom0g401 | mob type; spawn/content; content map; kill route unreachable; return flow | fix scene-key alias delegate methods |
| `com0g6` | 111606 | Appetite for Destruction | grand_company | 35 | questdirectorcom0g601 | mob type; spawn/content; content map; kill route unreachable; return flow | fix scene-key alias delegate methods |
| `com0l1` | 111401 | The Price of Integrity | grand_company | 35 | 2200708 | mob type; spawn/content; content map; kill route unreachable; return flow | first real SQB target after smoke adapter |
| `com0l4` | 111404 | Engineering Victory | grand_company | 35 | questdirectorcom0l401 | mob type; spawn/content; content map; kill route unreachable; return flow | fix scene-key alias delegate methods |
| `com0l5` | 111405 | An Officer and a Wise Man | grand_company | 35 | questdirectorcom0l501 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `com0l6` | 111406 | Ceruleum Shock | grand_company | 35 | questdirectorcom0l601 | mob type; spawn/content; content map; kill route unreachable; return flow | preserve explicit client quest id override |
| `com0u1` | 111801 | Career Opportunities | grand_company | 35 | 2200205 | mob type; spawn/content; content map; kill route unreachable; return flow | first real SQB target after smoke adapter |
| `com0u4` | 111804 | Arms Race | grand_company | 35 | 2109801 | mob type; spawn/content; content map; kill route unreachable; return flow | needs selected mob type data before combat enable |
| `com0u5` | 111805 | Burning Man | grand_company | 35 | questdirectorcom0u501 | mob type; spawn/content; content map; kill route unreachable; return flow | preserve explicit client quest id override |
| `com0u6` | 111806 | Know Your Enemy | grand_company | 35 | 2289025 | mob type; spawn/content; content map; kill route unreachable; return flow | needs selected mob type data before combat enable |
| `drg0j1` | 111321 | Eye of the Dragon | job | 15 | questdirectordrg0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `drg0j6` | 111326 | Into the Dragon's Maw | job | 15 | questdirectordrg0j601 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `etc1u7` | 110682 | Clasping to Hope | side_special_misc | 35 | questdirectoretc1u701 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc1u8` | 110683 | Traumaturgy | side_special_misc | 35 | questdirectoretc1u801 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc1u9` | 110684 | Best Flower Ever | side_special_misc | 35 | questdirectoretc1u901 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2g3` | 110667 | Hunting the Hunters | side_special_misc | 35 | questdirectoretc2g301 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2g4` | 110668 | To Deskunk A Beer | side_special_misc | 35 | questdirectoretc2g401 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2g5` | 110669 | Losing One's Thread | side_special_misc | 35 | questdirectoretc2g501 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2i2` | 110708 | Blood Price | side_special_misc | 25 | questdirectoretc2i201 | mob type; spawn/content; content map; kill route unreachable; return flow; reward lock | SQB adapter target |
| `etc2l1` | 110644 | Moonstruck | side_special_misc | 35 | questdirectoretc2l101 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2u0` | 110685 | The Unheard Horizon | side_special_misc | 35 | questdirectoretc2u001 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc2u5` | 110690 | No Other Dodo Will Do | side_special_misc | 35 | questdirectoretc2u501 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc3g1` | 110735 | Scrubbing the Soul | side_special_misc | 35 | questdirectoretc3g101 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc3g2` | 110736 | Disorganized Crime | side_special_misc | 35 | questdirectoretc3g201 | mob type; spawn/content; content map; kill route unreachable; return flow | preserve explicit client quest id override |
| `etc3l1` | 110744 | Winds of Change | side_special_misc | 35 | questdirectoretc3l101 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc3l2` | 110745 | Shot Through the Heart | side_special_misc | 35 | questdirectoretc3l201 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc3u1` | 110726 | Quid Pro Quo | side_special_misc | 35 | questdirectoretc3u101 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `etc3u2` | 110727 | There Might Be Blood | side_special_misc | 35 | questdirectoretc3u201 | mob type; spawn/content; content map; kill route unreachable; return flow | SQB adapter target |
| `gcg103` | 111629 | Shadow of the Raven | grand_company | 15 | questdirectorgcg10301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcg301` | 111617 | Eternal Recurrence | grand_company | 15 | questdirectorgcg30101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcg302` | 111618 | The Pen Is Mightier Than the Spear | grand_company | 15 | questdirectorgcg30201 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcg303` | 111619 | Woes of the Botanist | grand_company | 15 | questdirectorgcg30301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcg305` | 111626 | A Taste for Death | grand_company | 15 | questdirectorgcg30501 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcl103` | 111429 | Deus ex Machina | grand_company | 15 | questdirectorgcl10301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcl301` | 111417 | The Cove | grand_company | 15 | questdirectorgcl30101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcl302` | 111418 | Saving the Stead Instead | grand_company | 15 | questdirectorgcl30201 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcl303` | 111419 | It's a Piece of Cake to Bake a Poison Cake | grand_company | 15 | questdirectorgcl30301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcl305` | 111426 | Oil Crisis | grand_company | 15 | questdirectorgcl30501 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcu103` | 111829 | Careless Whispers | grand_company | 15 | questdirectorgcu10301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcu301` | 111817 | Prying Eyes | grand_company | 15 | questdirectorgcu30101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcu302` | 111818 | Different Strokes | grand_company | 15 | questdirectorgcu30201 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcu303` | 111819 | A Weaver and a Mummer | grand_company | 15 | questdirectorgcu30301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `gcu305` | 111826 | Challenge Accepted | grand_company | 15 | questdirectorgcu30501 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |
| `mnk0j1` | 111221 | Brother from Another Mother | job | 15 | questdirectormnk0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `pld0j1` | 111281 | Paladin's Pledge | job | 15 | questdirectorpld0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `pld0j5` | 111285 | Parley on High Ground | job | 15 | questdirectorpld0j501 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `sim000` |  |  | unknown | 15 | questdirectorsim00005 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock | SQB adapter target |
| `war0j1` | 111201 | Pride and Duty (Will Take You from the Mountain) | job | 15 | questdirectorwar0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `war0j3` | 111203 | Curious Gorge Goes to the Bazaar | job | 15 | questdirectorwar0j301 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `whm0j1` | 111241 | Seeds of Initiative | job | 15 | questdirectorwhm0j101 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `whm0j4` | 111244 | The Wheel of Disaster | job | 15 | questdirectorwhm0j401 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | keep job reward/completion disabled until SQB lifecycle is proven |
| `wvr306` | 110402 | A Fruitful Murder | class | 15 | questdirectorwvr30601 | actor class; mob type; spawn/content; content map; kill route unreachable; return flow; reward lock; scaffold mutation risk | SQB adapter target |

### BNPC_objective (32)

| Code | Quest ID | Quest | Category | Readiness | Actor IDs / Director / Content | Blocking Gaps | Hint |
|---|---:|---|---|---:|---|---|---|
| `etc1g2` | 110656 | A Well-Balanced Diet | side_special_misc | 40 | 2100509 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1g4` | 110658 | The Penultimate Prank | side_special_misc | 85 | 2104508 | director | manual review |
| `etc1g5` | 110659 | The Search for Sicksa | side_special_misc | 40 | 2104022 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1g6` | 110660 | The Ultimate Prank | side_special_misc | 40 | 2101908 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1g8` | 110662 | Say it with Wolf Tails | side_special_misc | 40 | 2100609 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1g9` | 110663 | Embarrassing Excerpts | side_special_misc | 40 | 2100503 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l0` | 110633 | Assessing the Damage | side_special_misc | 40 | 2105409 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l1` | 110634 | Bridging the Gap | side_special_misc | 40 | 2100113 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l3` | 110636 | Revenge on the Reavers | side_special_misc | 40 | 2180301; 2180302; 2180303 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l5` | 110638 | Till Death Do Us Part | side_special_misc | 40 | 2102717 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l6` | 110639 | Beryl Overboard | side_special_misc | 40 | 2107613 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1l7` | 110640 | Have You Seen My Son | side_special_misc | 40 | 2101609 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1u0` | 110675 | A Knock in the Night | side_special_misc | 40 | 2101711 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1u1` | 110676 | Sleepless in Eorzea | side_special_misc | 85 | 2104021 | director | manual review |
| `etc1u2` | 110677 | Dressed to Be Killed | side_special_misc | 40 | 2101816 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1u4` | 110679 | The Customer Comes First | side_special_misc | 40 | 2180210; 2180211; 2180212 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc1u5` | 110680 | An Inconvenient Dodo | side_special_misc | 85 | 2102009 | director | manual review |
| `etc1u6` | 110681 | Besmitten and Besmirched | side_special_misc | 85 | 2105717 | director | manual review |
| `etc2g0` | 110664 | A Forbidden Love | side_special_misc | 40 | 2102708 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2g1` | 110665 | Last Respects | side_special_misc | 40 | 2100512 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2g2` | 110666 | Stone Deaf | side_special_misc | 40 | 2100502 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2i0` | 110706 | Counting Sheep | side_special_misc | 40 | 2101403 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2i1` | 110707 | A Hypocritical Oath | side_special_misc | 40 | 2100314 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2l0` | 110643 | Fishing for Answers | side_special_misc | 85 | 2107601 | director | manual review |
| `etc2u1` | 110686 | Freedom Isn't Free | side_special_misc | 40 | 2106541 | mob type; spawn/content; director; kill route unreachable | manual review |
| `etc2u2` | 110687 | Ore for an Ore | side_special_misc | 85 | 2102105 | director | manual review |
| `etc3u9` | 110734 | Monster of Maw Most Massive | side_special_misc | 40 | 2102717 | mob type; spawn/content; director; kill route unreachable | manual review |
| `wld0g1` | 110762 | In the Name of Science | world_sidequest | 85 | 2106214 | director | manual review |
| `wld0g3` | 110764 | A Bitter Oil to Swallow | world_sidequest | 40 | 2103910 | mob type; spawn/content; director; kill route unreachable | manual review |
| `wld0g4` | 110765 | Spores on the Brain | world_sidequest | 85 | 2105916 | director | manual review |
| `wld0u2` | 110754 | Sanguine Studies | world_sidequest | 40 | 2106537 | mob type; spawn/content; director; kill route unreachable | manual review |
| `wld0u4` | 110756 | Rustproof | world_sidequest | 40 | 2106542 | mob type; spawn/content; director; kill route unreachable | manual review |

### bespoke_content (6)

| Code | Quest ID | Quest | Category | Readiness | Actor IDs / Director / Content | Blocking Gaps | Hint |
|---|---:|---|---|---:|---|---|---|
| `man0g0` | 110005 | Sundered Skies | main_scenario | 100 | man0g01:SimpleContent30010:Quest/QuestDirectorMan0g001 |  | bespoke private-content/fight validation |
| `man0l0` | 110001 | Shapeless Melody | main_scenario | 100 | man0l01:SimpleContent30002:Quest/QuestDirectorMan0l001 |  | bespoke private-content/fight validation |
| `man0l1` | 110002 | Treasures of the Main | main_scenario | 100 | Man0l101:SimpleContent30002:Quest/QuestDirectorMan0l101 |  | bespoke private-content/fight validation |
| `man0u0` | 110009 | Flowers for All | main_scenario | 100 | man0u01:SimpleContent30079:Quest/QuestDirectorMan0u001 |  | bespoke private-content/fight validation |
| `man200` | 110013 | Fade to White | main_scenario | 100 | man20001:SimpleContent30080:Quest/QuestDirectorEventMan20001 |  | bespoke private-content/fight validation |
| `man2g0` | 110008 | Beckon of the Elementals | main_scenario | 75 | man2g01:SimpleContentMan2g01:Quest/QuestDirectorMan2g001 | kill route unreachable; return flow; timed fake fight | bespoke private-content/fight validation |

