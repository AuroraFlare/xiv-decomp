# MNK 111225 Mnk0j5 — Five Easy Pieces (Lv45) — deep decomp

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j5_five_easy_pieces_decomp_2026-09-27.md`

## Stages / sequences
- 0: Widargelt offer `processEvent_WIDARGELT_Start` (offer pc103/0x582; accept
  14,48–57 — full armor-trial tail must play; decline 13). Texts 49–50 name the
  four destinations; 52: chakra-sensing chests; 53–54: four now, fifth held.
- 6 interaction: four independent unordered coffer acquisitions, each
  `processEvent_getAF_info(itemId)` (event-owner scheduler 67108910 + item
  widget; server selects the item). Fourth acquisition completes in place
  (completionOwner interaction; NO return to Widargelt — contrast Whm0j5).
- Journal: Wil 552 (four destinations) / 553 next notice (Erik 50).
- Saved flags 0–3 (one bit per coffer) + counter; order-free; inventory-full
  retry safe (grant-then-persist).

## NPCs / coffers / positions (ground-capture gated)
- Widargelt 1060032 @ Little Ala Mhigo ✓.
- 11221401 Dzemael Darkhold zone 231 (-74.51,392.07) map (4.85,7.76) p2900:
  0 recorded nodes (nearest `!pos 231 -63.883 200.462 306.256`, ~86u). Private
  dungeon zone: coffer must be quest-visible inside the Darkhold content —
  follow-up with DzemaelManager (do NOT attach to regular/relic chests).
- 11221402 U'Ghamaro Mines zone 137 (96.96,-2692.71): 0 nodes (nearest ~97u).
- 11221403 Turning Leaf zone 153 West Shroud (-1528.00,280.01): 0 nodes
  (nearest ~1200u) — live capture required.
- 11221404 Cape Deadwind zone 174 Southern Thanalan (118.06,542.62): 0 nodes
  (nearest ~1400u) — live capture required.
- Only coffer actor class in gamedata is 1200161 (GuildleveBonusTreasureBox).
  All four objectives share it → template extended to match objectives by
  uniqueId when present (additive; marker-only rows unaffected). Retail
  marker→item binding unrecovered → server-policy mapping below (labeled, NOT
  list-order-derived): Darkhold 8071402 Gloves / U'Ghamaro 8051402 Gaskins /
  Turning Leaf 8013502 Circlet / Deadwind 8081802 Boots. All item IDs ✓.

## Rewards / edge cases
- Rewards: exp 5340; four Temple pieces via coffers (no separate grant).
- Guards: eligibility + sequence 6 + exact uniqueId + unclaimed bit; grant
  before persist; 4th completes; abandon wipes flags with quest (re-run safe);
  no party requirement (solo interactions; party members cannot claim each
  other's bits — Player-owned quest data). No instance, no chocobo surface, no
  sync (interactions only). Cutscene: none.
- STATUS: implemented-behind-capture-gate — code + SQL complete; Y/rotation for
  all four coffers + Darkhold content visibility need live capture before
  `offer=true`.

## Amendment 2026-09-27 (MNK-B pass)

Superseding package: `quests/111225-mnk0j5-five-easy-pieces/` (data.json +
decomp.md + quest.md, incl. the 4-site locate table + capture checklist).
Implemented in FF14-Memory this pass: objectives table (uniqueIds
`mnk0j5_{darkhold,ughamaro,turning_leaf,deadwind}_coffer`),
`completionOwner = "interaction"`, eventnpc rows 3383-3386 (X/Z exact,
Y/rot capture-gated); offer stays closed. Prior draft IDs 3336-3339 are
taken (Min300); 3359/3360 are Tanner rows.
