# Goobbue mount variant native decomp (2026-08-12)

## Verdict

The pale/ice Goobbue can be made into a real linked riding mount, but the stock
1.x executable cannot select it by itself. The client accepts and transports a
Goobbue grade of `2` all the way to the native riding-model resolver; that
resolver deliberately ignores the grade for the Goobbue family and always
returns the single retail flowered/saddled entry.

The narrow solution is a client-side resolver hook at RVA `0x0025E040`: call
the retail resolver, then replace only its output graphic with `1024`
(`m048/e001 top 0`) when family is `1` and grade is `2`. Static inspection also
shows that `e001` and the retail mount `e002` use the exact same `m048` skeleton
and 66-bone palette, so there is no evident skeleton or animation incompatibility.
Rider clearance and clipping still require one live test.

No resolver/render hook was implemented during this decomp pass. There is an
existing staged Windower file named `MountAppearanceHook.cs`, created earlier
during the mount work, but it hooks only the Lua riding-grade getter. It does
not alter the linked mount model and its current `0x102` return value conflicts
with the retail Lua Goobbue test; see **Lua getter correction** below.

## End-to-end grade transport

The grade-2 path is now statically closed. A runtime trace is not required to
prove that the value reaches the resolver.

1. The actor packet dispatcher at VA `0x0058CCA0` reads the opcode directly
   from `[packet+2]`.
2. Switch case `416` (`0x01A0`) at VA `0x0058D3BE` reads the payload byte from
   `[packet+0x10]`.
3. It stores family `1` at actor offset `+0x26A` and the unmodified payload
   grade at `+0x26C`:

   ```text
   0058D411  mov byte ptr [edi+26Ah], 1
   0058D418  mov [edi+26Ch], bl
   ```

4. The actor update routine at VA `0x0058DF90` calls VA `0x00588ED0`.
   That routine detects changes to actor/rider mode, family, or grade and emits
   scene-command index `0x2F` with exactly three bytes:

   ```text
   [actor/rider mode, mount family, mount grade]
   ```

5. VA `0x004D7980` adds `0x15` to the scene index, so index `0x2F` becomes
   upstream command `0x44`.
6. Scene dispatcher VA `0x00662D30`, case `47`, consumes the three bytes and
   writes them to the scene actor:

   ```text
   payload[0] -> +0x164
   payload[1] -> +0x2B9C  (family)
   payload[2] -> +0x2BA0  (grade)
   ```

The grade byte is therefore neither dropped nor normalized. For opcode
`0x01A0` with payload `2`, the linked-mount constructor sees family `1`, grade
`2`.

## Lua/control-side state

There is a parallel state path used by Lua:

- `GoobbueReceiver::Receive` at VA `0x008A3100` forwards the one-byte payload
  to VA `0x006DE3C0`.
- VA `0x006DE3C0` clears the Chocobo byte at MyPlayer offset `+0x15D` and stores
  the Goobbue byte at `+0x15F`.
- The stock Lua getter at VA `0x007055E0` returns `0x101` only when
  `+0x15F == 1`; for grade `2` it returns `nil`.

This Lua getter controls UI/judge behavior. It does not select the linked
riding model. The scene-actor fields above are the render path.

## Linked riding-model construction

Mounted main state `15` uses one scene actor for the player and a second linked
scene actor for the mount. It is not the same as transforming or spawning an
ordinary NPC with `!spawnmodel`.

The construction path is:

1. VA `0x007BC44E` calls VA `0x006667F0` when main state `15` materializes.
   The restore/re-entry path also calls it at VA `0x007BE11A`.
2. VA `0x006667F0` removes any old linked child, then reads family from parent
   `+0x2B9C` and grade from parent `+0x2BA0`.
3. It calls the appearance resolver at VA `0x0065E040`
   (RVA `0x0025E040`).
4. It creates a type-`0x11` scene actor, links it to the player, copies the
   resolver's `0x74`-byte appearance result into child `+0x13C8`, and invokes
   the normal appearance rebuild at VA `0x0065D730`.
