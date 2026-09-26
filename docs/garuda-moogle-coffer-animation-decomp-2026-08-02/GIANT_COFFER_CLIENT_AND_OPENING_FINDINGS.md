# Giant non-guildleve coffer client assets and opening findings

Date: 2026-08-02  
Mode: strictly read-only inspection of installed client assets and existing repository material  
Requested output: Markdown findings only

## Executive result

The installed client contains four large treasure-container background-object families in the requested scope: `b919`, `b920`, `b923`, and `b927`. Each family has three appearance variants (`e001`, `e002`, `e003`), one skeleton, and three compiled action banks (`0001`, `0101`, `0201`). All 52 installed files in that scope are inventoried and hashed below.

The opening mechanism is now directly decoded:

- `b919`, `b923`, and `b927` are single-lid rigs: `n_root -> n_hara -> n_lid`.
- `b920` is one articulated lid/handle mechanism: `n_root -> n_hara -> n_joint -> n_handle`.
- No scoped skeleton contains `n_door_l`, `n_door_r`, or any other left/right door pair.
- Every family has an `act1` motion that moves from its rest pose to a displaced/open-like pose and an `act2` motion that begins at the exact `act1` endpoint and returns to rest.
- Bank `0201` embeds the two motions as sequential phases. **This is not two doors.** It is `act1` plus `act2` on one lid mechanism (or, for `b920`, its joint plus attached handle).
- `b923 act1` is semantically proven to be the opening motion by the explicitly excluded Guildleve control actor `1200161`, which uses `b923/e003` and was previously observed visibly opening under bank `0001`. That actor is used here only as a motion-semantics control, never as the requested coffer identity.
- For `b919`, `b920`, and `b927`, the byte-level direction is proven (rest to displaced, then displaced to rest). Calling those phases “open” and “close” is a high-confidence rig interpretation, but no recovered live target actor binding independently proves their runtime semantics.
- Every action bank embeds a family-specific VFX bundle and exactly one `RaptureSoundClip`. No semantic sound-event name was recoverable from printable data, so none is invented here.
- The scheduler's compiled active window is **not the raw motion duration**. Both values are reported separately. For example, `b923 act1` is a raw 4.0-second track while bank `0001` has a 2.0-second compiled scheduler active window.
- `RaidDungeonTreasureBox` calls scheduler ID `67932160` (`0x040C9000`, bank `0201`) after its reward/drop processing. The call identifies a bank, not a `b919`/`b920`/`b923`/`b927` family or an `e001`/`e002`/`e003` appearance. The receiving actor still supplies that resource identity.
- `InstanceRaidTreasureBox` contains only class inheritance from `TreasureBoxBaseClass`; it adds no opening method, scheduler ID, appearance ID, or family binding in the recovered script.
- The local archived wiki proves that a reward chest appears after Moogle victory and that Garuda rewards are found in a chest after her defeat. Those statements prove **chest existence only**. They do not prove any actor ID, background-object family, appearance variant, scheduler, VFX, placement, or opening sequence.

No evidence found here safely maps any of the four model families to Garuda, Moogle, Ifrit, Titan, or another primal. The internal `tbx` family numbers are therefore retained as neutral asset identifiers.

## Evidence vocabulary and boundaries

- **Proven:** directly present in installed bytes, decoded structures, SQL/source rows, or exact source text.
- **Observed control:** a prior live observation used only to establish motion semantics; explicitly not a target-identity claim.
- **High-confidence interpretation:** follows from the rest/end poses and single-lid rig architecture, but lacks a recovered target receiver binding.
- **Unresolved:** the inspected material does not establish the join.

Excluded target: actor `1200161`, class `/Chara/Npc/Object/GuildleveBonusTreasureBox`, is not a giant non-guildleve coffer candidate. It appears only in a separately labeled negative/control section. Guildleve chest implementations, Guildleve reward logic, and Guildleve placement are otherwise out of scope.

No game asset, binary, SQL file, Lua file, configuration file, or source file was changed. No model/motion viewer was launched, specifically avoiding viewers known to write `viewer.ini` or `spu_dump.bin`. The only authored artifact is this Markdown file.

## Family and model inventory

| Family | Base graphic | Variant | Internal model-token stem | Model references |
|---|---:|---|---|---|
| `b919` | 20919 | `e001` | `v11_tbx31_*` | `b919e001`, `b919e001_top`, `skl_b919t001` |
| `b919` | 20919 | `e002` | `v11_tbx32_*` | `b919e002`, `b919e002_top`, `skl_b919t001` |
| `b919` | 20919 | `e003` | `v11_tbx33_*` | `b919e003`, `b919e003_top`, `skl_b919t001` |
| `b920` | 20920 | `e001` | `v11_tbx11_*` | `b920e001`, `b920e001_top`, `skl_b920t001` |
| `b920` | 20920 | `e002` | `v11_tbx12_*` | `b920e002`, `b920e002_top`, `skl_b920t001` |
| `b920` | 20920 | `e003` | `v11_tbx13_*` | `b920e003`, `b920e003_top`, `skl_b920t001` |
| `b923` | 20923 | `e001` | `v11_tbx01_*` | `b923e001`, `b923e001_top`, `skl_b923t001` |
| `b923` | 20923 | `e002` | `v11_tbx02_*` | `b923e002`, `b923e002_top`, `skl_b923t001` |
| `b923` | 20923 | `e003` | `v11_tbx03_*` | `b923e003`, `b923e003_top`, `skl_b923t001`; additionally `v11_tbx03_fz`, `v11_tbx03_fz_0` |
| `b927` | 20927 | `e001` | `v11_tbx21_*` | `b927e001`, `b927e001_top`, `skl_b927t001` |
| `b927` | 20927 | `e002` | `v11_tbx22_*` | `b927e002`, `b927e002_top`, `skl_b927t001` |
| `b927` | 20927 | `e003` | `v11_tbx23_*` | `b927e003`, `b927e003_top`, `skl_b927t001` |

Every variant also exposes the suffix set `_1h`, `_1h_000`, `_1h_001`, `_ch`, `_ch_0`, `_nh`, `_nh_0`, `_sh`, and `_sh_0`. These are model-internal names, not primal or encounter labels.

## Complete installed-file manifest (52 files)

