# Good King Moggle Mog / Thornmarch client and battlefield findings

Read-only asset inventory and decompilation notes for installed client version `2012.09.19.0001`.

Audit date: 2026-08-02  
Installed client: `C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV`  
Source cross-reference only: `C:/Users/drime/source/repos/AuroraFlare/FF14-Memory`

## Read-only contract

This investigation only viewed installed client files and existing source/SQL. It did **not** edit game DATs, server data, SQL, Lua, C#, configuration, or gameplay behavior. This Markdown report is the only created artifact.

Confidence labels:

- **Exact** — parsed directly from an installed file or literal source row.
- **Strong** — an exact client name/order relationship exists, but engine dispatch was not recovered.
- **Candidate** — a useful correlation for future testing, not proof.
- **Unknown** — present, but not safely nameable from current evidence.

## Executive result

- Eight distinct court appearances all resolve to monster base `m701`: seven role variants and a larger, crowned King.
- The direct `m701` tree contains 111 files / 30,067,736 bytes. Its 47 ACT files include a common FID, 16 common LIB emotes, BID, BTL, four MGC banks, and **24 WSS banks**.
- The 24 installed WSS files are `0001`–`0023` and `0025`; `0024` is absent. Recursive parsing of the action tree reaches 1,102 live resources, including skeletal motion, root motion, schedulers, models, textures, and effects.
- Current named commands do **not** prove retail WSS assignments. Most current rows intentionally collapse to WSS1; a sequential command/WSS mapping is only a candidate hypothesis.
- BID contains locomotion, damage reactions, activation/deactivation, looping states, and a staged death/corpse sequence. It has no conventional one-piece `cbbm_ded` clip.
- The battlefield contains a dedicated Moogle ring, collision, four prop groups, exact show/hide schedulers, and a Moogle primal atmosphere with `moguri01` glow/spot effects plus sky, fog, environment, and lighting tracks.
- The Thornmarch cutscene bundle `sum6m000` contains all seven lesser court actors and 50 court-specific scene clips, but no King actor. Scene clips are not automatically combat WSS mappings.
- Current encounter code calls scripted mob skills and ordinary actor lifecycle. It does not explicitly play the recovered arena schedulers or dedicated body schedulers for entrances, ritual, revival, King arrival, corpse poses, or victory.

## Scope and counts

Direct root: `client/chara/mon/m701`

| Kind | Files | Bytes |
|---|---:|---:|
| `act` | 47 | 7,445,016 |
| `equ` | 63 | 22,605,616 |
| `skl` | 1 | 17,104 |
| **Total** | **111** | **30,067,736** |

The 47 ACT files are exactly:

- FID: `cmn/fid/base/1098`
- LIB: `0710`, `0711`, `0720`, `0725`, `0726`, `0727`, `0730`, `0740`, `0750`, `0751`, `0752`, `0753`, `0754`, `0755`, `0756`, `0774`
- BID: `mon_sp/cmn/act/cmn/BID/0000`
- BTL: `mon_sp/cmn/act/cmn/BTL/0001`
- MGC: `mon_sp/cmn/act/cmn/MGC/0001`–`0004`
- WSS: `mon_sp/cmn/act/cmn/WSS/0001`–`0023`, plus `0025`

Direct action containers expose 329 top-level entries: 1 CIBC, 48 CIBT, 76 MCB, 76 MTB, 41 RES, and 87 SCB. Following nested RES references yields:

| Type | Count | Type | Count |
|---|---:|---|---:|
| ACB | 44 | CIBC | 1 |
| CIBT | 50 | LEAF | 44 |
| MCB | 97 | MTB | 97 |
| RES | 42 | SCB | 114 |
| VEFF | 44 | VINS | 44 |
| VMDL | 249 | VTEX | 276 |
| **Total** | **1,102** |  |  |

Depth is 329 outer resources, 744 at nested depth 1, and 29 at nested depth 2.

## Runtime actor and appearance resolution

### Exact same-ID join

`Map Server/Actors/Chara/Npc/Npc.cs:117` calls `LoadNpcAppearance(actorClass.actorClassId)`. Therefore fight classes `2210401`–`2210408` resolve the **same-ID** `gamedata_actor_appearance` rows.

Values `3210401`–`3210408` found in another class-table field must not be treated as the live appearance binding. That appears to be a schema/recovery-era reference field; current runtime code explicitly uses `actorClassId`. All eight same-ID appearance rows use base `10701`, which resolves to installed monster `m701`.

### All eight court variants

| Class ID | Client path / fight name | Role | Size | Head | Body | Hands | Installed interpretation |
|---:|---|---|---:|---:|---:|---:|---|
| 2210401 | `MoogleDarkTanker` / Whiskerwall Kupdi Koop | Tank | 5 | 1024 | 2048 | 2048 | `e001` head; `e002` top variant 0; `e002` gloves |
| 2210402 | `MoogleDarkAttacker` / Ruffletuft Kupta Kapa | Melee | 5 | 1024 | 2080 | 3072 | `e001` head; `e002` top variant 1; `e003` gloves |
| 2210403 | `MoogleDarkHealer` / Furryfoot Kupli Kipp | Healer | 5 | 1024 | 2112 | 4096 | `e001` head; `e002` top variant 2; `e004` gloves |
| 2210404 | `MoogleDarkSniper` / Woolywart Kupqu Kogi | Sniper | 5 | 1024 | 2144 | 5120 | `e001` head; `e002` top variant 3; `e005` gloves |
| 2210405 | `MoogleDarkNuker` / Pukla Puki the Pomburner | Nuker | 5 | 1024 | 2176 | 6144 | `e001` head; `e002` top variant 4; `e006` gloves |
| 2210406 | `MoogleDarkBuffer` / Puksi Piko the Shaggysong | Buffer | 5 | 1024 | 2208 | 7168 | `e001` head; `e002` top variant 5; `e007` gloves |
| 2210407 | `MoogleDarkDebuffer` / Pukna Pako the Tailturner | Debuffer | 5 | 1024 | 2240 | 8192 | `e001` head; `e002` top variant 6; `e008` gloves |
| 2210408 | `MoogleDarkKing` / Good King Moggle Mog XII | King | 6 | 9216 | 2272 | 9216 | crowned `e009` head; `e002` top variant 7; `e009` gloves |