5. It copies family and grade to the linked child as well.

VA `0x006627E0` performs the link through the generic scene-object constraint
virtual at slot `+0xC0`. Its implementation at VA `0x00A60620` is generic
`SceneObject::Actor` constraint code; it does not hard-code a Goobbue equipment
ID or a special `e002` attachment. Generic model initialization at VA
`0x0065B440` resolves the `n_hara` bone from the loaded skeleton.

## Embedded mount tables and resolver defect

Each resolver record is 20 bytes:

`grade key, model resource ID, component A, component B, component C`

VA `0x00630760` packs the last components into the linked actor's appearance
graphic at resolver output offset `+0x38`:

`graphic = ((component B & 0x3FF) << 10) | (component C & 0x3FF)`

### Chocobo family 0

The table at VA `0x00FC0B90` has 13 grade-keyed records:

`0, 1, 2, 3, 4, 31, 32, 33, 34, 61, 62, 63, 64`

All use model resource `702` (`m702`). VA `0x0065E040` searches this table for
the requested grade.

### Goobbue family 1

The table at VA `0x00FC0CA8` contains only:

| Key | Model | A | B | C | Packed graphic |
| ---: | ---: | ---: | ---: | ---: | ---: |
| `0` | `48` (`m048`) | `0` | `2` | `0` | `2048` |
| sentinel | `0` | `0` | `0` | `0` | n/a |

The decisive branch is at VA `0x0065E068`: the resolver searches records only
when family equals `0`. Any nonzero family skips the grade search and consumes
the first record immediately. Thus family `1`, grade `2` is correctly received
but still resolves to `m048`, graphic `2048`.

There is no hidden second Goobbue riding record in this executable.

## Available `m048` graphics

| Appearance | Model | Graphic | Confirmed visual use |
| --- | ---: | ---: | --- |
| native riding record | `m048` | `2048` | Retail flowered/saddled Goobbue (`e002`) |
| actor `2103301` | `m048` | `1024` | Pale/ice Goobbue (`e001 top 0`) |
| actor `2103306` | `m048` | `1056` | Plain/regular mossy Goobbue (`e001 top 1`) |

The successful `!spawnmodel` previews prove that `1024` and `1056` exist and
identify their materials. `!spawnmodel` itself still creates an ordinary actor
and does not test the linked-rider construction path.

## DAT and skeleton compatibility

The installed `m048` tree contains one shared skeleton:

`client/chara/mon/m048/skl/0001` (`22,736` bytes)

There are no per-equipment skeletons under either `e001` or `e002`. Both model
files explicitly reference the same resource string, `F00\skl_m048t001`, and
both contain the exact same unique set of 66 bone/palette names. The shared set
includes `j_kosi`, the spine/limb chains, and `n_grass_a` through `n_grass_f`.
The skeleton itself also contains `n_hara`.

Structural mesh inspection produced:

| Resource | Model bytes | Meshes | Index/vertex streams |
| --- | ---: | ---: | --- |
| `m048/e001/top_mdl/0001` | `244,868` | `3` | `11412/2452`, `2340/472`, `4224/1578` |
| `m048/e002/top_mdl/0001` | `282,016` | `4` | `11412/2452`, `2340/472`, `4308/1749`, `912/310` |

Their overall bounding boxes are effectively identical. `e001` has material
groups `tc_a` and `tc_b`; `e002` has those plus `tc_c` and the fourth mesh.
That extra group is strong structural evidence for the retail mount decoration
layer, although its exact visible contents are an inference until rendered.

All `m048` equipment variants also use the same family-level action tree under
`m048/act`. Taken together, this rules out the main crash-class risks: missing
skeleton, incompatible bone palette, or missing separate `e001` animation bank.

## Animation behavior

The mounted animation/offset branches around VA `0x00663E5F` and
VA `0x006642AC` test family `+0x2B9C`: family `0` takes the Chocobo lane and a
nonzero family takes the Goobbue lane. They do not branch on grade.

