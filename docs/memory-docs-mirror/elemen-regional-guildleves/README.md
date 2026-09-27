# eLeMeN FFXIV 1.x Regional Guildleve Archive

A complete Markdown extraction of the regional-guildleve pages linked by [eLeMeN's dated regional index](http://elemen.sakura.ne.jp/ff14_dated_archives/guildleve/regional/index.html).

- **371 table rows** across **10 source pages**
- Battlecraft: **180**
- Fieldcraft: **108**
- Faction: **53**
- Company: **30**
- eLeMeN rows flagged as not reconfirmed after Patch 1.19: **61**
- Official game-data IDs: **360 unique**; **11** starter IDs are shared by two source rows
- Original Japanese objectives, rewards, limits, commission text, and source URLs retained
- Official English game-data titles/descriptions added where matched

## Start here

- [How regional guildleves work](mechanics.md) — allowances, difficulty, EXP, linking/sharing, faction credit, company leves, history evaluation, and spawn notation
- [Data-driven encounter framework](encounter-framework.md) — waves, links, chance branches, interaction points, decoys, escorts, survival, and moving targets
- [Faction placement capture](../faction_guildleve_placement_capture.md) — runtime coverage for all 53 faction leves and the remaining direct-coordinate checklist
- [Server chest and reward implementation](server-implementation.md) — complete coverage, trigger/tier rules, captured versus fallback data, Toto-Rak animation, gil/items/EXP, and validation
- [Source and completeness manifest](source-manifest.md)

## Catalog

- [Limsa Lominsa — Battlecraft Leves](battlecraft-limsa-lominsa.md) — 60 rows, 7 sections
- [Gridania — Battlecraft Leves](battlecraft-gridania.md) — 60 rows, 7 sections
- [Ul'dah — Battlecraft Leves](battlecraft-uldah.md) — 60 rows, 7 sections
- [Limsa Lominsa — Fieldcraft Leves](fieldcraft-limsa-lominsa.md) — 36 rows, 5 sections
- [Gridania — Fieldcraft Leves](fieldcraft-gridania.md) — 36 rows, 6 sections
- [Ul'dah — Fieldcraft Leves](fieldcraft-uldah.md) — 36 rows, 5 sections
- [Brotherhood of the Broken Blade — Faction Leves](faction-brotherhood-of-the-broken-blade.md) — 20 rows, 7 sections
- [Azeyma's Shields — Faction Leves](faction-azeymas-shields.md) — 19 rows, 6 sections
- [Horn and Hand — Faction Leves](faction-horn-and-hand.md) — 14 rows, 5 sections
- [Company Leves](company-leves.md) — 30 rows, 6 sections

## Regenerate

```powershell
python tools/build_elemen_regional_guildleve_archive.py
```

The host is HTTP-only. Generation requires network access and validates the discovered source-page set before replacing this folder.