Paths are relative to `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV\`.

| Family | Resource | Relative path | Bytes | SHA-256 |
|---|---|---|---:|---|
| b919 | action bank | `client/chara/bgobj/b919/act/cmn/lib/base/0001` | 92,656 | `7a9adc6c21c1d35d992264cbae7238c66a637b64c7e16bb3f81c7b9732426f82` |
| b919 | action bank | `client/chara/bgobj/b919/act/cmn/lib/base/0101` | 92,528 | `3fd90ef9cdf9c544a85350d114613b90dfdf1def93c9b2e879883967d20135f0` |
| b919 | action bank | `client/chara/bgobj/b919/act/cmn/lib/base/0201` | 94,256 | `389a9778bdc5c90f2f30f11d0dc3fff53d0e0d65e9ce831576c87b940ac00946` |
| b919 | e001 model | `client/chara/bgobj/b919/equ/e001/top_mdl/0001` | 124,240 | `3a50358856ef3469aff96c1dc3047d48ab783c2cdb1a849d3e486851e4599f23` |
| b919 | e001 texture 1 | `client/chara/bgobj/b919/equ/e001/top_tex1/0000` | 131,960 | `213f6a58ca89aa5796cd38bd9bc0809bcd4815dba7cd6cebd30921cc320eb7f9` |
| b919 | e001 texture 2 | `client/chara/bgobj/b919/equ/e001/top_tex2/0000` | 525,272 | `357c034f8dd9abaa2c2f0d485f9ef6e52e10019c1f5385cd944890cc1ac65e66` |
| b919 | e002 model | `client/chara/bgobj/b919/equ/e002/top_mdl/0001` | 131,120 | `83a0b98484963f2ed4602310d1ab3b0cd0c9710a327c3e5c8e361903b6586f13` |
| b919 | e002 texture 1 | `client/chara/bgobj/b919/equ/e002/top_tex1/0000` | 131,960 | `492d381571fbc2ffdf840f9d4bee1560690cf4a2c90046d7aa84cf7b5c27ac7f` |
| b919 | e002 texture 2 | `client/chara/bgobj/b919/equ/e002/top_tex2/0000` | 525,272 | `2935bf1938104cb90c31b57337053154546da2fa06793f487fa717d917f068c0` |
| b919 | e003 model | `client/chara/bgobj/b919/equ/e003/top_mdl/0001` | 137,984 | `d8a7e5ebbe6ab53ca663a2fd70c274fbe8b459c472d32c59140c4a15d942daf9` |
| b919 | e003 texture 1 | `client/chara/bgobj/b919/equ/e003/top_tex1/0000` | 131,960 | `777c3aaad5e67e23473efec98aca6eba709ce3c2abe5a355268e886af9a2cd6a` |
| b919 | e003 texture 2 | `client/chara/bgobj/b919/equ/e003/top_tex2/0000` | 525,272 | `cebc860ca1682d0355ecf0682c6e66ba7603b6e1aff75a84ebd4408f9f59ae8d` |
| b919 | skeleton | `client/chara/bgobj/b919/skl/0001` | 6,176 | `5e187ebb0c878ca2b9d28266f152ddce8101be5ef198550daf54e854a9ae63bc` |
| b920 | action bank | `client/chara/bgobj/b920/act/cmn/lib/base/0001` | 90,240 | `5b91fb05018a64116ea586e140aa5157eed835e6d6bd65a86003f1d6275acc43` |
| b920 | action bank | `client/chara/bgobj/b920/act/cmn/lib/base/0101` | 84,848 | `10b1ee68cc57da7408e1f796dad7abccedc499d8a72618ee6e21e70c078eadab` |
| b920 | action bank | `client/chara/bgobj/b920/act/cmn/lib/base/0201` | 91,632 | `8cc5b7b1500d8e8fbed8d909e15bbb02000e685d540ff5548a3b6e5b14ced524` |
| b920 | e001 model | `client/chara/bgobj/b920/equ/e001/top_mdl/0001` | 100,160 | `d5a7c0bf3a5db124fa11c00bb2615007d6e66d61a0964333577fbe1f03dcf741` |
| b920 | e001 texture 1 | `client/chara/bgobj/b920/equ/e001/top_tex1/0000` | 33,704 | `aab50d9e716ce6bb4bdbdc4df2ece2eda7fdc9270a012c2c0a1be94a4f13a680` |
| b920 | e001 texture 2 | `client/chara/bgobj/b920/equ/e001/top_tex2/0000` | 350,360 | `24bad2bf07ec8932b93caf5222d472708ea14b8440c735797304f1dbc3702d95` |
| b920 | e002 model | `client/chara/bgobj/b920/equ/e002/top_mdl/0001` | 99,040 | `5281a7587d79060ba633cfdf2ea6eddce6ec6260a39872e5e2ca59c4ad2ba79e` |
| b920 | e002 texture 1 | `client/chara/bgobj/b920/equ/e002/top_tex1/0000` | 33,704 | `3fa5209c311746ecb6960a5fb19a3e3af3d47b366b42b43309bdbb37af36e514` |
| b920 | e002 texture 2 | `client/chara/bgobj/b920/equ/e002/top_tex2/0000` | 132,008 | `5b4ceffb98f317a20a1434d1af91cc05290697fe498cc21946729a03cbacd0f1` |
| b920 | e003 model | `client/chara/bgobj/b920/equ/e003/top_mdl/0001` | 113,824 | `5a5521b9e5f9282688f71a1bd3b47614f0881c2508da244d6b18a7495e1084fe` |
| b920 | e003 texture 1 | `client/chara/bgobj/b920/equ/e003/top_tex1/0000` | 33,704 | `137d3ec820a86f2a96d7899a0e12bfc955e94f9020d5c52c6d526fb3a07f3cd9` |
| b920 | e003 texture 2 | `client/chara/bgobj/b920/equ/e003/top_tex2/0000` | 350,360 | `acc2518008eaf2e4ae895b020ade8eaf5dd482853483c4c57cbd40d0de614e68` |
| b920 | skeleton | `client/chara/bgobj/b920/skl/0001` | 6,512 | `dece3dd8440abb2627fad6ba964f88813da3335a3f8af1416b8bafa2852a7196` |
| b923 | action bank | `client/chara/bgobj/b923/act/cmn/lib/base/0001` | 97,232 | `f0beafb8b4585baec3267fd93c7f9c740dea394ccd7cff6246953519fee09e05` |
| b923 | action bank | `client/chara/bgobj/b923/act/cmn/lib/base/0101` | 96,992 | `244f0e6a1ed31f3c94f84f21aaae461487b1e9feaeec5bfcc156b21d99cf006f` |
| b923 | action bank | `client/chara/bgobj/b923/act/cmn/lib/base/0201` | 98,560 | `717a21c682c7880c1f0af59f0b6f6336edb119e83db375c6a9e7b651265c4c95` |
| b923 | e001 model | `client/chara/bgobj/b923/equ/e001/top_mdl/0001` | 137,744 | `a3231db60f72af525aa716b9b400cda70ae0d58053761cdedf0b33a4426eef99` |
| b923 | e001 texture 1 | `client/chara/bgobj/b923/equ/e001/top_tex1/0000` | 131,960 | `00c2feeb6d916eb1d8d6ab0f970c1eeea4a62943f640ef52474e50cb205f462c` |
| b923 | e001 texture 2 | `client/chara/bgobj/b923/equ/e001/top_tex2/0000` | 525,128 | `e50381c3ddaed05970fdc923e3aa165b8f19d5b25fd4c8553edf9ae574a41b3f` |
| b923 | e002 model | `client/chara/bgobj/b923/equ/e002/top_mdl/0001` | 140,048 | `6609521ade303343ec6c8cb831f93cf9aa9896a04cbd8cddd20675d15928d707` |
| b923 | e002 texture 1 | `client/chara/bgobj/b923/equ/e002/top_tex1/0000` | 131,960 | `2b088b262a522769cdaf4483324280e338c4fa971d99662f0f7dd8bacfd88013` |
| b923 | e002 texture 2 | `client/chara/bgobj/b923/equ/e002/top_tex2/0000` | 525,128 | `d0f4ba84260282d20391a161b12ad9982734b99343233260e8376d88c00946ca` |
| b923 | e003 model | `client/chara/bgobj/b923/equ/e003/top_mdl/0001` | 170,304 | `5f54881a89ca25a440ed90bac2a582807a1ee392953d85adbd57b889b2d7fdd2` |
| b923 | e003 texture 1 | `client/chara/bgobj/b923/equ/e003/top_tex1/0000` | 143,128 | `076a216bda2ec2dafecf390087ab0a4b5ac1f9d3379e420242a62e707e3e5073` |
| b923 | e003 texture 2 | `client/chara/bgobj/b923/equ/e003/top_tex2/0000` | 536,296 | `bdeb32d62c9e7cdb05c6c3ba1b9afeafd239664152c2633112479225c28a8ee1` |
| b923 | skeleton | `client/chara/bgobj/b923/skl/0001` | 6,192 | `64d02724ff9809d53f19140632fb01803c1a26c25497f199305ec900d3a19e90` |
| b927 | action bank | `client/chara/bgobj/b927/act/cmn/lib/base/0001` | 89,952 | `0f224f70b56c6b7c8f1ddd95193821f48ed3481c3342ca0343be53402e0b67c9` |
| b927 | action bank | `client/chara/bgobj/b927/act/cmn/lib/base/0101` | 89,856 | `97737fade330c58c216d53703587aec5e463916c19efbbaa364b9f174f695194` |
| b927 | action bank | `client/chara/bgobj/b927/act/cmn/lib/base/0201` | 91,728 | `87c3f347bab070728478bbfa8a63f3c1970f24b611ba18a8fa01018ac429bc63` |
| b927 | e001 model | `client/chara/bgobj/b927/equ/e001/top_mdl/0001` | 155,920 | `19b77ecb731667a10fa05baaae8ba6b3c66b0ff3a60ed16229138d54444e64ff` |
| b927 | e001 texture 1 | `client/chara/bgobj/b927/equ/e001/top_tex1/0000` | 131,960 | `bdfc8effb6b8c8b4489b0d978b747856a9291eae30db4b695148d9ec5b0728d0` |
| b927 | e001 texture 2 | `client/chara/bgobj/b927/equ/e001/top_tex2/0000` | 525,128 | `cc64242dbd1375e341775f15d0c901a3d4a08f1bdcc992f1f971096821a931ba` |
| b927 | e002 model | `client/chara/bgobj/b927/equ/e002/top_mdl/0001` | 155,920 | `9e78dd19807dec353471aad36e653d2f52a6e4d0818b1f33e547cbc26fa3a022` |
| b927 | e002 texture 1 | `client/chara/bgobj/b927/equ/e002/top_tex1/0000` | 131,960 | `267efad0e9a3400961a2e629831b20224eea9c6ef0092f658478268e994666e0` |
| b927 | e002 texture 2 | `client/chara/bgobj/b927/equ/e002/top_tex2/0000` | 525,128 | `913e2b8bbaf9ea543e199fcd16e765f7e9af3b54d44e5466b85d258cf4013f54` |
| b927 | e003 model | `client/chara/bgobj/b927/equ/e003/top_mdl/0001` | 155,920 | `15f4f1368fe295ea9ffac41939e83060c4d3eccf425ba807e46bcd6ee20fd5eb` |
| b927 | e003 texture 1 | `client/chara/bgobj/b927/equ/e003/top_tex1/0000` | 131,960 | `9d6e34e585124bea76bd300c29c20b6cbf959e41da9a5c5832255f06785c76c9` |
| b927 | e003 texture 2 | `client/chara/bgobj/b927/equ/e003/top_tex2/0000` | 525,128 | `defa1c0cc7d6af3457f2f9a723cf75630355891cb0174100f41c7d0ed5c7e3ef` |
| b927 | skeleton | `client/chara/bgobj/b927/skl/0001` | 6,176 | `a5c0f5fdef9dbf450d7695d15446ba94baf86aa20c8f2fa4fc0252ee2fb70d66` |

## Skeleton and moving-part decompilation

The outer skeleton containers hold nested `SEDBSKL` payloads. All rest rotations are identity and all rest scales are `(1,1,1)`.

| Family | Nested payload bytes | Nested SHA-256 | Bone chain and local rest translation |
|---|---:|---|---|
| b919 | 652 | `512b49d926cf480ce380cf3b37560c92cbfa7f2f04af5fb187d17b7b3b75778b` | `n_root` (parent -1) -> `n_hara` (parent 0) -> `n_lid` (parent 1), lid `(0, 1.584549903869629, 0)` |
| b920 | 840 | `f5183e2d76890f20f4fbed62de810fc0ac8dfffb7a110a93399c6537f6f97348` | `n_root` -> `n_hara` -> `n_joint` `(0, 0.49853697419166565, -0.3077499568462372)` -> `n_handle` `(0.0013039398472756147, 0.20677295327186584, 0.3077489733695984)` |
| b923 | 652 | `494ef722f05d8dea6ce11b406589f882e895049da911ee1b0e0c2ade6afe4c4f` | `n_root` -> `n_hara` -> `n_lid` `(0, 0.37135496735572815, -0.28405997157096863)` |
| b927 | 652 | `cb99360b6d35e0a5feb5b8aa6e48455b3497874f32fc5c5062ee1ee3e47720ac` | `n_root` -> `n_hara` -> `n_lid` `(0, 0.5299999117851257, 0)` |

The skeleton evidence is decisive about the requested “doors”: three assets have one bone literally named `n_lid`; the fourth has one `n_joint` with one child `n_handle`. Nothing in these rigs supports a two-door interpretation.

## Raw motion resources

The raw `act1` motion-controller, track, and actor-controller resources are byte-identical across `0001`, `0101`, and `0201` within each family. Bank `0201` additionally contains `act2` controller and track resources.

| Family | Phase | MTB bytes | MTB SHA-256 | FPS | Frames | Raw duration |
|---|---|---:|---|---:|---:|---:|
| b919 | act1 | 1,185 | `ed55cdfdb2cbf5e1c2d72e98a40d0e0a87e71d10bc6413c1a2903da47b7b91bf` | 30 | 60 | 2.000000 s |
| b919 | act2 | 865 | `8d88a785e2192ad59094f16e392ec5e821a3025d76f51834f10f1bb6843315c3` | 30 | 30 | 1.000000 s |
| b920 | act1 | 1,377 | `4478b312c539c04c6b366d2a395003897dce5723ef2daad804098d087bca9f8e` | 30 | 100 | 3.333333 s |
| b920 | act2 | 705 | `adb416b065fc971f598eac515ee13a560e4da70d587a66eff246ef240573b1b1` | 30 | 45 | 1.500000 s |
| b923 | act1 | 977 | `d13858ef878656103fcdae9bcb90a9240343c22b2caf3a928349f6306397ac0c` | 30 | 120 | 4.000000 s |
| b923 | act2 | 577 | `6c3ea34ae68fb75804d0852a3f177fd8bb93b750df5b78400013273652f4d3ea` | 30 | 30 | 1.000000 s |
| b927 | act1 | 1,617 | `09fe40d1047ed1b4aee61577cda198255a6269eee3679e895cb6f3b6673d842c` | 30 | 100 | 3.333333 s |
| b927 | act2 | 1,025 | `39845f1cd2d92f765a8515cdbe0d09e081670c532d18551c690f06c79fe42b11` | 30 | 50 | 1.666667 s |

Controller hashes:

| Family | act1 BCM SHA-256 | act2 BCM SHA-256 | BCA bytes | Family BCA SHA-256 |
|---|---|---|---:|---|
| b919 | `734243e21a13a342e15652ca612b7320633b994fc957a49ad6d11397653772d4` | `0bde6ef5bada84afd88fa2bbe9a2ca333484a1a386425ea2c65f777a1227e4e7` | 1,016 | `b4d31cac8967440053ea30b8e6ef5ffb0faac6e0bded9b3ee268a8c6c9c16a70` |
| b920 | `07cad1b1651357684bb46434c0ae8620dbb208145c73b93696aa892289c0020d` | `66c6579c14bb2f7c5a86b6c003fbe3930f062349f346cd5985aa25fe5b922f3c` | 1,016 | `75ac022a62d0958f903172b5e51dda8fa65cddfb2649d3ac4691e8b535d18b3a` |
| b923 | `5cf614fb7456811f83833921bed16aa31050f6f68fae4f5f238b25d3985d72ec` | `0bde6ef5bada84afd88fa2bbe9a2ca333484a1a386425ea2c65f777a1227e4e7` | 1,016 | `172aba37eea15607d7c29194c0ddfd0fd9d111e66afedf7858da4b300aaeacc9` |
| b927 | `07cad1b1651357684bb46434c0ae8620dbb208145c73b93696aa892289c0020d` | `d4b5905379cfd653cbe869c2266c2ed52749ce83dedd2a205a7460d0bce50647` | 1,016 | `08356310b360aa22de83efcd454ae571ec284f04841ceb348f7256a507440103` |

### Decoded motion curves and direction

Compressed identity rotations decode as a tiny positive-X value of about `0.055638°`; that is treated as the format's rest-pose artifact, not intentional visible movement. Rotations below are local-space endpoint angles after normalizing that artifact.

**b919, `n_lid`:**

- `act1` moves from rest to a local X rotation of approximately `-164.156226°`.
- X translation ranges from `-0.00346016` to `0.00433478` and ends near zero.
- Y moves `1.584550623 -> 1.108973502`, with an overshoot/range of `1.108973502 .. 1.808091820`.
- Z moves `-0.000000884 -> -0.866595368`, minimum `-0.870575964`.
- `act2` begins at the same displaced endpoint and returns to rest: Y `1.108962953 -> 1.584548525`, Z `-0.866603134 -> 0`, and rotation `-164.156226° -> rest`. Its small X movement ranges `-0.0203507 .. 0.02153195`.

**b920, `n_joint` plus child `n_handle`:**

- `act1`: `n_joint` rotates local X from rest to approximately `-149.620802°`.
- `act1`: `n_handle` rotates local Y from rest to approximately `-114.709271°`.
- Animated translations remain constant (`n_joint` X = 0; `n_handle` X = `0.001303942`); axes without tracks use the base pose.
- `act2` starts at those exact rotation endpoints and returns both bones to rest over 45 frames.
- This is one joint/handle assembly, not two independently opening doors.

**b923, `n_lid`:**

- `act1` rotates local X from rest to approximately `-133.292943°`; translations remain at the base pose.
- `act2` starts at that exact endpoint and returns to rest over 30 frames.
- The excluded `1200161` control visibly opening under bank `0001` proves that this family's `act1` is the open direction. Therefore its reverse-direction `act2` is a high-confidence close/return phase.

**b927, `n_lid`:**

- `act1` rotates local X from rest to approximately `-39.998945°`.
- Y moves `0.529999144 -> 0.451105699`, range `0.451105699 .. 0.554085963`.
- Z moves `0 -> -0.794011445`, minimum `-0.834840059`.
- `act2` starts at the same endpoint and returns to rest: Y `0.451107323 -> 0.529999548`, Z `-0.794019988 -> 0`, and rotation `-39.998945° -> rest`.

## Action schedulers: active windows versus raw tracks

All 12 compiled schedulers have an outer envelope value of `9,000,000` units. Treating scheduler units as microseconds is an inference supported by the magnitudes, so approximate seconds are shown with `~`. The active values below are parsed compiled scheduler windows; they are not derived from, and must not be substituted for, the raw MTB durations above.

| Family | Bank | Embedded raw motion(s) | Scheduler active units | Approx. active seconds | Parsed entries | `SEDBSCB` offset:size |
|---|---|---|---:|---:|---:|---|
| b919 | 0001 | act1 (raw 2.000 s) | 2,000,000 | ~2.00 | 8 | `0xE36C:0x5D0` |
| b919 | 0101 | act1 (raw 2.000 s) | 3,140,000 | ~3.14 | 6 | `0xE36C:0x550` |
| b919 | 0201 | act1 + act2 (raw 2.000 + 1.000 s) | 1,500,000 | ~1.50 | 8 | `0xE9A0:0x5D0` |
| b920 | 0001 | act1 (raw 3.333 s) | 2,000,000 | ~2.00 | 8 | `0xD9CC:0x600` |
| b920 | 0101 | act1 (raw 3.333 s) | 1,000,000 | ~1.00 | 5 | `0xD594:0x520` |
| b920 | 0201 | act1 + act2 (raw 3.333 + 1.500 s) | 2,050,000 | ~2.05 | 8 | `0xDF60:0x5D0` |
| b923 | 0001 | act1 (raw 4.000 s) | 2,000,000 | ~2.00 | 7 | `0xE560:0x5B0` |
| b923 | 0101 | act1 (raw 4.000 s) | 1,200,000 | ~1.20 | 5 | `0xE500:0x520` |
| b923 | 0201 | act1 + act2 (raw 4.000 + 1.000 s) | 2,100,000 | ~2.10 | 8 | `0xEA74:0x5D0` |
| b927 | 0001 | act1 (raw 3.333 s) | 2,000,000 | ~2.00 | 7 | `0xE8F4:0x5B0` |
| b927 | 0101 | act1 (raw 3.333 s) | 3,910,000 | ~3.91 | 6 | `0xE8F4:0x550` |
| b927 | 0201 | act1 + act2 (raw 3.333 + 1.667 s) | 2,100,000 | ~2.10 | 8 | `0xEFC8:0x5D0` |

Again, `0201` having `act1` and `act2` means **two sequential motion resources for the same rig**, not two doors. The scheduler can clip, overlap, command, or otherwise time those resources independently of each MTB's full raw length.

### Aligned candidate timing words

These are aligned integer words recovered in the compiled scheduling region. They are useful reconstruction candidates, but individual words are not labeled as proven event boundaries without a full SCB opcode specification.

| Family/bank | Candidate timing words (units) |
|---|---|
| b919/0001 | `480000; 600000; 600000; 1800000; 1800000; 1800000` |
| b919/0101 | `480000; 600000; 600000; 10000; 20000` |
| b919/0201 | `480000; 600000; 600000; 10000; 970000; 1200000; 1500000; 300000; 1250000; 1300000` |
| b920/0001 | `1000000; 1000000; 350000; 470000; 1800000; 1800000; 1800000` |
| b920/0101 | `1000000; 1000000; 350000; 820000; 470000; 820000` |
| b920/0201 | `1000000; 1000000; 350000; 820000; 470000; 1600000; 1600000; 2050000; 450000; 1800000; 1900000` |
| b923/0001 | `1200000; 1200000; 650000; 1800000; 1800000; 1800000` |
| b923/0101 | `1200000; 1200000; 300000; 770000; 650000; 770000` |
| b923/0201 | `1200000; 1200000; 650000; 1700000; 1800000; 2100000; 300000; 1850000; 1900000` |
| b927/0001 | `1000000; 1000000; 50000; 50000; 1200000; 1800000; 1800000; 1800000` |
| b927/0101 | `1000000; 1000000; 50000; 50000; 1200000; 60000; 70000` |
| b927/0201 | `1000000; 1000000; 50000; 50000; 1200000; 1500000; 1600000; 2100000; 500000; 1700000; 1750000` |

## Clip classes, VFX, sound, and container structure

Every bank contains one each of `ActionClip`, `BindActorClip`, `EffectClip`, `MotionClip`, and `RaptureSoundClip`.

- Every `0001` has one `MotionCommandClip`, one `RaptureCharaColorFadeClip`, and normally one `RaptureEffectEndClip`; `b919/0001` additionally has one `ClipSyncClip`.
- Every `0101` has one `MotionCommandClip` and one `RaptureChantSyncClip`. `RaptureEffectEndClip` is present for `b919/0101` and `b927/0101`, and absent for `b920/0101` and `b923/0101`.
- Every `0201` has two `MotionCommandClip` entries and one `RaptureEffectEndClip`, with no `RaptureCharaColorFadeClip` and no `RaptureChantSyncClip`.
- The presence of one `RaptureSoundClip` in all 12 banks proves that sound is scheduled. No stable printable sound-event name is embedded, so the exact sound cue remains unresolved.

Container tag counts:

- `0001` and `0101`: `SEDBRES` 3, `SEDBMCB` 1, `SEDBmtb` 2, `SEDBACB` 1, `SEDBSCB` 1, `SEDBveff` 1, `SEDBleaf` 1, `SEDBvins` 1.
- `0201`: `SEDBRES` 3, `SEDBMCB` 2, `SEDBmtb` 3, `SEDBACB` 1, `SEDBSCB` 1, `SEDBveff` 1, `SEDBleaf` 1, `SEDBvins` 1.
- The raw caster payload resolves to one act1 MTB in `0001`/`0101` and act1 plus act2 in `0201`; the broader `SEDBmtb` tag count also includes container/infrastructure material and should not be mistaken for extra lid motions.

Embedded source paths:

| Family | Embedded VFX source path |
|---|---|
| b919 | `D:/gra_rapture/vfx/chara/bgobj/b919_01v/veff/b919_01vfx.veff` |
| b920 | `D:/gra_rapture/vfx/chara/bgobj/b920_01v/veff/b920_01vfx.veff` |
| b923 | `D:/gra_rapture/vfx/chara/bgobj/b923_01v/veff/b923_01vfx.veff` |
| b927 | `D:/gra_rapture/vfx/chara/bgobj/b927_01v/veff/b927_01vfx.veff` |

Both upper- and lower-case drive-letter spellings occur in embedded strings; they refer to the same original authoring path.

## Embedded VFX resource inventory

Hashes here are for the exact nested resource byte slices inside the action bank, not separate installed files. Unless noted, the resource bytes are identical in `0001`, `0101`, and `0201`.

| Family/bank applicability | Type | Resource ID | Bytes | SHA-256 |
|---|---|---|---:|---|
| b919/all | vtex | `0XWWecgl` | 180 | `65c2ee213b5e50752b7310bb16c445f298b0662ae4fad6d931160c243fddd6fe` |
| b919/all | vtex | `2fZNAtpk00` | 180 | `0597f5ec60862177e61492b4bc5e0b328b4c994d6dde2b54e118d6c41c2c0e33` |
| b919/all | vtex | `1qISHBcyl00` | 180 | `b8b16cc8bb55a5d23d99e9f720ffc7a1634d50417231bdad297f041a9a09ab02` |
| b919/all | vtex | `45wyEgbl_b` | 180 | `0c200a277390bf2e7707042c9cdfca971e3075664f121ef5195f805f402be730` |
| b919/all | vmdl | `2u4JZLgl00` | 6,012 | `b46efba6e3876231817e4ac4cd6f2a5ed987db285843b3e1b1c976e3808425de` |
| b919/all | vmdl | `38G3z6pk00` | 5,396 | `6dfc01e5fb4a14d0fa41a080fa9e3e327d262621a4300983b93720e3154d35b1` |
| b919/all | vmdl | `38wYX2pk01` | 5,396 | `d66f6533a57e9aab374185612ef8784aca6f99a8aabeabb5f5540f16bc8f02e8` |
| b919/all | vmdl | `0H7DnPcyl0` | 9,596 | `b5406dcb9e91398052155a3e72d1bc67ef29be3badf45e43237b4bb42aafc5ee` |
| b919/all | veff | `4oaoL6b919_01vf` | 24,556 | `44dfb40e3408b2f8ecb47bd81f58720d8f91b24fd5239db388b66abba0b9b4f9` |
| b919/all | leaf | `3tM813b919_01l` | 1,156 | `cedab1464fd8cfcc4bbb975ebd30616f6170ed5ebb6866b70d19d87db4fa1d39` |
| b919/all | vins | `1OKlN9vleafinst` | 1,129 | `f8d05f39416af7bab653ea6a9c1f69e4e3dfe4269258533a1a3b438a6fe7dffa` |
| b920/0001+0201 | vtex | `4fa6wMgl` | 180 | `7ef4a65dc1d7426ab3e5b30839c3e6e801c9fe3e28faed0e1590700d7e61888f` |
| b920/0001+0201 | vtex | `33DllXpk00` | 180 | `30711650c509dd4da645c3d94f18eeb9c04cfe842579c3784805dbcb1dc4792c` |
| b920/0001+0201 | vtex | `2JjGIScyl00` | 180 | `f3cf3bba598374916c26ba3fc1f9e1fa822ddfadd06abbfdcfd865b6007e15fa` |
| b920/0001+0201 | vtex | `0nVGysbl_b` | 180 | `57bca3bc8c5fccb9e9f6fee67166dfc6400a5f227fd1a53a7f5a19cdccca35a7` |
| b920/0001+0201 | vmdl | `2xm5PHgl00` | 6,028 | `9832c51d9bfdc80a9a98a887cbb455b4287df6ac3d8058f891cfd39c4dded640` |
| b920/0001+0201 | vmdl | `3wrm0opk00` | 5,396 | `0cff8bc23353ba4e9f4c18d28478d2641e33a12ae503ce748705810db2cd7070` |
| b920/0001+0201 | vmdl | `3wihokpk01` | 5,396 | `87f47ab17497d61d96ddf293dd812609de6fdf38de0bd3dcdd07edc5d966c638` |
| b920/0001+0201 | vmdl | `0AWaQVcyl0` | 9,596 | `871f80045b2d62eae7572775cd9ae22caa02c641695d5f59d49487813e8d2696` |
| b920/0001+0201 | veff | `108Ingb920_01vf` | 22,380 | `93cbb99051c40db046db5c2b334b0140d15d449a3cd9233e4599f0829e5d5d6d` |
| b920/all | leaf | `2ZWrO7b920_01vf` | 910 | `568ad9066ab0c294c06f419c612d0d86ed1476ea530d50aa501fd9d247df3b3a` |
| b920/all | vins | `2piKo6vleafinst` | 878 | `4835ea7695fee83b115cff4a9742491c1e3f6fcb3b47648401052f2f99e6e796` |
| b920/0101 | vtex | `4fa6wMgl` | 180 | `7ef4a65dc1d7426ab3e5b30839c3e6e801c9fe3e28faed0e1590700d7e61888f` |
| b920/0101 | vtex | `33DllXpk00` | 180 | `30711650c509dd4da645c3d94f18eeb9c04cfe842579c3784805dbcb1dc4792c` |
| b920/0101 | vtex | `2JjGIScyl00` | 180 | `f3cf3bba598374916c26ba3fc1f9e1fa822ddfadd06abbfdcfd865b6007e15fa` |
| b920/0101 | vmdl | `2xm5PHgl00` | 5,920 | `82c581549a92050f941642da4a0d0f49bf75f5c076127bf969961f56ecd42128` |
| b920/0101 | vmdl | `3wrm0opk00` | 5,300 | `23bb96980b3536e770272fb650b803c787699fdac022a968930ca839790904b2` |
| b920/0101 | vmdl | `3wihokpk01` | 5,300 | `3977b596ef79dca02397791ff8768033e962750f11e0db3a782a1431eeff1921` |
| b920/0101 | vmdl | `0AWaQVcyl0` | 9,488 | `3a2fb9debd20e37d314b235ef4b18763d35cd1c1e0d6de3990ef75e081ac05d7` |
| b920/0101 | veff | `108Ingb920_01vf` | 21,980 | `a8c473c654431400ef6a56a9afddff29cfe8eebe1b59008c3dfa0e7a5153641a` |
| b923/0001+0201 | vtex | `3V18P2gl` | 180 | `1e2698f532869221deb7a1bfc918e7ee8416a8c73e5f168fc554e0ee3e8ad39c` |
| b923/0001+0201 | vtex | `3361Mlpk00` | 180 | `0cba766e975c1632df846292b34f9f52a3715b1f0c6aac24f62cdb4b97d53b2e` |
| b923/0001+0201 | vtex | `33DllXpk00` | 180 | `c79f04de9ce64f13f746e391358517092a220f336f9787592b7586eedfd12e2e` |
| b923/0001+0201 | vtex | `234vXCcyl00` | 180 | `985830d3155693f71add4e42f7622e8cabfb63cc6dd9f19097e7a3982a71f31d` |
| b923/0001+0201 | vmdl | `2C3JVbgl00` | 5,920 | `9929a39b16119acf5868ae0b37df515274fd9fde4c2e1033f0cccd06f434700a` |
| b923/0001+0201 | vmdl | `2A71aspk00` | 5,316 | `e6f7a12e3c53a23b20fe6f920197b4cc30ed04ff530b114c75939fa9ade24288` |
| b923/0001+0201 | vmdl | `3wihokpk01` | 5,396 | `87f47ab17497d61d96ddf293dd812609de6fdf38de0bd3dcdd07edc5d966c638` |
| b923/0001+0201 | vmdl | `3q7xVZcyl00` | 6,496 | `068d82deab268cf523dafdab275c2468b4aae5d8e9742fbb67dabae2cc164886` |
| b923/all | veff | `3Ix4Cfb923_01vf` | 28,940 | `2ac317ec98dcf99cf52850666b8ef5e48abd1dc00866aef58a6eb1c07c7d1f97` |
| b923/all | leaf | `3JHE5qb923_01vf` | 910 | `febf1e2d1bb84cebc2e2c68b0747887ba1ffc2feede4cb273e0c6e9ee1176542` |
| b923/all | vins | `1yAe1svleafinst` | 878 | `6bd818b623b1476c1f681e4b169e16414f2a30877731e7dc8b8888b28d7783c1` |
| b923/0101 | vtex | `3V18P2gl` | 180 | `1e2698f532869221deb7a1bfc918e7ee8416a8c73e5f168fc554e0ee3e8ad39c` |
| b923/0101 | vtex | `3361Mlpk00` | 180 | `0cba766e975c1632df846292b34f9f52a3715b1f0c6aac24f62cdb4b97d53b2e` |
| b923/0101 | vtex | `33DllXpk00` | 180 | `c79f04de9ce64f13f746e391358517092a220f336f9787592b7586eedfd12e2e` |
| b923/0101 | vtex | `234vXCcyl00` | 180 | `985830d3155693f71add4e42f7622e8cabfb63cc6dd9f19097e7a3982a71f31d` |
| b923/0101 | vmdl | `2C3JVbgl00` | 5,920 | `9929a39b16119acf5868ae0b37df515274fd9fde4c2e1033f0cccd06f434700a` |
| b923/0101 | vmdl | `2A71aspk00` | 5,316 | `e6f7a12e3c53a23b20fe6f920197b4cc30ed04ff530b114c75939fa9ade24288` |
| b923/0101 | vmdl | `3wihokpk01` | 5,300 | `3977b596ef79dca02397791ff8768033e962750f11e0db3a782a1431eeff1921` |
| b923/0101 | vmdl | `3q7xVZcyl00` | 6,496 | `068d82deab268cf523dafdab275c2468b4aae5d8e9742fbb67dabae2cc164886` |
| b927/all | vtex | `2P73TCgl` | 180 | `a62f0aba4d4baa7ec92ef6f250b4adad12ed31511f8e957bc09b15ea9209768c` |
| b927/all | vtex | `1HK0wVpk00` | 180 | `963ec6ca8e25cbe01f038a3687bcb90fda0211969bbd065e33141453e7a02a27` |
| b927/all | vtex | `3YkFw1cyl00` | 180 | `ed6a17facee4bee179d49bd3fe6ff48978601743b68c790a0ded10b422175f51` |
| b927/all | vmdl | `336G97gl00` | 6,012 | `bae995d1035763ed6d93c8a79f2f0e97ac815196df36be700562239f3dc8f616` |
| b927/all | vmdl | `1eKZV2pk00` | 5,396 | `b3dab6f2d86f6322c64f7461fbcaaf1baf16512c62247aee7d628ef27f25cee6` |
| b927/all | vmdl | `1eBViYpk01` | 5,396 | `e578e9f2426ce6a08b08c54f458f54190720f211df0f9f6ae0e322a6282b2114` |
| b927/all | vmdl | `2BfZfacyl00` | 6,588 | `e480c7d55f338df763a80d09bb91c662712393dd80b07edb0ed85d696d8879d8` |
| b927/all | veff | `2YUDMmb927_01vf` | 28,796 | `a69f71523461ed7d43ad9798e29c4fcda26013693fc51ecb753160f237bc321b` |
| b927/all | leaf | `3ImU8Eb927_01l` | 1,156 | `aa17d4055e15f676fbc32b0764df32f2e90e7c8085a6da0f2492365b3414075b` |
| b927/all | vins | `22r3F7vleafinst` | 1,129 | `f47dc94e8548576eb28a60751bb7d3ff15b8b96f1cedf728c4f92d7063634340` |

## Top-level action-bank payload fingerprints

The common-resource, caster, and main scheduler payloads were sliced from each installed bank and hashed independently. Shared hashes make identical payload reuse explicit.

| Family/bank | Common resource bytes / SHA-256 | Caster bytes / SHA-256 | Main scheduler bytes / SHA-256 |
|---|---|---|---|
| b919/0001 | 54,899 / `9b9471b5985b04254798e5fa9028c8e9ecc8d91cfab5e0c7360f43cef4133e0b` | 3,159 / `c1528c07e9da872a0e0872b5a740b402353b601ea837383f88870ec83848a4f9` | 1,488 / `90d5e4f0c4a7a42fa36bfd17e0295cb94b0a082b9e5cf093b8a19738dd6a142c` |
| b919/0101 | 54,899 / `9b9471b5985b04254798e5fa9028c8e9ecc8d91cfab5e0c7360f43cef4133e0b` | 3,159 / `c1528c07e9da872a0e0872b5a740b402353b601ea837383f88870ec83848a4f9` | 1,360 / `65f35ebd1727fdb4ce552e2b45f9bc7f5dea52cc7626f2428464d8f365a62a2e` |
| b919/0201 | 54,899 / `9b9471b5985b04254798e5fa9028c8e9ecc8d91cfab5e0c7360f43cef4133e0b` | 4,746 / `9943d9597bf40f6c24f75e2bdbcaa1c13da5ba15516315664a50c464fd421310` | 1,488 / `c1e05a8edc6ec14ef957435f45139cae2b1bbd4ac801d508c6de439cf95cab2c` |
| b920/0001 | 52,244 / `7631d92fd6dd289efe43ae8473d8162dc6486db689f1edb71908fd120a0c4411` | 3,351 / `ce82a807ab114b483ee08896e16f462653aecdc74a084b1dc9c0576914d3f020` | 1,536 / `1cd91123bf24da49e47c63b5e1265aaf511bd8b6c92eda39d19cfee946f1d95a` |
| b920/0101 | 51,164 / `0fb6d7fcd78b2f132855d3aab5e7714c37d5039d22600d7e968ea2b5a20c4674` | 3,351 / `ce82a807ab114b483ee08896e16f462653aecdc74a084b1dc9c0576914d3f020` | 1,312 / `8de631510363ace2644e89ff3445afb7c8f31b9b421e905947563e0596120181` |
| b920/0201 | 52,244 / `7631d92fd6dd289efe43ae8473d8162dc6486db689f1edb71908fd120a0c4411` | 4,778 / `bd9c05b0438779d928a5254bba57e001cf124b6780a34861eddbc0512f38a204` | 1,488 / `8ca7d7f7502cf91990161d2e19ccee5a3809b0487bf11ba32cf220c13b6b6b72` |
| b923/0001 | 55,608 / `c2ed5b6ba49b6367ad7f801427a631c4082cc9cd8cd5647d596b1135179b7c7b` | 2,951 / `b9f5f8bfda9530ddc40afadfa36e4594b71bdaca9f933f31ea207f0dcacae2ee` | 1,456 / `b35abe2a2c53763c8cf39720d6e534b69eede1ae540fab08940506f623819b02` |
| b923/0101 | 55,512 / `2bf1296e36cd8500ea4c6ae28eab670b88073a8689d33c062344dc30669e80c1` | 2,951 / `b9f5f8bfda9530ddc40afadfa36e4594b71bdaca9f933f31ea207f0dcacae2ee` | 1,312 / `aab2b7594aa75c6cefe4c680c7c3bd80064afcc336830e41374e90f06eba88ca` |
| b923/0201 | 55,608 / `c2ed5b6ba49b6367ad7f801427a631c4082cc9cd8cd5647d596b1135179b7c7b` | 4,250 / `47c7f3f8b0ab190e3b74381163b52934c85551a458eee4868fecc157f7ced8aa` | 1,488 / `f6eb27b06dbd5ee320a4ee984c6397efce9e19957fedbeb3fe3baa6fd9c2d0f3` |
| b927/0001 | 55,884 / `12882eb1ee498cbd8f0176d29749d6673dd0fbb1f77d5e286bc9b5be006898ed` | 3,591 / `474d32ea0a21e33ea7ee48aab868cae2cd776b0ee13a3727b04c8143d680b00f` | 1,456 / `125f767e020bb03d227fafce3563525ef4d62044d3f48d26afa14e0151ec4831` |
| b927/0101 | 55,884 / `12882eb1ee498cbd8f0176d29749d6673dd0fbb1f77d5e286bc9b5be006898ed` | 3,591 / `474d32ea0a21e33ea7ee48aab868cae2cd776b0ee13a3727b04c8143d680b00f` | 1,360 / `e8fe77eb203dcba284a090c0159cff7702908e32c3112cf7b7edce272e02f700` |
| b927/0201 | 55,884 / `12882eb1ee498cbd8f0176d29749d6673dd0fbb1f77d5e286bc9b5be006898ed` | 5,338 / `f2ba6c367f4e5cc105681c28ce66aaaa45e93d7f3a6f9c91a55bba69695959ce` | 1,488 / `0bf1147d2e53f768feb01bf16b0ba9c765c1f24253f4828bdebba98fa5834aca` |

## Exhaustive appearance-row inventory (55 rows)

The join key is `gamedata_actor_appearance.baseGraphic`. `body = 1024`, `2048`, and `3072` map to `e001`, `e002`, and `e003`, respectively. Blank class paths are reported as `—`; a blank path is not evidence that an actor is a reward coffer. SQL lines refer to the current repository copies of `gamedata_actor_appearance.sql` and `gamedata_actor_class.sql`.

Schema note: `gamedata_actor_appearance` and `gamedata_actor_class` are separate tables. This audit performs an exact same-numeric-ID comparison because the current `Npc` path loads appearance by `actorClass.actorClassId`; it does not claim that `baseGraphic` is itself an actor-class ID or that an appearance row supplies class behavior. `baseGraphic` selects the `b###` asset family, `body` selects the `e###` variant, and `classPath` comes only from the separate same-ID actor-class row.