The direct tree also contains an `e001` top and `e010` head. Neither is selected by these eight same-ID rows; they remain installed-but-unassigned in this fight audit.

Current named role surface:

| Actor | Named action(s) in current encounter |
|---|---|
| Whiskerwall | Whisker Bash |
| Ruffletuft | Moogle-Go-Round |
| Furryfoot | Cure IV (`29013`, generic spell surface) |
| Woolywart | Eye Shot |
| Pukla Puki | Pom Flare |
| Puksi Piko | Maximoogle |
| Pukna Pako | Mognesia; Break |
| King | Mogdive; abilities learned from dead retainers |

These names identify roles, not proven retail WSS joins.

## Common FID and all LIB emotes

All recovered body clips here use 41 bones at 30 fps.

FID `1098` is 61,904 bytes, SHA-256 `0c6dc3d2872ac2cf6123fa525214bdd81c0aef73bde8768131901aadcaff01c4`. It includes `cbnm_id0` (120f / 4.000s), `cbfm_talk01` (80f / 2.667s), `cbfm_talk02` (115f / 3.833s), and a nested `fxpf_idle` path.

| LIB | Motion/meaning | Frames | Seconds | Bytes | SHA-256 prefix |
|---:|---|---:|---:|---:|---|
| 0710 | `cbfm_talk01` / talk 1 | 80 | 2.667 | 18,816 | `090b83…` |
| 0711 | `cbfm_talk02` / talk 2 | 115 | 3.833 | 25,888 | `2b81dc…` |
| 0720 | `cbfm_talk_ang01` / angry talk | 86 | 2.867 | 22,768 | `c08b…` |
| 0725 | joy | 105 | 3.500 | 26,544 | `2995…` |
| 0726 | surprised | 92 | 3.067 | 21,264 | `5871…` |
| 0727 | sad | 110 | 3.667 | 25,776 | `0575…` |
| 0730 | sigh | 105 | 3.500 | 22,592 | `cd49…` |
| 0740 | give | 100 | 3.333 | 19,344 | `1083…` |
| 0750 | watch/look | 120 | 4.000 | 23,648 | `65b0…` |
| 0751 | bye-bye | 80 | 2.667 | 20,320 | `d12b…` |
| 0752 | eat | 160 | 5.333 | 38,864 | `ff20…` |
| 0753 | dance | 405 | 13.500 | 98,128 | `cc90…` |
| 0754 | `kashige` / head tilt | 120 | 4.000 | 24,064 | `b793…` |
| 0755 | jump | 80 | 2.667 | 19,536 | `aee1…` |
| 0756 | `dance_mv` / moving dance | 405 | 13.500 | 99,024 | `2740…` |
| 0774 | bound/bounce | 80 | 2.667 | 19,824 | `7a71…` |

This confirms talk, joy, surprise, sadness, sighing, giving, watching, waving goodbye, eating, dancing, head tilt, jumping, moving dance, and bouncing animation surfaces in addition to combat actions.

## Complete 24-file WSS inventory

Every body motion below uses 41 bones at 30 fps. `Root` means a paired `cbbr` root-motion track exists. All WSS containers have a 9-second outer scheduler envelope and reference generic `chr/sch/mon/cmn/ws/main`; the listed activation time is not necessarily damage timing.

