# Blm0j6 Always Bet on Black (111266) indepth decomp - 2026-09-27 (JOB BLM)

Lv50 finale. Da Za -> Dozol Meloc -> Kazagg Chah -> (linkpearl contact) ->
Lalai at Milvaneth -> Nald's Reflection: slay Barbatos + Void Lanterns ->
Ququruka's confession -> Wizard's Coat. Status: ENABLED private adapter.

## Client scenario (tools/outputs/lpb/content_systems_20260612/.../blm/blm0j6.lua)

- Offer `processEventStart` (single stored result, pc53). Route talks:
  `processEventDozol01` (14-21,100), `processEventKazagg02` (25-31,101),
  `processEventLalai02` (38-49,105). Numbered alternates are reminders.
- Journal stage 493 requires an incoming linkpearl contact before Lalai;
  the scenario has no `showEventBeforeNpsLS` for it (push originates
  elsewhere). NOT staged by renaming a Follow method; remains a follow-up.
- `processEventNQ01`: fade-out, `startNQCutScene("blm0j610", 1)`, then
  STRICT-BOOLEAN fade: `arg == true` -> default, else after-warp (scene CALL
  pc6, EQ-true pc7, default pc11, after-warp pc15; numeric 1 takes warp).
- `processEventNQ02`: blm0j620 + after-warp. `processEventNQ03`: blm0j620 +
  default. Exactly ONE aftermath plays, never both.
- `processEventAfget(itemArg)`: text 106/wait 8, ability `(27316,2)`/wait 6
  (27316 is Burst, not Flare), caller item widget/wait 6. Coat 8032707 comes
  from reward data, not the method.
- `QuestDirectorBlm0j601` is an empty shell: no waves/positions/lifecycle.

## Stages / markers / positions

- Sequences: 0 Da Za offer -> 0/1/2 tribal route -> 5 battle -> automatic
  content completion (no public reward NPC).
- 11223501 Dozol: -1513.660034/-235.220001. 11223502 Kazagg:
  -1506.540039/-233.970001. 11223503 Lalai (Milvaneth): 18.16/283.670013.
