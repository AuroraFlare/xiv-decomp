# Class quests 20/30/36 — director + handler coverage — 2026-09-27

Data: `outputs/class-quest-20-30-36-director-handler-audit-20260927/handler_coverage.csv`.
Sources: per-quest Lua in `FF14-Memory/Data/scripts/quests/<fam>/<code>.lua`,
directors in `FF14-Memory/Data/scripts/directors/Quest/QuestDirectorClass*.lua`
plus `QuestDirectorCnj306Echo.lua` / `QuestDirectorCnj306Escort.lua`.

## 1. Handler matrix (bespoke files)

- Battle FULL (Pgl200, Exc300/306, Arc300/306, Cnj306): all 7 core handlers
  (onStart/onFinish/onStateChange/onTalk/onPush/journal/journalMarkers) + UpdateENPCs/EndEvent/CompleteQuest/AddExp.
  Exc306 + Cnj306 also carry CreateContentArea (survival/escort) alongside StartPrivateQuestBattle.
- Craft FULL (all Wdk/Bsm/Gld/Tan/Wvr/Alc/Cul 200/300/306): 6 core handlers, correctly no onPush
  (talk/delivery only), all with UpdateENPCs/EndEvent/CompleteQuest/AddExp.
- Gather: Fsh200 (202 lines, onFishCatch, no onPush), Fsh300 (355 lines, onFishCatch + onPush + onParley),
  Fsh306 (305 lines, no onPush), Hrv300 (464 lines, onPush for sparkle-spot harvest, no AddExp — uses atomic rewards).
- Stubs (21 files, 3 lines each): zero handlers by design; template driver owns them.

## 2. Director inventory (22 files)

- Standard battle directors (3 funcs each, Retry+Timeout keys): Pgl200/300/306, Gla200/300/306,
  Exc200, Arc200/300, Lnc200/300/306, Thm200/300/306, Cnj200/300.
  Missing Cleanup key: Cnj300, Gla200/300/306, Pgl200/306 — pack workers must confirm
  cleanup path (or document why the template owns it).
- Enriched directors: Arc306Duel/Escape (Death key, 83/67 lines), Thm200 (Death key, 60 lines, 14 mobrefs),
  Exc306Survival (278 lines, 10 funcs, ContentFinished key — the forced-loss survival instance),
  Exc306Rematch (57 lines), Cnj306Echo/Escort (escort: 69-node authored route
  `Data/escortnavmesh/cnj306_morys_escort.json`, Morys-HP-0 and stray-too-far fail rules).
- No chocobo/mount APIs in any director (see global chocobo audit).

## 3. Loophole checklist for packs (per quest)

Class/level gate on every entry handler; instance entry check before zoning; door/push UID match
(so shared 1090199-class actors stay inert); death/timeout/disconnect/abandon/retry return to door
sequence; grant-before-consume with retry flag; item consume exactly once; UpdateENPCs + EndEvent on
every path; journal/marker reflect door/inside/turn-in states; onFinish cleanup owns no event double-end.
Craft: snapshot baselines at briefing, traded-item credit, inventory-full stays on step.
Gather: baseline excludes pre-brief holdings, delivery consumes exact count.
