# Beckon Spirit appearance transition

This additive Windower `DatOverlay` package exposes the Spirit of the Wood's
retail **spawn/appearance** effect. The stock m508 action banks do not contain
that effect; it is embedded in the `man2g000` scenario package.

It is not the in-combat elemental color transition. Live testing showed that
using it for element changes produces the wrong dramatic light and no lasting
color change. The map server therefore does not request WSS9 during the fight.

The builder creates a new m508 WSS9 (`0x13009000`) containing the exact retail
chain:

```text
c_c23_appr01
  -> 3ZjARPvleafinst
  -> 1vgBedm508_appe
  -> 0J3FJQm508_appe
```

All five effect textures, all five effect models, and the complete VEFF color
curve data are copied with it. WSS8 and every other retail action remain
untouched. The overlay preserves m508's authored actor-binding setup offsets:
the wrapper starts at 100 ms and its action starts 160 ms later.

The element colors are genuine m508 body textures, not RGB tints. A live preload
probe still rebuilt and blinked the whole visible Spirit, so it was removed. The
current implementation keeps the neutral-white Spirit as the authoritative
combat actor and places one nameless, untargetable m508 elemental shell directly
over it. Only the shell selects Wind (`2080`), Earth (`2112`), or Water (`1088`).
During its resource rebuild the white core, target, HP bar, and nameplate remain
present, producing color → white → next color instead of actor disappearance.

## Build

From the repository root:

```powershell
python tools/actions/build_beckon_spirit_appearance_overlay.py
```

The package is written to:

```text
.codex-build/beckon-spirit-appearance-overlay
```

The builder verifies the installed WSS8 and `man2g000` hashes, rebuilds the new
PWIB resource tables, and validates every transplanted payload hash and both
presentation schedulers.

## Install

Copy the generated package to the launcher's active additive overlay folder so
the final path remains:

```text
client/chara/mon/m508/act/emp_emp/wss/base/0009
```

Then fully restart the client before manually probing this spawn effect. The
Spirit's combat element, spell list, and absorption do not depend on WSS9.

## Flan note

The m049 `pur_mupt1`, `pur_mupt2`, and `pur_mupt3` resources are explicitly
Magic Power Up levels 1-3. They are not used as Prison Pudding elemental-color
states. The later m049/e001 decomp recovered the actual `init_msn001` through
`init_msn006` material states. Puddings now use those native states, paired with
their spell and absorbed element; see `docs/pudding_elements_2026-09-12.md`.
The older white-body fallback is superseded; these Magic Power Up VFX are still
unrelated to the elemental colour.
