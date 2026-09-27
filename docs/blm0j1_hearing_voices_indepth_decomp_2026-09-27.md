# Blm0j1 Hearing Voices (111261) indepth decomp - 2026-09-27 (JOB BLM)

Lv30 THM->BLM unlock. Yayake (Arrzaneth Ossuary) -> guano gnats at the
Copperbell Mines entrance -> Kazagg Chah appearance + Gem of Shatotto ->
return to Yayake -> Soul of the Black Mage. Status: ENABLED private adapter.

## Client scenario (tools/outputs/lpb/content_systems_20260612/.../blm/blm0j1.lua)

- `processEventYayakeStart`: R4=0 init; only `arg1 == 0` plays the
  preliminary text 51 + one `askRestrictChoices(52)`; nil/2 answers play 55
  and exit unaccepted (nil cannot accept). Ordinary offer reuses one stored
  `showQuestInfomation()` result (13/15 accept, 11/12 reject, returned).
- `processEvent010`: fade-out, `startNQCutScene("blm0j110", 1)`, public
  dialog+notify `(worldMaster,25117,11000556,1)` (Gem of Shatotto), wait 5,
  default fade-in. POST-KILL wrapper; spawns/counts nothing.
- `processEvent020`: fade-out, `startNQCutScene("blm0j120", 1)`, default
  fade-in. Return-to-Yayake narrative.
- `processEventClear(arg1)`: text 49, `showGetJobItemWidget(player,arg1)`,
  wait 6, long text 79, wait 8, `showGetJobAbilityWidget(player,27305,1)`,
  wait 6. `ClearAfter` is later Yayake dialogue.
- `*Follow` methods (Yayake/Lalai/Kazagg/Dozol/Daza, 000 and 010 variants)
  are contextual dialogue, not ordered objectives.
- Client director `QuestDirectorBlm0j101` is an empty SQB shell: no count,
  waves, trigger, or kill callback.

## Stages / flags / markers / positions

- Sequences: 0 offer/Yayake -> 5 battle -> 10 Yayake reward. No route steps.
- Marker 11223002 (battle): Western Thanalan m00013/104/403,
  X/Z -828.539978/-59.150002, display 4000257 (area, not actor).
- blm0j110 stages its shot at (-835.47, 120.0, -62.54), rot 3.054 (corroborates
  the marker); scene cast: PC + Kazagg 1060036 + gem props 6500003.
- blm0j120 shot at (-197.50, 18.00, 62.25), rot 2.821.
- Journal: "several" gnats, no count; up to three companions (4 total).

## NPCs / mobs

- Yayake 1000846, spawn row 175, zone 209 (-292.89, 206.46, 219.88).
- Guano Gnat: actor 2200610 (FlyStandard/display 3200609), mob 3050
  (job 23, 30-42), skill list 94 (Brundleflight 23064).

## Rewards

- EXP 2661; key item 2000207 (Soul of the Black Mage); item 3020410 (The
  Keeper's Hymn, Clear widget arg); action 27305; item 11000556 (Gem of
  Shatotto, presented in blm0j110; adapter grants at completion so the
  Blm0j4 stela chain holds real inventory).

## Adapter (this pass)

- `QuestDirectorJobBlm0j1`: 4 gnat copies (explicit tuning for "several",
  War0j1 precedent), requireAll, successEvent 010/blm0j110, cap 4,
  minimumLevel 30 (template-enforced), timeout 600.
- Private shell: ambient Copperbell kills cannot credit; death/timeout/
  exit/disconnect/spawn-failure all retry at Yayake via gc_sqb_runtime.
- No chocobo handling exists server-side (no mount state on Player/content
  entry); 1.0 had no level sync (floor only, no cap) - both verified, not
  assumed. Cutscene skip is acknowledged by the native scene token path.
