# Grand Company rewards: second-pass native recovery

Date: 2026-09-26. Reproduce with `python -B tools/build_gc_second_rewards.py build`; verify with `check` and `python -B tools/test_gc_second_rewards.py`.

The first pass left `-13 / 534 / 8090201` unresolved. This pass follows it through the actual client Lua bytecode and recovers the complete **offer-preview EXP calculation**:

```text
level = questSheet[questId][51]
percent = questNewRewardSheet[questId][13 * (slot - 1) + 5]
preview = ceil(getSkillPointMax(level) * (percent / 100))
```

`534` is passed to the icon setter. `8090201` is the generic slot item field; the -13 branch does not read it. `getSkillPointMax` is a Lua literal lookup for levels 1–50, so this formula requires no speculative native PE analysis. The raw chunks have 8-byte non-integral Lua numbers. The replay records instruction offsets, sheet reads and UI calls; it never executes a client or server API.

## Instruction and argument proof

`player_work.luac` calcSkillPoint executes DIV by 100 at **0x17B6**, calls getSkillPointMax at **0x17C2**, multiplies at **0x17CE**, then calls `_math.ceil` at **0x17D2**. The division happens first. `charabaseclass_battle.luac` getSkillPointMax begins at **0x353E** and ends at **0x36AA**; its five literal arrays recover every level 1–50. Inputs above 50 return 99999999; out-of-table low/fractional indices can return nil and are not valid quest-level inputs in this audit.

The detail widget scans 16 slots, stops at state 301, and displays state 100. State 300 is skipped. Each slot is 13 fields: +1 reward type, +2 icon, +3 item/action ID, +5 base quantity/percentage, +6..8 alternate quantities. The -13 offer branch calls the formula with the **quest's level**, not the player's current level, and renders UI text **5054** ('～… experience points', German/French explicitly 'up to'). This is an offer estimate, not proof of final server EXP.

Completion `QuestRewardWidget.setRewardData(self, questId, awardedExp, variantIndex, ...slotIndices)` instead renders -13 with text **5052** and **awardedExp supplied by its caller**. Every all-quest completion probe uses supplied EXP 9876; all 69 -13 rows display 9876 even when the native preview differs. The real `_onJobQuestCompleteThird` callback packs up to eight reward slot IDs, calls `desktopWidget:openQuestRewardWidget(questId, arg2, arg3, unpack(slots))`, and invokes the ordinary completion callback. The connector's raw instructions preserve the UI-mode wrapper. The caller's provenance, authority and actual grant are separate from display.

## Floating-point rounding matters

| Level | Base EXP | Percent | Binary-double product | ceil | Exact rational ceil |
| ---: | ---: | ---: | --- | ---: | ---: |
| 22 | 22000 | 5% | 1100.0 | 1100 | 1100 |
| 22 | 22000 | 7% | 1540.0000000000002 | 1541 | 1540 |
| 22 | 22000 | 8% | 1760.0 | 1760 | 1760 |
| 25 | 27000 | 4% | 1080.0 | 1080 | 1080 |
| 25 | 27000 | 7% | 1890.0000000000002 | 1891 | 1890 |
| 25 | 27000 | 8% | 2160.0 | 2160 | 2160 |
| 30 | 38000 | 8% | 3040.0 | 3040 | 3040 |
| 40 | 71000 | 6% | 4260.0 | 4260 | 4260 |
| 40 | 71000 | 7% | 4970.000000000001 | 4971 | 4970 |
| 45 | 89000 | 5% | 4450.0 | 4450 | 4450 |
| 45 | 89000 | 6% | 5340.0 | 5340 | 5340 |
| 45 | 89000 | 7% | 6230.000000000001 | 6231 | 6230 |
| 50 | 110000 | 6% | 6600.0 | 6600 | 6600 |

**33 quests** gain one point from the observed divide-then-multiply double rounding before ceil. In particular, 7% at levels 22/25/40/45 yields **1541/1891/4971/6231**, not 1540/1890/4970/6230. Rearranging to integer multiplication/division changes these native previews. Every comparable archive base EXP entry matches the replay: **68 rows, 0 mismatches**. Agreement corroborates the formula but does not turn client preview into server-grant proof.