Static references to grade `+0x2BA0` are limited to initialization, the grade
query, scene-command assignment, resolver input, and copying it to the linked
child. Therefore grade `2` remains in the normal Goobbue motion lane. Replacing
only the resolver's graphic does not turn it into Chocobo motion or ordinary
monster behavior.

## Lua getter correction

The current staged Windower `MountAppearanceHook.cs` returns `0x102` when it
sees raw Goobbue grade `2`. That value does not mean "another Goobbue" to the
retail Lua.

Recovered `judge/chocobojudge.lua` uses exact comparisons:

```lua
isRidingGoobbue = mainState == 15 and ridingGrade == 257
isRidingChocobo = mainState == 15 and ridingGrade ~= 257
```

Consequently, returning `258` (`0x102`) makes the Lua judge classify the pale
Goobbue rider as a Chocobo. This explains the earlier failure to dismount by
clicking the horn again.

If the variant is implemented, the getter hook should return retail Goobbue
code `257` (`0x101`) for raw grades `1` **and** `2`. The raw grade remains
available independently in the resolver's third argument, so UI classification
and render selection do not need to share the same value.

## Zoning and multiplayer lifecycle

- The constructor is used by both initial mounted-state materialization and the
  restore/re-entry path, so a resolver hook covers normal summon and zoning
  reconstruction.
- The hook should be installed before a mount is constructed. Installing it
  while already mounted will not mutate the existing linked child; dismount and
  remount (or another rebuild) is required.
- Server `SendMountAppearance()` broadcasts opcode `0x01A0` to the rider and
  every instanced player. `CreatePlayerRelatedPackets()` also includes the
  current grade when a player becomes visible to a new requester.
- The `0x01A0` handler at VA `0x0058CCA0` is on the actor packet/update path and
  produces the same family/grade scene command for the actor receiving the
  packet. It is not limited to selecting only the local rider's render model.
- Every viewing client must have the resolver hook. A hooked viewer renders
  grade `2` as the pale Goobbue; an unmodified retail viewer receives the same
  grade but falls back to graphic `2048`, because its resolver ignores it.

The server already sends the custom Goobbue grade before the Lua flow enters
mounted state, allowing the linked constructor to consume it. Zoning, remote
visibility, dismount/remount, and late actor creation still belong in the live
validation matrix.

## Recommended hook boundary

The stable narrow target is VA `0x0065E040`, RVA `0x0025E040` in this x86
client build. Both callers load the owning scene actor into `ECX` immediately
before the call; the routine then consumes three explicit stack arguments and
returns with `retn 0x0C`. The detour must therefore preserve the x86
`ThisCall` contract even though this build's resolver body does not read the
implicit actor argument:

```text
bool ResolveMountAppearance(void* sceneActor, void* output, int family, int grade)
```

Safe behavior:

1. Validate the client-build signature at the resolver RVA.
2. Call the original resolver first.
3. If it succeeded and `family == 1 && grade == 2`, write `1024` to
   `output + 0x38`.
4. Leave the model resource, all other appearance fields, grade `1`, and every
   Chocobo grade unchanged.

This keeps the retail linked actor, Goobbue family state, attachment,
animations, music, damage rules, and dismount path. It is substantially smaller
than relocating the embedded Goobbue table and rewriting the family-specific
search branch.

The server comment in `SetCurrentMountGoobbuePacket.cs` that associates the
ice variant with `e001 top 1` is stale. The confirmed pale/ice target is graphic
`1024` (`e001 top 0`); `e001 top 1` is graphic `1056`, the plain/regular model.

## Remaining live validation

Static decomp supports the implementation with high confidence, but one live
resolver experiment should verify:

- grade `2` renders graphic `1024` on summon;
- rider height, seat position, and body clipping;
- idle, walk/run, turn, jump/fall if applicable, damage, and transition clips;
- second-click dismount after correcting the Lua getter classification;
- zone transfer and seamless-area reconstruction;
- local and remote visibility with two hooked clients;
- graceful retail fallback on an unhooked viewer.

A DAT overlay alone is not required for the model: `e001` is already present
and loadable. The missing piece is resolver selection, not asset availability.