| WSS | Bytes | SHA-256 | Body motion(s) | Moogle/monster scheduler activation | Sound | Rec. total |
|---:|---:|---|---|---|---|---:|
| 0001 | 180,752 | `1c3991e263a69a2c189289bd3c6a832c9b90725f4a8a25b8d172949537b2d1e1` | `sp_a01_1` 26f/.867s; `sp_a01_2` 36f/1.2s; Root | `mowgli_701/skl01`: `mon_main` .62s/8; `m701_0001` .33s/5 | yes | 34 |
| 0002 | 286,912 | `e131884307951b3a6c0711f894597c8d6010577b01bf4525aae96e35254b05e4` | `sp_a02_1` and `_2`, 34f/1.133s; Root | `skl10`: `m701_0010` .50s/5; `mon_main` 1s/11 | yes | 51 |
| 0003 | 292,928 | `e529e48722ae649a8a9d645b5341ca5d518fc3f01e0dfe0f21768c741e91f6f9` | `sp_01` 60f/2s | `skl02`: `m701_0002` .55s/4; `mon_main` 1s/10 | yes | 39 |
| 0004 | 258,208 | `b3e376a6b2aa5495c0ec1e7e97dd7ba17ab2231e900148134de3af8bc61792f2` | `sp_a01` 90f/3s | `skl03`: `m701_0003` 1s/4; `mon_main` 1.2s/9 | yes | 38 |
| 0005 | 260,088 | `b0dbda48664ac29832f61525095aa926b738a402675072a1728c3294ae2e90f0` | `sp_b01_1` 20f/.667s; `_2` 39f/1.3s; Root | `skl04`: `m701_0004` 1.6s/4; `mon_main` 1.57s/9 | yes | 41 |
| 0006 | 398,664 | `149b26e8fa8d74769d29902d470ec16b423126ced4c070b2306d67717d967557` | `sp_03` 70f/2.333s | `skl05`: `m701_0005` .61s/5; `mon_main` 1.5s/11 | yes | 63 |
| 0007 | 430,752 | `a85035f95dff8f2f08833c486c1cfc800806913460d3ddc5687621f59dfb2125` | `sp_a02` 70f/2.333s | `skl11`: `m701_0011` .6s/5; `mon_main` 1.71s/11 | yes | 64 |
| 0008 | 468,224 | `a1cce1872aa2a107286449f4d49c1ebbb8986ebd99f1419b818ff09a1c5b640c` | `sp_b01` 70f/2.333s | `skl06`: `m701_0006` .6s/4; `mon_main` 2s/9 | yes | 54 |
| 0009 | 262,656 | `05d7dc86c715f50b3d678c3d93798f0b848cfdcd1a4853face75b52c9221a5ca` | `abl_3` 65f/2.167s; Root | `skl07`: `m701_0002` 1.37s/5; `mon_main` 1s/9 | yes | 37 |
| 0010 | 231,792 | `8a5ab59fd630682f1a9405b57fb11c2d9d9d5f566aef6bed6ecbe6ff68cdf4b6` | `sp_a03` 90f/3s | `skl08`: `m701_0008` 1s/4; `mon_main` 1.2s/10 | yes | 37 |
| 0011 | 510,672 | `5321e768ba84b5313051b132f72c4dfe93109d712ec9f1264ab9f825aa820046` | `sp_b02` 60f/2s | `skl09`: `m701_0009` 1.5s/3; `mon_main` 1.5s/9 | yes | 54 |
| 0012 | 152,000 | `9c74dc6a1e4a0208d3ed4baf2d33709115f6b1e00ccac2686550c1dd3d28de93` | `sp_04` 45f/1.5s | `skl19`: `mon_main` .85s/10; no actor scheduler | yes | 25 |
| 0013 | 163,160 | `2ec87421a95773a557f035795c52323e2b6b0a23a42776797d0d2c94133be7db` | `sp_05` 40f/1.333s | `skl20`: `mon_main` .79s/8; no actor scheduler | yes | 26 |
| 0014 | 257,088 | `8f33cdb53a2de4d95b1ed62d9aee42ba6d66153abb1faf171ec73483f74c8d83` | `sp_06` 120f/4s | `skl16`: `mon_main` 1.2s/8; no actor scheduler | yes | 36 |
| 0015 | 166,176 | `89b5ff938076eff017a3c153b2bbcec10047e4e9d87b80b85d1c1a9720084cfb` | `sp_07` 30f/1s | `skl12`: `mon_main` 1.13s/7; no actor scheduler | yes | 25 |
| 0016 | 205,984 | `1dae12e732b2749d9a80f4b1e17a4dc2bc3ad3735d49f5ffe221941686cca1bb` | `sp_08` 30f/1s | `skl13`: `mon_main` 1.1s/10; no actor scheduler | yes | 34 |
| 0017 | 21,360 | `ac8f31ab87d974660ea44943c417d6879d1c52ef1ad87924cbf804982bdc93af` | `sp_14` 80f/2.667s | `m701/wss/ws_102/bin/mon_main` .8s/6; no nested VFX RES | no | 5 |
| 0018 | 244,504 | `8389a1cc490bb522390ba07423a5681f6995c08544930d4a17711f5a08a94e9a` | `sp_09` 50f/1.667s | `skl21`: `mon_main` 1s/9; no actor scheduler | yes | 27 |
| 0019 | 28,688 | `089e090ec2a69e1c74b263c5ff05f435d8a0b5cea06938ba2a31ce7a328e04e2` | `sp_10` 91f/3.033s | `skl14/main`: `mon_main` 1s/2; no nested VFX RES | no | 5 |
| 0020 | 315,008 | `edc5d2829057caf71afc555a56e43bb651b30a3dcc3fbf208e027fd864cad955` | `sp_11` 90f/3s | `skl15/main`: `mon_main` .9s/8; no actor scheduler | yes | 35 |
| 0021 | 366,192 | `fd17dcfa180888f72a8ddc8bc0bbc08329289e9710e50130fa6f678a6a1c1571` | `sp_12` 85f/2.833s | `skl17`: `m701_0017` 1.5s/4; `mon_main` 1.76s/9 | yes | 42 |
| 0022 | 193,704 | `f5dee67e0e59c793bcd76291703360a22865c3f43f3ce5ca403f90ebcdbd64dc` | `atk_a_1`, `_2`, each 35f/1.167s; Root | `skl22`: `m701_0022` .6s/4; `mon_main` .7s/8 | yes | 35 |
| 0023 | 67,232 | `d934bf2be95b04ea4ee57f706654a5a401508c0e027c3ff9aa66d0ac1b7b4c79` | `sp_13` 78f/2.6s | `skl18`: `mon_main` .85s/6; no actor scheduler | no | 13 |
| 0025 | 360,704 | `fdf80fc970f70c0150c8bda087c397e47f8919b0f2d6878f9aaef69e77c6d58f` | `abl_3` 65f/2.167s; Root | `skl25`: `m701_0025` .45s/4; `mon_main` .86s/9 | yes | 44 |

### Recursive type census per WSS

Columns are ACB/CIBT/LEAF/MCB/MTB/RES/SCB/VEFF/VINS/VMDL/VTEX.

