# HAND Phase Decomp — Disciple of the Hand class quests

Scope: `Data/scripts/quests/{alc,bsm,cul,wvr,gld,tan}/` — 42 files:
6 shared helpers, 18 quest scripts (Lv.20/30/36), 18 tail stubs (Lv.40/50/56).

Date: 2026-09-27. Target dir: `outputs/class-quest-decomp-hand/`
(prior `outputs/class-quest-crafting-decomp-20260927/` CSVs used as cross-check only).

## Offer state (verified 2026-09-27)

| Quest | Availability | Script gate | Effective |
|---|---|---|---|
| Cul200 (110440) | uncommented | none (class/level only) | **ENABLED, playable** |
| all other 200/300/306 | commented (`--`) | `*_OFFER_ENABLED = false` | HOLD, not offered |
| all 400/500/506 tails | commented | template `noOffer` | hidden initText probes |

Both gates must open for an offer (availability allowlist + script/template
readiness). GM `ForceAddQuest` bypasses the allowlist but NOT the script gates;
HOLD quests stay unprogressable except where bare advances exist (noted per file).

## Convention key

- VERIFIED: read directly from Lua / main SQL / DAT atlas / archive text.
- INFERRED (authored): marked inline in each script header; revisit on evidence.
- No synthesis callback exists in the engine: every craft objective is an
  accept-/stage-time inventory snapshot plus a live probe (traded outputs
  credit — established etc-quest behavior, documented per helper).
- `HasItem`/`RemoveItem` are quality-exact: helpers count/consume NQ (q1) then
  HQ (q4); HQ 3-arg probe capability is `pcall`-detected once per helper.
- EXP is script-side only (no EXP rows in `gamedata_quest_rewards`): single grant.
  Gil + guild marks are central (`autoGrant = 1`), EXCEPT Bsm branch marks
  (central rows `autoGrant = 0`, script grants the locked branch) and Gld200's
  mid-route 1,000 gil (central row carries the remaining 20,000; archived total
  21,000 preserved across the two grants).
- Main-SQL parity holds for the whole scope: quest rows + prereqs, all 20 quest
  recipes (5385 Alc + 5386–5404), reward rows, and quest items are in main SQL;
  the six `live migrations` files are mirrors only. Details in `summary.json`.

## Files

- `alc200.md alc300.md alc306.md` — Alchemist (35)
- `bsm200.md bsm300.md bsm306.md` — Blacksmith 30 / Armorer 31 (branch-locked)
- `cul200.md cul300.md cul306.md` — Culinarian (36)
- `wvr200.md wvr300.md wvr306.md` — Weaver (34)
- `gld200.md gld300.md gld306.md` — Goldsmith (32)
- `tan200.md tan300.md tan306.md` — Tanner (33)
- `tails.md` — all 18 Lv.40/50/56 probes
- `quest_flow.csv` — every scripted transition (single CompleteQuest each)
- `summary.json` — machine-readable index + SQL parity + gaps

## Open gaps (all scopes)

1. No Parley subsystem anywhere in the server — every mandatory-Parley state
   (Alc300, Bsm300, Cul300, Wvr300, all Gld, Tan300/306) holds by design.
2. Missing public spawns: S'lyhhia, Damielliot, Mimidoa, Chuchumu, Lalatta,
   Colbernoux, F'lhaminn, Vielle, Sence, sickly child, miners, students.
3. Unregistered recipes: Alc306 salve (materials incomplete), Gld200 brooch,
   Gld300 augite, Gld306 replica, Tan200 jacket — nothing invented.
4. No Echo/past-area owners (Alc306, Cul306, Gld306, Tan306); no escort driver
   (Gld300); no island-puzzle actors (Bsm306); silk-removal/SQB owners (Wvr306).
5. Exact EXP scaling (post-1.20 maxima used), reward-era variants, Linkpearl
   item ids, gil-variant selection rules — unresolved, documented per quest.
