# Relic Coffer / Key Reward Contract (2026-06-19)

Generated: 2026-06-19T17:00:55Z

## Contracts

- A Relic Reborn source text is strong for Miser's Mythril, Alumina Salts, Enchiridion, Allagan Band, Oschon's Finger, White-hot Ember, and Howling Gale.
- Aurum/Cutter source identity is not the same as runtime coffer mechanics; spawn/special requirements/drop rows remain missing.
- Dzemael has the strongest recovered runtime resolver: quest 110868, item 10011244, drop sheets, full-inventory 25262, and no-item 60027.
- Garuda Hard must use a loot-list reward surface: Vortex Fletchings gates chest eligibility, and Vortex Headdress appears in loot list before inventory.
- Castrum coffer keys are solid item identities, but key consume/chest reward mechanics still need capture.
- Caravan and Behest relic source items are source-text solid but condition/table incomplete.

## Bridge Queue

1. Relic reward source registry: Register source item IDs, content IDs/source labels, and reward backend type: direct chest, loot list, Behest, Caravan, or trial. Verification: A debug dump shows 10011211/10011212/10011244/10011245/10011246/11000367/11000368 with correct source labels.
2. Loot-list backend: Represent loot-list add/full/exit-transfer/discard separately from direct inventory AddItem. Verification: Text IDs 25021/25027/25033 and exit text 52061 can be emitted from one test path.
3. Dzemael Enchiridion provisional chest: Use recovered quest/item/capacity checks and 25262/60027 messages; keep drop tables incomplete. Verification: Success, full inventory, and no-drop cases match recovered Lua behavior.
4. Aurum/Cutter coffer probe: Record A Relic Reborn stage, special requirement flags, spawn count, coffer actor, item, and packet order. Verification: Miser's Mythril and Alumina Salts are only awarded through table-backed/captured conditions.
5. Castrum key probe: Validate Copper/Silver/Gold keys as key tiers but do not infer rewards from names alone. Verification: Key consume/open/reward logs include key id, chest id, and preface/content state.
6. Garuda Hard chest: Gate claim eligibility on Vortex Fletchings and deliver Vortex Headdress through loot list. Verification: Eligible and ineligible party members differ exactly in loot-list claim behavior.
7. Caravan and Behest relic source rewards: Add Oschon's Finger and Allagan Band only after route/site contribution conditions are explicit. Verification: Camp Skull Valley/Drybone/Treespeak and Iron Lake/Broken Water/Nine Ivies are independently testable.

## Gaps

- Aurum/Cutter coffer runtime is not recovered: Recover coffer spawn/drop sheets or capture Aurum/Cutter chest opens with A Relic Reborn active.
- Loot-list backend is not mapped to local packets: Find or implement a loot-list package with 25021/25027/25033/52061 behavior.
- Caravan/Behest relic source rewards lack exact conditions: Probe contribution, party, active-protection, camp/site, and per-route reward conditions.
- Castrum key chest mechanics are still a capture task: Capture Castrum chest/key open events and tie them to bcn0l/Beacon preface state.
- Garuda Hard headdress reward distribution table is missing: Capture Garuda Hard post-clear chest/loot-list packets with and without Vortex Fletchings.

## Artifact Index

- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/relic_item_source_matrix.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/coffer_key_surface_matrix.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/loot_list_message_contract.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/evidence_anchor_hits.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/source_term_hits.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/bridge_queue.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/local_gap_summary.csv`
- `tools/outputs/lpb/relic_coffer_key_reward_contract_20260619/contract_summary.json`