Counts: `b919 = 8`, `b920 = 8`, `b923 = 30`, `b927 = 9`, total `55`.

| Actor ID | Family/variant | Body | Size | Actor class path | Display-name ID | Flags | Appearance SQL line | Class SQL line |
|---:|---|---:|---:|---|---:|---:|---:|---:|
| 1200155 | b919/e001 | 1024 | 2 | — | 0 | 0 | 3197 | 3170 |
| 1200156 | b919/e002 | 2048 | 2 | — | 0 | 0 | 3198 | 3171 |
| 1200157 | b919/e003 | 3072 | 2 | — | 0 | 0 | 3199 | 3172 |
| 1200243 | b919/e001 | 1024 | 2 | — | 0 | 0 | 3280 | 3253 |
| 1200244 | b919/e002 | 2048 | 2 | — | 0 | 0 | 3281 | 3254 |
| 1200245 | b919/e003 | 3072 | 2 | — | 0 | 0 | 3282 | 3255 |
| 1200385 | b919/e003 | 3072 | 2 | — | 0 | 0 | 3422 | 3395 |
| 1200401 | b919/e003 | 3072 | 2 | — | 0 | 0 | 3438 | 3411 |
| 1200049 | b920/e001 | 1024 | 2 | — | 0 | 0 | 3091 | 3064 |
| 1200158 | b920/e002 | 2048 | 2 | — | 0 | 0 | 3200 | 3173 |
| 1200159 | b920/e003 | 3072 | 2 | — | 0 | 0 | 3201 | 3174 |
| 1200246 | b920/e001 | 1024 | 2 | — | 0 | 0 | 3283 | 3256 |
| 1200247 | b920/e002 | 2048 | 2 | — | 0 | 0 | 3284 | 3257 |
| 1200248 | b920/e003 | 3072 | 2 | — | 0 | 0 | 3285 | 3258 |
| 1200396 | b920/e001 | 1024 | 2 | — | 0 | 0 | 3433 | 3406 |
| 1200400 | b920/e003 | 3072 | 2 | — | 0 | 0 | 3437 | 3410 |
| 1080001 | b923/e001 | 1024 | 2 | — | 0 | 0 | 2305 | 2262 |
| 1080002 | b923/e001 | 1024 | 2 | — | 0 | 0 | 2306 | 2263 |
| 1080003 | b923/e001 | 1024 | 2 | — | 0 | 0 | 2307 | 2264 |
| 1080037 | b923/e001 | 1024 | 2 | — | 4000257 | 0 | 2341 | 2298 |
| 1080038 | b923/e001 | 1024 | 2 | — | 4000257 | 0 | 2342 | 2299 |
| 1080039 | b923/e001 | 1024 | 2 | — | 4000257 | 0 | 2343 | 2300 |
| 1080053 | b923/e001 | 1024 | 2 | — | 0 | 0 | 2357 | 2314 |
| 1080056 | b923/e001 | 1024 | 2 | `/Chara/Npc/Populace/PopulaceStandard` | 0 | 1 | 2360 | 2317 |
| 1200051 | b923/e001 | 1024 | 2 | — | 4000257 | 0 | 3093 | 3066 |
| 1200137 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3179 | 3152 |
| 1200138 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3180 | 3153 |
| 1200149 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3191 | 3164 |
| 1200160 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3202 | 3175 |
| **1200161** | **b923/e003** | 3072 | 2 | **`/Chara/Npc/Object/GuildleveBonusTreasureBox` — excluded control** | 2 | 0 | 3203 | 3176 |
| 1200223 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3260 | 3233 |
| 1200224 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3261 | 3234 |
| 1200225 | b923/e003 | 3072 | 2 | — | 0 | 0 | 3262 | 3235 |
| 1200235 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3272 | 3245 |
| 1200236 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3273 | 3246 |
| 1200237 | b923/e003 | 3072 | 2 | — | 0 | 0 | 3274 | 3247 |
| 1200286 | b923/e003 | 3072 | 2 | — | 0 | 0 | 3323 | 3296 |
| 1200320 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3357 | 3330 |
| 1200321 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3358 | 3331 |
| 1200322 | b923/e003 | 3072 | 2 | — | 0 | 0 | 3359 | 3332 |
| 1200392 | b923/e001 | 1024 | 2 | — | 0 | 0 | 3429 | 3402 |
| 1200394 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3431 | 3404 |
| 1200395 | b923/e003 | 3072 | 2 | — | 0 | 0 | 3432 | 3405 |
| 1200398 | b923/e002 | 2048 | 2 | — | 0 | 0 | 3435 | 3408 |
| 9111304 | b923/e001 | 1024 | 4 | — | 1 | 0 | 7774 | 7881 |
| 9220401 | b923/e003 | 3072 | 2 | — | 0 | 0 | 7902 | 8012 |
| 1200162 | b927/e001 | 1024 | 2 | — | 0 | 0 | 3204 | 3177 |
| 1200163 | b927/e002 | 2048 | 2 | — | 0 | 0 | 3205 | 3178 |
| 1200164 | b927/e003 | 3072 | 2 | — | 0 | 0 | 3206 | 3179 |
| 1200240 | b927/e001 | 1024 | 2 | — | 0 | 0 | 3277 | 3250 |
| 1200241 | b927/e002 | 2048 | 2 | — | 0 | 0 | 3278 | 3251 |
| 1200242 | b927/e003 | 3072 | 2 | — | 0 | 0 | 3279 | 3252 |
| 1200249 | b927/e003 | 3072 | 2 | — | 0 | 0 | 3286 | 3259 |
| 1200399 | b927/e002 | 2048 | 2 | — | 0 | 0 | 3436 | 3409 |
| 1200402 | b927/e003 | 3072 | 2 | — | 0 | 0 | 3439 | 3412 |

