
# Implementation handoff

## Flans

The native route is the low-byte `SetActorSubState.mode` plus an
action-time SubStatusKick, not BODYGEAR, humanoid COLORINFO, or the low-byte
magic-power-up mode bits.

1. Keep gameplay absorption/spell profiles independent from presentation.
2. Publish state 1 for Fire, 2 Ice, 3 Lightning, 4 Wind, 5 Earth, or 6 Water
   in opcode-0x0144 payload byte `+4`; keep byte `+5` zero.
3. Commit it with m049 WSS5 (`0x13005000`), whose scheduler contains
   `RaptureActionSubStatusSchKickClip`; the command id can remain zero when
   this is presentation-only.
4. Publish the chosen state in the actor's initial substate packet so late
   viewers bind to the same persistent material state.
5. For m049, values 1-6 occupy the metadata-defined low ordinal bits. Other
   models can partition the same byte differently and use remaining bits for
   `init_msb` state, so do not generalize m049's ordinal mapping globally.

## Spirit of the Wood

Keep the atomic BODYGEAR variant selection, but replace the guessed WSS7 cover
with a presentation modeled after the authored scenario chain:

```text
c_c23_appr01 ACB
  -> 3ZjARPvleafinst
  -> 1vgBedm508_appe
  -> 0J3FJQm508_appe
  -> ColorRGBABlink / ColorRGBALeaf / LeafLife
```

If the server cannot request the original scenario ACB directly, emulate it
as a separate effect around the atomic variant change. Preserve the complete
0x34-byte color-control records; they include curve/tangent data and are not
equivalent to a guessed single from/to RGBA pair.

Do not infer a BODYGEAR delay from the cutscene clocks. The appearance packet
and the QIX presentation are separate native systems.

## Reuse

The exact packet handler, queue, selector, QIX math, generic color-fade false
lead, resource hashes, and scheduler edges are now in this bundle. Remaining
work should be runtime capture or server integration, not another broad static
scan of the same binaries.
