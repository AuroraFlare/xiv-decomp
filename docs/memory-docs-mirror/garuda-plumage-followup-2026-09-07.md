# Garuda Plumage release: feather mesh, native action and completed batches

This follow-up supersedes the unjoined Plumage status in the earlier pose report.
It concerns original FFXIV 1.x/1.23b, not ARR. Placement is unchanged.

## Positive evidence and its boundary

The named [Monk recording at 130–133 seconds](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=130s)
shows an upright rise, spread-wing hold, green release and recovery, with the
Plumage name visible at 132 and Razor Plumes present by 133. Six unchanged full
frames are retained in `outputs/garuda-named-action-video-20260907/`.
The additional [original Hard recording at approximately 232 seconds](https://www.youtube.com/watch?v=goKSqF9fldE&t=232s)
also names Plumage; that browser observation is corroboration, not a precisely
extracted animation onset or a new saved frame set.

Decoded m851 WSS9 is a 71-frame / 2.3667-second upright rise/recovery. More
importantly, its effect package contains a distinctive feather/quill mesh:

- Resource `3uad3sso007c`, 186 vertices of stride 20, 756 valid indices / 252 triangles.
- Authored bounds at offset 6824; bounded vertex/index records at 1448 and 5260.
- VEFF `1sJ6uUm851sk9c0` contains its resource literal at 5452 and 33280.
- The compared WSS7 and WSS8 packages do not contain this feather resource.
- WSS9 has a real SCB/VFX action envelope, not just an unattached motion bank.

The [mesh figure](../outputs/garuda-presentation-followup-20260907/m851_wss09-mesh-overlays.png)
shows the actual retained triangle topology under an **inferred** signed-short
normalization mapped to the authored AABB. This is not native VMDL rendering,
particle instancing, texture/material recovery or proof of world-space size.
The nearby VEFF `GenerateMaster` data does not yet establish an exact loaded
model/emitter binding. All raw offsets and control records remain inspectable.

Together, the named release, upright motion and feather topology support **WSS9
as an evidence-backed Plumage reconstruction**. No retail selector packet was
recovered. The interpretation is stronger than the previous rise/hold comparison
alone, but still requires stock-client visual acceptance.

## Implemented

Private command **23979** (`garuda_plumage`) uses client command **23544** and
packed animation **0x13009000 / 318803968**. Installed DAT supplies the instant,
non-damaging action classification. The private row is self-only, zero potency,
zero status, zero MP/TP and no area damage. The shared canonical donor is untouched.
The guarded handler is only admitted for a marked encounter boss targeting itself.

The combat engine executes the release and publishes its completed/interrupted
counter. Because an empty target-result list otherwise emits nothing, the
completed private action explicitly sends the existing source-only **X00 / 013C**
packet with zero hit results. No zero-damage hit or synthetic status is invented.
The self release retains Garuda's facing instead of turning toward her own origin.

Every plume batch waits for its corresponding completed release, including the
second 6-plume pre-Aerial batch. Busy, rejected and interrupted releases retry;
existing boss queues, tower outcomes and warps are not interrupted. Delayed
release rebases subsequent pair-spawn times instead of dumping overdue plumes
all at once. Earlier plumes continue their independent detonation processing
while a later release waits. Cleanup cancels the outstanding release and discards
the pending batch. The existing pair spacing and batch sizes remain reconstruction.

SQL seed and the unapplied migration contain the same new row. Reapplying skips
that named private row; a conflicting custom command ID fails instead of being
overwritten. Deploy SQL, engine and the new Lua handler together. No live database,
map server, installed client or unrelated placement was changed.

## Verification

Fresh isolated Map build: zero errors, four existing dependency advisories.
**364 production C# + 117 Lua/interop + 25 motion + 6 effect tests = 512 checks.**
The first five new behavior tests failed against the old director, then passed.
The new cases cover release receipts, busy/reject/interruption retry, multiple
batches, queue/warp guards, cleanup, a non-damaging scoped handler, and continued
detonations while a later release waits. C# tests cover outcome idempotence,
canonical alias, private metadata, WSS override and exact source-only packet bytes.
These are isolated fixtures, not a live network/client end-to-end acceptance test.

```powershell
dotnet run --no-restore --project tools/garuda-cast-tests/GarudaCastTests.csproj -- '.codex-build/garuda-poses-20260907/map/Map Server.dll'
dotnet run --no-restore --project tools/garuda-encounter-tests/GarudaEncounterTests.csproj
python tools/validate_garuda_encounter.py
python tools/garuda-presentation-followup/inspect_effects.py --check
python -m unittest discover -s tools/garuda-presentation-followup -p test_*.py -v
```

See the previous pose report for the isolated build and full-motion checks.
Mistral Song's WSS join and Featherlance versus Thermal Tumult effects remain
unproven. Exact potency, several timers/phase policies, arena boundary and native
rendering acceptance remain explicit limits; this does not claim full retail parity.
