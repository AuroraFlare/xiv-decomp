# Job and Grand Company client decomp evidence

Scope: 87 requested quests. `scope.csv` retains IDs and current availability rows.

Start with [the complete quest index](QUEST_INDEX.md) or [the main findings](../../docs/job_gc_full_decomp_2026-09-07.md).

`quests/` contains typed symbolic API-call paths and exact PCs/byte offsets; `reconstructed/` renders every non-init method as readable path templates; `bytecode/` also includes registration and initText. Symbols arg4 etc. name the 1-based client parameter slot, including self/quest, player, event owner. callPC.occurrence.returnN preserves independent multiple API results.

Only recovered opcodes execute. All client calls are inert, uninterpreted boundaries. Branch coverage is coverage of bytecode predicates, not of game states, arbitrary API values, all menu repetitions, scene skipping, or server encounter behavior. Lua booleans remain distinct from numeric 0/1; LE paths require Lua-compatible ordered types. Uncovered instructions/edges are explicit.

`scene-callers.csv`, `fade-callers.csv`, and per-scene JSON join method calls to installed scene resources. `scene-placements.csv` lists scene-local actor typed SetPosClip character setup positions (rotation in radians). All other clip classes retain raw records; a 0x40/0x48 size alone proves no transform. `scene-timeline-placements.csv` spans all authored blocks; `scene-clips.csv` and per-scene `timeline` retain class, track, flags, motion resources and offsets. These are neither final scene poses nor verified server world/battle placements. `director-evidence.json` records exact class shells and any methods.

Reproduce: `python tools/build_job_gc_decomp.py`. Source hashes are recorded in `source-manifest.json`; client assets themselves are not copied.
