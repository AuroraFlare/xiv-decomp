# FFXIV 1.x Archive Wiki

Static preservation build from archived Gamer Escape / Eorzeapedia pages for Final Fantasy XIV 1.x.

- Start here: [index.html](index.html)
- Region/location archive: [regions/index.html](regions/index.html)
- Bestiary archive: [bestiary/index.html](bestiary/index.html)
- Build manifest: [manifest.json](manifest.json)
- Requested seed link cache: [wiki_data_links.csv](wiki_data_links.csv)
- Notorious Monsters roster/crosswalk: [notorious-monsters-roster.md](notorious-monsters-roster.md), [notorious-monsters-roster.csv](notorious-monsters-roster.csv), and [notorious-monsters-roster.json](notorious-monsters-roster.json)
- Notorious Monsters member-page mirror: [nm-pages/index.html](nm-pages/index.html) and [nm-pages/manifest.json](nm-pages/manifest.json)
- Quest archive rows: [quest_archive_rows.csv](quest_archive_rows.csv)
- Class/job ability rows: [class_job_ability_data.csv](class_job_ability_data.csv) and [class_job_ability_data.json](class_job_ability_data.json)
- Generated game-data layer: [data/index.html](data/index.html), including Main Scenario Quest map markers and Behest Battlewarden start positions
- Source pages retain links back to the Internet Archive capture used.
- Preferred capture timestamp: `20130129062310`
- Fallback capture timestamp: `20121124223139`
- Legacy image fallback timestamp: `20110815202002`

The Wayback Machine had intermittent 404/503 responses for the requested November 24, 2012 snapshot, so the generator falls back to the older archived 1.x navigation capture when a page is unavailable at the preferred timestamp.

The requested January 2013 class/job cache recovered action/trait tables for Archer, Conjurer, Marauder, Pugilist, Paladin, White Mage, Carpenter, Blacksmith, Armorer, Alchemist, Culinarian, Botanist, and Fisher. The same Wayback snapshots did not return standalone pages for Gladiator, Lancer, Thaumaturge, Monk, Warrior, Dragoon, Bard, Black Mage, Goldsmith, Leatherworker, Weaver, or Miner; links to those pages remain in the source/category pages and are rewritten to Wayback where no local page exists.

Rebuild with:

```powershell
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\build_ffxiv_1x_archive_wiki.py --requested-only --append --max-pages 90 --max-assets 0
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\extract_ffxiv_1x_wiki_links.py
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\import_ffxiv_1x_quest_data.py
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\extract_ffxiv_1x_ability_data.py
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\build_ffxiv_1x_data_wiki.py
```

The data overlay reads the local client `quest_marker.csv` and `2Dmap_data.csv`,
and the current Behest definitions from `Map Server/Behests/BehestManager.cs`.
It keeps archived wiki text separate from current/reconstructed coordinates.
Outdoor Behest positions are displayed as familiar map squares and retain raw
server XYZ; dungeon sites remain marked pending until a zone-specific map
transform is verified. The nation-specific first four Main Scenario Quest
chains are displayed with `(Gridania)`, `(Limsa Lominsa)`, or `(Ul'dah)` suffixes.

Validate local navigation with:

```powershell
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\validate_ffxiv_1x_static_wiki.py
```

Regenerate and validate the 110-member Notorious Monsters crosswalk with:

```powershell
python tools/build_nm_category_archive.py
python tools/build_nm_page_archive.py
python tools/validate_nm_category_archive.py
```

The build rewrites links for pages that are not mirrored locally to their Wayback Machine page, so static navigation should not dead-end on missing `.html` files.

Build the dedicated region/location section with:

```powershell
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\build_ffxiv_1x_regions.py --max-pages 160 --max-assets 80
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\finalize_ffxiv_1x_regions.py
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\validate_ffxiv_1x_regions.py
```

Build the dedicated bestiary section with:

```powershell
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\build_ffxiv_1x_bestiary.py
& 'C:\Users\drime\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' tools\validate_ffxiv_1x_bestiary.py
```

The mirrored content and images may be protected by their original owners' rights. Keep the source links and use this archive for preservation/research.

The January 6, 2013 Notorious Monsters category is preserved as a 110-member roster. Each member keeps its direct archived Wayback URL; the roster crosswalk links matching eLeMeN records and local BNPC IDs without treating category membership as proof of numeric combat data.
