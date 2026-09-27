# Garuda 1.x implementation and decomp handoff

This is original FFXIV 1.23b Garuda, not ARR. Begin with the
[current implementation report](garuda-hard-video-implementation-2026-09-07.md).
The older August documents are historical snapshots, not the current code.
The [pose/Mistral follow-up](garuda-pose-comparison-2026-09-07.md) adds
Downburst, Slipstream and Shriek animation matches, corrects Hard's sheltered
jumps, and fixes Mistral stalling when its selected player evades the footprint.
The [Plumage follow-up](garuda-plumage-followup-2026-09-07.md) joins the
feather-bearing WSS9 release and makes each batch wait for its completed action.
The latest [plume-effects follow-up](garuda-plume-effects-followup-2026-09-07.md)
adds actual GTEX pixels, bounded material decoding and the English Razor/Satin
labels without guessing the remaining explosion selectors.
The [Song follow-up](garuda-song-followup-2026-09-08.md) replaces Song's WSS1
fallback with WSS6 using positively named original Normal footage and the shared
model's decoded recoil. It does not transplant Normal mechanics into Hard.
The [plume-color follow-up](garuda-plume-color-followup-2026-09-08.md) completes
all 18 material records and traces native color composition without guessing
the Featherlance/Thermal Tumult selector join.
The [final source audit](garuda-final-audit-2026-09-08.md) closes failed Razor,
Satin and sister spawn handling, records all 544 passing checks and summarizes
the deployment boundary and remaining evidence gaps.

## Live code

- `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua`: shared Normal/Hard
  director, stones, plumes, sisters, wind geometry/motion, model publication,
  phase timing, victory and cleanup.
- `Data/scripts/monster_tp.lua`: per-command cast/effect preparation,
  Mistral shelter/displacement and wind contact behavior.
- `Data/scripts/commands/weaponskill/garuda_plumage.lua`: guarded, non-damaging
  self release. `Map Server/Actors/Chara/Character.cs` emits its source-only X00.
- `Map Server/Primals/GarudaManager.cs`: entry, shared player start, party policy.
- `Map Server/Actors/Chara/Ai/BattleCommand.cs`, `Helpers/TargetFind.cs`,
  `State/MobSkillState.cs`, `Utils/BattleUtils.cs`: canonical presentation,
  private geometry, outcomes, recipient filtering and displacement.
- `Map Server/Packets/Send/Actor/Battle/CommandResult.cs` and
  `Map Server/DataObjects/Session.cs`: frozen displacement origin and exact
  session-generation identity used for presentation readiness.
- `Data/sql/server_battle_commands.sql` plus
  `Data/sql/live migrations/garuda_hard_contact_20260907.sql`: matching private
  command definitions. Apply the incremental
  `Data/sql/live migrations/garuda_song_animation_20260908.sql` after that earlier
  migration. Neither migration has been applied to a live database here.

## Evidence packages to give another AI

For one sharing archive, run `tools/garuda-ai-handoff/package.ps1`. It packages
these reports/data, relevant source snapshots and tests with a checked SHA-256
manifest under `outputs/garuda-ai-handoff-20260907/`. Full videos, bulk searches,
compiled outputs and local configuration are excluded. Read `START-HERE.md`
inside the ZIP; this is source context, not a deployable server or wholesale patch.

| Package | Contents | Reproducer |
|---|---|---|
| `outputs/garuda-command-decomp-20260907` | 31 canonical commands, 62 typed installed DAT rows, raw bytes, field schema, source hashes | `python tools/build_garuda_command_decomp.py` |
| `outputs/garuda-action-timeline-decomp-20260907` | 33 containers, 889 resources, 959 authored scheduler clips, 89 motion headers | `python tools/build_garuda_action_timeline_decomp.py` |
| `outputs/garuda-motion-followup-20260907` | Full bone keys: 17 banks, 3,704 tracks, 115,832 keys; skeleton joins and pose analysis | `python tools/garuda-motion-followup/build.py` |
| `outputs/garuda-pose-comparison-20260907` | Ten scientific WSS1–10 pose figures, every-frame anatomical samples and input hashes | `render_poses.py` in the motion tool; see folder README |
| `outputs/garuda-song-followup-20260908` | Reproducible WSS1/WSS6 root/head/foot samples, motion bounds and input/helper hashes; browser video observations are in the linked Song report, not archived images | `python tools/garuda-motion-followup/song_probe.py --check` |
| `outputs/garuda-rock-state-followup-20260907` | Model section bounds, native mask/visibility/dispatch decomp, cumulative-state proof | `python tools/garuda-rock-state-followup/inspect_rock_state.py` and its sibling `decompile.ps1` |
| `outputs/garuda-tornado-decomp-20260805` | Earlier deep m999/e003, WSS15/18, scheduler, VFX and native runtime recovery | `python tools/build_garuda_tornado_decomp.py` |
| `outputs/garuda-video-timing-20260907` | Four recordings' metadata, extraction recipe, 12 curated evidence images; full media/bulk frames are git-ignored | Folder README and `extract_frames.py` |
| `outputs/garuda-arena-navmesh-check-20260907` | Supplied starts vs recorded paths; interior-route fit, not arena boundary | See [navmesh report](garuda-arena-navmesh-check-2026-09-07.md) |
| `outputs/garuda-named-action-video-20260907` | 46 full frames linking named Wheel, Downburst, Slipstream, Shriek and Plumage to body sequences | Folder README |
| `outputs/garuda-clone-timing-20260907` | Three recordings' resolution/next-announcement frames, with timing uncertainty | Folder README |
| `outputs/garuda-range-followup-20260907` | Five installed bytecode files, 20 range methods and negative native-name probes | `python tools/garuda-range-followup/build.py --check` |
| `outputs/garuda-presentation-followup-20260907` | Seven effect banks, 141 resources, bounded mesh/control inventory and seven scientific projections | `tools/garuda-presentation-followup/README.md` |
| `outputs/garuda-plume-effects-20260907` | 22 native GTEX images, three atlases, localized plume names and 18 bounded material overlays | `python tools/garuda-presentation-followup/inspect_plumes.py --check` |
| `outputs/garuda-plume-color-followup-20260908` | Nine requested native function exports, verified executable/registry bytes, six VEFF graph joins and material defaults; no final-color or named-selector claim | `python -B tools/garuda-presentation-followup/inspect_color.py --check` |