- 11223504 battle (Nald's Reflection, zone 174): 915.130005/661.270020.
  Map cell (36,37); nearby ground Y 309-312; blm0j610 shot (908.10, 311.59,
  656.09), blm0j620 shot (863.42, 309.01, 654.70).
- blm0j610 cast: GARGOYLE/FreezeGARGOYLE 1001973 + WISP_A 6500044 + nine
  WISP slots 1001974 (presentation only: NOT ten combat lanterns, NOT a
  subclass binding). Journal: seven companions (8 total).

## NPCs / mobs (verified mechanics)

- Da Za 1060038 / Dozol 1060037 / Kazagg 1060036 (zone 172 spawns) /
  Lalai 1060035 (zone 209).
- Barbatos: actor 2203503 (GargoyleLesserBlm0j6/display 3203505), mob 3002
  (NOW 50/50, HP 34000/MP 8000 documented estimates; was level 0 = runtime
  level 1), skill list 10 (Flare/Blizzard II/Freeze/Aero II/Tornado/Quake/
  Water II/Flood/Megaflare + Blind/Sleep/Silence/Gravity/Paralyze/Slow).
- Void Lanterns: quest actors 2209906-08 (one model/display 3209907); NEW
  quest profile 32760 (level 48 published, HP 12000/MP 3000 estimates,
  wisp-family skill 5010: Self-destruct/Combustion/Fast Burn).
- Retail rules (period Barbatos guide + journal audit): kill Barbatos wins;
  lantern deaths optional; each lantern repops 45s after death UNLESS all
  die together (simultaneous AoE burst required); tank holds Barbatos while
  casters clear adds between pops.

## Adapter (this pass)

- Template: offer, 3-step route, preEvent NQ01/{true} (default branch,
  launcher-owned), targets=[Barbatos], cap 8, minimumLevel 50.
- `QuestDirectorJobBlm0j6`: Barbatos-only victory; 4 director-spawned
  lanterns (uniform 2209906, Blm0j3 repeated-class precedent); per-second
  repop tick (45s each; permanent suppression once all 4 die inside a 10s
  window - count/window are labeled tuning for "several"); NQ03/blm0j620
  aftermath then automatic Afget via CompleteJobQuestFromContent.
- No retail enrage: 1200s timeout is the fail condition. Full shared guards:
  wipe/retry, re-entry refusal, abandon/reacquire teardown, party/solo,
  cutscene-skip acknowledgement, disconnect, death-during-event, boundary
  circle, retrigger lease. Starts at Lalai (public Nald's Reflection
  trigger unrecovered - documented limitation, Mnk0j6 precedent).

## Addendum 2026-09-27 (implement-blm-b pass; 100% audit)

- Web (inspected bodies): Final Fantasy Wiki 1.0 journal confirms the
  Dozol -> Kazagg -> linkpearl(Lalai) -> Milvaneth -> Nald's Reflection
  route, "up to seven party members may accompany you (Recommended)"
  (cap 8 total, matches adapter), and Wizard's Coat + Burst rewards.
  Period forum thread "LFM Always Bet On Black" (search snippet):
  "tank grabs Barbatos and runs him to the entrance", "Between pops,
  damage Barbatos, but be sure to keep MP up to deal with adds" -
  corroborates Barbatos-kite plus 45s add repop; the "weapons glow =
  more damage" note is an unrecovered mechanic, not staged. No 1.0-era
  YouTube footage found (results are ARR only).
- Coordinates (mob_map_coordinates.md "All-zone interface" + "Agent
  workflow" `locate`): 11223504 zone 174 (915.13, 661.27) -> map
  (36.02, 37.33), cell (36,37) - matches the period "36,37 Black Mage
  AF Quest Cave" report. 0 recorded nodes in selection (nearest 461u
  away), so per "Generate placements" (recorded XYZ only, never
  invented ground; private zones JSON-only, no public SQL) the fight
  keeps owner-anchored private formation (Barbatos at leader +4 yalms,
  lanterns +/-6) with Y from the owner. No public mob SQL written.
- 100% checklist (all verified by file read this pass): NO chocobos -
  launcher isMounted gates pre/post movie (gc_sqb_quest.lua) + engine
  mount-restricted private areas (loophole-matrix rows 24-26) + new
  director header note; FULL fight - Barbatos-only victory, 4 lanterns
  with 45s repop + 10s simultaneous-kill suppression, 1200s timeout,
  skill lists 10/5010 (AoEs/enmity via engine AI); death/abandon/
  re-enter/disconnect/logout via gc_sqb_runtime branches + Disable-
  Reentry + lifecycle lease (loophole-matrix rows 1-13); leash via
  45-yalm boundary circle; reset via retry seq 0 (route flags persist)
  or seq-5 direct relaunch; aggro/sequence-break via exact-actor kill
  reconciliation + boundQuestIsCurrent + inert quest onKillBNpc.
- Item-loss fix (this pass, shared template): completeJobQuest now
  refuses completion unless every promised key item/item is visibly
  possessed (engine AddItem is void over tri-state AddItem and
  swallows ERROR_FULL); grantItems skips re-granting possessed
  single-copy items so the retry cannot duplicate the coat. Harness
  test "Black Mage 50 full inventory refuses completion and retries
  without loss" added to test_content_rewards.lua.
- Tests: validate_job_blm0j6_route PASS; MoonSharp content_rewards
  group 17/17; full MoonSharp suite 993 passed / 1 failed where the
  single failure is the parallel MNK worker's in-flight Mnk0j5
  objectives ("Unverified coffer/object actors remain absent"),
  untouched by this pass. validate_quest_availability PASS (42 rows);
  blm0j1/blm0j2/blm0j3 routes PASS; counter slots PASS (527 scripts).
- Open: linkpearl-contact journal stage 493 push owner; public Nald's
  Reflection trigger owner; retail lantern count/simultaneity window
  (4 copies + 10s stay labeled tuning); weapons-glow damage-shift
  mechanic unrecovered.