Only two of the 55 same-ID actor-class rows have a nonblank class path: quest prop `1080056` and excluded Guildleve control `1200161`. This is why the appearance table alone cannot identify the requested giant reward coffer receiver.

## Exact cutscene-prop bindings found in the all-cut scan

A corrected direct scan of all installed cutscene files found three valid standard PWIB actor records among the 55 appearance IDs. These records are important, but their scope is narrow: they bind an appearance to a **public-stronghold cutscene prop**. They do not identify a reward coffer, prove an opening bank, or join a primal encounter.

Standard-record validation was exact at each hit: actor ID at record `+0x30`, record `+0x20 = 5`, `+0x28 = 0xFFFFFFFF`, and `+0x2C = 2`.

| Cut key / replay | Localized area | Main cut file | File bytes / SHA-256 | Record start | Actor offset | Label | Exact appearance | What it proves |
|---|---|---|---|---:|---:|---|---|---|
| `gc03g410` / 11082002 | Natalan | `client/cut/gc03g410/gc03g410` | 24,880 / `e98e436878951def0824689852e28262e8c69313bbf16f7a234ce879855f3199` | `0x50C` | `0x53C` | `box` | 1200155 -> b919/e001 | b919/e001 is used as a Natalan cutscene prop |
| `gc03l410` / 11082001 | U'Ghamaro Mines | `client/cut/gc03l410/gc03l410` | 24,720 / `8bfde8e15647ccc2229645c8252a26714233f5556027788940cd4d7bf43f76ed` | `0x44C` | `0x47C` | `hako` | 1200158 -> b920/e002 | b920/e002 is used as a U'Ghamaro cutscene prop |
| `gc03u410` / 11082003 | Zahar'ak | `client/cut/gc03u410/gc03u410` | 23,376 / `914b8fcc83f698ecec060eab4a7c07e7c9624ad51030df980a49469f1076be36` | `0x398` | `0x3C8` | `hako` | 1200162 -> b927/e001 | b927/e001 is used as a Zahar'ak cutscene prop |

