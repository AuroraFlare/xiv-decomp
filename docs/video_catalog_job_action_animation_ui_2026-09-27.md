# Video and thread catalog: jobs, actions, animations, UI (Battle Regimen focus)

Date: 2026-09-27. Summaries only; watch the linked media for visuals. Do not
treat forum recollection as packet truth — confirm against client Lua and
captures before implementing.

## Battle Regimen (core ask)

- Gamer Escape wiki — Battle Regimen (mechanics reference, not video):
  [Battle Regimen](https://ffxiv.gamerescape.com/wiki/Battle_Regimen).
  Button on action bar enters Regimen Mode; each participant queues one action;
  red icon by target name during setup; glowing red button launches; queued
  cast-time actions pre-cast and fire instantly; WS->WS ≈ +50% second-hit
  damage example.
- Forum: "Battle Regimen, it was going to make a comeback, no?" — contains a
  how-to Battle Regimen video link (`youtube.com/watch?v=5R2c...`, see thread
  for full URL):
  [thread](https://forum.square-enix.com/ffxiv/threads/59616-Battle-Regimen-it-was-going-to-make-a-comeback-no).
  Relevance: end-to-end queue/launch flow on the live 1.x bar.
- Forum: "The Battle Regimen LOVE thread" (queue semantics discussion):
  [thread](https://forum.square-enix.com/ffxiv/threads/7464-The-Battle-Regimen-LOVE-thread?p=93417&mode=linear).
- Forum: Combat Bugs (mentions "Light up Battle Regime button / Select action
  to queue" repro steps):
  [thread](https://forum.square-enix.com/ffxiv/threads/18129-Combat-Bugs).
- Forum: dev1022 battle-system thread (proposes regimen stay easy/armoury-based):
  [thread](https://forum.square-enix.com/ffxiv/threads/4975-dev1022-Changes-to-the-current-battle-system-to-make-them-fun-and-engaging).
- Allakhazam mirror of retail regimen how-to (queue/stack rules, one action per
  member, icon-left-of-name signal, macro coordination):
  [page](https://wow.allakhazam.com/wiki/ffxiv_ability:Battle_Regimen).
- Gamespot FFXIV primer (macro row: `/br on/off` + `/ac "Brandish" <t>`):
  [primer](http://www.gamespot.com/articles/final-fantasy-xiv-primer/1100-6281676/).

Suggested YouTube queries (verify upload date and 1.x UI before citing):
`FFXIV 1.0 battle regimen`, `FFXIV battle regimen queue launch`,
`FFXIV 1.21 job actions`, `FFXIV 1.x action bar macros`.

## Jobs, soul stones, job actions

- Gamer Escape 2012 job-system article (5 job actions per job, first on soul
  acquisition, auto-equip on switch, job-only use, gear-slot equip):
  [article](https://gamerescape.com/2012/03/05/ffxiv-job-system/).
- PCGamesN soul-crystal primer (ARR-era UX, lower-right equip slot; useful only
  for equip-slot orientation, not 1.x rules):
  [article](https://www.pcgamesn.com/final-fantasy-xiv-a-realm-reborn/new-ffxiv-players-job-soul-crystals).
- SunsThirdStone guide (job unlock chain: 30 base + 15 secondary + class quests
  + "Sylph-management"; soul item + first skill on opening quest):
  [guide](https://gamefaqs.gamespot.com/pc/141253-final-fantasy-xiv-online-the-complete-experience/faqs/71019).
- In-repo authoritative job quest bytecode reports (not video): `job_blm_pld_brd_drg_decomp_2026-09-07.md`,
  `job_war_mnk_whm_decomp_2026-09-07.md`, `job_gc_full_decomp_2026-09-07.md`,
  per-quest `blm0j*`, `mnk0j*`, `WHM_whm0j*`, `war0j1-war0j6`, `brd_11130*`,
  `PLD_paladin-job-quest-deep-decomp-2026-09-27.md`.

## Actions, traits, menus, animations

- In-repo (primary): `actions_traits_classes_jobs_menu_decomp_2026-07-05.md`,
  `actions_traits_widget_specialization_decomp_2026-07-08.md`,
  `menu_widget_decomp_2026-09-26.md`,
  `dungeon_actor_animation_decomp_2026-07-19.md`,
  `ifrit-animation-decomp-2026-08-02/`,
  `garuda-moogle-coffer-animation-decomp-2026-08-02/`,
  `atomos_deepvoid_summoning_animation_decomp_2026-07-29.md`.
- Meteor-decomp actor notes (open questions on regimen chain UI render and
  battle-event opcodes):
  [actor.md](https://github.com/swstegall/meteor-decomp/blob/HEAD/docs/actor.md).
- Official community retrospective thread (Atomos camp-crystal orange-state
  video caption; crystal `b902` material/VFX-state finding):
  [thread](https://forum.square-enix.com/ffxiv/threads/303338-The-Rising-Event%21-1.0-Experience/page4).
- Suggested YouTube queries: `FFXIV 1.x actions traits menu`,
  `FFXIV soul stone equip job change`, `FFXIV 1.0 action bar setup`,
  `FFXIV dat mining SaintCoinach tutorial`, `FFXIV Penumbra animation mod`.

## How to use a video as evidence

1. Record URL, upload date, visible patch/UI markers, timestamp range.
2. Transcribe only observable steps (button pressed, icon shown, order queued).
3. Map each step to a client anchor (widget method, command id) or mark
   `unresolved`.
4. Never paste video frames as code; describe the signal (e.g. "red icon left of
   target name at 0:42").
