
# Negative results and interpretation boundaries

## Disproved shortcuts

- D6/D7 BODYGEAR does not interpolate. It defers a single requested bank,
  compares one encoded resource selector, invalidates the prior cache, and
  installs the new resource.
- m508 WSS7 is `magic_counter`/Aetherial Barrier. It has no
  `RaptureCharaColorFadeClip` and no m508 appearance VEFF.
- Every installed m508 WSS1..8 and BID scheduler has zero color-fade clips;
  m508 BID also has no `init_msn` model-state family.
- The abandoned `beckon_element_fade` overlay injected a generic color-fade
  clip around WSS7/WSS8, but it was committed as “No Luck” and removed. It
  should remain a recorded negative result, not be restored as retail logic.
- `RaptureCharaColorFadeClip` is globally registered and functional, but no
  recovered m049 or Spirit scheduler instantiates it.
- The m049 `pur_mupt1/2/3` names prove magic-power-up levels, not a
  lightning/wind/fire order. The elemental order comes from the separate
  low-byte `init_msn` material-transform resources.

## Still capture-dependent

- Totorak's exact retail packet/action ordering. The state-to-element mapping
  itself is closed by the installed material bank.
- Spirit's live-combat BODYGEAR publication order. The current server's
  1120/2080/2112/1088 sequence is plausible and asset-backed, but not proven
  as a captured retail packet train.
- The final QIX output-to-specific-render-material setter after
  `ColorRGBABlink self+0x40` / `ColorRGBALeaf self+0x10`. The interpolation
  math and effect binding are proven; this last renderer edge is not named.
- The visible duration of the m508 effect cannot be reduced to one clock:
  SCB start 0.44 s, SCB block 1.95 s, ACB block 2.5 s, repeated VEFF layer
  envelope 300,000 units, and LeafLife's 150,000 interval have distinct
  native roles.