| WSS | Type counts in the order above | Total |
|---:|---|---:|
| 0001 | 1/2/1/4/4/1/3/1/1/7/9 | 34 |
| 0002 | 3/2/3/4/4/1/3/3/3/10/15 | 51 |
| 0003 | 3/1/3/1/1/1/3/3/3/12/8 | 39 |
| 0004 | 2/1/2/1/1/1/3/2/2/9/14 | 38 |
| 0005 | 2/2/2/4/4/1/3/2/2/11/8 | 41 |
| 0006 | 4/1/4/1/1/1/3/4/4/17/23 | 63 |
| 0007 | 4/1/4/1/1/1/3/4/4/17/24 | 64 |
| 0008 | 2/1/2/1/1/1/3/2/2/18/21 | 54 |
| 0009 | 2/1/2/2/2/1/3/2/2/9/11 | 37 |
| 0010 | 3/1/3/1/1/1/3/3/3/10/8 | 37 |
| 0011 | 2/1/2/1/1/1/3/2/2/18/21 | 54 |
| 0012 | 1/1/1/1/1/1/2/1/1/8/7 | 25 |
| 0013 | 1/1/1/1/1/1/2/1/1/9/7 | 26 |
| 0014 | 1/1/1/1/1/1/2/1/1/11/15 | 36 |
| 0015 | 1/1/1/1/1/1/2/1/1/6/9 | 25 |
| 0016 | 3/1/3/1/1/1/2/3/3/8/8 | 34 |
| 0017 | 0/1/0/1/1/0/2/0/0/0/0 | 5 |
| 0018 | 1/1/1/1/1/1/2/1/1/8/9 | 27 |
| 0019 | 0/1/0/1/1/0/2/0/0/0/0 | 5 |
| 0020 | 1/1/1/2/2/1/2/1/1/12/11 | 35 |
| 0021 | 2/1/2/1/1/1/3/2/2/13/14 | 42 |
| 0022 | 1/2/1/4/4/1/3/1/1/8/9 | 35 |
| 0023 | 1/1/1/1/1/1/2/1/1/2/1 | 13 |
| 0025 | 2/1/2/2/2/1/3/2/2/14/13 | 44 |

## WSS mapping boundary

The sequence `command = 23413 + WSS` yields a conspicuous **candidate-only** table:

| WSS candidate | Command candidate | Current name |
|---:|---:|---|
| 1 | 23414 | Mogdive |
| 2 | 23415 | Whisker Bash |
| 3 | 23416 | unknown |
| 4 | 23417 | Moogle-Go-Round |
| 5 | 23418 | unknown |
| 6 | 23419 | ranged attack |
| 7 | 23420 | Eye Shot |
| 8 | 23421 | Pom Flare |
| 9 | 23422 | Maximoogle |
| 10 | 23423 | Mognesia |
| 11 | 23424 | Memento Moogle |
| 12–23 | 23425–23436 | unknown rows |
| absent 24 | 23437 | row exists; direct WSS24 does not |
| 25 | 23438 | Break |

This is **not** a recovered retail mapping. Do not turn it into data without captures or another authoritative join.

Current rows instead select:

| Commands | Current selector |
|---|---|
| `23414`, `23415`, `23417`, `23420`, `23421`, `23422`, `23423`, `23438`, `23451` | `0x13001000` → WSS1 |
| `23424`, `23452` | `0x13002000` → WSS2 |
| `23453` | `0x13003000` → WSS3 |

Thus the current repeated animation is explained by row selection, not missing client files. Cure IV `29013` is a generic player/cure spell surface. A retail one-to-one WSS assignment remains unresolved.

## BID, BTL, MGC, VFX, and sound

### BID `0000`

Size 611,712; SHA-256 `9b0c73a319c1817a96507ec8c6c3799f9c08e96e243a78c01aa0c17965fb7514`. All 24 body tracks are 41-bone/30-fps.

| Surface | Exact clips |
|---|---|
| Damage | `cbba_add_dmg_f`; `cbba_dmgh_b/f/l/r`, each 29f/.967s |
| Movement | `cbbm_01f_lp0` 64f/2.133s; `cbbm_02f_lp0` 48f/1.6s; matching normal forms |
| Idles | `cbbm_id0` 90f/3s; `cbnm_id0` 120f/4s |
| Loops | `cbbm_wekid_2lp` 100f/3.333s; `cbnm_wekid_2lp` 120f/4s; `cbbm_abl_2lp` 40f/1.333s; `cbbm_sp_a_2lp` 72f/2.4s; `cbbm_sp_b_2lp` 50f/1.667s |
| Lifecycle | `cbbm_activ` and `cbbm_deact`, each 30f/1s |
| Staged death | `cbbm_ft_ded_1` 40f/1.333s; `ft_ded_2lp` 4f/.133s; `ft_ded_3` 36f/1.2s |
| Corpse/state | `cbbm_dedpose` 100f/3.333s; `cbbm_msb5_1` identical payload; `cbbm_msb6_1` 91f/3.033s |

BID nested schedulers include identical cast payloads `cas00`, `cas90`, `casa0`, plus `itm00`, `casb0`, generic `cast_mon_11`–`17`, and state pairs `init_msb3_0/1` through `init_msb7_0/1`. `init_msb6` nests `cbbm_msb6_1`. Exact MSB meanings are unknown; they cannot safely be relabeled summon/revive/entrance.

### BTL `0001`

Size 45,264; SHA prefix `2e76df…`. It contains body/root `atk_a_1`, `atk_a_2`, and `atk_a_rac`, each 35f/1.167s, plus generic `pc/cmn/attack_m/main` and Moogle `atk10`, `rac10`, `atk20`, `rac20` schedulers.

### MGC `0001`–`0004`

All four are byte-identical: 19,072 bytes, SHA-256 `4f6b71490669d73d3be1d81562505a65f8b5089f0f9f0c1de45c307ea5c63e41`. Each contains body/root `abl_3` 65f/2.167s plus generic `shoot/mag_r1/main`, Moogle `emp_emp`, and `sht00` scheduler paths.

### VFX and audio

WSS nested graphs total 44 VEFF, 44 VINS, 249 VMDL, and 276 VTEX. Playing only skeletal MTB motion can therefore omit a substantial scheduled VFX layer.

External `client/vfx/mgc/1135` is 235,376 bytes, SHA-256 `25d6f06e472cccca57f186ba95c5b808b55fc5b0930d23fcd424c7a960f74e6f`, and contains literals `m701_0025` and `m701_tar`. That is strong WSS25/Break-family evidence, not independent command dispatch proof.

`RaptureSoundClip` occurs in WSS1–16, 18, 20–22, and 25; it is absent from 17, 19, and 23. Numeric audio event IDs were not safely decoded. Equipment sound containers exist at `e001/top_snd/0000` and `e002/top_snd/0000`–`0007`, all 940 bytes; the latter are eight distinct payload hashes. The skeleton exposes foot events `EID_SE_FOOT_L/R`.

