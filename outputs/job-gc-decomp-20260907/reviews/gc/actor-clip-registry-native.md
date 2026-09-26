# SCB actor and clip class registry: native confirmation

Reviewed 2026-09-07. This closes the incorrect assumption that CACT kind bytes use a fixed Common/Character/Proxy order. The serialized kind indexes a **per-SCB CATT registry**, whose type names are resolved through the String resource. Clip kinds use the parallel CCPT registry.

## Sources

- Native C export: `Client Sourcecode Decomp/ffxivgame.exe.c`
  - Bytes: 9040782
  - SHA-256: `9abfc1eedeb1f64530205704f43964155c4321ce1e779fbf967f7d6d80c77345`
- Installed client: `C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV/ffxivgame.exe`
  - Bytes: 15996808
  - SHA-256: `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9`
- Fresh installed-image disassembly reproduced with `python -B tools/disassemble_pe_window.py <installed-image> --start 0xA271B0 --end 0xA27260`; String lookup additionally at `0xA26E90` and `0xA26F00`.

## Proven loader mechanics

1. `FUN_00a24400` matches `@CATT` at C lines181077–181091 and calls `FUN_00a271b0` with the table count and payload.
2. `FUN_00a271b0`, C lines181600–181620, builds an eight-byte runtime entry for each four-byte serialized entry. At VA `0xA271D4`, it reads an unsigned16 String index from entry+0. At `0xA271D7–0xA271E0`, it resolves `pool_base + (int16)offsets[string_index]`. At `0xA271E2–0xA271E5`, it stores the class-name pointer at `this->actor_registry[ordinal]` (registry pointer `this+0x50`).
3. At `0xA271E8–0xA271EE`, only the low byte at serialized entry+2 is copied into runtime entry+4; the iterator advances four bytes at `0xA271F5`. Preserve both raw bytes and the consumed low byte. Its semantic meaning is not established by this bounded review; it is not another actor-class selector.
4. `FUN_00a27210`, C lines181625–181645, performs the identical operation for CCPT, storing the clip registry at `this+0x58` (`0xA27234–0xA27255`). Hence actor and clip class strings should both come from their exact registry entries, not regex order or a hardcoded class list.
5. The direct String accessor at `0xA26E90–0xA26E9C` and its owner wrapper at `0xA26F00–0xA26F0D` also sign-extend the String offset. The String index itself is unsigned16. Retain that distinction in the parser.
6. Registry reload functions `0xA27000` / `0xA27040` re-resolve these same String pointers into the already allocated actor / clip tables; their raw iterator again advances four bytes.

The native table lookup proves the per-file registry relationship independently of assumptions about actor names such as PC, camera, or stage. `ProxyActor` is the exact serialized class for the 0x3C PC/NPC bindings in the requested scenes. “Character proxy” is a useful role label; `CharacterActor` is a different literal registry name used here by 0x24 stage/resource records.

## Concrete files and offsets

All offsets in this table are relative to the SCB payload unless explicitly marked outer-file.

| Scene | CATT entries `(String index, raw descriptor word)` | Resolved class order | Representative CACT records |
|---|---|---|---|
| `pld0j110` | `[(0,2),(1,0),(2,0)]` at `0x90` | ProxyActor, CommonActor, CharacterActor | PC at `0x130`, kind0, size0x3C; bg at `0x16C`, kind1, size0x20; stage at `0x228`, kind2, size0x24 |
| `com0l510` | `[(0,0),(1,2),(2,0)]` at `0x90` | CommonActor, ProxyActor, CharacterActor | PC at `0x1C0`, kind1, size0x3C; stage at `0x454`, kind2, size0x24 |
| `com0g610` | `[(0,0),(1,2),(2,0),(3,0)]` at `0x90` | CommonActor, ProxyActor, LayoutActor, CharacterActor | PC at `0x170`, kind1, size0x3C; layout at `0xE78`, kind2, size0x20; stage at `0xE98`, kind3, size0x24 |

For `pld0j110`, the String CRES begins at SCB `0x128E0`. Its offsets base is `0x12900` (`CRES+0x20`); first offset `0x68` yields `ProxyActor` at `0x12968`, then `CommonActor` at `0x12973`, then `CharacterActor` at `0x1297F`. SCB begins at outer-file `0x80`.

