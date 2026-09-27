# Garuda named-pose comparison and Mistral completion fix

Later update: the [Plumage follow-up](garuda-plumage-followup-2026-09-07.md)
supersedes the unresolved Plumage candidate section below with new feather-mesh
evidence and a completed-release implementation. Counts below are this earlier
snapshot; see the [current handoff](garuda-ai-handoff-2026-09-07.md) for the latest
combined verification counts.
The [September 8 Song follow-up](garuda-song-followup-2026-09-08.md) subsequently
supersedes the unresolved Song/WSS1 section below with a named WSS6 recoil match.

This follow-up supersedes the candidate-only Downburst/Slipstream status in the
earlier [motion report](garuda-motion-followup-2026-09-07.md). It concerns original
FFXIV 1.x Hard, not ARR. Installed motion keys and named video sequences support
three further presentation improvements; the same footage exposed a phase-policy
error. Production tests also reproduced and fixed a Mistral admission stall.

## Implemented presentation joins

| Private command | Canonical name / ID | Native bank / packed animation | Positive comparison |
|---|---|---|---|
| 23989 | Wicked Wheel / 23538 | WSS3 / 318779392 | Previously implemented: sustained hip/spine horizontal turning sweep |
| 23990 | Slipstream / 23539 | WSS4 / 318783488 | Frontal wing expansion, down/forward release, upright recovery |
| 23991 | Downburst / 23537 | WSS2 / 318775296 | Rise/rear, asymmetric leg extension, turning downward dip |
| 23993 | Mistral Shriek / 23541 | WSS5 / 318787584 | Curled preparation, dip/head-down inversion, rising release |

These are **motion/video inferences**, not recovered retail command-selector
packets. Downburst and Shriek have particularly distinctive body sequences;
Slipstream has a less unique signature and correspondingly lower confidence.
No assignment follows merely from WSS order or a `sp_bNN` resource name.
All four have actual SCB action envelopes in the installed bank. The seed and
unapplied idempotent migration agree on both animation fields. Cast durations,
damage types, radii and canonical client names are unchanged by this mapping pass.

### Downburst