## Direct model/equipment surface

The 63 EQU files exhaustively cover these installed paths/patterns:

| Equipment | Files represented | Key sizes / SHA prefixes |
|---|---|---|
| `e001` | `met_mdl/0000`; `top_mdl/0000`; `top_snd/0000`; `top_tex/0001`,`0002` | 4,192 `06cbff…`; 248,868 `babc82…`; 940 `db9eb5…`; 395,008 `45629c…`; 1,574,656 `a3ed90…` |
| `e002` gloves | `glv_mdl/0000`; `glv_tex/0001`,`0002` | 78,448 `a32b…`; 98,944 `0c26…`; 393,856 `ed2b…` |
| `e002` head | `met_mdl/0000` | 4,192 `06cbff…` |
| `e002` tops | `top_mdl/0000`; `top_snd/0000`–`0007`; `top_tex/0001/0000`–`0007`; `top_tex/0002/0000`–`0007` | model 258,272 `865265…`; eight 940-byte sound payloads; diffuse 395,008 each; large textures 1,574,656 each |
| `e003` | glove model and two textures; common head | 52,928 `8cc6…`; 98,944 `9c35…`; 393,856 `5250…`; head 4,192 |
| `e004` | glove model and two textures; common head | 32,848 `54f3…`; 49,792 `a3f1…`; 197,248 `7431…`; head 4,192 |
| `e005` | glove model and two textures; common head | 115,424 `36ab…`; 148,528 `09d0…`; 590,896 `e106…`; head 4,192 |
| `e006` | glove model and two textures; common head | 42,272 `4a50…`; 49,792 `9451…`; 197,248 `0d7c…`; head 4,192 |
| `e007` | glove model and two textures; common head | 36,112 `ea45…`; 49,792 `0136…`; 197,248 `cd68…`; head 4,192 |
| `e008` | glove model and two textures; common head | 106,288 `df4e…`; 99,376 `d015…`; 394,288 `f8a2…`; head 4,192 |
| `e009` | King glove model/two textures and crowned head | 78,816 `8926…`; 98,944 `cf7e…`; 393,856 `8a4c…`; head 329,568 `64fd…` |
| `e010` | head model | 4,192 `06cbff…` |

For `e002` top textures, variant 0 has distinct hashes (`79bb…` and `4c157f…`); variants 1–7 share identical payload hashes within each texture tier (`e9af4b…` and `6dfe24…`). The eight top sound hashes are distinct: `72c845…`, `c0131c…`, `167a0d…`, `1c3b79…`, `f08b24…`, `beea28…`, `e1d268…`, `e055f7…`.

The standalone `skl/0001` is 17,104 bytes, SHA-256 `f63727a8bcef3bf04b2309ab760fc742f3217ab64b08e07504886f0fa0143b46`.

## Thornmarch battlefield and native selector

### Region contract

`data/03/C0/00/00.DAT` is a 52,336-byte RegionResourceData file, SHA-256 `c04b0d998aea4c1b13ed322292a5aa5af45485c698da2315171c3c024bcb9a74`.

- Region parent row: ID `103`, token `fst_f0`, 32 children.
- Zone-layout child: ID `304`, token `fst_f0_fld04`, key `0x29B00006`.
- Native primal/weather child: ID **8028**, token `wtr_smmn`, key **`0x29B0001E`**.

The installed RegionResourceData does not contain a direct child row `8073`. Current server scripts use `8073` as an additive/separated Moogle label, while the installed native region selector remains **8028 → `29B0001E`**. These are separate layers and must not be conflated.

Current zone SQL identifies zone `238`, region `103`, `fst0Field04`, Thornmarch, music `97`.

### Arena layout

`data/29/B0/00/06.DAT` is MapLayoutResourceData, 1,692,336 bytes, SHA-256 `f539b71233efa49c3f869d88ca494ab88db2a55487f2a2c64543bbaf0091d7fa`.

Header: version 1.1.0, table size `0x5C20`, 735 records / 737 slots, payload starts `0x5C60`; embedded resource census is 29 SCB, 3 MTB, 1 LYB.

Exact Moogle arena names:

- Ring groups: `sgrp_f0f0_mog_ring_h`, `f0f0_mog_ring_h`, `attr_f0f0_mog_ring_a`, `isgrp_mog_ring`.
- Prop/model groups: `f0f0_mog_w001_h`, `f0f0_mog_w002_h`, `f0f0_mog_w003_h`, `f0f0_mog_w004_h`.
- Declared instances: `w1_01`–`w1_04`, `w2_01`–`w2_12`, `w3_01`–`w3_04`, and `w4_01`–`w4_04`.

### Exact show/hide scheduler names

| Surface | Show scheduler | Hide scheduler | Bytes each | Recovered action |
|---|---|---|---:|---|
| Ring model + collision | **`time_mog_ring_show`** | **`time_mog_ring_hide`** | 896 | two ShowHideClip entries; show bytes 1, hide bytes 0 |
| Wall/prop 001 | **`time_mog_w001_show`** | **`time_mog_w001_hide`** | 816 | one ShowHideClip; 1 → 0 |
| Wall/prop 002 | **`time_mog_w002_show`** | **`time_mog_w002_hide`** | 816 | one ShowHideClip; 1 → 0 |
| Wall/prop 003 | **`time_mog_w003_show`** | **`time_mog_w003_hide`** | 816 | one ShowHideClip; 1 → 0 |
| Wall/prop 004 | **`time_mog_w004_show`** | **`time_mog_w004_hide`** | 816 | one ShowHideClip; 1 → 0 |