## Corrected shared seals and alternative quantities

Shared `101/104/106/107` quests and the `304` field surveys use reward type **-15**, not -14. The native display selects seal item and icon from the player's **current company**, overriding the sheet's item/icon after reading them. Type -14 uses the sheet item. Concrete probes for all three allegiances produce 1000201/61603, 1000202/61602 and 1000203/61601 from the same Limsa Ifrit row.

The completion quantity comes from `slotBase + 5 + (variantIndex - 1)`; a negative alternative falls back to base +5. It does not add the alternative to the base.

| Family | Variant 1 seals | Variant 2 seals | Variant 3/4 |
| --- | ---: | ---: | --- |
| It Kills with Fire / 101 | 1000 | 1500 | negative -> base 1000 |
| Garuda / 104 | 2000 | 2500 | negative -> base 2000 |
| United We Stand / 106 | 5000 | 6000 | negative -> base 5000 |
| To Kill a Raven / 107 | 6000 | 7000 | negative -> base 6000 |
| Field surveys / 304 | 700 | negative -> base 700 | negative -> base 700 |

The prior Elemen transcription described 1500/2500/6000/7000 as EXP bonuses. These exact values occur natively as **alternative total seal quantities**, not EXP fields or added deltas. This corrects that evidence interpretation; the producer and eligibility rule selecting variant 2 still require separate recovery. No payout or SQL change was made.

The old decompiler's `isFestival() return true` is wrong. Raw bytecode reads `worldMaster:_getSpecialEventWork(9)` and returns true only for **11**. On -14/-15 completion displays, the festival bonus presentation additionally requires native quest column53 >0 and <127. It moves the entry into ListBoxItem_Bonus, writes text/content3189 with argument2 and starts BonusEffectStart. The traced widget does **not multiply the numeric seal quantity**; an 'x 2' label alone does not establish server doubling.

## Complete inventory and grants

The earlier first-pass prose claiming reward rows for all 102 identities was incorrect. There are **87 native reward rows: all 69 named quests plus 18 internal placeholder rows**. The 15 internal Gc501/502/601/602/603 identities have no reward row. All named quests have one -13 preview slot; the seal slots are 45 type -14 and 15 type -15. Nine named quests have no direct seal slot. Absence is not silently converted into an invented reward.

[Reward matrix](../../outputs/grand-company-second-decomp-20260926/rewards/reward-matrix.csv) covers all 102 rows. [Structured evidence](../../outputs/grand-company-second-decomp-20260926/rewards/reward-evidence.json) retains every reward slot, native sheet line, per-quest preview and four completion variants, archive transcription and current server reward summary. [Examples](../../outputs/grand-company-second-decomp-20260926/rewards/example-traces.json) include full PC/offset traces; [state/callback probes](../../outputs/grand-company-second-decomp-20260926/rewards/state-and-callback-probes.json) recover allegiance, festival and completion argument behavior.

The first-pass server-runtime snapshot's fixed EXP values agree with the recovered native preview where wired. The six promotion routes are its exception: that completion path awards no EXP, despite native previews 6231/6600. A fresh scan of the main quest reward SQL still finds zero GC reward rows, so that file provides no completion fallback. Generic routes remain gated in the first-pass snapshot. Native completion presentation can show any supplied amount; it does not itself grant EXP, seals or items. This work preserves all first-pass artifacts and changes no gameplay data.

## Validation boundary

The purpose-built concrete interpreter supports only observed opcodes and recording APIs and fails on unknown ones. Unit regressions verify table boundaries, exact arithmetic order/rounding, concrete supplied completion EXP, variant fallback, dynamic company currency, actual festival branch, stop/skip slot behavior and callback slot packing. Bytecode offsets and SHA-256 hashes make the extraction reproducible. No native server grant formula, live database state, client rendering or normal-party acceptance is claimed.
