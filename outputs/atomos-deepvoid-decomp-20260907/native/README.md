# Native `RaptureEffectAtoBClip` closure

The registered `RaptureEffectAtoBClip` factory at `0x0063A560` allocates a
`0x38`-byte runtime object and constructs it at `0x00821760`. Its action-time
handler is `0x00821820`.

The handler reads a signed 16-bit referenced-clip count from the parsed record
at `+0x12`, then signed 16-bit clip indices beginning at `+0x16`. It resolves
each index in the owning scheduler, verifies that the referenced object is an
`ActionClip`, and calls that clip's virtual method at `+0xCC` with argument
`2`. WSS3's serialized record has count `1` and referenced index `2`, so its
A-to-B clip controls target ActionClip 2 (`m070_0003tar`). It does not contain
or load another tether/beam VFX resource.

The ActionClip factory/constructor are `0x0063C210` / `0x0082FB30`; its `+0xCC`
implementation is `0x0082FE70`. That method propagates the supplied action
mode through eligible nested action objects. The supporting setters at
`0x0080A810` and `0x0082EAB0` retain that mode in runtime state.

Reproduce the decompilation from the repository root:

```powershell
& tools/decompile_atomos_native.ps1
```

This native result narrows WSS3's semantics but does not identify the original
server action name or prove that the event director targeted the aetheryte.