The replay/area joins come from `cutReplay.csv` rows 445–447 and `xtx_cutReplay.csv` rows 445–447. The result supports the visual/theme interpretation that these three families appear in Ixali/Natalan, Kobold/U'Ghamaro, and Amalj'aa/Zahar'ak stronghold material. It does **not** establish that the same appearances are the post-fight coffers for Garuda, Titan, Ifrit, or Moogle, and it does not identify which action bank those cutscene props receive.

No other valid standard or compact target record was found across the 9,593 installed cut files in the corrected all-family scan. In particular:

- `client/cut/sum6g000/sum6g000` (10,626,512 bytes, SHA-256 `c0bdcb72ac50d712642e56d29df4ef00403717f433c3fdcd553e5de0eb071e74`) contains none of the 55 scoped appearance IDs as raw little-endian values.
- `client/cut/sum6m000/sum6m000` (10,431,968 bytes, SHA-256 `d393cf0811f3d26543057ada07a7fbdae551c9a606b4345ce48001869f4b9259`) likewise contains none.

Those two negatives close a direct candidate-ID join for the inspected Garuda/Moogle cut files, but they do not prove that no dynamically instantiated chest exists.

## Current static spawns and non-reward bindings

The only current `server_eventnpc_spawn_locations.sql` rows using one of the 55 same-ID actors are three `1080056` props:

| SQL line | Spawn ID | Actor | Label | Zone | Area | Sub-area | X | Y | Z | Rotation | Motion pack |
|---:|---:|---:|---|---:|---|---:|---:|---:|---:|---:|---:|
| 1410 | 2191 | 1080056 | `etc5l1_chest_1` | 128 | `PrivateAreaMasterPast` | 5 | -244.244 | 12.491 | -98.884 | -0.6 | 1080 |
| 1411 | 2192 | 1080056 | `etc5l1_chest_3` | 128 | `PrivateAreaMasterPast` | 5 | -244.077 | 12.673 | -100.918 | 1.0 | 1080 |
| 1443 | 2254 | 1080056 | `etc5l1_chest_2` | 128 | `PrivateAreaMasterPast` | 5 | -245.056 | 12.556 | -99.806 | -2.0 | 1080 |

Because `1080056` is `/Chara/Npc/Populace/PopulaceStandard`, b923/e001, and the rows are explicitly named `etc5l1_chest_*` in a private quest-room area, this is an exact b923/e001 quest-decoration binding. It is not a dungeon/primal reward coffer and is not a proven opening receiver.

No other non-control same-ID actor among the 55 appears in the current event, battle, notorious-monster, or Guildleve spawn SQL surfaces inspected.

Two quest scripts reuse appearance IDs as condition/alias constants, not as instantiated chest spawns:

- `Data/scripts/quests/etc/etc2g4.lua:22`: `JANLENOUX = 1200164`, paired elsewhere with actual actor `1001356`.
- `Data/scripts/quests/etc/etc201.lua:26`: `TRISTECHAMBEL = 1200223`, paired elsewhere with actual actor `1001955`.

These numeric aliases are not valid family-to-encounter joins. Likewise, `Data/scripts/commands/gm/spawnbgmodel.lua` lists representative triplets for development spawning (`b919`: 1200155–1200157; `b920`: 1200049/1200158/1200159; `b923`: 1080001/1200160/1200161; `b927`: 1200162–1200164). That is useful appearance tooling, not retail placement or reward logic.

## Excluded Guildleve control and what it can prove

Actor `1200161` has the exact class `/Chara/Npc/Object/GuildleveBonusTreasureBox` (`gamedata_actor_class.sql:3176`) and appearance b923/e003 (`gamedata_actor_appearance.sql:3203`). It is explicitly excluded from the requested target set.

Prior live control observations on 2026-07-19 were:

- Scheduler `0x04001000` (bank `0001`) visibly opened `1200161`.
- Scheduler `0x040C9000` (bank `0201`) did not visibly act on that receiver.

Safe conclusions:

1. b923's `act1` resource is an opening motion.
2. Receiving actor class/runtime setup matters; having a b923 appearance does not guarantee every bank will execute visibly.

Unsafe and therefore rejected conclusions:

1. `1200161` is the requested giant non-guildleve coffer.
2. Any current server reuse of `1200161` reconstructs original retail dungeon/primal binding.
3. Failure of `0201` on this excluded receiver means `0201` is invalid for another receiver class.

## `RaidDungeonTreasureBox` and `InstanceRaidTreasureBox`

### `RaidDungeonTreasureBox`

Recovered source: `tools/outputs/lpb/focused/chara/npc/object/raiddungeontreasurebox.lua`.

`processOpenDzemaelEpicQuestType` begins at line 3. It processes the reward/drop branch and then, at lines 42–43, calls:

```lua
A0_0._runCharaScheduler(A0_0, A1_1, 67932160)
```

`67932160 = 0x040C9000`. The scheduler encoding selects category `4`, bank number `201` decimal (filename `0201`), low parameter `0`. It does not contain an actor appearance ID, `b###` family, or `e###` variant. `A1_1`, the receiving actor, must already provide the resource family and class behavior.

This resolves the action-bank request but leaves the critical receiver join unresolved. The script contains no concrete one of the 55 appearance IDs and no `b919`, `b920`, `b923`, or `b927` token.

Fingerprints:

- Recovered Lua: 6,848 bytes, SHA-256 `be6d403d8ed40f517ac1b034b2fc8fbd42fb70074f7ff35a9474bacb2b38d230`.
- Recovered LUAC: 4,074 bytes, SHA-256 `f85d87ced22e9b2330571afdd4a93ff29fdb01f3e96d7a19a2a61937bfc11018`.
- Installed LPB `client/script/729s9/wu7/v8057q/s9166pw35vwqs59rps58vm.le.lpb`: 4,087 bytes, SHA-256 `9e8cdec96d2efae04b8b4c6cd3753a1dd0217689c85091263a344058409c42eb`.

### `InstanceRaidTreasureBox`

The entire recovered source is:

```lua
require("/Chara/Npc/Object/TreasureBox/TreasureBoxBaseClass")
_defineClass("InstanceRaidTreasureBox", "TreasureBoxBaseClass")
```

It defines no method, scheduler ID, appearance ID, or asset token. `TreasureBoxBaseClass.initForEvent` initializes temporary work and calls the empty `processInitTreasureBox` hook; that base class also supplies no coffer-family join.

Fingerprints:

- Recovered InstanceRaid Lua: 126 bytes, SHA-256 `3b553019580ef8b37d5e20f48ad88b34e079d1e110cfbac8d7e067c9eb52f493`.
- Recovered InstanceRaid LUAC: 226 bytes, SHA-256 `3e7cffc2f493dc1ad85b584d76c2c04c62aefd37f61e661fd0a05e6768df3803`.
- Installed InstanceRaid LPB `client/script/729s9/wu7/v8057q/qs59rps58vm/1wrq9w75s916qs59rps58vm.le.lpb`: 239 bytes, SHA-256 `7df24afc3c4b3a7eb6fafe544d80c47faa02c647c401b83017e3c70fa4a7e872`.
- Recovered TreasureBoxBaseClass Lua: 336 bytes, SHA-256 `88c86d52eb99db5acbc9097f181b092687907ca4083d8f07509fd685c2c26f5f`.

