# eLeMeN FFXIV 1.x local guildleve archive

A complete extraction of [eLeMeN's dated local-leve index](http://elemen.sakura.ne.jp/ff14_dated_archives/guildleve/local/index.html), joined to the local 1.x client data.

- **152** publisher-listed crafting commissions
- **608** source variants (four per commission)
- **19** commissions for each of the eight crafting classes
- Requested item, quantity, attempts, recommended level, and success reward joined against `gamedata_passivegl_craft.sql`
- The 17 class-1 dummy/test passive rows are deliberately excluded because no publisher/source commission uses them

## How local guildleves work

Local guildleves are crafting commissions, not field objectives. They do not start at an aetheryte, use gathering circles, or impose the regional leve's field timer. The selected card chooses one of four variants stored on the same commission ID. Each variant changes the requested product/quantity, allowed synthesis attempts, recommended crafting level, and success reward.

The commission text names the client or camp contact who supplies/receives the work. The 64 `PgConv` commissions require collecting supplies from that client; the 88 `PgAeth` deliveries supply materials at acceptance. Craft through Requested Items, then speak to the named client to deliver completed work. All 26 clients have existing NPC spawns. The publisher issues/returns leve cards but does not receive completed goods. See [the handoff implementation notes](../local_guildleve_handoffs.md).

Normal synthesis grants the ordinary crafting EXP for each craft. The archived tables expose the success item/crystal but do not provide exact gil, guild-mark, or separate completion-EXP amounts. Contemporary [version 1.0 descriptions](https://finalfantasy.fandom.com/wiki/Guildleves_%28version_1.0%29) establish that local leves could pay gil and guild marks, but those per-card values have not been recovered here; the server currently grants only the source-backed item/performance tiers rather than presenting estimated currency as exact retail data.

Patch 1.22 evidence retained in the repository defines the performance bonuses:

- Successful completion always grants the configured success item.
- Performance rating 100 grants one additional item.
- Performance rating 300 gives a chance at one more item. The exact retail probability is not recovered; the server's current data-tunable reconstruction is 50%.
- Crystal quantities were adjusted by the patch, but the archive/client rows—not a guessed formula—remain authoritative per variant.

## Server audit

- All 152 published IDs are present in the publisher arrays and passive guildleve SQL.
- All 608 archived variants are joined. **21 individual cells differ** between the web archive and client SQL; each affected commission labels both values and runtime retains the client-data value.
- Recipe resolution uses the assigned crafting class, objective quantity, attempt limit, and recommended level. This prevents duplicate-result recipes from selecting another class or an impossible yield.
- Acceptance consumes one allowance and enforces the eight-local-leve slot limit.
- State persistence covers selected variant, attempts, successful crafts, quality/performance, HQ count, and material-display state.
- Completion preflights inventory and grants all eligible configured rewards.
- Offer-card variation uses the recovered `1,2,3,4,1,2,3,4` mapping rather than treating the three rank tabs as variant indexes.

## Catalog

- [Carpenter](carpenter.md) — 19 commissions / 76 variants
- [Blacksmith](blacksmith.md) — 19 commissions / 76 variants
- [Armorer](armorer.md) — 19 commissions / 76 variants
- [Goldsmith](goldsmith.md) — 19 commissions / 76 variants
- [Leatherworker](leatherworker.md) — 19 commissions / 76 variants
- [Weaver](weaver.md) — 19 commissions / 76 variants
- [Alchemist](alchemist.md) — 19 commissions / 76 variants
- [Culinarian](culinarian.md) — 19 commissions / 76 variants

## Regenerate and validate

```powershell
python tools/build_elemen_local_guildleve_archive.py
```

The generator validates the full source-to-SQL join before replacing this folder.

## Source hashes

- `Carpenter.html`: `2aa909178153b8b6c3b43fa5b10ba8aae8837a105fec29f34588774350ef8d06`
- `Blacksmith.html`: `b9dcbf5209bb3047bb3fb4fa3e21e2fbdc3cdeb096b5baa1500fc20c8d249b14`
- `Armorer.html`: `f583d3d321c0bc359752696ed2ee94e9a8b3e0b3f0db750ee80140deeba8d432`
- `Goldsmith.html`: `7d66450844b76d40997774d96e23fd5b23e015ca4dd8fd6d404bbfffa46781f9`
- `Leatherworker.html`: `27bd10b5f6da1cbdcf4754c8d54c53e017d9e52822a3773e794f85c6365d5847`
- `Weaver.html`: `420e7cf687e4df83efb0c8987dc6c917045775a66c3f9ecba8af57f73a5710ce`
- `Alchemist.html`: `c2fa8809cb41599ab1ce1ee2788db7476b810dcd1c8faea085aec18542cc49d2`
- `Culinarian.html`: `644fc1c42000b9aef7bfb91f3dde141d2cb24c9194a0c65f45b21a4896bc393d`
