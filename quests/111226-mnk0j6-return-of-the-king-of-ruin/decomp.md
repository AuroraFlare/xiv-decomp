# 111226 Return of the King...of Ruin (Mnk0j6) — in-depth decomp

Monk 50, quest 6/6 (finale). Offer: Professor Erik (1060033), Pugilists'
Guild, Ul'dah zone 175 (-32.453, 192.10, 45.343; spawn id 2466). Requires
MNK job + level 50 + PGL secondary 15 gate + completed 111225.

Erik's published findings drove Widargelt to Silvertear Falls (Mor Dhona)
to force open the seventh chakra. At the falls — strewn with slain XIVth
Legion soldiers — the player must defeat Widargelt the Watcher plus his
four Ala Mhigan retainers; the seventh chakra opens, both aether calm, and
Erik closes the arc (decking Widargelt, then the aether-and-responsibility
speech). The fifth and final garb piece is the reward.

## Sequence / flags (server: job_quest_template.lua `Mnk0j6`)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Erik offer | `processEventERIKStart`: talks 3-14 + 76/80-94; accept 59 / decline 58,93 ("stop the simpleton monk") |
| 0 | Travel boundary | No route steps → talk to Erik → preEvent `processEvent005(true)` → `mnk0j610` (boolean true selects the Default-fade branch; any other value = AfterWarp; numeric 1 NOT equivalent) → private battle at seq 5 |
| 5 | Defeat Widargelt + 4 adds | Private content `quest_sqb_mnk0j6_<pid>`; `requireAllTargets` over 5 exact uniqueIds |
| 9 | Aftermath (persisted BEFORE the movie) | `processEvent015` → `mnk0j620` (unconditional AfterWarp) via real same-content reload; private Widargelt `mnk0j6_aftermath_widargelt` |
| 10 | Reward at private Widargelt | `processEvent020(8032702)` (Widargelt's speech + 5th piece; belongs to Widargelt, NOT Erik) + `processEventClear` (talk 115 + Hundred Fists 27106) |

Hint/follow variants (15-17 Little Ala Mhigo pre-talk, 74-79, 82-89) are
contextual, not objectives. Journal: Wil 555 (Silvertear; RECOMMENDED up to
7 companions, 8 total) / 556 (subdue Widargelt) / 557 (comfort Widargelt).

## Dialogue (recovered DAT mnk0j6.csv, EN)

- Offer 9/10/14: "What have I done!? ... I fear the words I offered may have
  driven Widargelt to attempt the insane." / seventh-chakra isolation +
  "Silvertear Falls!" / "You must stop him!"
- 76: "Hasten ... to Silvertear Falls, now! Stop the simpleton monk!"
- Falls 24-33 (Widargelt): Garlean corpses; "The seventh chakra swells
  within me. Soon it will open." / "Ah, [sister/brother]. You are late." /
  "Rejoice!"
- 98/100: "The fifth and final piece. It is yours to claim. But only if you
  defeat me." / "This is my sacred battleground. The battle between you
  and I."
- 40/44-46 (Erik arrives): "That light! ... the opening of the seventh
  mechanism? Fascinating!" / "Why did you strike me?" / "Silence, you bloody
  fool! ... Next time, I shall bring a stick!"
- 47-52/56 (Erik's speech): Cid Garlond's center-of-the-world; Silvertear
  aether = chakra; "We all share in the same existence." / "With great
  power comes great responsibility."
- 69-72/114/115: "revenge" / thanks / "The fifth piece is yours. ... For
  one whose seventh chakra is open." / "Farewell ... May Rhalgr watch over
  you." / "The ancient aether of Silvertear Falls opens your seventh chakra!"

## Objectives / markers (DAT quest_marker)

11221501: zone 190 Mor Dhona, X/Z -138.759995/345.190002, display 4000257
(area), m00013/105/501. 11221502: same X/Z, display 2200241 (Widargelt
linkshell actor). Continuous map (11.41, 16.89) — corroborated by the retail
archive's Mor Dhona (11-16) location for all five mobs.

## Positions (coord guide `locate --zone 190 --world -138.76 345.19`)

- 0 recorded nodes in selection (live + premerge 190); nearest Y 13-17 at
  ~72u; scene Widargelt Y≈18.1-18.6. Per guide ("Agent workflow"): center Y
  unresolved → the adapter spawns at the caller's valid position; NO public
  Silvertear owner is fabricated (the public Widargelt spawn is in Eastern
  Thanalan and must not be reused).

## Instance / territory

- Fight: SimpleContentQuestBattle copy `quest_sqb_mnk0j6_<pid>`, boundary
  radius 45, DisableReentry, timeout 900 s, cap 8. Entry movie mnk0j610 is
  skippable (launch already staged); aftermath mnk0j620 is an AfterWarp real
  reload that re-lands safely; reward is independent of playback.
- Client director `QuestDirectorMnk0j601` is an EMPTY QuestDirectorBaseClass
  shell (not SimpleQuestBattle): no HP threshold, chakra phase, add-spawn
  callback, or status transition. The 900 s timeout is the fail pressure.

## Fight: Widargelt the Watcher + 4 adds (all-or-nothing)

Retail levels/jobs (contemporary Jan-2013 Gamerescape archive, local
nm-pages snapshots): boss 55/Monk; axeman 53/Marauder; pikeman 53/Lancer;
bowman 53/Archer; shaman 53/Conjurer. All Mor Dhona (11-16) for this quest.

| Target | Actor/display | Mob | Job/lv | List |
|---|---|---|---|---|
| Widargelt the Watcher | 2289039/3280321 | 3115 | 2/55 | 15 |
| Ala Mhigan pikeman | 2289040/3280322 | 3036 | 8/53 | 15 |
| Ala Mhigan axeman | 2289041/3280323 | 3032 | 4/53 | 15 |
| Ala Mhigan bowman | 2289042/3280324 | 32762 | 7/53 | 15 |
| Ala Mhigan shaman | 2289043/3280325 | 3037 | 23/53 | 14 |

- All five actor/display bindings verified in gamedata_actor_class.sql.
- Mob stats: speed 6, hostile; boss notorious; detectRange 10; resists 1.0.
  List 15 (boss-physical): animal_instinct, godsbane, jump, wyvern_dive.
  List 14 (boss-magic): sonorous/terrene/aerial blasts, remembrance,
  chthonic_call, blaster.
- Bowman mob 32762 is the NEW private profile (actor/display exact; job 7
  ARC + list 15 mirror the pikeman/axeman rows; archive corroborates
  Lv53/Archer). Scene dictionary shells 1001978-81 (pikeman/axeman/bowman/
  shaman) corroborate the four-add roster.
- Shaman job is CNJ 23 per the archive (loot staging agrees); the earlier
  mob_types THM 22 + flat lv50 rows are corrected this pass (see below).
- Widargelt server job stays PGL 2 (both SQL files agree); the archive's
  "Monk" label is noted as an owner follow-up, not changed (balance
  judgment, no retail stat evidence).
- Single simultaneous wave (no wave fields); NO invented phases — the
  seventh-chakra narrative is mechanic context only; victory = all five
  exact uniqueIds dead inside the boundary. Quest `onKillBNpc` inert;
  director reconciliation as in 111224.

SQL provenance note (installer orders mob_types.sql BEFORE mob_types_loot.
sql): the loot file's NM staging (lv53/55, shaman CNJ23) already carried
the retail-correct values and wins at load; this pass aligns the mob_types
rows to the same levels/job so partial installs cannot produce a different
fight. Residual install-path variance (speed/notorious/respawn/dropListId
loader defaults) is inert in one-shot private content (one-shot lifecycle,
zero drop rows for these IDs) and is flagged for owner unification.

## Triggers / edge handling

Eligibility gates on offer/state/talk/kill/journal. Exact-5 kill credit at
seq 5 in-shell. Victory persisted at seq 9 BEFORE the movie; Erik reopens
an interrupted aftermath/reward WITHOUT replaying combat or the completed
movie (recovery shell `QuestDirectorJobMnk0j6Aftermath`,
aftermathOnly; ownership = area + uniqueId + landing checks). Death/
timeout/disconnect/area-exit/abandon → retry 0 (Erik) for seq 5, or Erik
recovery for seqs 9/10. Post-movie revalidation guards replaced journals.
Party: leader-only, cap 8, entry + post-movie rechecks; no helper credit.
Leash 45 yalms; standard engine enmity; no sync; no lockout beyond 900 s.
No chocobo (mounted blocked pre/post-movie; no in-content mount surface).
Aftermath NPC ownership prevents public-Erik reward confusion.

## Rewards

Temple Cyclas 8032702 (5th piece, via Widargelt's `processEvent020` arg) +
Hundred Fists 27106 (job 15, lv 50). No EXP (none authoritative for 50).
CORRECTION: the 1.0 finale ability is Hundred Fists (1.0 quest page +
official forum: "50 the last quest where you get the body AF and hundred
fists ability"), NOT Form Shift (ARR anachronism in the earlier note).

## Sources

DAT mnk0j6.csv dialogue; DAT markers 11221501/02; gamedata_actor_class rows
2289039-43; mob_types rows 3115/3032/3036/3037/32762; skill lists 14/15;
1.x archive wiki (Monk Quests 1.0 page; nm-pages levels/jobs/map);
Garlemald issue #131 reconstruction; fandom Widargelt page (instance
battle); map_coordinates locate 190 (+ premerge 190).
Validator `tools/validate_job_mnk0j6_route.py` PASS.
