# eLeMeN FFXIV 1.x Monster Archive

English, structured reference data derived from the public dated eLeMeN archive.

- [Regular bestiary](bestiary.md) — 63 families, 110 species, 240 moves
- [Species aggression and senses](species-aggression.csv) — 72 aggressive, 38 passive
- [Notorious monsters](notorious-monsters.md) — 39 NMs, 126 moves
- [Server aggression implementation audit](server-aggression-implementation-audit.md) — row-level public/open-dungeon mapping, user-confirmed supplements, corrections, exclusions, and zero-gap coverage
- Machine-readable: `bestiary.json`, `species-aggression.csv`, `notorious-monsters.json`, `bestiary.csv`, `notorious-monsters.csv`, `enemy-moves.csv`, `monster-drops.csv`, and `nm-spawn-locations.csv`
- Build scripts: `tools/build_elemen_monster_archive.py` and `tools/build_elemen_aggression_audit.py`
- Canonical server SQL: `Data/sql/server_battlenpc_mob_types.sql` and `Data/sql/server_battlenpc_mob_types_loot.sql`; the Kai SQL is supplemental and must not overwrite nonzero canonical runtime values

## Provenance and limits

The eLeMeN pages are served over HTTP; HTTPS currently displays the hosting provider's unconfigured-SSL page. Every record retains its exact source URL.

For each regular species, eLeMeN embeds a red or green enemy icon next to a Japanese detection-sense label. The importer maps red to aggressive, green to passive, 視覚 to Sight (`DetectionType.Sight` / 1), 嗅覚 to Smell (`DetectionType.Scent` / 2), and 聴覚 to Hearing (`DetectionType.Sound` / 4). `知覚感知不明` remains Unknown with no numeric runtime mapping. Passive species retain their sense so the data is complete for future behavior work.

The regular bestiary does **not** publish ordinary item drops. The generated `ordinary_drops` arrays are supplemented only where a species name matches this repository's existing Gamer Escape region-page import, and each row says so. eLeMeN's `Crystal` row is stored as an affinity/order because the page does not state a shard/crystal tier or probability.

The NM pages do **not** publish level, HP, MP, or numeric STR/VIT/DEX/INT/MND/PIE/attack/defense stats. Level/HP/MP and server-side drop probabilities are included only in the explicitly separate `server_enrichment` object when the NM name matches local server wiring; zero/unknown values remain null. One cited `archive_wiki_enrichment` record closes the local-table gap for Lozol Totoloq's level and published drops, but not HP/MP. Captured server coordinates are exposed separately as `server_spawn_locations` and `nm-spawn-locations.csv`. When eLeMeN states a field, it has source priority; local canonical runtime data fills eLeMeN's numeric/runtime gaps, and the Kai guide remains a fallback/supplement.

English names are taken from the game's local multilingual data (`xtx_command.csv`, `xtx_itemName.csv`, `xtx_placeName.csv`, and `xtx_displayName.csv`) when available. Both English and original Japanese text are retained for fields where a complete official English mapping is unavailable.

## Regenerate

```powershell
python tools/build_elemen_monster_archive.py
python tools/build_elemen_aggression_audit.py
python tools/validate_elemen_server_implementation.py
```
