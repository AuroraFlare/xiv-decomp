# 110420 Alc200 — Sleep, Cousin of Death (Alchemist Lv.20)

Class quest. Prereq: Man200 Fade to White (110013) completed + Alchemist 20.
Source of truth for runtime: `FF14-Memory/Data/scripts/quests/alc/alc200.lua`
(full body read). Client text: `docs/Dat Mining/alc200.csv` (IDs 1-81, 95, 97,
full body read). Status: ENABLED (offer on, availability uncommented).

## Sequence / flags / counters

| Seq | Name | Talk | Event | Effect |
|---|---|---|---|---|
| ACCEPT | offer | Nogeloix 1000597 | processEventNogeloixStart | nil-or-1 accept + AcceptQuest |
| 0 | reagent | Nomomo 1001392 | processEvent010 | grant Mummified Mole 11000076 x1, snapshot counter0 = med count |
| 5 | synth | Nogeloix | processEvent015 | inspect: net-gain(med)>=1 and holding>=1; keep item; counter2=1 |
| 7 | shown | S'lyhhia 1000932 | processEvent015_6 (ask 44) | result==1 then consume 1 med |
| 10 | ward | S'lyhhia | processEvent020 (scene alc20020) | bare advance, client-scene-only |
| 15 | report | Nogeloix | processEvent030 (scene alc20030, final) | CompleteQuest + 1760 EXP |

Counters: 0 = medication baseline at grant; 2 = recovered literal 1 from seq 7
(set, never branched). Flags: none. Journal probe at seq 5 returns
`(5, min(gain,1), 0, 0, 1)`; else `(seq,0,0,0,0)`.

## NPCs / positions (spawn SQL verified)

- Nogeloix 1000597 (display 1200017), zone 209, (-211.67, 229.6, 279.04), rot 0.38.
- Nomomo 1001392 (display 1500091), zone 170 Camp Black Brush,
  (23.404, 200, -476.668), rot 2.366.
- S'lyhhia 1000932 (display 1900021), zone 209, (-215.88, 229.5, 300.48),
  spawn row 3327, ~0.7u from retail back-door trigger MAN0u1_ALCH_TRIGG
  (1090119) at (-216.38, 229.5, 300.983).

Map check (mob guide tool): zone 209 page 1922 Hustings Strip contains the
guild point at map (5.2, 6.5), matching the wiki (5,6). Interior has no
recorded navmesh within 30u, so no auto-placement was run; positions above
are the committed spawn rows, not new claims.

## Dialogue / cutscene IDs (DAT text IDs, EN verified)

Offer/route: 1-9 (guild intro, join asks 51-53), 10-14 (Damielliot coma,
recipe 13, Nomomo pointer 14), 15-16 + 81 + 95 (Nomomo grant; mole + Eye
Drops 3020401 self-procured), 17-19 + 65-67 (inspection, ward pointer),
20 + 44-46 (S'lyhhia handoff ask), 21-29 (ward scene incl. Echo-conditional
23/25/49/75-76), 30-40 (report; Assessor Saulette cameo 31-39), reward 40.
Stale pre-1.21 material Illuminating Salts 10009011 appears only in EN/DE/FR
IDs 16/95; JP 95 + recipe 5385 confirm current Eye Drops material.

## Objectives / triggers / instances

Talk Nomomo -> synth Potent Medication (recipe 5385: Mole + Eye Drops,
ALC 21, crystals 1000008/1000007 x1, verified row) -> show Nogeloix ->
handoff to S'lyhhia (ask-gated) -> ward scene -> report. No push/emote/
kill triggers. Retail ward is a guild-back-door instance; server runs it
client-scene-only (recovered director empty, no ward area identified):
two S'lyhhia talks, no warp. Zones: 209 (Ul'dah/Phrontistery), 170 (Black
Brush). No chocobo handling needed (no server instance entered).

## Mobs / sync / lockout

None. Non-combat craft/delivery quest: no mob IDs, stats, abilities, AI,
phases, reinforcements, enmity, leash, level sync, or lockouts.

## Items / rewards

Items: 11000076 Mole (grant), 3020401 Eye Drops (player), 11000077
Medication (synth, kept at inspection, consumed at handoff). Rewards:
EXP 1760 script-side (post-1.20 max); gil 20000 + ALC marks 1000119 x2000
central autoGrant (verified rows). Iron Alembic NOT granted (era
unresolved); Linkpearl skipped (id unresolved). Single CompleteQuest.

## Edge cases (verified in script body)

Inv-full: AlcGrantVerified holds sequence on failed grant. Total-loss Mole
re-grant at seq 5/7 only (Mole and Medication both zero). Dup turn-in:
consume-verify; missing med re-routes to Nomomo. Abandon/completion:
onFinish sweeps Mole + Medication NQ+HQ multi-copy. Class/level/prereq
checked on every talk and state change. Death/logout/re-enter: no
instance, QuestData persists counters; re-login restores. Timeout/sync N/A.
