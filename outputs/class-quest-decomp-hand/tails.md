# Tails — Lv.40/50/56 probes (all hidden, all commented)

18 files, all three lines (`require template` + `InitClassQuest(code)`).
No custom logic, no offers, no routes. Recovered client surface is
initText-only (VERIFIED via class-quest-template `todo` fields and the
`class-quest-20-30-36-*` atlases); owners, objectives, rewards, completion
all unverified. SQL names are `[en]`; availability lines commented.

| File | Code | QuestId | SQL name |
|---|---|---|---|
| alc/alc400.lua | Alc400 | 110423 | [en] |
| alc/alc500.lua | Alc500 | 110424 | [en] |
| alc/alc506.lua | Alc506 | 110425 | [en] |
| bsm/bsm400.lua | Bsm400 | 110323 | [en] |
| bsm/bsm500.lua | Bsm500 | 110324 | [en] |
| bsm/bsm506.lua | Bsm506 | 110325 | [en] |
| cul/cul400.lua | Cul400 | 110443 | [en] |
| cul/cul500.lua | Cul500 | 110444 | [en] |
| cul/cul506.lua | Cul506 | 110445 | [en] |
| gld/gld400.lua | Gld400 | 110363 | [en] |
| gld/gld500.lua | Gld500 | 110364 | [en] |
| gld/gld506.lua | Gld506 | 110365 | [en] |
| tan/tan400.lua | Tan400 | 110383 | [en] |
| tan/tan500.lua | Tan500 | 110384 | [en] |
| tan/tan506.lua | Tan506 | 110385 | [en] |
| wvr/wvr400.lua | Wvr400 | 110403 | [en] |
| wvr/wvr500.lua | Wvr500 | 110404 | [en] |
| wvr/wvr506.lua | Wvr506 | 110405 | [en] |

Shared helpers (6 files, `*_quest_helpers.lua`): snapshot-diff credit
(`*NetGain` over counter baselines), NQ/HQ binary-search probe
(`*ProbeQualityCount`, cap 1024) + cross-quality consume (`*ConsumeItem`,
qty-guarded, post-probe verified), verified grants (`*GrantVerified`,
ownership-checked + attention 25228), ask-gates (`*AskAccepted`, explicit 1),
progress/objectives-complete announcers. Class ids: Alc 35, Bsm 30/31,
Cul 36, Wvr 34, Gld 32, Tan 33. No chocobo content anywhere in scope
(VERIFIED — Tan300 saddle is a crafted item, not a mount).