The named [reference recording](https://www.youtube.com/watch?v=rzVsuAo30hs)
at 389.5–391 seconds shows the distinctive rear, extended leg, then turning dip;
477.625–478.125 corroborates the rise/drop. WSS2's decoded root Y is about 4.28
at frame 15 and 1.70 at frame 22, with more than one model unit of left/right
foot-height asymmetry at frame 15. This is not a claim that Downburst has no yaw.

### Slipstream

The new ready line at reference 412.0 precedes the held frontal posture through
415.5, wing opening at 415.875, down/forward sweep at 416.125, and recovery around
416.5. WSS4 has the corresponding symmetric wing-driven release and stays upright
where WSS5 inverts. WSS6's sideways/asymmetric presentation is different. Overlapping
player spells are not used to identify Garuda's VFX or calibrate damage.

### Mistral Shriek: positive name, not an assumed Song

The [Monk recording](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=62s) has its
useful named combat lines in the **left** pane. `Garuda readies Mistral Shriek.`
is visible at 62.25 seconds. Garuda holds curled wings through roughly 62.75,
dips around 63.0, turns head-down around 63.125, then rises into the green release
at 63.25–63.5 and high recovery at 64.0. WSS5 places the head below the feet near
frame 16 and rises again through frames 24–32. WSS4 does not perform that inversion.

The next sheltered jump also says Shriek: the ready line is visible at 118.0,
and `Garuda's Mistral Shriek misses.` is visible at 123.0. These names are retained
in unchanged full frames; this is not a name assigned to an anonymous explosion.

## Corrected Hard pre-Aerial policy

The old reconstruction alternated Song and Shriek and moved some Shrieks among
the rocks. Hard pre-Aerial jumps now consistently use sheltered Shriek from the
**existing cardinal ring**. Both tower shelter and tower damage remain enabled.
Two successive named observations support this choice; the exact retail order
of cardinal directions and their radius are still not established. Existing
ring coordinates are retained, not promoted to recovered placement data.

Normal retains its previous Song policy. Post-Aerial Song/Shriek selection is
unchanged. User-supplied initial boss/player starts and unrelated placements are
unchanged in this follow-up. The inside-walked navigation route is not a wall.

## Fixed: successful evasion could prevent Mistral from finishing

The previous engine used the chosen player both as the command anchor and as
a mandatory member of its damage footprint. Thus a valid player 40 yalms from a
22-yalm Shriek could block the cast entirely, despite its separate 50-yalm anchor
range. A player standing behind Song's cone had the same problem. This can stall
queued fight mechanics instead of allowing the attack to complete harmlessly.

Only director-controlled private Mistral commands **23992–23994** now validate
their anchor with `CanTarget(... ignoreAOE: true)`. Final recipient discovery
still applies the complete circle/cone. Actual maximum/minimum distance, height,
floor, target mask/allegiance, same area, life, MP/TP and recast checks remain.
Distance is explicitly recomputed for these anchors so the legacy optional-cap
helper's zero-distance quirk cannot admit arbitrarily distant players.

This applies at admission and interruption revalidation, including unsnapshotted
convergence Shriek. It does not widen damage or grant the exemption to wind,
ordinary specials, autonomous enemies, or imported commands. Frozen tornado
admission and per-recipient visibility/readiness filtering remain intact.

The new actual-engine test failed on the old implementation, then passed after
the fix. It checks empty recipient sets outside Shriek and behind Song, a 51-yalm
rejection, interruption behavior, and preserved hostile/floor/resource guards.
The actual-Lua test likewise failed on the first Hard jump before the policy fix.

## Scientific figures and limits

`outputs/garuda-pose-comparison-20260907/` contains ten WSS1–10 joint-projection
figures and full per-frame anatomical samples. These are calculated from every
available curve plus skeleton bind fallback, composed along the verified parent
hierarchy. Front XY, side ZY and top XZ views preserve each clip's motion.
Each figure states its scale; high-flying clips use smaller scales to avoid
clipping. The top-view baseline is its minimum plotted Z, not ground height.

No native mesh, skinning, physics, scheduler blend, actor/world facing, VFX or
live-client rendering is reproduced. Raw decoder provenance and scalar-sampling
caveats still apply. Raster screenshots are not the source of the numeric tests.

## Still unproven; no speculative production change here

- Mistral Song's ordinary WSS1 fallback has not yet been replaced by a positively
  named pose match. WSS6 is a candidate, not established by elimination.
- Plumage is positively named at Monk 132 seconds. At 130–132 Garuda rises with
  wings spread, holds airborne, releases a green effect and returns; Razor Plumes
  are visible by 133. WSS7/9 have upright rise/hold candidates; WSS8 is asymmetric.
  Camera movement, clipping and overlapping spells prevent a confident final
  selector join in this comparison. WSS7–9 **do** have SCB/VFX envelopes; only
  WSS10 is the bare motion bank. The director spawns plumes, but does not yet
  reproduce a proven native Plumage release action.
- Featherlance versus Thermal Tumult cannot be separated using plume bone motion:
  their three MTB payloads are identical. Their differing VFX still need joining.
- Exact retail damage, some timers/pulses, arena boundaries, reward presentation,
  and native reconnect/rendering remain outside what isolated tests establish.

## Verification

Fresh isolated Map build: **0 errors**, four existing NuGet dependency advisories.
**341 production C# + 110 Lua/interop + 25 decoder/math tests = 476 checks pass.**
The Lua total is 89 encounter cases, 20 publication cases and one CLR identity probe.
The static contract and deterministic command/full-motion re-extraction also pass.

```powershell
dotnet build 'Map Server/Map Server.csproj' --no-restore --nologo -v:q -p:OutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-poses-20260907/map/ -p:IntermediateOutputPath=C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/.codex-build/garuda-poses-20260907/obj/map/
dotnet run --no-restore --project tools/garuda-cast-tests/GarudaCastTests.csproj -- '.codex-build/garuda-poses-20260907/map/Map Server.dll'
dotnet run --no-restore --project tools/garuda-encounter-tests/GarudaEncounterTests.csproj
python tools/validate_garuda_encounter.py
python tools/build_garuda_command_decomp.py --check
python tools/garuda-motion-followup/build.py --check
python -m unittest discover -s tools/garuda-motion-followup -p test_*.py -v
& '.codex-video-tools/Scripts/python.exe' tools/garuda-motion-followup/render_poses.py
```

Do not omit dependency compilation on the first isolated build: its Common
reference assembly must exist. No live client/server was started, no database
migration was applied, and no installed client file was changed.
