# Shared base: dreamer_dilemma_base.lua (The Dreamer's Dilemma driver)

- File: `Data/scripts/quests/spl/dreamer_dilemma_base.lua` (271 lines, VERIFIED read)
- Role: INFRASTRUCTURE, not a quest. Required by `spl0g2.lua`, `spl0l2.lua`, `spl0u2.lua` via
  `require ("quests/spl/dreamer_dilemma_base")` + `InitDreamerDilemmaQuest({...})` (VERIFIED).
- Entry: `InitDreamerDilemmaQuest(config)` with `{girl, boy, twiggy, diggy}` actor-class IDs.

## Sequences (VERIFIED)

| Seq | Name (local) | Meaning |
|---|---|---|
| ACCEPT | offer | Girl offers (`eventJihliStart`); requires completed Gospel `questId - 1` (110789->110790, 110794->110795, 110804->110805 — VERIFIED against `gamedata_quests.sql`) |
| 0 | SEQ_BRICOT_EXPLAINS | Boy explains (`eventBricotOffered`), then `StartSequence(1)` |
| 1 | SEQ_EXCHANGE | Permanent exchange loop. NO clear event — the quest intentionally never completes. |

## Delegates (recovered client functions, VERIFIED names)

- Girl: `eventJihliStart` / `eventJihliOffered` / `eventJihliDefault` (+ `claimEgg` 2011 top-up).
- Boy: `eventBricotDefault` / `eventBricotOffered` + server-side `CustomMenu` exchange list.
- Twiggy: `eventTwiggyDefault` / `eventTwiggyOffered` / `eventTwiggyResist` / `eventTwiggyExchange` / `eventTwiggyHint`.
- Diggy: `eventDiggyDefault` / `eventDiggyHint(exchangeCount)`.

## Actors / markers / counters / journal (VERIFIED)

- ENPC flags: all four TALK on ACCEPT/0; on seq 1 all become REWARD.
- Markers: none. Counter 0 = completed-exchange count (`IncCounter` only after successful
  `TryExchangeSeasonalReward`); journal returns `(exchanges, 0, 0, 0, 0)`.

## Rewards (VERIFIED)

- Bricot recipes (items 10012001-10012012 Archon-egg set): Pristine 8012801, Vibrant 8012802,
  Brilliant 8012803, Midnight 8012804. Twiggy all-12 recipe: Chocobo Egg Cap 8012805.
- `exchangeRecipe` pre-checks `HasItem` for every ingredient, then `TryExchangeSeasonalReward`
  with `INV_ERROR_*` mapping (0 success -> counter + msg 25246; 1 full -> 60022; 2 unique -> 40279;
  3 system -> debug). Codes 4/5/6 (payment-missing/ineligible/invalid) return silent false AFTER
  the `hasRecipe` pre-check, so no state changes and no message — acceptable, no phantom grants.
- `CustomMenu.ask` auto-closes its own session (`custom_menu.lua:366-371`); no explicit
  `CustomMenu.finish` is needed here (unlike spl0i2's pcall path which also finishes — both safe).
  Choice validation rejects non-integer/cancel/timeout before any exchange.
- No SQL reward rows for 110790/110795/110805 (VERIFIED zero hits); nothing auto-granted.

## Hardening verdict (PART 2)

- SEQ_ACCEPT gating: VERIFIED (gospel-completion `questId - 1` guard at `onStateChange` line 188
  and `onTalk` line 208).
- Zero `CompleteQuest` calls in the file (VERIFIED) — endless seasonal loop by design; nothing to
  single-guard. Colon-form throughout; `UpdateENPCs`+`EndEvent` paired via `finishEvent` on all paths.
- Abandon/re-accept: exchange counter resets with fresh QuestData — correct for a repeatable loop.
- No changes made. No chocobos, no kills, no invented mechanics.

## Open gaps (reasons)

- Native menu/dialogue bodies are client-owned; Bricot's list is a launcher `CustomMenu`
  compatibility surface (presentation input only; C# re-resolves item/cost).
- Recipe ingredient sets and cap item IDs are authored from event-era sources, not from a recovered
  retail drop table; see seasonal gap contract `docs/seasonal_quest_gap_contract_2026-06-19.md`.
