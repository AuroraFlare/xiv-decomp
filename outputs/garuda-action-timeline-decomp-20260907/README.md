# Garuda, feather, and stone native action timelines

Read-only extraction from the installed original-game client, produced with:

```powershell
python tools/build_garuda_action_timeline_decomp.py
```

The extractor verifies the installed executable hash against the existing
tornado decomp and records SHA-256 hashes of every input and nested resource.
No client file is changed. Outputs are derived JSON; this is not a client mod.

## Coverage

33 source containers, 889 nested resources, 959 authored scheduler clips, and
89 motion-transform headers. Both the scheduler and motion-command parsers
completed with zero diagnostics for this client generation.

- All m851 Garuda WSS1–14, BID, and equipment model containers.
- All m527 feather WSS1–4, BID, and equipment model containers.
- All m526 stone WSS1–5, BID, and equipment model containers.
- m999 WSS16, the verified control-only persistent-state commit scheduler.

`manifest.json` identifies exact inputs. `summary.json` is the quick inventory.
Each source has its own JSON containing resource IDs, paths, sizes, hashes,
effect paths, motion headers, MCB entries, SCB actor bindings and all authored
blocks. `scheduler_clips.json` combines the scheduler entries, with raw payload
hex, resource references, actor names, start times and named scheduler targets.
`motion_metrics.json` combines duration/frame/bone-count headers.

## What this establishes

The feather actions are distinct authored packages. WSS1 invokes its target
scheduler at 0.29 seconds of `mon_main`; WSS2 and WSS3 do so at 0.10 seconds.
Their target damage-presentation selectors occur at 0.03/0.04/0.04 seconds of
those separate target schedulers. These are **client presentation times**, not
server cast times, damage application clocks, or natural plume lifetimes.
WSS4 invokes substatus scheduling rather than carrying an independent motion.

m999 WSS16 has only two SCB resources. `main` dispatches `mon_main` at 0.10
seconds; that scheduler binds the actor and executes
`RaptureActionSubStatusSchKickClip` immediately. It has no motion or VFX resource
and does not itself create a damage action. Its packed animation selector is
`0x13010000`. The wind publisher uses this real action envelope to commit the
preceding mode packet; merely setting `SubState.mode` leaves it queued.

The stone BID has `init_msb4_1`, `init_msb5_1`, `init_msb6_1`, and `init_msb7_1`.
Their node-group clip payloads address pairs 1/2, 3/4, 5/6, and all six groups,
respectively. The [rock follow-up](../../docs/garuda-rock-state-followup-2026-09-07.md)
checks their native runtime meaning and model geometry before applying them.

## Limits

This package does not invent a named-ability-to-WSS dictionary. Finding
`cbbm_sp_a01`, `m851sk2c1`, or a Feather skill02 path does not establish that
retail selected it for a specific named command. Full skeleton transforms are
not decoded by the MTB header reader. Server phase timing, potency, collision,
and exact retail selectors require other evidence.

Use the [command audit](../../docs/garuda-command-audit-2026-09-07.md) for actual
cast/element/range fields and the [implementation report](../../docs/garuda-hard-video-implementation-2026-09-07.md)
for live code and remaining reconstruction choices. Earlier decomp remains in
`outputs/garuda-tornado-decomp-20260805`; it is complementary, not replaced.
