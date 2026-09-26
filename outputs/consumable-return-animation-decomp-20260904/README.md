# Consumable and Return animation evidence

Start with [the findings and test commands](../../docs/consumable_return_animation_decomp_2026-09-04.md).

- `summary.json`: counts, executable identity, candidate packed IDs, validation boundary.
- `source_manifest.csv`: SHA-256 and size of every inspected asset.
- `native-verified-targets.txt`: 16 completed targeted native decompilations plus instructions.
- `packet-dispatch.asm`: opcode dispatch and position-field reads from the local IDA export.
- `native-windows.asm`: supporting loader/table assembly windows.
- `native_categories.csv`: correctly aligned category names, character/VFX flags, and route kinds.
- `schedulers.json`: actor bindings, resources, and authored blocks.
- `scheduler_clips.csv`: clip edges, raw times and record bodies.
- `motion_headers.csv`: embedded motion frame/fps metadata.
- `authored_paths.csv`: preserved potion/food/revival source paths.
- `resource_inventory.csv`: recursive resource identity and payload hashes.
- `parse_failures.csv`: empty; all selected scheduler and motion headers parsed successfully.

Intermediate native dumps retain exploratory work, including explicitly invalid
leads; use `native-verified-targets.txt` and the report for the final conclusions.
No in-game playback was performed. Raw SCB units are intentionally not labeled
seconds. Rebuild with `tools/build_consumable_return_animation_decomp.py` and
`tools/decompile_consumable_return_animation.ps1` from the repository root.
