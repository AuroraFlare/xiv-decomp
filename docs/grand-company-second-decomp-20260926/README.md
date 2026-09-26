# Grand Company quests: second deep decompilation

This second pass uses three helper agents to investigate the gaps left by the [first pass](../grand-company-deep-decomp-20260926/README.md). It covers the same **102 core identities (69 named quests and 33 internal rows)**, with **Noc001** tracked separately. It adds independent concrete execution, recovered reward formulas, nested journal logic and native scene-control analysis.

Start with the [combined index for every quest](../../outputs/grand-company-second-decomp-20260926/QUEST_INDEX.md). It joins each quest's first-pass paths, second-pass journal dossier, native EXP preview and independent bytecode replay. Full structured evidence and raw instruction offsets accompany the reports.

## New findings

| Area | New recovery | Detailed report |
| --- | --- | --- |
| Rewards | Native EXP preview formula and exact arithmetic order; 33 rounding differences; 68 matching archive entries; dynamic company seals and completion variants | [Rewards](rewards.md) |
| Journals | 2,060 fields, 4,208 sheet-reference occurrences across four locales, nested alternatives and sparse selectors | [Journals](journals.md) |
| Scenes | 94 IfClip controls, 295 branches, 348 predicates and 3,938 track nodes in 56 resources; 33 native function exports; nine newly traced replay associations | [Native scenes](scenes.md) |
| Independent execution | 713 methods / 1,495 path templates, 10,589 extra type/boundary probes and zero mismatches; journal packet argument flow | [Verification](verification.md) |

### EXP and seals

The offer preview is `ceil(getSkillPointMax(questLevel) * (percentage / 100))`. Native double arithmetic divides first. At 7%, levels 22, 25, 40 and 45 produce **1541, 1891, 4971 and 6231**. Reordering the calculation loses the extra point. Every one of the 68 comparable base-EXP archive entries matches this replay.

The completion widget receives awarded EXP from its caller; it does not repeat that formula. Shared Ifrit/Garuda/United/Raven alternate values are **seal totals**, not EXP bonuses. Type -15 chooses the player's belonging-company seal item and icon. The festival branch checks special-event work 9 against 11; the older readable decompilation's unconditional interpretation was misleading. These are client display contracts, with original server grant authority still distinct.

### Journal selectors and transport

The deeper journal parser retains both arms of nested IF expressions. `Com0l1` selector 2 chooses between Sea/265 and Sea/232 using another argument. `Gcl105` has 15 sparse selectors and five independent held-item parameters. The four locales agree on reference/branch structure after accounting for localized sheet columns.

The server's `qtdata` arguments pass unchanged through the native desktop connector into journal `setDetailData`: the sequence is the first text parameter, followed by the supplied journal-information values. The [verification report](verification.md) distinguishes this wire contract from selector interpretation and records the current source mismatch. The `.354` completed-journal token in all four `Com0g5` locales remains unresolved rather than being silently repaired.

### Native scene conditions and replay ownership

A fresh read-only native export establishes ordered IfClip evaluation, predicate layout, numeric operations and empty AND/OR behavior. The corpus includes unconditional branches that shadow later entries; the detailed report preserves offsets and selected track IDs without claiming live visual results.

Nine of the ten scenes whose ownership was unresolved in the first pass have exact cutscene-replay table entries. Replay ownership is separate from ordinary quest or duty dispatch. **`gc010440` remains unbound** in this audit. Parameter producer meanings and live timing remain explicit uncertainties.

### Independent verification

The verifier uses a separate concrete Lua 5.1 executor, not the first-pass symbolic tracer. It verifies root method bindings, branch edges, ordered API calls and argument/result values against all 1,495 bounded templates. It also executes 164 extended loop probes and 105 local-helper compositions. External APIs are inert recorders with controlled return values; those probes establish instruction behavior, not legal retail inputs or live reachability.

## Corrections to older interpretations

- The EXP percentage selector is now decoded as an offer-preview calculation; completion EXP is supplied independently.
- Alternate reward-column totals for the shared story quests are seals. Prior archive-ledger labeling as bonus EXP is not supported by the widget bytecode.
- **Only 87/102 core identities have native reward-table rows.** All 69 named quests do, plus 18 internal rows. The first scope report's claim that all 102 have 16 slots was too broad; the 15 `501/502/601/602/603` internal identities have no row in this source.
- Nine additional scene associations are recovered specifically from cutscene replay metadata. This narrows the earlier uncertainty without converting those associations into normal-gameplay callers.

The first-pass evidence remains preserved. No gameplay implementation, SQL, live database or placement changes were made by either decompilation pass. Missing server implementations and client acceptance remain open work, including the promotion EXP discrepancy recorded in the first pass.

## Reproduce and verify

Run from the repository root. If rebuilding from scratch, create the [first-pass dependencies](../grand-company-deep-decomp-20260926/README.md#reproduction-and-validation) first. The [scene report](scenes.md) describes `--native-export` and its local Ghidra prerequisites when the pinned native exports are absent.

```powershell
python -B tools/build_gc_second_rewards.py build
python -B tools/build_gc_second_journals.py build
python -B tools/build_gc_second_scenes.py
python -B tools/build_gc_second_verification.py
python -B tools/build_gc_second_index.py build

python -B tools/build_gc_second_rewards.py check
python -B tools/build_gc_second_journals.py check
python -B tools/build_gc_second_scenes.py --check
python -B tools/build_gc_second_verification.py --check
python -B tools/build_gc_second_index.py check

python -B tools/test_gc_second_rewards.py
python -B tools/test_gc_second_journals.py
python -B tools/test_gc_second_scenes.py
python -B tools/test_gc_second_verification.py
```

Each layer preserves source hashes and instruction or source spans. The reports distinguish executable bytecode, native exports, table metadata, current emulator behavior and unresolved interpretation. Raw source artifacts are required to reproduce extraction; generated evidence lives under `outputs/grand-company-second-decomp-20260926/`.