## Current-local implementation boundary (not original retail proof)

The repository's present server implementation reuses excluded actor `1200161` in several systems. These are current reconstruction choices and must not be read backward as original client/retail bindings:

| Current local system | Exact source evidence | Scope boundary |
|---|---|---|
| Toto-Rak | `Map Server/Actors/Area/PrivateAreaContent.cs:2280-2330`, `SpawnTotorakTreasureCoffer`, calls `SpawnActor(1200161, ...)` for route/reward coffers | Current local implementation only |
| Dzemael | `Map Server/DzemaelManager.cs:57`, `TreasureCofferActorClassId = 1200161` | Current local implementation only |
| Skirmish | `Map Server/Actors/Director/SkirmishDirector.cs:25`, `RewardCofferActorClassId = 1200161` | Current local implementation only |
| Hamlet Defense | `Map Server/Actors/Director/HamletDefenseDirector.cs:36`, `RewardCofferActorClassId = 1200161` | Current local implementation only |
| Guildleve | `Map Server/Actors/Director/GuildleveDirector.cs:110`, `DefaultGuildleveChestActorClassId = 1200161`; also `Data/scripts/guildleve_chests.lua:14` | Explicitly excluded target class; current local implementation |

The local `Npc.cs` comment likewise says the “current content coffer” is Guildleve actor 1200161. That describes the reconstruction at this repository revision, not an original receiver recovered from the client.

The current Garuda and Moogle encounter implementations do **not** spawn a coffer on victory:

- `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua:898-920` directly grants Vortex Totems through `AddGeneratedLootItem` and the Howling Gale through `AddItem`; the victory loop calls that function at line 936. No `1200161`, scoped coffer actor, or reward-coffer `SpawnActor` occurs in the reward path.
- `Data/scripts/directors/InstanceRaid/MoogleEncounter.lua:622-638` directly grants the Kupo Nut Charm through `AddGeneratedLootItem`; the victory loop calls it at line 661. The phrase “chest reward” appears only in a player-facing message. No reward coffer is instantiated.

Therefore the current local Garuda/Moogle runtime is evidence of **direct reward delivery with no implemented coffer**, not evidence against the historical chest. The local archive independently says retail-era victory produced a chest; implementing that visual/runtime receiver remains outstanding.

Current-local source fingerprints:

| Source | Bytes | SHA-256 |
|---|---:|---|
| `Data/scripts/directors/InstanceRaid/GarudaEncounter.lua` | 34,734 | `daf3f3d7cb9780a1d1ef1dd57e105ec200e60bdb789e8662dc4a0f27b0182c32` |
| `Data/scripts/directors/InstanceRaid/MoogleEncounter.lua` | 26,967 | `729c5ba5da4b501536e83fba1ceb2aa97fad89f0e64512d7627f7998f201918e` |
| `Map Server/Actors/Area/PrivateAreaContent.cs` | 128,368 | `d3be41edf9c0ee77ea50018fa6b0a9eb417d7d9415bd3425c57e470edd46705a` |
| `Map Server/DzemaelManager.cs` | 113,571 | `128b41242b357e0853f2d52de1c5d93dd4595203ade25a51cf440fcdc2502bc7` |
| `Map Server/Actors/Director/SkirmishDirector.cs` | 42,738 | `39bf46d4547dc3929ccbaa95f7eda559a6bff126200bfdbe224ef2c0ed9b08a6` |
| `Map Server/Actors/Director/HamletDefenseDirector.cs` | 139,239 | `1df30da75b05302c3506b15c609585180542445d530d1f69be8c9cbdb2b4a274` |
| `Map Server/Actors/Director/GuildleveDirector.cs` | 158,467 | `5c9077baa6e9ea1799a3fedecd0928ecde8cd257ee8633bd84a515e922b8ecd4` |
| `Map Server/Actors/Chara/Npc/Npc.cs` | 43,300 | `3c8537abf994cc169b1021ecf8b63d4e6945ac07cfd43565ebdd46ba8c3017f9` |

## Final all-55 scan-count ledger

This table is the corrected all-family audit. The older b923-only/dungeon-candidate table later in this report is retained separately and labeled historical/narrow.

| Corpus | Files | Bytes | Final all-55 result |
|---|---:|---:|---|
| All installed CUT files | 9,593 | 720,340,590 | Exactly three valid target PWIB records: the Natalan, U'Ghamaro, and Zahar'ak stronghold props above; no other valid target record. `sum6g000` and `sum6m000` contain no scoped ID hit |
| Raw PWIB DAT payloads | 3,482 | 762,467,544 | 22 raw uint32 coincidences; zero valid standard or compact target actor record |
| Decoded LPB corpus | 2,517 | not recorded | Zero of the 55 IDs as u32, Lua double, or ASCII; zero `b919`/`b920`/`b923`/`b927` family token. Only relevant class-name bytecode surfaces were recovered |
| SQWT corpus | 1,127 | 154,503,018 | Zero 55-ID, family-token, or target-class hit |
| `ffxivgame.exe` | 1 | 15,996,808 | Sole 1200164-like byte sequence at `0x1518E6` crosses x86 instruction bytes and is not an actor constant; no valid target binding. SHA-256 `9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9` |
| All `MapLayoutResourceData` roots | 287 | 89,152,600 | Zero family token; target-like integers resolve as internal pointers/references, not actors |

Exact battlefield-layout negatives:

- Garuda primary `data/28/D9/00/02.DAT`: 1,641,712 bytes, SHA-256 `2280939b00697a0d67d67e71dd326a576b6a6baeefbed9a509908c48355bc542`. Apparent values 1200156 and 1200396 at offsets `0x9C8D4` and `0x9CB54` are internal pointers; no actor/model join.
- Garuda secondary `data/28/D9/00/15.DAT`: 87,024 bytes, SHA-256 `db13649451a75054235319e93bc9bfd3c236eb776bdd45c6df12e96e49e2a383`. No scoped hit.
- Thornmarch `data/29/B0/00/06.DAT`: 1,692,336 bytes, SHA-256 `f539b71233efa49c3f869d88ca494ab88db2a55487f2a2c64543bbaf0091d7fa`. Apparent values 1200224 and 1200400 are pointer-array entries; no actor/model join.

“No other valid target record” applies to the validated actor-record grammar and the 55 same-ID appearance set. It does not exclude dynamically supplied IDs, indirect aliases, or receiver construction outside CUT/layout assets.

## Candidate receiver search and negative evidence

### Existing b923-focused exhaustive audit, correctly bounded

The inherited `original_chest_actor_search_audit.csv` was re-read and its directly referenced SQL/LPB/asset facts were rechecked. It is a b923/dungeon-candidate audit, not a universal proof that the other families never appear in cutscenes. The later corrected all-family cut scan found the three stronghold props reported above, so the earlier “all installed cut files” negative must be read only in its original b923-target context.

| Surface | Files | Bytes | Result | Boundary |
|---|---:|---:|---|---|
| Scoped four-dungeon replay PWIBs | 24 | 8,379,056 | 220 valid standard records plus known compact `rad0r102`; zero base-20923 actors | Known BG-object records were b936 terminals/barriers and b996 Cutter Tool only |
| All raw PWIB DAT payloads | 3,482 | 762,467,544 | 17 raw coincidences; zero valid b923 target record | Standard and compact actor grammars checked |
| Four exact map-layout resource roots | 4 | 4,423,104 | All 30 b923 appearance IDs searched; zero hits | No candidate ID in those four dungeon layout roots |
| Direct resources referenced by those layouts | 1,802 | 154,642,239 | 10 numeric coincidences, all texture/SSCF/PHB data; zero b923 tokens | Searched `b923e001`–`e003`, `v11_tbx01`–`03`, `b923_01v` |
| Decoded LPB corpus | 2,517 | not recorded | No concrete selected b923 appearance ID | `RaidDungeonTreasureBox` bytecode exists, but has no concrete receiver ID |
| SQWT assets | 1,127 | 154,503,018 | Zero selected b923 candidate hit | No original actor binding |
| `ffxivgame.exe` | 1 | not recorded | No exact selected candidate constant | IDs checked: 1200161, 1200223–225, 1200235–237, 1200320–322 |

The audit CSV itself is 1,520 bytes, SHA-256 `bd32456120a8ac0f6d9be357fa00c5c397680e7050c8c8fd084437484dde6502`.

The three b923 triplets most often suggested by numeric adjacency remain unbound:

| Candidate set | What is proven | What remains unproven |
|---|---|---|
| 1200223 / 1200224 / 1200225 | Exact b923 e001/e002/e003 appearance triplet; 1200223 is also a quest alias constant | No reward-coffer class, battlefield spawn, layout record, or primal join |
| 1200235 / 1200236 / 1200237 | Exact b923 e001/e002/e003 appearance triplet | No class, spawn, scheduler receiver, or encounter join |
| 1200320 / 1200321 / 1200322 | Exact b923 e001/e002/e003 appearance triplet | No class, spawn, scheduler receiver, or encounter join |

Numeric adjacency and matching e001/e002/e003 palettes are useful search seeds only. They are not identity evidence.

### What the corrected all-family cut scan changes

The corrected scan establishes stronghold-prop placements for b919/e001, b920/e002, and b927/e001. It does **not** establish any `b923` stronghold record, any post-battle reward-coffer record, or any actor hit in `sum6g000`/`sum6m000`. Thus:

- It is now wrong to say that no scoped family appears in installed cutscene actor records.
- It remains correct to say that no inspected cutscene record binds one of these appearances as the Garuda or Moogle reward chest.
- It remains correct to say that the receiver for `RaidDungeonTreasureBox` bank `0201` has not been recovered.

## Historical Garuda and Moogle reward-chest evidence

Two local archived wiki pages independently establish that these encounters award through a chest:

- `docs/ffxiv-1.0-wiki/pages/A_Feast_of_Fools.html:165` says that after Moogle victory, a treasure chest containing the reward spawns. File: 28,054 bytes, SHA-256 `8126298676c58e73e40851f97409c02799baa2ab1306b808862d2096610b6b99`.
- `docs/ffxiv-1.0-wiki/pages/Category__Class_Quests.html:3210` says Garuda rewards are found in a chest upon her defeat. File: 428,527 bytes, SHA-256 `79bcb21f74b4ba6b285bdd361a68d6e3fa264b0acded32ca9ca786692ce5a2a7`.