All use a 9-second envelope. Exact embedded offsets are ring show `0x19A750`, ring hide `0x19AAD0`, then w001 show/hide `0x19AE50`/`0x19B180`, w002 `0x19B4B0`/`0x19B7E0`, w003 `0x19BB10`/`0x19BE40`, and w004 `0x19C170`/`0x19C4A0`.

The sequential names, paired payloads, and action-byte flip are exact authored battlefield-control evidence. Current Moogle source does not call these schedulers.

### Arena dependency files

| Purpose | DAT | Bytes | SHA-256/prefix |
|---|---|---:|---|
| Ring model | `data/72/E9/01/C0.DAT` | 86,450 | `6d0da620…` |
| Ring collision | `data/72/E7/04/25.DAT` | 8,656 | `30b4c3…` |
| Wall/model 001 | `data/72/E9/01/C2.DAT` | 29,176 | `b8064a…` |
| Wall/model 002 | `data/72/E9/01/C3.DAT` | 36,936 | `2463de…` |
| Wall/model 003 | `data/72/E9/01/C4.DAT` | 32,552 | `a39c72…` |
| Wall/model 004 | `data/72/E9/01/C5.DAT` | 29,576 | `a46202…` |
| File-set manifest | `data/29/AB/00/09.DAT` | 1,165,478 | `a27d0a8…` |

The collision geometry has local X/Z bounds approximately `-29.615..29.615`, establishing an approximately 29.6-unit circular footprint. Current source uses center `(-2350, -22.85, -890)` and a conservative 29-unit shell boundary. The layout ring world-transform format was not safely decoded, so local geometry is evidence, not a world-origin prescription.

### Recovered prop placement records

The record grammar produced 21 concrete world-position triples:

| Group | Positions `(x, y, z)` |
|---|---|
| w1 | `01 (-2336.189,-1.841,-963.409)`; `02 (-2289.911,-20.795,-876.032)`; `03 (-2402.089,-23.571,-861.673)`; `04 (-2389.818,-23.377,-845.553)` |
| w2 | `01 (-2327.012,-23.808,-871.055)`; `02 (-2338.799,-23.517,-921.975)`; `03 (-2315.430,0.008,-959.433)`; `04 (-2326.687,-23.102,-921.217)`; `05 (-2371.827,-23.603,-939.002)`; `06 (-2424.176,-22.468,-931.299)`; `07 (-2372.180,-23.618,-928.936)`; `08 (-2402.669,-23.745,-918.563)`; `09 (-2447.643,-10.801,-832.020)`; `10 (-2397.450,-28.055,-899.844)`; `11 (-2425.160,-22.911,-837.232)`; `12 (-2338.923,-24.332,-887.171)` |
| w3 | `01 (-2416.979,-23.349,-861.587)`; `02 (-2405.523,-8.874,-959.204)`; `03 (-2339.164,-11.497,-895.499)`; `04 (-2342.053,-0.574,-965.886)` |
| w4 | `01 (-2444.937,0.538,-912.944)` |

Strings for `w4_02`–`w4_04` exist, but the same placement grammar did not yield matching concrete records. Do not fabricate their transforms.

## Moogle primal atmosphere

`data/29/B0/00/1E.DAT` is 88,912 bytes, SHA-256 `1b9ca79a141a8cfd4cd6cc28d4497cd14222d5c6b79137f25beb548e1c5f468a`.

It contains 23 active entries / 25 slots, 12 SCBs, and 62 MTBs. Exact named surfaces include `moguri01`, `sdef_mog_loop`, `sdef_mog_spot`, `cbind_mog`, `time_wtr_00`, and `envmap_smmn`.

Moogle-specific dependencies:

| Kind/token | Key | Bytes | SHA-256/prefix |
|---|---|---:|---|
| VTEX `moglow4_o` | `61A90012` | 4,276 | `e73e…` |
| VTEX `mogglow2o` | `61A90068` | 2,228 | `fa21…` |
| VMDL `moglow41o` | `5D1E008A` | 5,304 | `61d3…` |
| VMDL `moglow2o` | `5D1E00C4` | 5,304 | `27f6…` |
| VEFF `moguri01o` | `5D21008A` | 12,988 | `18ab…` |
| LEAF `cam_mogfi` | `5D1F000E` | 1,081 | `8284…` |
| VINS | `5D200016` | 1,616 | `86f…` |

The dependency closure is 21 files / 7,871,330 bytes, or 7,960,242 including the wrapper. It includes four `win0` motion tracks, duplicate environment textures, six sky textures, and two SSCF resources. The 12 atmospheric schedulers control outside environment, sky/star/sun/moon/fog, cloud lights, main light/fog/environment map, fog/light phases, and final material lighting. Eleven active tracks are about 2.4 seconds inside 9-second envelopes; the final material-lighting track is 24 seconds. These are arena atmosphere animations, not Moogle body attacks.

## Cutscene and external Moogle dependencies

### Thornmarch bundle `sum6m000`

File size 10,431,968; SHA-256 `d393cf0811f3d26543057ada07a7fbdae551c9a606b4345ce48001869f4b9259`.

Recursive census: 270 resources — 72 MCB, 72 MTB, 22 VMDL, 21 VTEX, 14 each of VEFF/LEAF/VINS/ACB, 13 RES, 13 unknown `ccb`, and 1 SCB.

Exact court aliases:

| Alias | Dataset | Class | Role |
|---|---:|---:|---|
| `m701b0` | 11001 | 2210401 | Tank |
| `m701c0` | 11002 | 2210402 | Attacker |
| `m701d0` | 11003 | 2210403 | Healer |
| `m701e0` | 11004 | 2210404 | Sniper |
| `m701f0` | 11005 | 2210405 | Nuker |
| `m701g0` | 11006 | 2210406 | Buffer |
| `m701h0` | 11007 | 2210407 | Debuffer |

No actor record for class `2210408` was found in this bundle.

All 50 court scene clips are 41-bone/30-fps:

