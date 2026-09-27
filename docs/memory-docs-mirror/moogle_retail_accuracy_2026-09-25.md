# Moogle retail accuracy review — 2026-09-25

**Current status:** the September 26 floor-supported implementation at the end
of this report adds recorded homes, mesh-checked roaming, help coordination,
reward coffer and native exit dialogue. Earlier absence statements describe
prior reviews.



This pass concerns the original FFXIV 1.x Thornmarch encounter. The existing

September 7 native-command audit remains authoritative for installed command

fields. ARR Hard/Extreme mechanics and fan-created crossover abilities are not

evidence for this encounter.



## Corrections supported by the review



| Subject | Evidence | Implementation decision |

|---|---|---|

| Royal Maximoogle | [Pseudopsia/MIKU's firsthand strategy, December 20, 2011](https://forum.square-enix.com/ffxiv/threads/33496), ability list; independently, [Famitsu's firsthand clear report, December 18, 2011](https://www.famitsu.com/news/201112/18007297.html), kill-order discussion | Inherited Maximoogle targets the King himself. MIKU identifies a random chase target for this case. The bard's version still selects another court member and uses the singer's hate. |

| Mogdive users | MIKU's ability list assigns Mogdive to the gladiator, bard and King | Remove the generic Mogdive fallback from Furryfoot, Pomburner, Tailturner and Ruffletuft. Preserve Woolywart's ranged fallback. Empty alternate slots do not accelerate the existing special-action cadence. |

| King level | The main `server_battlenpc_mob_types.sql` BNPC 3044 row, matching loot profile and retained `docs/ffxiv-1.0-wiki/pages/Thornmarch.html` list 55 | Use the existing profile level instead of the director's level-50 override. This is database/archive agreement, not a level read from the video. |

| Court Cure IV | Fresh 16:00 frame below directly shows the King healing another moogle; engine inspection finds that unpartied NPCs fail the player spell's `PartyOnly` completion mask | Permit self/allied recipients on the execution copy only for the director-controlled Moogle healer/King. Preserve player and unrelated NPC spell behavior and the healing formula. |



The old target selector excluded its caster even when the caster was the King.

It therefore enlarged a surviving retainer and had no target when the King was

alone. The corrected director explicitly separates a royal self-cast from a bard

cast and selects a random live chase target on successful completion. Production

`CopyHateFrom` already guards self-aliasing; the former Lua test double did not.

A bard enlarging the King remains a separate singer-hate case.



The Maximoogle command's self-recipient permission must exist in the main command

SQL as well as its optional migration, because admission checks the cached

command before Lua preparation. Cure IV's correction is instead scoped to the

per-execution spell copy: accepted casting alone did not guarantee that its

recipient survived the completion filter.



The level correction changes level-dependent calculations. Existing HP, authored

potency, fixed hits, cast times and placement coordinates retain their prior

evidence boundaries. Cadence, target-selection timing within action completion,

and other server policies are reconstructions, not recovered retail constants.



## Fresh video inspection



The retained [A Feast of Fools recording](https://www.youtube.com/watch?v=hDZy_jGvHxk)

was inspected through existing contact sheets at 9:00–20:55 and selected fresh

1280×720 decoded frames. This was sampled review, not continuous playback or a

complete log transcription. Timestamps below are video time.



| Timestamp | Directly visible | Boundary |

|---|---|---|

| [14:30](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=870s) | Battle log identifies **Puksi Piko** readying Maximoogle. | Identifies the singer in this occurrence. |

| [14:35–14:40](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=875s) | An enlarged crowned King is visible; party chat comments on the enlarged King. | Together with the preceding bard log, supports preserving bard-to-King enlargement. It does **not** prove a royal self-cast. |

| [16:00](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=960s) | The King casts Cure IV on Ruffletuft, restoring **2,953 HP**. | Supports the existing inherited ally-heal behavior; one sample does not recover its formula. |

| [17:20](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=1040s), [18:15–18:30](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=1095s) | King target panel displays **??**; later log entries repeatedly name Moogle-Go-Round. | No numeric level or exact frenzy threshold/cadence can be read from these samples. |

| [20:25](https://www.youtube.com/watch?v=hDZy_jGvHxk&t=1225s) | Whiskerwall remains in combat late in the run. | Consistent with keeping the all-eight victory condition. |



Fresh frames and their [source/hash manifest](evidence/moogle-retail-20260925/manifest.json)

are under `docs/evidence/moogle-retail-20260925/`. The frozen recording's SHA-256 is

`425bb04e77b004db4c80c221d0cfba69480ff016de90a635840e67643e750890`.

The manifest distinguishes extracted timestamps from individually inspected

frames. Existing five-second contact sheets remain in `.codex-moogle-footage/sheets/`.

No fresh video sample proves the King's self-cast target-selection rule; the

two contemporary firsthand reports support that correction.



The earlier [Rabanastre SeeD recording](https://www.youtube.com/watch?v=IdMbBbsQw3k)

remains evidence recorded in the September 7 report; it was not newly inspected

in this pass. Search also found the [January 24, 2012 speed-clear author's

post](https://www.ffxiah.com/forum/topic/28281/good-king-moggle-mog-xii-defeated-in-short-order)

and its [linked video](https://www.youtube.com/watch?v=ZxkFwTosB-4).

The author reports royal healing and enlargement affecting clear time, but this

video was not played here and supplies no newly verified frames.



## Remaining evidence gaps at the first review (superseded below)



MIKU describes help requests by five lesser roles, answered by Whiskerwall, the

healer or King with pursuit/healing. Famitsu independently describes pursuit

after an ally requests help. Neither source recovers exact request conditions,

frequency, duration or action admission. This review therefore does not replace

the current authored hate-reset schedule with an invented help-call timer.

The speed-clear author's reference to royal enlargement while attacking the King

does not identify a health percentage. Other inherited arts during the existing

below-half-health Go-Round frenzy remain an evidence gap.



[Erwald's January 22, 2012 firsthand strategy](https://forum.square-enix.com/ffxiv/threads/35955-Good-King-Moggle-Mog-XII-Battle-Strategy)

describes independent movement by the archer, healer and thief. Famitsu describes

Pomburner moving through the arena. Routes, floor support, movement cadence and

precise targeting policy remain unmeasured; no new world coordinates or patrols

are introduced by this pass.



The native Eye Shot marker, role movement, detailed enmity fixation, King defense

curve, reward probabilities, physical chest/exit actor and client presentation

remain open. A passing offline suite does not establish live-client acceptance.



## Validation



Passed against the completed changes:



- `python -B tools/validate_moogle_encounter.py`: all 13 named command contracts,

  including agreement between main SQL and the optional migration.

- `dotnet run --project tools/moogle-encounter-tests/MoogleEncounterTests.csproj --no-restore`:

  21 scenarios, including successful/failed royal self-enlargement, bard-to-King

  threat, restoration/cleanup, role arts and complete encounter victory.

- Production Moogle battle harness: 83 checks against the isolated fresh

  `.codex-build/moogle-retail-20260925/map/Map Server.dll`. The real Lua hooks,

  `BattleNpc.CanUse` and `TargetFind.FindWithinArea` reproduce both old targeting

  failures and verify self/ally recipients, enemy rejection, range/area checks,

  unrelated caster behavior and command-cache isolation.

- Map Server build: zero errors; five pre-existing dependency/compiler warnings.

- Shared Garuda validator, 108 encounter cases, 20 wind-publication cases and

  368 production engine checks pass.



The production targeting checks do not simulate a whole cast through network

delivery or prove in-client healing/animation. Existing damage formulas and

authored encounter timing retain their earlier limits.



No live database was changed and no running server was restarted. Fresh imports

receive the Maximoogle target masks from `Data/sql/server_battle_commands.sql`.

For an existing database, the matching optional

`Data/sql/live migrations/moogle_command_contract_20260907.sql` can be reapplied;

reload the updated scripts and command cache through the normal safe server

restart before testing. The current changes require no new C# runtime API.



Client acceptance still needs a run that checks Furryfoot/King ally healing,

royal self-enlargement after Shaggysong dies, bard-to-King enlargement before he

dies, the King's level display, and the court's corrected role attacks. The

level-55 value is not expected to be numerically visible when the native client

uses its unknown-level display.



## Second implementation review — 2026-09-26



**The recent corrections are implemented and pass offline checks; the encounter

is not yet a complete retail reconstruction.** This review inspected the current

director, main command/profile SQL, matching migration, Lua effect and Cure IV

hooks, production command admission/recipient discovery/heal finishers, and both

Moogle harnesses. No additional runtime defect was confirmed in the recent pass.



| Requirement | Current evidence | Result |

|---|---|---|

| King self-Maximoogle and random chase | Director self-target branch; successful support handoff; real command admission/recipient/finish checks; Lua two-player, solo, failure, expiry and cleanup scenarios | Implemented; rendering and chase presentation need client acceptance |

| Bard-to-King remains singer-based | Separate completion-source branch and deterministic Lua scenario; retained 14:30/14:35 frames | Implemented offline |

| Furryfoot/King Cure IV heals allies | Scoped execution-copy mask plus real `onSkillFinish` → `CommandResult.DoAction` → heal finisher; ally/self HP restoration and MaxHP clamp assertions | Implemented; full timed cast and wire/client path remain untested |

| King level 55 | Both current main BNPC profile sources agree with the director's level argument; Lua spawn assertion | Implemented; not a numeric observation from the video |

| Role-specific Mogdive | Explicit director role branches and four-slot tests for each lesser | Implemented; special cadence remains authored |

| Main SQL is sufficient without migrations | Static validator checks all 13 named rows and matching migration fields | Passed |

| Phase/lifecycle preservation | Lua scenarios cover staggered waves, completion-gated Memento, interruption, replacement rollback, threat carry, learned arts, recovery, all-eight victory, rewards and exit with engine doubles | Passed; not a real eight-player/client run |

| Full retail behavior | Help-call coordination and role roaming are absent; Eye Shot uses text; rewards use a provisional charm policy; no physical reward coffer or Fretful Moogle exit conversation; defense curve and low-health art availability remain unresolved | Incomplete |

| Live activation and client acceptance | No database application, server restart or new client run was performed | Unverified |



The earlier 83 engine checks stopped at recipient discovery for the new Cure

correction. Eleven added assertions now execute the real finish hooks: healing

actually changes ally/self HP, clamps at MaxHP, and royal support publishes its

pending enlargement without damaging the King. This strengthens verification;

it does not establish original cure formulas, network delivery or visual timing.



Fresh review results: 21 Lua scenarios, 94 production engine checks and the

13-command SQL/migration validator pass. The current source builds successfully

into `.codex-build/moogle-review-20260926/map/` with zero errors. The test runner

reported the existing unavailable NuGet vulnerability-feed warning. Only tests

and documentation changed during this second review; runtime and SQL retain the

previous pass's fixes.





## Floor-supported implementation — 2026-09-26



This follow-up implements the previously absent help calls, role roaming,

physical victory coffer and Fretful Moogle exit. It supersedes the absence

statements above. Current runtime now requires the rebuilt C# server, generated

`MoogleArena.lua`, the frozen recording/manifest and zone-specific XIVNAV mesh.

No live database or running server was changed.



The 115-point frozen zone-238 quicknav recording and actual `fst0Field04.nav`

show that the former (-2350,-890) center is the east-side entrance. The new

geometric center is (-2368,-896), with a 20.5-yalm boundary backed by 72 mesh

wall rays. Seven homes, the King, seven ritual destinations, eight entry slots,

coffer and exit use exact frozen recorded XYZ. Role assignments are authored,

not recovered retail actor coordinates. The movement planner projects complete

paths onto the actual floor and rejects partial/disconnected paths, steps outside

the inset arena, invalid heights and changed source hashes. Pukla, Shaggysong,

Furryfoot, Woolywart and Tailturner roam between recorded candidates on an

8–12-second authored cadence; queued casts, enlargement, ritual and cleanup

release these paths. See the generated `Data/raidroutes/thornmarch_navigation.json`

and `tools/mobspawns/thornmarch_navigation.py` for source IDs and hashes.



Help calls now use the period-described five caller roles and three responder

roles. A newly damaged caller can request Furryfoot/eligible King's Cure IV,

or Whiskerwall/King pursuit of its current highest-enmity player. Normal threat

is retained while the pursuit override lasts. The damage trigger, below-75%

healing preference, 20–30-second per-caller cooldown, twelve-second pursuit,

and precedence over Taunt are explicit reconstruction choices. Pursuit pins

the original instance and player Session; death, disconnection, replacement,

expiry, cutscene protection and ritual/cleanup invalidate it. This replaces

the unrelated periodic royal random hate wipe. Successful royal self-Maximoogle

still has its independent random chase.



Victory now retains an authored five-minute aftermath window. The physical

coffer uses a retained per-character reward selection with partial-delivery

retry and no duplicate successful items. The known seven-weapon roster and

materials are in the main loot SQL, with a matching optional migration. Odds

remain authored: guaranteed charm; one optional weapon (14% total, 2% each);

20% Grade 5 Dark Matter; 10% Vampire Plant; 10% Unmarked Keystone. The existing

five-key eligibility and GM reward suppression remain; keys are not consumed

without stronger evidence. The Fretful Moogle uses native `Sum6m0` exit dialogue

and confirmation. Donor appearances, homes and exact chest packet presentation

still require client acceptance. Details and tests are in the aftermath report.



The [Eye Shot native audit](moogle_eye_shot_marker_2026-09-25.md) reproduces four

schedules and 828 VFX banks. It confirms shot/impact effects but does not recover

a warning selector plus start/target/cancel protocol. The existing text warning

remains; no unrelated icon was substituted. The King defense curve, exact

low-health art availability, historical random distributions and live rendering

also remain unverified. These limits prevent a claim of complete retail parity.



Validation for this follow-up: 24 Lua encounter scenarios; 112 production

Moogle engine checks; 176 actual-mesh policy checks; both shared coordinate

suites (34 tests); 368 Garuda cast checks; the ordinary final server build succeeds with zero errors (four existing dependency warnings).

The new coffer/exit helper has a separate reward and production authorization

suite. A local client run still needs to accept floor contact, roaming, help

pursuit, coffer interaction/retry, native exit dialogue and normal-party behavior.



Shared end-of-patch combat, detection range and aggro/hitbox contracts also pass (including 244 dungeon/outdoor aggro checks). The combat fixture was updated only to recognize the new scoped help override before the existing Taunt lock. Windows sandbox temporary-directory ACLs blocked the coordinate fixtures initially; rerunning the unchanged 34-test suite outside that sandbox passed.


The final coffer/exit suite passes 70 checks; see [the aftermath report](moogle_aftermath_2026-09-25.md) for main SQL, native dialogue and client acceptance details.


Final ordinary build and production fixtures use
`.codex-build/moogle-complete-20260926/map/Map Server.dll`, with no compatibility
overlay or source substitutions. The temporary concurrent seasonal compile
blocker was resolved in that work before final validation. The 112 Moogle,
70 aftermath and 368 Garuda checks pass against this actual-source assembly.
