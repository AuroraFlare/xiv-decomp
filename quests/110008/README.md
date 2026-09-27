# Quest 110008 — Beckon of the Elementals (Man2g0, Lv 13, Gridania MSQ)

Instance + staging work. Prereq 110007 (Whispers in the Wood); feeds Man200 convergence.
Combat instance: zone 153 (West Shroud) private `PrivateAreaMasterPast` type 1.

## Sources inspected (bodies, not just grep)

- Retail recovered: `FF14-Decomp/tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/man/man2g0.lua`
  (all `processEvent*` bodies), `lua/chara/npc/object/questobjectman2g0.lua` (stub),
  `lua/director/quest/questdirectorman2g001.lua` (stub — no retail kill/lifecycle).
- Live: `FF14-Memory/Data/scripts/quests/man/man2g0.lua` (925 lines),
  `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorMan2g001.lua` (922 lines),
  `FF14-Memory/Data/scripts/content/SimpleContentMan2g01.lua` (boundary line only).
- Text: `FF14-Memory/docs/Dat Mining/man2g0.csv`, `FF14-Memory/docs/ffxiv-1.0-wiki/pages/Beckon_of_the_Elementals.html`
  (journal + walkthrough + boss-fight notes, read in full).
- External: `ffxiv.gamerescape.com/wiki/Loremonger:Beckon_of_the_Elementals` (full dialogue incl.
  "The elemental's aspect has changed!" / ward prompts), forum thread 34327 (fight = kill spirit with help).
- Prior: `FF14-Decomp/outputs/msq-decomp-man/man2g0_beckon_of_the_elementals.md`,
  `FF14-Decomp/docs/beckon_elementals_instance_cutscene_decomp_2026-07-01.md`.

## SEQ flow (live = retail journal order)

ACCEPT(Miounne) -> 0 Nonolato/Quiver's Hold -> 3 staging private 206/9 (O-App entry prompt) ->
4 Spirit fight 153/1 -> 5 A'naidjaa/Oak Atrium -> 10 LS Miounne -> 15 Soileine/Stillglade Fane ->
20 private 206/10 (wildling) -> 25 private 206/11 (Fye flag) -> 30 LS Miounne -> 35 amphitheatre push ->
40 private 206/12 (festival) -> 45 zone 153/2 (Echo forest) -> 50/55 cutscenes -> 60 Miounne reward.
SEQ_050/055 are push-only fallbacks to SEQ_040; SEQ_045 push jumps to SEQ_060 with zone-155 warp.

## Cutscene / trigger map (recovered retail names)

| Event | Scene | Journal marker |
|---|---|---|
| processEvent007 | man1g900 (ARC guild) | 11000801 |
| processEvent007_2 (yes) | man2g000 HQ pre-fight | 11000802 |
| processEvent010 | man2g010 post-fight | 11000803 |
| processEvent020 | man2g020 Oak Atrium | 11000804 |
| processEvent030 | man2g030 Fane entry | 11000805 |
| processEvent040 | man2g040 wildling | 11000806 |
| processEvent050 | man2g050 O-App refuses Fye | 11000807 |
| processEvent060 | man2g060 amphitheatre | 11000808 |
| processEvent070 | man2g070 Fye/Echo setup | 11000809 |
| processEvent080 | man2g080 + MAN2G090 HQ + man2g095 + man2g100 | 11000810 |
| processEventTrial001/002 | ward choice / attuning (modes 1/2, 3 options) | — |
| processEvent080_01 | Ul'dah/Waking Sands pointer (level>=18 branch) | — |

Talk/push/LS routing: `man2g0.lua` onTalk (all SEQ), onPush (PSHCJGUILD 1090178,
PSHAMPHITHEATRE 1090179, PSHSEQ045 1090180), onNpcLS (packs {65,66,67} SEQ010->015,
{112,113,114,115} SEQ030->035). Reward: 30000 gil + 500 EXP; GC whistle 2001005
deliberately commented out — do not "fix".

Flags: FLAG_SEQ025_FYE=0. Journal hook static (40,40,40) + private/public marker splits.
