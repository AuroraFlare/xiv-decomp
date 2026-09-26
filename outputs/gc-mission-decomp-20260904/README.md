# Grand Company mission decomp evidence — 2026-09-04

[Findings and remaining gaps](../../docs/grand_company_missions_bytecode_decomp_2026-09-04.md)

Rebuild: `python -B tools/build_gc_mission_decomp.py` from the repository root.
The installed client is needed for the scene setup decode. Regression checks:
`python -B tools/test_gc_mission_decomp.py` (uses repository bytecode).

| Artifact | Contents |
|---|---|
| `summary.json` | Counts: 18 quests, 128 methods, 148 sampled EQ edges, nine scenes |
| `method-inventory.csv` | Exact extra-parameter counts, code size, traces, text rows, branch coverage |
| `event-traces.json` | Bytecode-driven calls, returns, PCs and offsets; representative inputs for every distinct sampled trace |
| `event-text.csv` | Referenced quest-local English text, joined to owning method |
| `bytecode.txt` | All 128 event methods disassembled with byte offsets |
| `director-evidence.json` | Six SQB directors and the conjurer class: source hashes, constants, no child prototypes |
| `director-bytecode.txt` | Full root instructions for those seven class-only chunks |
| `scene-actors.csv` | All 45 scene dictionary entries joined to actor-class SQL metadata |
| `scenes.json` | Scene hashes, dictionary offsets and all 300 decoded setup records with raw bytes |

Extra arguments are sampled over `nil, 0, 1, false, true`; choice and salute
returns independently over `0,1`. JSON null represents Lua nil. Lua booleans
are never coerced to numbers. Traces with identical calls/returns are deduplicated;
the retained input is a representative, not the only way to reach that trace.
All 148 outgoing EQ edges were exercised within this finite domain.

This executes only Lua bytecode control flow. Client APIs are inert recording
stubs; rendering, widgets, database transactions, gameplay and networking are
not tested. Scene transforms remain local to the decoded file; actor entries
are not automatically persistent spawns or combat targets.
