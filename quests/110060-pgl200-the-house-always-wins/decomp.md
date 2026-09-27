# 110060 The House Always Wins (Pgl200) — in-depth decomp

Pugilist rank 20. Offer: Gagaruna (1000862) in the PGL guild, Ul'dah zone 175
(-184.94, 190.55, 108.87, rot 1.49; spawn id 61). Requires PUG class + level 20
(server gates; gamedata prereq 0 = no prior-quest gate).

## Sequence / flags (server: Data/scripts/quests/pgl/pgl200.lua, bespoke)

| Seq | Objective | Mechanic |
|---|---|---|
| ACCEPT | Gagaruna offer | `processEventGagarunaStart`: talk rows 1-3, ask 69; accept on result 1 + quest-info confirm |
| 0 | Talk to Titinin (1000934; zone 175, -170.63/190.01/117.15, id 64) | `processEvent010` → cutscene `pgl20010`; sysmsg 25246 grants Platinum Ledger 11000134 |
| 5 | GSM guild: talk to Esperaunce 3x | Counter 0; talks 1-2 send sysmsg 117/118; 3rd plays `processEvent020` (`pgl20020`) → seq 10 |
| 10 | Private area Past-5: 5 coin pickups + Esperaunce | Flags 0-4 keyed by uniqueId `pgl200_coin_1..5` (actor 1090199, ids 3212-3216, zone 209 Past-5, Y 200.2); Esperaunce talk-locked until 5/5; then `processEvent020_2` + `processEvent030` (`pgl20030`, after-warp) → warp public → seq 15 |
| 15 | Wise Miser Naida Zamaida (1000955; zone 175, 0.29/196.4/144.53, id 65) | `processEvent040`: say 34, ask 65; pay (1) plays `pgl20040` → seq 25; decline (say 119) holds. Titinin talk sets counter 1 (hint gate) |
| 25 | PGL trigger 1090042 (zone 175, -183.53/193/82.76, id 101) | Push or talk → `processEvent050` (`pgl20050`) → seq 30. Titinin talk sets counter 2 |
| 30 | Singleton (1001445; zone 209, -191.98/194.6/181.33, id 224) → duty | `processEvent050_4` confirm (1) → `processEvent060` (`pgl20060`, after-warp) → private battle. Stays 30 until director kill |
| 35 | Return to Titinin | Counter 3 = 1; `processEvent070` (`pgl20070`) + `sqrwa 1760` presentation; central CompleteQuest pays |

Ambient delegate events (all wired): 005_2..005_8 (guild staff), 010_2..010_5,
020_3/020_4, 030_2/030_3, 040_2/040_3, 050_2/050_3, 060_2..060_8. Dead client
stubs `processEvent013/017/035` intentionally unbound (empty bodies in decomp).
Text bank: `_loadTextDataPermanently(529, "pgl200")`.

## Dialogue / cutscenes (recovered client Pgl200)

pgl20010 (Titinin/ledger), pgl20020 (Esperaunce 3rd), pgl20030 (after-warp coin
turn-in), pgl20040 (Wise Miser pay), pgl20050 (PGL trigger), pgl20060
(after-warp duty entry), pgl20070 (reward). Journal sysmsgs: 25246 (item
handoff), 25226 (chip x/y counter), 25225 (objective complete), 117/118 (Esperaunce
1st/2nd talks).

## Objectives / markers (DAT quest_marker; 11006009-20 filler)

11006001 Titinin (-170.63,117.15); 11006002 GSM objective (-121.99,257.62,
trigger 1090058 at zone 209, -121.99/201.5/257.62, id 248); 11006003/04
Esperaunce (-125.74,269.17; private spawn 2044 at -124.351/200.2/268.694);
11006005 Wise Miser (0.29,144.53); 11006006 PGL entrance (-183.53,82.76);
11006007 Singleton (-191.98,181.33); 11006008 Titinin reward. Markers 015/025
are hint-first: destination marker reveals only after Titinin talk counter.

## Instance / territory

- Coin phase: PrivateAreaMasterPast level 5, zone 209 (Ul'dah interior copy;
  privateareas row 13: id 13, zone 209, Past-5). Entry via trigger 1090058,
  exit 1290002.
- Fight: SimpleContentQuestBattle content copy `quest_sqb_pgl200_<pid>`,
  boundary radius 45, spawn = leader pos + 4 yalms facing. Re-entry disabled.
- Client directors QuestDirectorPgl20001/02 recovered EMPTY (class shells only).

## Fight: Toothless Gladiator (single, lv 20)

- Actor class 2289013 / mob type 3108, uniqueId `pgl200_toothless_gladiator`.
- Stats (mob_types row): speed 6, hostile, detectRange 10, job 3, lv 20/20,
  hpMax 300, att 40, skillList 15, spellList 0. Skill list 15: animal_instinct
  (23484), godsbane (23490), jump (23493). Single wave, single kill credits.
- Director QuestDirectorClassPgl200: expected 30 → success 35 → retry 30.
  Party cap 3, timeout 600 s. Quest `onKillBNpc` inert; only the director's
  exact actor-class callback in the content area advances.
- Phases/reinforcements: none (single duel). Enmity/leash: standard content
  AI + 45-yalm boundary circle.

## Triggers / edge handling

Class+level gates on offer/state/talk/push/journal; coin flags stop
double-push (unknown/spent actors despawned, no progress); stale-actor
Esperaunce talk blocked until 5/5; Wise Miser decline holds; failed battle
launch reverts to pre-battle sequence; death/timeout/abandon/logout/DC handled
by gc_sqb runtime (retry seq 30, teardown, async unwind); mounted leader or
members blocked ("Dismount your chocobo...") pre- and post-movie; party: only
leader starts, max 3, same-area/alive/combat-class checks. No level sync (1.0
retail had none); overlevel allowed. No lockout beyond the 600 s attempt timer.

## Rewards (gamedata_quest_rewards rows 33-36)

Gil 20000 + PUG marks 1000101x2000 + Spiked Knuckles 4020208x1 + Exp 1760, all
central. Lua plays `sqrwa` presentation only (no double EXP).

## Sources

Recovered client `Pgl200` (content_systems_20260612), empty
`QuestDirectorPgl20001/02`, DAT markers, server_eventnpc/mob SQL rows above,
walkthrough consensus (Ul'dah debt-collection route → Colosseum duty).
Validator `tools/validate_pgl200_coin_objective.py` PASS.
