# 111224 Good Vibrations (Mnk0j4) — in-depth decomp

Monk 45, quest 4/6. Offer: Professor Erik (1060033) in the Pugilists' Guild,
Ul'dah zone 175 (-32.453, 192.10, 45.343, rot 2.622; spawn id 2466). Requires
MNK job + level 45 + Pugilist secondary 15 gate + completed 111223 (server
gates; gamedata prereq chain via template `prerequisite`).

Erik has caught the player's duplicate-readings ruse (same-site measurements
as Widargelt) and now theorizes battlefield aether resonates with the body's
own aether. He hands over the Experimental Aetheriometer (11000555) and sends
the player northwest of Camp Horizon to slay the basilisk Apep; the released
land-aether opens another chakra (Dragon Kick). Widargelt is sent to the East
End for a comparative experiment.

## Sequence / flags (server: job_quest_template.lua `Mnk0j4`)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Erik offer | `processEventERIKStart`: talk rows 8-15; accept 17,18 / decline 16; grants 11000555 (HasItem-guarded) |
| 0 | Launch boundary (no route steps) | Talk to Erik again (or accept directly) → `StartPrivateQuestBattle` → seq 5. Failed launch reverts to 0 |
| 5 | Slay Apep NW of Camp Horizon | Private content `quest_sqb_mnk0j4_<pid>`; single kill credits via director only |
| 10 | Return to Erik | `onJobQuestCompleteFirst` (51125 + 11000555 presentation), `Second` (Dragon Kick 27118, mode 3 — do NOT normalize), `Third` (linkshell 2200241 = Widargelt, event 93); instrument removed at reward (`removeItems`) |

Ambient/hint variants (19 Widargelt send-off, 33-36 + 38-51 Erik lectures) are
contextual dialogue, not ordered objectives. 550 is a next-quest notice
(Widargelt). Journal: Wil 549 (measure NW of Camp Horizon; RECOMMENDED up to 7
companions, 8 total) / 550 notice. No cutscene assets (no skip surface).

## Dialogue (recovered DAT mnk0j4.csv, EN)

- Offer 8: "Poring over the data, I finally arrived at a disheartening
  conclusion: the two of you took measurements of the same area!"
- 13/14: "It was the flow of the aether within the two of you which betrayed
  your falsehood. The whispering of your chakra ..." / battlefield-wave
  resonance lecture.
- 15: "Here, take this [Experimental Aetheriometer]."
- 17: "I believe I shall send the simpleton monk to East End."
- 48/49: "Make for the area northwest of Camp Horizon. ... Slay the basilisk
  there known as Apep and record for me the measurements within your own
  body." / "Slay it to release that aether, and it may resonate with your own."
- 51: "You need do nothing more than slay the basilisk the smallfolk have
  dubbed Apep."

## Objectives / markers (DAT quest_marker)

11221301: zone 172 Western Thanalan, X/Z -1670.089966/-1212.099976, display
4000257 (area, not actor), m00029/104/403. Continuous map (10.17, 18.60).

## Positions (coord guide `locate --zone 172 --world -1670.09 -1212.10`)

- 21 recorded nodes in selection; nearest `!pos 172 -1675.417 55.632 -1212.309`
  (node 3926, 5.3u). 0 ambient mobs in selection.
- Per guide ("Agent workflow"): center Y stays unresolved; the adapter spawns
  at the caller's valid position, so no public Apep row is needed or added.

## Instance / territory

- Fight: SimpleContentQuestBattle copy `quest_sqb_mnk0j4_<pid>`, boundary
  radius 45, spawn = caller pos + 4 yalms facing. Re-entry disabled
  (`DisableReentry`). Timeout 900 s. Party cap 8 (journal recommendation).
- Client director is an EMPTY QuestDirectorBaseClass shell (not
  SimpleQuestBattle): no count, wave, phase, or kill callback recovered.

## Fight: Apep (single, lv 53)

- Actor class 2100723 = `/Chara/Npc/Monster/Basilisk/BasiliskLesserMnk0j4`
  (quest-specific), display 3100721; mob type 32761 (moved off 32750: BRD
  range 32750-32756; director 32750 reference is a stale collision — fixed
  this pass).
- Stats (mob_types row): speed 5.5, hostile, notorious, job 4, lv 53/53,
  skillList 5006, resists 0.75/0.75/1.25 (mirrors ordinary basilisk 1317 at
  quest-appropriate level). Skill list 5006 (eLeMeN Basilisk family): Cold
  Gaze, Stone Gaze, Sand Breath (frontal burst), Heavy Stomp (frontal cone),
  Body Slam, Wall of Scales. Archived 1.x bestiary corroborates the family
  kit (Cold Glare/paralysis gaze, Heavy Stomp, Sand Breath). The
  quest-specific Apep kit itself is unrecovered → adapter policy, labeled.
- Director QuestDirectorJobMnk0j4: expected 5 → success 10 → retry 0.
  `requireAllTargets` over the single exact target. Quest `onKillBNpc` inert;
  only the director's exact uniqueId + same-area + same-class + isDead
  reconciliation credits the kill (duplicate/foreign/post-deadline kills
  rejected). Single wave; no phases or reinforcements (none recovered —
  deliberately not invented).

## Triggers / edge handling

Eligibility gates (offer + MNK45 + prereq 111223 + PGL15) on
offer/state/talk/kill/journal. Kill credit requires the bound quest at seq 5
in the private shell. Wipe/timeout/disconnect/death/area-exit/abandon/
reaccept/zone-change/session-replace → `retrySequence` 0 at Erik (gc_sqb
runtime fail paths; post-movie revalidation never rewrites a replaced
journal). Start-item re-grant guarded by HasItem; reward path has no
possession gate (item-loss safe); `removeItems` removes 11000555 only if held.
Party: leader-only start, cap 8, same-area/alive/combat-class checks at entry
plus post-movie recheck; helpers earn no credit (owner-bound quest/data).
Leash: 45-yalm boundary circle + one-shot lifecycle (no respawn inside).
Enmity: standard engine content AI (no custom script). Aggro/reset: boundary
exit fails the attempt (area-exit → retry 0). No level sync (1.0 retail had
none); overlevel allowed. No lockout beyond the 900 s timer. Chocobos:
mounted leader/members blocked pre-entry and post-movie with an actionable
dismount message; no mount surface or chocobo actor exists inside.

## Rewards

Exp 5340 (template-standard; no authoritative per-quest EXP) + Dragon Kick
27118 (job 15, lv 45, widget mode 3). External corroboration: 1.0 quest page
lists Dragon Kick for this quest; Experimental Aetheriometer "shatters" =
start-item removed at reward (no separate break event in the chunk).

## Sources

DAT mnk0j4.csv dialogue; DAT quest_marker row 11221301; gamedata_actor_class
row 2100723; server_battlenpc_mob_types row 32761; server_battlenpc_skill_list
5006; 1.x archive wiki (Monk Quests 1.0 page; basilisk bestiary kit);
Garlemald issue #129 reconstruction; map_coordinates locate 172.
Validator `tools/validate_job_mnk0j4_route.py` PASS.