For `com0g610`, String CRES begins at `0x29A60`, offsets base `0x29A80`; entries0–3 resolve `CommonActor` at `0x29AF8`, `ProxyActor` at `0x29B04`, `LayoutActor` at `0x29B0F`, and `CharacterActor` at `0x29B1B`. SCB begins at outer-file `0xA5CC0`.

## Grand Company count check

Independently reading the exact CATT/String tables and every CACT record of the 23 scenes referenced by the 45 requested GC quests gives **381 complete actor slots**:

| Resolved serialized class | Record size | Slots |
|---|---:|---:|
| ProxyActor | 0x3C | 252 |
| ProxyActor | 0x34 | 2 |
| CommonActor | 0x20 | 93 |
| CharacterActor | 0x24 | 26 |
| LayoutActor | 0x20 | 8 |

The 252 0x3C proxy records carry the established +0x30 class binding field, including player binding0. The two 0x34 proxies are in `com0u105`; do not read the 0x3C layout's +0x30 actor class field from them. The report's prior number252 was the class-bound proxy subset, **not** a count of native `CharacterActor` objects. In `com0g610`, 54 of its60 CACT slots are 0x3C ProxyActor bindings. Positions and typed SetPos counts do not change when correcting class names.

## Bounded C excerpt

The following text is preserved verbatim from the hash-identified local C export; the numeric prefixes identify its source lines. The installed-image disassembly above independently matches the core pointer and byte operations.

```c
181077:     pcVar6 = (char *)FUN_00a272c0();
181078:     iVar8 = 6;
181079:     bVar10 = true;
181080:     pcVar9 = "@CATT";
181081:     do {
181082:       if (iVar8 == 0) break;
181083:       iVar8 = iVar8 + -1;
181084:       bVar10 = *pcVar9 == *pcVar6;
181085:       pcVar9 = pcVar9 + 1;
181086:       pcVar6 = pcVar6 + 1;
181087:     } while (bVar10);
181088:     if (bVar10) {
181089:       uVar7 = FUN_00a272b0(uVar5);
181090:       sVar3 = FUN_00a272f0(uVar7);
181091:       FUN_00a271b0((int)sVar3);
181092:     }

181600: void __thiscall FUN_00a271b0(int param_1,int param_2,ushort *param_3,int param_4)
181601: 
181602: {
181603:   int iVar1;
181604:   
181605:   *(int *)(param_1 + 0x4c) = param_2;
181606:   iVar1 = *(int *)(param_4 + 8);
181607:   *(int *)(param_4 + 8) = iVar1 + param_2 * 8;
181608:   *(int *)(param_1 + 0x50) = iVar1;
181609:   iVar1 = 0;
181610:   if (0 < param_2) {
181611:     do {
181612:       *(int *)(*(int *)(param_1 + 0x50) + iVar1 * 8) =
181613:            (int)*(short *)(**(int **)(param_1 + 0x5c) + (uint)*param_3 * 2) +
181614:            **(int **)(param_1 + 0x5c);
181615:       *(char *)(*(int *)(param_1 + 0x50) + 4 + iVar1 * 8) = (char)param_3[1];
181616:       iVar1 = iVar1 + 1;
181617:       param_3 = param_3 + 2;
181618:     } while (iVar1 < param_2);
181619:   }
181620:   return;
181621: }
181622: 
181623: 
181624: 
181625: void __thiscall FUN_00a27210(int param_1,int param_2,ushort *param_3,int param_4)
181626: 
181627: {
181628:   int iVar1;
181629:   
181630:   *(int *)(param_1 + 0x54) = param_2;
181631:   iVar1 = *(int *)(param_4 + 8);
181632:   *(int *)(param_4 + 8) = iVar1 + param_2 * 8;
181633:   *(int *)(param_1 + 0x58) = iVar1;
181634:   iVar1 = 0;
181635:   if (0 < param_2) {
181636:     do {
181637:       *(int *)(*(int *)(param_1 + 0x58) + iVar1 * 8) =
181638:            (int)*(short *)(**(int **)(param_1 + 0x5c) + (uint)*param_3 * 2) +
181639:            **(int **)(param_1 + 0x5c);
181640:       *(char *)(*(int *)(param_1 + 0x58) + 4 + iVar1 * 8) = (char)param_3[1];
181641:       iVar1 = iVar1 + 1;
181642:       param_3 = param_3 + 2;
181643:     } while (iVar1 < param_2);
181644:   }
181645:   return;
```
