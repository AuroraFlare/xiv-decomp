# Eye Shot warning: native inspection

The native warning selector is still unresolved. This inspection does not add a
replacement icon or claim the current text warning reproduces the retail visual.
The [pinned review](evidence/moogle-eye-shot-20260925/native_review.json) can be
reproduced against installed client `2012.09.19.0001` with:

```powershell
python -B tools/inspect_moogle_eye_shot_marker.py check
```

## Directly recovered

The existing Eye Shot binding selects Moogle WSS7, whose installed source hash is
`a85035f95dff8f2f08833c486c1cfc800806913460d3ddc5687621f59dfb2125`.
Its `mon_main` schedules the caster's `sp_a02` motion and caster effects, then
`m701_0011`. That target graph contains `m701_11_tar`, an A-to-B effect and a
damage-reaction selector. These are shot/impact resources; this graph does not
independently identify a pre-shot warning. Its scheduler envelope is not a
recovered warning duration.

The current command's cast type is 11. The installed Moogle BID contains `casb0`
with four clips: actor binding, client/server movement stops and caster motion.
It contains no target-effect clip. Generic `cast_mon_11` through `cast_mon_17`
also exist, but their presence supplies no Eye Shot-specific warning binding.

Installed `gameCommand` rows 23419 (ordinary ranged shot) and 23420 (Eye Shot) are
byte-identical, including the unidentified field 75 value of 6. That value must
not be presented as recovered proof of a six-second warning. The separate native
cast-time evidence and the guide-supported warning reconstruction retain their
existing scope.

The audit scans all 828 external `client/vfx` banks (146,857,660 bytes), pins the
full inventory through a canonical hash, and preserves semantic string matches.
The only external Moogle match is `mgc/1135`, already associated with Break.
The two named marker matches, `lib/3109` and `lib/3110`, identify quest `man406`
Magitek Cannon markers. String scanning is triage, not proof that another warning
asset cannot exist under an opaque name.

## Runtime paths inspected

- `SetActorIconPacket` (`0x145`) represents GM/AFK/disconnection actor flags.
- `Npc.SetNpcTargetMarker` changes hate/nameplate classification.
- The recovered `DesktopWidget.executePlayerTargetMarking` delegates to player
  party-target marking; it does not identify the Eye Shot crosshair.
- `PlayAnimationOnActorPacket` (`0xDA`) selects an action on its source actor. It
  does not supply a separate caster-to-player warning binding or cancel token.

None establishes a supported replacement. A runtime helper requires a proven
warning start selector, target binding and cancel operation before adding owned
cast tokens, exact player/session checks, death/escape cancellation and cleanup.
No runtime files or client assets were edited for this investigation. Video and
guide evidence from the [retail review](moogle_retail_accuracy_2026-09-25.md)
supports the existence of a warning; it does not expose its packet selector.