This is **chest-existence-only proof**. Neither page supplies a client actor ID, actor class, `b###` graphic family, `e###` appearance, bank number, scheduler ID, VFX resource, sound resource, location record, cutscene actor record, or animation duration. No family-to-Garuda or family-to-Moogle assignment is made from it.

## Proven facts, interpretations, and unresolved joins

### Proven

1. Four scoped families exist, with all 12 model appearances, four skeletons, and 12 action-bank files inventoried.
2. The family-token stems are b919=`tbx31/32/33`, b920=`tbx11/12/13`, b923=`tbx01/02/03`, b927=`tbx21/22/23`.
3. b919/b923/b927 use one `n_lid`; b920 uses one `n_joint` plus child `n_handle`; no scoped rig has left/right door bones.
4. Each family has an act1 rest-to-displaced track and act2 displaced-to-rest track with matching endpoints.
5. `0201` embeds act1 and act2, not two doors.
6. b923 act1 is an opening motion, proven using the excluded Guildleve control only as a motion-semantics receiver.
7. All banks schedule VFX and sound clip classes; exact nested VFX resources and hashes are inventoried.
8. Scheduler active windows differ from raw motion lengths and must be tracked separately.
9. `RaidDungeonTreasureBox` requests bank `0201` through `0x040C9000`; the call does not encode a family or appearance.
10. Three public-stronghold cuts bind b919/e001 at Natalan, b920/e002 at U'Ghamaro, and b927/e001 at Zahar'ak as cutscene props.
11. Current SQL binds b923/e001 actor 1080056 to three private quest-room `etc5l1_chest_*` props.
12. A chest exists after Moogle victory and Garuda's rewards are found in a chest after her defeat.

### High-confidence interpretations

1. For b919, b920, and b927, act1 is the open phase and act2 the close/return phase because the tracks follow the same rest-to-displaced/displaced-to-rest architecture as the semantically proven b923 rig.
2. The three stronghold cut bindings explain the respective Ixali/Natalan, Kobold/U'Ghamaro, and Amalj'aa/Zahar'ak visual themes. This is a prop-theme interpretation supported by exact appearance records, not a reward identity.
3. Scheduler units are microseconds; the report marks converted values with `~` to retain the inference boundary.

### Unresolved

1. Which actor class/appearance receives the giant non-guildleve reward-coffer interaction.
2. Which, if any, family is used for Garuda, Moogle, Ifrit, Titan, a dungeon, or another encounter reward.
3. Which e001/e002/e003 skin is used for any specific primal reward.
4. Whether `0001`, `0101`, or `0201` is requested by a specific unrecovered target receiver outside the proven control and RaidDungeon script facts.
5. The semantic name and exact audible asset triggered by each `RaptureSoundClip`.
6. The exact per-opcode boundaries inside SCB scheduling; candidate aligned timing words are preserved without over-labeling.
7. Full rendered appearance of the nested VFX. The resources were decoded structurally and fingerprinted but not played in a viewer, because the task prohibited data/config writes.
8. Any original battlefield spawn/layout record for the Garuda or Moogle reward chest.

## Reconstruction guidance without overclaiming

For a faithful implementation, preserve these layers separately:

1. **Appearance layer:** choose a proven `baseGraphic/body` pair only after the encounter's receiver binding is independently recovered.
2. **Rig layer:** b919/b923/b927 animate `n_lid`; b920 animates `n_joint` and `n_handle` together.
3. **Raw motion layer:** use the decoded frame counts, rates, and endpoints above.
4. **Scheduler layer:** do not simply wait for the MTB's full raw duration; reproduce the selected bank's compiled active window and clip composition.
5. **Presentation layer:** retain its family VFX and scheduled sound hook. Do not substitute a guessed sound event.
6. **Interaction layer:** ensure the actor class actually handles the scheduler. The excluded control's different response to `0001` and `0201` demonstrates that appearance alone is insufficient.

The safest current prototype is therefore family-agnostic: implement a receiver interface capable of selecting `0001`, `0101`, or `0201`, then bind a family only when a battlefield/spawn/packet capture proves it.

## Coverage ledger

| Requested/related surface | Status | Evidence quality | Remaining gap |
|---|---|---|---|
| Giant coffer model families | Complete for b919/b920/b923/b927 | Exact installed files, tokens, hashes | No encounter assignment |
| e001/e002/e003 appearances | Complete | Exact model files and all 55 SQL rows | Runtime receiver join |
| Lid/door skeletons | Complete | Nested SEDBSKL decode | None for scoped rigs |
| Opening/return raw tracks | Complete | MTB/SPU curve decode | Non-b923 semantic receiver proof |
| `0201` two-phase meaning | Complete | Two matching sequential MTB resources | Full SCB opcode semantics |
| Raw durations | Complete | 30-FPS frame headers | None |
| Scheduler active windows | Complete structurally | Parsed SCB ranges | Unit scale remains inferred; opcode labels partial |
| VFX resource set | Complete structurally | Nested resource IDs/sizes/hashes/source path | No visual playback/render |
| Sound scheduling | Presence complete | One `RaptureSoundClip` in every bank | Exact cue/event name unresolved |
| Actor-class inventory | Complete for same-ID rows | Exact actor-class SQL | Most paths blank |
| Current static spawns | Complete for same-ID scan | Exact three 1080056 rows | Original retail dynamic spawns unresolved |
| Stronghold cutscene props | Complete for all-family cut scan | Three validated PWIB records | No reward/open/primal join |
| Garuda cut candidate-ID join | Negative for `sum6g000` | Exact 55-ID byte scan | Dynamic/nonliteral receiver possible |
| Moogle cut candidate-ID join | Negative for `sum6m000` | Exact 55-ID byte scan | Dynamic/nonliteral receiver possible |
| `RaidDungeonTreasureBox` | Scheduler recovered | Decompiled Lua + installed LPB | Receiving actor identity |
| `InstanceRaidTreasureBox` | Class surface recovered | Entire two-line Lua | Inherited/runtime external behavior |
| Garuda reward chest existence | Proven historically | Local archived wiki | Family/actor/animation join |
| Moogle reward chest existence | Proven historically | Local archived wiki | Family/actor/animation join |
| Guildleve chest | Excluded/control only | Exact class + prior observation | Intentionally out of scope |

## Read-only verification method

All task actions were non-mutating except authoring Markdown output. The inspection used:

- `rg --files` and exact `rg -n -F` scans for paths, actor IDs, source calls, wiki statements, and SQL rows.
- PowerShell `Get-Item`, `Get-Content`, and `Get-FileHash -Algorithm SHA256` for sizes, exact source reads, and fingerprints.
- In-memory Python byte reads for PWIB/SEDB chunk enumeration, little-endian structure decoding, resource slicing, hashes, nested skeleton parsing, and MTB/SPU curve decoding. The scripts emitted only console text and created no binary dumps.
- Exact PWIB actor-record validation at the documented invariant offsets, not raw uint32 coincidence alone.
- Cross-joins among `gamedata_actor_appearance.sql`, `gamedata_actor_class.sql`, spawn SQL, `cutReplay.csv`, and `xtx_cutReplay.csv`.

No command wrote into `client/`, `Data/`, `Map Server/`, `tools/`, `docs/`, an executable, a DAT, or a source-controlled code file. No viewer was launched.

## Principal source fingerprints

Repository root: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`.

| Source | Bytes | SHA-256 |
|---|---:|---|
| `Data/sql/gamedata_actor_appearance.sql` | 1,216,707 | `bf46cc9438b1a2ea1850b0b856519a952b00058973661453a30e06028e21c015` |
| `Data/sql/gamedata_actor_class.sql` | 1,628,685 | `a981149eb3f00997b7c4df09dc60cba59e76685d6a732367bae9b82c14c489c5` |
| `Data/sql/server_eventnpc_spawn_locations.sql` | 183,514 | `90bc29c03afce91d5eaa6bb64eae3b59667749dca62e009b8545025b009011e4` |
| `Data/scripts/commands/gm/spawnbgmodel.lua` | 11,873 | `11395bbbb84f0f745d5197c6caf1f04b3c1f906193eb418ed6fcc1e20e7796c4` |
| `Data/scripts/quests/etc/etc2g4.lua` | 5,242 | `9e569369dd753d0e9987c0e9b1ff6a9524fb605c83b00e0e2bce572e59ef36ec` |
| `Data/scripts/quests/etc/etc201.lua` | 4,430 | `58f627b26740a2351114651b09dbf2b653e4cc8ca81eae04ee4809fd1a8a4599` |
| `docs/Dat Mining/cutReplay.csv` | 41,735 | `465fda19d5af7d120cff36fef4cd7415cd9dc1fa74d89e69b1a72add13c07ca2` |
| `docs/Dat Mining/xtx_cutReplay.csv` | 44,108 | `64605ce57793d833af493748d39d75b6c4e8c5d49d897ecaba15ac5c08054038` |
| `outputs/dungeon-actor-animation-atlas-20260719/original_chest_actor_search_audit.csv` | 1,520 | `bd32456120a8ac0f6d9be357fa00c5c397680e7050c8c8fd084437484dde6502` |
| `docs/ffxiv-1.0-wiki/pages/A_Feast_of_Fools.html` | 28,054 | `8126298676c58e73e40851f97409c02799baa2ab1306b808862d2096610b6b99` |
| `docs/ffxiv-1.0-wiki/pages/Category__Class_Quests.html` | 428,527 | `79bcb21f74b4ba6b285bdd361a68d6e3fa264b0acded32ca9ca786692ce5a2a7` |
| `tools/outputs/lpb/focused/chara/npc/object/raiddungeontreasurebox.lua` | 6,848 | `be6d403d8ed40f517ac1b034b2fc8fbd42fb70074f7ff35a9474bacb2b38d230` |
| `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/treasurebox/instanceraidtreasurebox.lua` | 126 | `3b553019580ef8b37d5e20f48ad88b34e079d1e110cfbac8d7e067c9eb52f493` |
| `tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/treasurebox/treasureboxbaseclass.lua` | 336 | `88c86d52eb99db5acbc9097f181b092687907ca4083d8f07509fd685c2c26f5f` |

## Final boundary statement

The client-side coffer mechanisms are now documented down to their files, model variants, bones, raw curves, durations, controller hashes, scheduler windows, clip composition, VFX resources, sound-clip presence, and all same-ID appearance rows. Exact stronghold cutscene-prop uses and current quest-prop uses are also separated from reward behavior.

What is still missing is not another animation file: it is the original runtime **receiver binding** that joins a specific encounter's spawned chest actor to one family/variant and then invokes the appropriate bank. Until a battlefield layout, actor-instantiation capture, script argument, or packet provides that join, assigning b919/b920/b923/b927 to Garuda, Moogle, Ifrit, or Titan would be speculation.
