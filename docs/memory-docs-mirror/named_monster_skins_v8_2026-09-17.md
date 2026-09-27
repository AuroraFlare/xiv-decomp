# Named monster skins V8

Twenty-five independent cosmetic variants are installed in the combined
`NamedMonsterSkinsV8` Windower collection. The previous seventeen skins are
preserved. The full roster and commands are in
`outputs/named-monsters-v8-20260917/spawn-commands.md`; `catalog.html` provides
packaged texture and static mesh previews.

New actor IDs are 2990718–2990742, with BNPC IDs 1419–1443. Main actor-class,
appearance and mob-type SQL contain all 75 inserts. The optional scoped insert
contains the identical statements. The configured local database was updated
and every column read back equal to those main rows. No placements or drops
were added. Server restart was not performed; native-profile fallback keeps
the custom appearance available to the existing process. Coeurl fallback 3067
currently has native NM skill list 6021; the new custom profiles use 5016.

The new skins use unused texture banks in nine native model families. Only
requested diffuse pixel spans change; normal/specular maps, container layout,
sound tables, mesh and animation assets are retained. Wights retain their
native sword/shield graphics. The bat retains its profile hover height.
Treant bark and trunk maps are unchanged. Four seasonal foliage variants keep
the exact original one-bit alpha mask; Barebranch Bogg uses generated bare-twig
alpha on both foliage atlases, with under 30% of the native visible coverage.

The shared material registry uses the corrected native-length-dependent codec.
The actual pinned client decoder verified its new descriptor. All 443 blocks,
32,277 original rows and sixteen previous custom rows remain intact, with
exactly 25 new rows. V8 is the sole installed owner of the shared descriptor.
The guarded installer verified all 178 payloads and removed only the 76 exact
V7 files after successful installation. The reproducible V7 workspace output
remains available as the prior-package backup.

Validation passed: five package tests (including cutout-alpha preservation,
scoped SQL, conflict refusal and rollback), 674 real-Lua spawn checks with a
mocked engine, and installed-client script resolution for all 84 custom and
fallback class references. The original missing Cyclops script remains a
negative control. Full native model rendering, movement, sound and leafless
transparency still need client acceptance after a fresh Windower launch.
Static diagnostic previews do not demonstrate animation or game shaders.

Reproduction: run `build_pack.py build`, `sql_rows.py check`, `verify_native.py`,
and `test_pack.py` under `tools/named-monster-skins-v8`. Generate previews with
`mesh_preview.py` and the catalog with `catalog.py`. `install_pack.py plan`
checks the exact upgrade scope; `install_pack.py check` verifies deployment.
ImageGen prompts and per-image source receipts are saved with the output.
Final deployment evidence is in `installation-verification.json`.
