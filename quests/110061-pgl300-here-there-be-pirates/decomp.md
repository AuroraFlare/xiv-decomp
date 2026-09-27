# 110061 Here There Be Pirates (Pgl300) — in-depth decomp

Pugilist rank 30. Offer: Gagaruna (1000862), Ul'dah zone 175. Requires PUG +
level 30 (server gates; gamedata prereq 0). Walkthrough note: retail gated
behind main-scenario progress ("Fade to White" point); server gates class/level
only — main-scenario gate unrecovered, documented OPEN.

## Sequence / route (server: pgl300.lua stub + class_quest_template `Pgl300`)

| Step | NPC / objective | Event |
|---|---|---|
| OFFER | Gagaruna `processEventGagarunaStart` → `pgl30010` cutscene, accept result | offer |
| 1 | Waekbyrt aboard the Astalicia (1000003; zone 230, -752.53/7.35/382.14, id 387; marker display 1600217) | `processEvent020` → `pgl30020` (Carvallain/Kraken's Arms scene) |
| 2 | Mytesyn, Mizzenmast (1000167; zone 133, -435.2/40/207.07, id 47) + ship/object step {11006102,11006103} | `processEvent025` (talk turn only) + afterEvent `processEvent030` → `pgl30030` pre-fight scene |
| BATTLE (10) | The Misery hold: 5x Kraken Deckhand | private battle, markers {11006103} |
| 20 | Titinin (1000934; zone 175, -170.63/190.01/117.15, id 64) | `processEvent040` (`pgl30040`, after-warp) + afterEvent `processEvent050` (`pgl30050`, after-warp, "payment prepared") |
| 21 | Hurrey (1000603; zone 175, -178.46/190.0/102.62, id 3218, Y/rot scaffold) | `processEvent060`: say 50/51 + Echo ask 51030 → `pgl30060`; requiredResult 1 (decline holds) |
| 22 | Melisie (1001009; zone 175, -171.69/190/123.84, id 67) | `processEvent070`: say 56 + Echo ask → `pgl30070`; requiredResult 1 |
| 23 | Halstein (1001007; zone 175, -160.78/188.7/117.31, id 66) | `processEvent080`: say 59 + Echo ask → `pgl30080`; requiredResult 1 |
| 24/Reward | Gagaruna {11006108} | `processEvent090` (say 65) → CompleteQuest, EXP 3420 via Lua |

Ambient events 010_*/020_*/050_*/060_2/070_2/080_2 recovered but unbound (no
owners). Text bank 533. Walkthrough extras modeled as documented gaps: the
Platinum Mirage Linkpearl check after the mold, and the ???-chest Counterfeit
Chip Mold pickup (no chest-spawn/linkpearl-use primitive recovered) — the mold
(11000019) is corpse loot only: mob 3066 drop rate 20%, ~1 expected over 5 kills.

## Markers (DAT; 11006109-20 filler)

11006101 Waekbyrt, 11006102 Mytesyn, 11006103 ship/object (battle marker reuse),
11006104 Titinin, 11006105 Hurrey, 11006106 Melisie, 11006107 Halstein, 11006108
Gagaruna reward.

## Instance / territory

Fight: SimpleContentQuestBattle content copy `quest_sqb_pgl300_<pid>`,
boundary 45, spawn = leader pos + 4 facing. Client `QuestDirectorPgl30001`
recovered EMPTY (class shell). Ship-object server callback unrecovered
(`QuestObjectPgl300` decomp is an empty NpcBaseClass shell) — handoff modeled
as one guarded interaction. Re-entry disabled.

## Fight: 5x Kraken Deckhand (lv 25)

- Actor class 2280217 / mob type 3066, uniqueIds `pgl300_kraken_deckhand_1..5`,
  formation offsets (0,0),(±4,±4) — adapter formation, NOT retail hold geometry.
- Stats: speed 6, hostile, detectRange 10, job 4, lv 25/25, hpMax 0 (scaled),
  att 40, skillList 15 (animal_instinct 23484, godsbane 23490, jump 23493),
  spellList 0. Loot: Counterfeit Chip Mold 11000019 @ 20%.
- Director QuestDirectorClassPgl300: expected 10 → success 20 → retry 0,
  requireAllTargets (all five must fall; walkthrough: "defeated a group of
  pirates"). Party cap 3, 600 s. Single wave, no phases/reinforcements.
- Walkthrough tactics note: five lv-25 mobs gang up; set Return to Limsa.

## Edge handling

Template class+level gates; Echo asks decline-hold; failed launch reverts to
pre-battle sequence; death/timeout/abandon/logout/DC via gc_sqb runtime;
mounted leader/members blocked pre- and post-movie; party leader-only start,
max 3, same-area/alive/combat-class checks. No level sync (retail-accurate);
no lockout beyond 600 s timer. Dup turn-in impossible (kill-gated director +
central CompleteQuest).

## Rewards

Central: gil 30000 + PUG marks 1000101x3000 (rows 37-38). Lua EXP 3420
(`sqrwa`+`AddExp`; no central Exp row — no double-pay).

## Sources

Recovered client `Pgl300`, empty `QuestDirectorPgl30001`/`QuestObjectPgl300`,
[Gamer Escape obsolete walkthrough](https://ffxiv.gamerescape.com/wiki/Here_There_be_Pirates)
(5x lv-25 deckhands, ??? chest mold, linkpearl, Echo order), DAT markers, SQL
rows above. Validator `tools/validate_pgl300_route.py` PASS.