- Tank b: `b02` 5s, `b03` 10s, `b06` 6s, `b07` 10s, `b08a` 4s, `b09` 2s, `b10` 3s, `b11` 4s, `b08b` 5.667s, `b08c` 1s.
- Attacker c: `c03` 10s, `c05` 2s, `c06` 6s, `c07` 10s, `c08a` 4s, `c08b` 5.667s, `c08c` 1s.
- Healer d: `d03` 10s, `d04` 4.667s, `d06` 6s, `d07` 10s, `d08a` 4s, `d08b` 5.667s, `d08c` 1s.
- Sniper e: `e03` 10s, `e06` 6s, `e07` 10s, path/ID inconsistency `f08a` 4s, then `e08b` 5.667s, `e08c` 1s.
- Nuker f: `f03` 10s, `f04` 4.667s, `f07` 10s, `f08a` 4s, `f08b` 5.667s, `f08c` 1s.
- Buffer g: `g03` 10s, `g04` 4.667s, `g06` 6s, `g07` 10s, `g08a` 4s, `g08b` 5.667s, `g08c` 1s.
- Debuffer h: `h03` 10s, `h05` 2s, `h06` 6s, `h07` 10s, `h08a` 4s, `h08b` 5.667s, `h08c` 1s.

These animations are authored to a scene timeline. They are evidence for role-specific acting/entrance material, not direct combat-command selectors.

### Other literal Moogle cut bundles

A whole-client literal sweep for `m701` / `skl_m701b001` found 20 CUT bundles:

| Cut bundle | Bytes | SHA-256 |
|---|---:|---|
| `com0g610` | 963,216 | `c2e0adb676a434ce5e2c511ed28f0b293a96cd473dee343e94f2e3601004a366` |
| `gld30040` | 58,976 | `3d481aa2319f71a2dd9427bb2395d6ed9b192b1c07535b6b88bca6b2a3a976ee` |
| `gld30050` | 20,864 | `19710a722793354a6e211a84e2e61d0405c82d6224e18033dbbff3b69efc5e7f` |
| `hrv20020` | 103,104 | `145e22781b2e3b825de0f31ecbeafb4cda7ca4642f2d065ee4236c884e0d982b` |
| `hrv30660` | 219,088 | `b1f46ec44c11e423b756d9edec96dae9d02a3bc2c6900783469978c420fe404e` |
| `hrv40020` | 312,704 | `2fae93e8442e530a613e517f24beafe7547f22196fe92aa678db3107ebe1598e` |
| `lnc20020` | 145,520 | `b1ca72c3e2619fa2ad8e0cc44bd0fe3324d760013335ce38191e7f82c2748f67` |
| `lnc30060` | 474,992 | `9e41ce50c27444ed39015cf307822201d9fa60a8cb7f9bd5a7e3cf37172a1fc5` |
| `lnc30065` | 95,152 | `4ace45edf451ac8a76e337b7cc5fc6ec1b0bb4dff4f4f30729cd41c1574fbbca` |
| `lnc30630` | 142,640 | `7e352452b347e56a3aab5281fc1e243e0e51e137f81c6b20c6ec638595d06a9f` |
| `lnc30640` | 268,320 | `6d64eb4bfe50b68d11791aa63385dadc16b04e7240659a026f752b2acc324f36` |
| `man0g020` | 8,786,144 | `7bab2b8077ea70c3a0cc2fea742cd359e5f14e88019c2225467ddee2df5de61e` |
| `man0g181` | 205,184 | `83f17dc30f30a2d5eea6d155624cea48df5225214bc37b7ae3058343205e5043` |
| `man1g060` | 219,280 | `e16c90812e22375b2c1b435064810928b747d52232594809b25e3d171dea8282` |
| `man1g070` | 564,640 | `449f5829c44c233fb499b1bce0f48e694517cf13aba6f737817ff1dde8034421` |
| `man2g000` | 9,608,688 | `c895ce29d8f28246cfe9f6238e364754c82f1e003c43fd15289ec616f8b7cc19` |
| `man2g060` | 335,552 | `9b4586ba76f5b19f31badce00e565abe08f9059fd12440e5c2e0e49edceee75f` |
| `sum6m000` | 10,431,968 | `d393cf0811f3d26543057ada07a7fbdae551c9a606b4345ce48001869f4b9259` |
| `whm0j110` | 1,155,472 | `4f76ea160ee9a28ab9ac27595333f84cb4b3884dfd8cbe1d88d7174f3ff08471` |
| `whm0j210` | 457,728 | `c2f292612b0c802251ed30f3af96a922391568b166e3d84f8d9327485be95af9` |

Most only reference the skeleton. `man0g020` has five generic class-6000250 Moogle aliases and 29 event clips; `man2g000` has a generic Moogle alias with two clips; `whm0j110` has class-1001937/1001938 Moogle aliases with idle/event clips. These are non-fight/cutscene surfaces and cannot be reassigned to court abilities from literal presence alone. Hashed/numeric-only references can evade a literal sweep.

## Current encounter lifecycle and what is still missing

Exact current flow from `MoogleEncounter.lua`:

1. Whiskerwall spawns first and waits for engagement; the other six are shuffled and enter every 40–50 seconds.
2. Lesser actions alternate role abilities and Mogdive on roughly 9–13-second scheduling.
3. When all seven are dead or the elapsed timer reaches 5m30s, phase 2 begins. Living phase-one actors are moved into a radius-6 ring. The King is spawned immediately and receives `DamageTakenDown +100`: strong mitigation, not categorical invulnerability, because physical post-mitigation zero can still be clamped to a level-based damage floor.
4. Memento chooses current rows/damage by survivors: zero `450/23424`, one `1800/23451`, two `3500/23452`, more than two `9999/23453`.
5. Five seconds later, phase-one actor records are despawned and seven **fresh** lesser actors are spawned; the King's `DamageTakenDown +100` modifier is removed.
6. The King learns each dead retainer's current role skill and alternates learned actions with Mogdive. On the next encounter update, Maximoogle increases a selected living Moogle/King's appearance size by two steps, capped at size 7; it applies invulnerability and damage/auto-attack bonuses for 30 seconds, then reverses the temporary state.
7. Victory requires King plus all seven phase-two retainers dead.