Read the [command audit](garuda-command-audit-2026-09-07.md),
[rock proof](garuda-rock-state-followup-2026-09-07.md), and
[precise video follow-up](garuda-video-timing-followup-2026-09-07.md).
The latter supersedes earlier coarse browser-seek timing estimates.

The [range-method follow-up](garuda-range-followup-2026-09-07.md) checks actual
installed bytecode: empty range-code/angle methods are not identified native
thunks. The [clone timing follow-up](garuda-clone-timing-followup-2026-09-07.md)
preserves shorter clone-to-South observations and a weaker, longer clone-to-Mirage
sample; do not silently promote the current 40–45-second policy to retail fact.

The [runtime follow-up](garuda-runtime-followup-2026-09-07.md) documents the
frozen-position admission/interruption fix and its real-engine regressions.
Raid-start delivery also tracks the actual session plus actor-table generation,
so a reconnect replays setup once without resetting the original raid deadline.

The [full-motion follow-up](garuda-motion-followup-2026-09-07.md) and
[named-action video report](garuda-named-action-video-followup-2026-09-07.md)
support replacing Wicked Wheel's generic WSS1 with the WSS3 body spin. This is
explicitly a video/motion inference, not a recovered retail selector packet.
The later [pose comparison](garuda-pose-comparison-2026-09-07.md) supports
Downburst/WSS2, Slipstream/WSS4 and Mistral Shriek/WSS5 with the same explicit
inference status. Hard's pre-Aerial jumps use sheltered Shriek; Normal and the
existing cardinal ring coordinates remain unchanged.

## Authority and remaining uncertainty

The user supplied approximate boss/player starting transforms for **both**
difficulties; those are implemented. Other initial placements are unchanged.
`Data/quicknavmesh/zone_239.tsv` was walked **inside** the arena. Do not turn its
fitted loop into a wall, arena center or combat collision radius.

Recovered client command casts/elements, rock section masks and the real
SubStatusKick requirement are evidence-backed. South's 62-second total span is
a one-second-director reconstruction of two 62–63-second video measurements.
Four-second pulse windows, 40-second orbit, orbit radius, initial West eye
override, exact potency, clone resistance percentage and some phase policies
remain tuning. Duplicate command names do not prove retail phase assignments.
The remaining plume explosion named-action-to-WSS fallbacks are unproven; do
not infer an attack from a WSS ordinal or motion leaf name alone. Song now uses
WSS6, inferred from named video and native recoil motion, not a recovered Hard
selector packet or proof of the same-name canonical variant joins.
Plumage now uses WSS9, cross-matched from its feather topology, upright motion
and named video release. This is an evidence-backed inference, not a recovered
selector packet or proven native rendering parity.

No live client fight, database migration or map-server restart has been done.
Native rendering, transition/reconnect appearance, exact damage and remaining
animation joins still need stock-client acceptance. Preserve any destination
workspace's unrelated work and do not reset its tree.

## Verification

```powershell
python tools/validate_garuda_encounter.py
python tools/build_garuda_command_decomp.py --check
python tools/garuda-motion-followup/build.py --check
python tools/garuda-motion-followup/song_probe.py --check
python -m unittest discover -s tools/garuda-motion-followup -p test_*.py -v
python tools/garuda-presentation-followup/inspect_effects.py --check
python tools/garuda-presentation-followup/inspect_plumes.py --check
python -B tools/garuda-presentation-followup/inspect_color.py --check
python -m unittest discover -s tools/garuda-presentation-followup -p test_*.py -v
dotnet run --no-restore --project tools/garuda-encounter-tests/GarudaEncounterTests.csproj
dotnet run --no-restore --project tools/garuda-cast-tests/GarudaCastTests.csproj -- '.codex-build/garuda-poses-20260907/map/Map Server.dll'
```

Latest isolated Map build: zero errors and four existing dependency advisories.
A prior full compilation also reports the existing Blowfish signed-extension
warning; online vulnerability metadata has been unavailable for the Lua project.
129 Lua/interop, 368 production C#, 26 motion and 21 effect tests pass (544 total).
The latest isolated build command is in the pose/Mistral report. Rebuild the isolated Map
assembly after C# edits; passing an older DLL is not verification of new code.
