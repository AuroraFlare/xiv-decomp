# 110422 Alc306 — Dream On, Dream Away (Alchemist Lv.36)

Class quest. Prereq: Alc300 (110421) completed + Alchemist 36.
Source of truth for runtime: `FF14-Memory/Data/scripts/quests/alc/alc306.lua`
(full body read). Client text: `docs/Dat Mining/alc306.csv` (IDs 1, 3-47,
48-70; 2/24 absent, full body read). Status: HOLD-GATED (offer off,
availability commented; validators enforce the HOLD).

## Sequence / flags / counters

| Seq | Name | Talk | Event | Effect |
|---|---|---|---|---|
| ACCEPT | offer | S'lyhhia 1000932 | processEventSlyhhiaStart | nil-or-1 accept + AcceptQuest |
| 0 | sickroom | Damielliot-any | processEvent000 | bare advance (plea) |
| 5 | echo | Damielliot-any | processEvent005 (ask 51030) | result==1 required but HOLD: no warp, announce, stay |
| 10 | find | Damielliot-any (past) | processEvent008 + 009 | grant Poultice 11000078 x1, snapshot counter0 = salve count |
| 12 | synth | Damielliot-any (past) | -(bare) / 009_2 reminder | net-gain(salve)>=1 and holding>=1 advances; total-loss re-grant |
| 15 | deliver | Damielliot-any (past) | processEvent010 (scenes alc30610+alc30620, afterWarp) | consume 1 salve |
| 20 | report | Nogeloix 1000597 | processEvent030 (scene alc30630, final) | CompleteQuest + 4720 EXP |

Counters: 0 = salve baseline at poultice grant. Flags: none. Journal probe
at seq 12 returns `(12, min(gain,1), 0, 0, 1)`; else `(seq,0,0,0,0)`.
SEQ 12->15 advance plays no scene (no recovered transition scene; delivery
scene plays at 15) — authored, marked in script.

## NPCs / positions

Public spawns verified: S'lyhhia 1000932 (display 1900021), zone 209,
(-215.88, 229.5, 300.48), row 3327 (offer approximation; retail offer sits
inside the guild instance); Nogeloix 1000597 (display 1200017), zone 209,
(-211.67, 229.6, 279.04). UNSPAWNED (offer HOLDs): Damielliot candidates
1000853/1000854/1001516 (display 1200030, accept-any) in both present and
past roles. Ward children speak (DAT 7-11, 32-36) but no child actor is
bound to this quest's route (all route states address Damielliot).

## Dialogue / cutscene IDs (DAT text IDs, EN verified)

1 (S'lyhhia linkpearl summons), 3-6 (coax-children request), 7-11
(children), 12-14 + 61 + 68-70 (past Damielliot pleas), 15-21 (past
meeting: brigand kidnap, dragon attack, cliff fall), 22-31 (awakening),
32-36 (children), 37-44 + 48-51 (Nogeloix report + reward), 45-47 (offer
asks), 52-67 (ambient: treatment dread, dragon/Ishgard lore 66-67).

## Echo / instance

Retail: "Use the Echo" on Damielliot -> instanced vision of a steep ravine
NE of Camp Dragonhead, Coerthas (walkthrough: "instance near Camp
Dragonhead"; transcript gist). No past-area identity is recovered in repo
data, so the script runs NO server warp: seq 5 holds with "The way into
the past is not yet open." No public XYZ is claimed (structural HOLD).
Zones: 209 + unidentified Echo instance. No chocobo handling needed (no
server instance entered).

## Craft

Poultice 11000078 granted with recipe at seq 10; salve 11000079 is the
output. The salve recipe is INCOMPLETE (additional materials unresolved —
walkthrough/journal name only poultice+recipe; no source names more), so
NO recipe row is registered (verified absent from gamedata_recipes.sql):
registering an invented row would corrupt material-hash crafting. Synth
credit would be snapshot-diff (currently unreachable). Mobs/sync/lockout:
none (non-combat; brigands/dragon are tale/scene-only, no mob IDs).

## Items / rewards

11000078 Poultice (grant + total-loss re-grant), 11000079 Salve (output,
consumed at delivery). Rewards: EXP 4720 script; gil 36000 + marks 3600
central. Single CompleteQuest.

## Edge cases (verified in script body)

Inv-full: grant-verify at seq 10 holds. Total-loss poultice re-grant at
seq 12 (poultice and salve both zero). Dup turn-in: consume-verify;
missing salve announces. Abandon/completion: onFinish sweeps both items
NQ+HQ multi-copy. Echo ask: only explicit 1 proceeds (still HOLDs without
warp). Class/level/prereq on every talk. Death/logout/re-enter: no
instance; counters persist. Timeout/sync N/A.