### Presentation gaps

- No explicit `PlayAnimation`/WSS scheduler call exists in `MoogleEncounter.lua` or `MoogleManager.cs`; casts rely on `ForceScriptedMobSkill` and selected command data.
- The seven phase-one bodies are despawned and replaced with fresh phase-two actors. No explicit staged `ft_ded`/`dedpose`, revival, flight/jump, teleport, or reactivation animation is selected.
- The King is spawned at ritual start under `DamageTakenDown +100` strong mitigation; no explicit King entrance/summon scheduler or King-specific cutscene actor binding was recovered.
- Memento's five-second ritual window is encounter logic. Its exact animation/VFX synchronization is not proven by the current code.
- Maximoogle uses temporary size/state/stat mutation. No dedicated proven WSS/VFX scheduler is selected for growth or shrink reversal.
- Role introductions, phase-two revival, learned-art feedback, final corpse poses, and victory performance have no explicit recovered body-scheduler calls.
- `time_mog_ring_show/hide` and all `time_mog_w001..004_show/hide` schedulers are present in client layout but are not called by the current encounter. The generic content shell/boundary is used instead.

### Reconnect and state-resynchronization gaps

- `MoogleManager` enables generic instance-raid bind and a 30-minute reentry expiry, so a generic reentry facility exists.
- The encounter itself snapshots members once at startup and keeps phase/action/buff/queue state only in its running Lua state table. This audit found no encounter-specific serialization or replay of phase state, remaining timer, active Maximoogle state, current King skill inheritance, queued casts, or arena scheduler visibility to a reconnecting client.
- Start, clear/fail, rewards, quest notice, and exit are sent only when the stored player object is currently in the content area and has a connected session. A disconnected player at completion does not receive those present-only calls in this routine.
- Therefore full reconnect/rejoin correctness is **not established**. Generic bind support should not be described as recovered encounter-state restoration.

### Cleanup gaps and boundaries

- Normal finish broadcasts result, sends present-player clear/fail, applies timers, waits eight seconds, exits connected players, then calls `ContentFinished`, `EndDirector`, and `CheckDestroy`.
- Director-creation failure explicitly finishes and destroys the new content shell.
- Final King/retainer despawn, queued-skill cancellation, active actor-state reversal, and scheduler hide calls are not individually authored in the encounter; cleanup is delegated to content/director destruction.
- Phase-two spawn failure occurs after phase-one actors have been despawned; it routes to generic failure cleanup rather than restoring prior actors.
- This is a source behavior audit, not proof that engine-level destruction leaks actors. It marks missing explicit encounter cleanup/replay hooks.

## Historical post-victory chest and Fretful Moogle evidence

Historical evidence is strong for **existence of the retail post-victory flow**, but it does not recover an arena object/model binding:

- Archived 1.x quest text for *A Feast of Fools* says victory spawns a treasure chest containing the reward and a Fretful Moogle used to leave the battlefield.
- Patch 1.20a records a bug in which opening the treasure chest after the Good King fight with little time remaining failed to extend time. This independently confirms that a post-victory chest existed.
- Current quest scaffold `Data/scripts/quests/sum/sum6m0.lua` records `thornmarchClear` but comments that the recovered content-exit scene still needs the missing Fretful Moogle actor.
- `DftFst.lua` identifies class `1001838` as a West Shroud Fretful Moogle/default-talk entry, and display-name data includes a Fretful Moogle string. Neither establishes that this class/appearance/model was the Thornmarch exit actor.

**Boundary:** this is chest/Fretful-Moogle **existence evidence only**. No exact chest model, chest layout instance, spawn transform, Fretful Moogle class-to-arena binding, appearance, scheduler, event packet order, or loot table was recovered here. Current code grants a provisional generated loot-list item and exits players to their recorded return point; it does not safely spawn the historical chest or exit Moogle.

## Findings most relevant to a future visual parity pass

Without changing data, the strongest test targets are:

1. Capture command animation selectors and scheduler packets from an authoritative retail trace, especially named role actions, Memento variants, Maximoogle, and King inheritance.
2. Test skeletal WSS plus nested RES/VFX as a pair. Body-only playback can explain animations that appear present but visually incomplete.
3. Recover MSB3–MSB7 runtime state selection before labeling BID state clips.
4. Recover or capture the exact ring/wall scheduler invocation lifecycle and native weather selection.
5. Treat `sum6m000` event clips as phase/acting candidates only; do not substitute them into combat without scheduler evidence.
6. Capture reconnect during each phase and during Maximoogle/Memento, then capture final cleanup, chest appearance, exit actor, and delayed reward flow.

## Uncertainties and explicit non-claims

- No retail one-to-one WSS-to-command mapping was proven.
- No WSS24 file was found in the direct installed `m701` action tree; this does not prove no hashed/external equivalent exists.
- Scheduler activation timestamps and event counts do not equal damage windows unless separately captured.
- Numeric sound event IDs remain undecoded.
- MSB state semantics remain unknown.
- The `sum6m000` sniper `f08a` path inconsistency is recorded as found, not silently corrected.
- Ring local geometry is exact enough for radius evidence; its world transform is not safely decoded.
- Native installed selector 8028 and current additive label 8073 are distinct facts, not interchangeable file rows.
- Literal searches can miss hashed or numeric-only dependencies.
- Historical chest/Fretful Moogle text proves the objects/flow existed, not their client model binding.

## Methodology and read-only attestation

Methods were limited to directory enumeration, size/hash calculation, binary signature/string scanning, existing resource-container parsing, scheduler/MTB inspection, and source/SQL reads to locate roots and identify current joins. No client or server input file was written.

The only output is this Markdown file.
