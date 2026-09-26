# Exhaustive Ifrit / Infernal Nail client-asset coverage audit

Snapshot date: **2026-08-02**  
Installed client: **2012.09.19.0001 (FFXIV 1.23b)**  
Direct roots: **`client/chara/mon/m852`** and **`client/chara/mon/m524`**

This is a read-only, Markdown-only audit. No client, source, SQL, parser, or game file was changed.

## Outcome

The current `IFRIT_CLIENT_ANIMATION_BANKS.md` and `INFERNAL_NAIL_ANIMATIONS.md` correctly cover the 28 direct action containers, principal WSS clips, dash/jump candidates, and Nail BID lifecycle. They are not exhaustive resource-graph inventories. The installed roots contain **34 m852 files** (26 act + 6 equ + 2 skl) and **9 m524 files** (2 act + 6 equ + 1 skl).

| Model | Action files | Live outer entries | Exact outer type census |
|---|---:|---:|---|
| `m852` | 26 | 224 | 1 CIBC, 36 CIBT, 54 MCB, 54 MTB, 22 RES, 57 SCB |
| `m524` | 2 | 27 | 1 CIBC, 5 CIBT, 9 MCB, 9 MTB, 1 RES, 2 SCB |

The decisive omissions are the exact outer SCB/MCB/MTB/CIB/RES tables; model-root states and transitions; Ifrit death and orientation assets; Nail body-aura and death assets; embedded three-channel effect curves; nested FID/BID/BTL schedulers; m852-bound cutscene motion datasets; and complete m999/m526 dependency boundaries.

WSS `0007` carries a separately hashed `m852_0007_fire` ACB. Moving Ifrit and playing a body pose does not execute that flame controller. Nail e002 similarly carries `m524_body_aura`; BID `cbbm_msb4_1` is only the one-frame skeletal state associated with that authored presentation.

## Method and evidence boundary

The catalog follows `ResourceSection.cs`: 48-byte SEDB header, `ResourceHeader`, `ResourceData[]`, then `RESOURCE_TYPE` and 16-byte-slot `RESOURCE_ID` tables. A resource is live only when its type, size, and live field are nonzero. Resource hashes cover exact payload bytes.

- `outer` means the first action-container SEDBRES table.
- A 135-bone MTB is an m852 skeleton motion; a 12-bone MTB is m524; a 3-channel MTB embedded in an ACB is an effect FCurve, not an actor motion.
- MTB time is decoded frames/FPS. SCB `@CBLK` values are binary signatures only; the common `9s/0` block is an envelope, not a nine-second action.
- Printable names prove a reference, not that an MCB/MTB is physically embedded. The outer tables below separate those concepts.
- A full binary literal sweep over 51,111 installed `client` files (about 5.09 GiB) found the four m852-bearing cut bundles, m999 WSS1/WSS6, and one m526 BID dependency outside the direct roots. No cut/script filename is literally Ifrit-named; cut files surfaced from embedded `m852` paths. Indirect numeric/hashed edges without literals remain outside this proof.

Pre-reconciliation input snapshots (these hashes intentionally identify the
baseline files before the current-state addenda were integrated):

| Report | Bytes | SHA-256 |
|---|---:|---|
| `IFRIT_CLIENT_ANIMATION_BANKS.md` | 25,695 | `4d27ff78618fbd06f3141e83a08136914897e926550bac5c55087e6f12d17ec0` |
| `INFERNAL_NAIL_ANIMATIONS.md` | 15,872 | `acdf1b4cadb5da3c16e16f7d2bb075a5f55c8f08aa77d11f7920ed0c4cc1ea49` |

## Complete direct file manifest (43 files)

| Installed path | Bytes | SHA-256 |
|---|---:|---|
| `client/chara/mon/m524/act/emp_emp/bid/base/0000` | 16,960 | `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17` |
| `client/chara/mon/m524/act/emp_emp/wss/base/0001` | 239,336 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` |
| `client/chara/mon/m524/equ/e001/met_mdl/0001` | 230,816 | `4a0445d0b136e0d8aae1cf019c183b9226a14a706d58aa68daeb2f4b313940b8` |
| `client/chara/mon/m524/equ/e001/top_mdl/0001` | 61,168 | `750c86c87e39b3504be8d1781202b60f19eef33d1e971655812c11105b880b0a` |
| `client/chara/mon/m524/equ/e001/top_snd/0000` | 940 | `2811b58f3316a05d2d57319deb63bd8ba45e988f962bdfb9c31e681553542350` |
| `client/chara/mon/m524/equ/e001/top_tex1/0000` | 398,688 | `66a02509a91af1fe6712021039e0a9dabc547aa50fca773fd6e981037dd19f84` |
| `client/chara/mon/m524/equ/e001/top_tex2/0000` | 1,578,336 | `d05fab52feff84056b9213fd8b19cbcf80fb740cdc451b805be03c5041d2d509` |
| `client/chara/mon/m524/equ/e002/met_mdl/0001` | 352,064 | `5a5a4414c7327ca5dd0f04d78677e76827d535126b8db3edd5633a7ea24784ff` |
| `client/chara/mon/m524/skl/0001` | 10,896 | `4186e060a67dd8c3d673e639d1c5a777e78c77e93082c9c0603bb5a37503d149` |
| `client/chara/mon/m852/act/cmn/fid/base/1110` | 86,672 | `15f1002a8c9d73dbf0bd522f27aefe9d07eb1861fd806d1957eae18053592bec` |
| `client/chara/mon/m852/act/emp_emp/bid/base/0000` | 1,649,424 | `d628997bfead8781208960fb5c7bde0f73a57a51acc1a66e9d497c7f2deb7e50` |
| `client/chara/mon/m852/act/emp_emp/btl/base/0001` | 221,536 | `28d9b295136212eb08f22622f79a615d131df8e815bd774e4341d0054d4a5e5e` |
| `client/chara/mon/m852/act/emp_emp/mgc/base/0001` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` |
| `client/chara/mon/m852/act/emp_emp/mgc/base/0002` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` |
| `client/chara/mon/m852/act/emp_emp/mgc/base/0003` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` |
| `client/chara/mon/m852/act/emp_emp/mgc/base/0004` | 61,760 | `ba3e5986ffeaa861686806945c1b28b8a479d111ac8cab323c5be69415259a46` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0001` | 423,680 | `10b6aac9583319ddde403800df8b0939ab535440cb5c9178c53a72452576c32b` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0002` | 515,904 | `5f832618e64f086be4ae33d75ea4552c92876e7ed4e01b6cd31cea0ac15af45e` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0003` | 768,448 | `9b99c9ac481c0036fb6e66fec69b479599c99c4b9e3df401d97bb2127268e7b9` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0004` | 862,880 | `581822c4e5419d02d3ba3c6e2804a58879484528351c2f6247fcc80af99416c9` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0005` | 236,096 | `2c01f01d23b873e56b870e5ff10704d70f6f12bca187a45e8a6e4d65f5d56f0f` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0007` | 738,000 | `45f0c0abde7221e053a1b693ed6ca643676ca8871f3bfe40b0dfc2d044b6eaa7` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0008` | 134,308 | `b2ba7c44797e50ee6085f9d4ed0b647ce67d56445f2eccc537602db789878217` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0010` | 312,128 | `9de9b7d1cfe0329e5f863ad348c553ce12ef32bfe7ad00af9d578b5932e2cf0d` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0012` | 1,015,088 | `e3072750c0d82ed77932c93ad620e65f66b931a7f584a9d5e2b74da83d8713d2` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0013` | 1,040,224 | `6361322e500c5292ae93c05468fa3eb6d01ffa3744cb6f7be10b2b45c9079629` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0014` | 1,204,256 | `46f750379dafa78f65360de3f9aca5034c94ea968d39d422bd4ed1539dfca3e4` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0015` | 97,200 | `1132c275c97bf3af4a8ef0e25b2d166dade14ebb768850c22b9f91a6cea97a98` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0016` | 28,848 | `4fbf6d5b77a776f395c27fe5a69e52031c813bcdd5f5434d7fcb5949db73d414` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0017` | 304,544 | `fc11450d9c3459fb70af1e6a2b623786a3aa5ea07c9002002a3273cebe5ab8b3` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0018` | 112,788 | `05ac1317b3ae797466e9e323927ec51799ebfde1dbd0ec048c04af9575a4d469` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0019` | 131,524 | `8aa13bcd9a161966f6aee5a1b6914e86ebae9dcc43378d120cb7443bb231f4e8` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0020` | 321,968 | `e1b6d517268dc75c595946d0d46499f65a73ffba0f703b21a8c41b723bcc7f66` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0021` | 788,480 | `d365c2f62241323971e73880bddd3b1908bfa8ffea269d17fa3dd158f25ecd34` |
| `client/chara/mon/m852/act/emp_emp/wss/base/0022` | 740,448 | `035e5346203e2d9a715b8c89cee14d8f0001fc38d7b43bc1bf74c44db24e78e3` |
| `client/chara/mon/m852/equ/e001/met_mdl/0001` | 1,568 | `9f334b4dd19db4f85cd9c8fdcd37df6a8d3edc3d32f346d584832238bd31223a` |
| `client/chara/mon/m852/equ/e001/top_mdl/0001` | 833,808 | `8305e6a26529eefb17e414870c0c8caad5b95fd03ee9a0945e747dd422345eef` |
| `client/chara/mon/m852/equ/e001/top_snd/0000` | 940 | `0e27cfaf83368260ed15ab48a6f2e1bef0e6cafdf6f464d5b7af6e08eec3497d` |
| `client/chara/mon/m852/equ/e001/top_tex1/0000` | 1,593,312 | `d653f181eb8324d7a1066dd20b475e181ba5d324cec364c339f6ac25063de03b` |
| `client/chara/mon/m852/equ/e001/top_tex2/0000` | 6,311,904 | `7db014dc101fe5044668fc3b6ebf16ef48b63885bda2bf4e90cc2f43c2d28b83` |
| `client/chara/mon/m852/equ/e002/met_mdl/0001` | 311,552 | `ca808182cedddcabf93d905f1bdebf536c36b09bf4be12f96af7c10574a84a85` |
| `client/chara/mon/m852/skl/0001` | 35,504 | `4b705e3f6c48166aa0dbf318d9ec6d7c1413187e113a13ad7ec7b79ee66a0436` |
| `client/chara/mon/m852/skl/9999` | 10,304 | `51fee5ba05de3bb6e87e70f8eb083949580ca3347f58207d1c9ec1716b683ca5` |

The two baseline input reports cover the 28 `act` rows at file level. The 15 `equ`/`skl` rows are the additional direct-family manifest surface closed here.

## Complete outer action-resource catalog

### Every outer SCB scheduler (59 entries)

| Bank | ID | Resource path | Bytes | SHA-256 | Block signatures |
|---|---|---|---:|---|---|
| `m852/fid/1110` | `fxpf_idle` | `bin\fxpf_idle` | 1,248 | `38e9b35d3e66bf7679ab518033c2470f95cb3f13a6dffee3dd58d906c2ecfb8c` | `9s/0; 0.02s/4` |
| `m852/mgc/0001` | `main` | `vfx\system\shoot\mag_r1\main\bin\main` | 1,248 | `0dbb080c774b856cd029633a4550f3314356cf854b81221aa5f151c6a95a90bd` | `9s/0; 1s/6` |
| `m852/mgc/0001` | `sht00` | `chr\sch\mon\m852\emp_emp\sht00\bin\sht00` | 1,248 | `917ec443fd877894ccd89e5f109a900f3b08d21e40f9aaa12de8a5638dc61f20` | `9s/0; 0.7s/4` |
| `m852/mgc/0002` | `main` | `vfx\system\shoot\mag_r1\main\bin\main` | 1,248 | `0dbb080c774b856cd029633a4550f3314356cf854b81221aa5f151c6a95a90bd` | `9s/0; 1s/6` |
| `m852/mgc/0002` | `sht00` | `chr\sch\mon\m852\emp_emp\sht00\bin\sht00` | 1,248 | `917ec443fd877894ccd89e5f109a900f3b08d21e40f9aaa12de8a5638dc61f20` | `9s/0; 0.7s/4` |
| `m852/mgc/0003` | `main` | `vfx\system\shoot\mag_r1\main\bin\main` | 1,248 | `0dbb080c774b856cd029633a4550f3314356cf854b81221aa5f151c6a95a90bd` | `9s/0; 1s/6` |
| `m852/mgc/0003` | `sht00` | `chr\sch\mon\m852\emp_emp\sht00\bin\sht00` | 1,248 | `917ec443fd877894ccd89e5f109a900f3b08d21e40f9aaa12de8a5638dc61f20` | `9s/0; 0.7s/4` |
| `m852/mgc/0004` | `main` | `vfx\system\shoot\mag_r1\main\bin\main` | 1,248 | `0dbb080c774b856cd029633a4550f3314356cf854b81221aa5f151c6a95a90bd` | `9s/0; 1s/6` |
| `m852/mgc/0004` | `sht00` | `chr\sch\mon\m852\emp_emp\sht00\bin\sht00` | 1,248 | `917ec443fd877894ccd89e5f109a900f3b08d21e40f9aaa12de8a5638dc61f20` | `9s/0; 0.7s/4` |
| `m852/wss/0001` | `mon_main` | `vfx\mon\ifrit_852\skill01\mon_main\bin\mon_main` | 1,760 | `e62669ce36d7ffc8ede2330f5faa56de98e6fe9ed051913e2517a776eb6e03cf` | `9s/0; 0.8s/12` |
| `m852/wss/0001` | `m852_0001` | `vfx\mon\ifrit_852\skill01\m852_0001\bin\m852_0001` | 1,136 | `9d0892b7a2d696ebd48e968b2e52b5739378b8d578de80b1eaf705a7cb6d3fc1` | `9s/0; 0.37s/4` |
| `m852/wss/0001` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0002` | `m852_0002` | `vfx\mon\ifrit_852\skill02\m852_0002\bin\m852_0002` | 1,136 | `60543e77989ebe7a78657e13c257f7c4087ed2ac29fa618a03b9dc79d53b6a5f` | `9s/0; 0.45s/4` |
| `m852/wss/0002` | `mon_main` | `vfx\mon\ifrit_852\skill02\mon_main\bin\mon_main` | 1,584 | `e142b06e9fdeca177731fcd9bde8dc9ac7712df670de0afe3eb8ec20d80e269a` | `9s/0; 0.65s/9` |
| `m852/wss/0002` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0003` | `mon_main` | `vfx\mon\ifrit_852\skill03\mon_main\bin\mon_main` | 1,584 | `8db5bbaf85fb7d1625fe1cf821c0c395f829cff9be788ebf6afd022820be8787` | `9s/0; 0.8s/9` |
| `m852/wss/0003` | `m852_0003` | `vfx\mon\ifrit_852\skill03\m852_0003\bin\m852_0003` | 1,136 | `9b21a85eefdeb835e22e774b1fba490f3cf82364f8c1a5a2b346183c74a181f8` | `9s/0; 0.44s/4` |
| `m852/wss/0003` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0004` | `mon_main` | `vfx\mon\ifrit_852\skill04\mon_main\bin\mon_main` | 1,648 | `4e526d43fd0b8a09733ccbfe63f4fdca70166cfd795ca6fd06d7615529adae21` | `9s/0; 0.82s/10` |
| `m852/wss/0004` | `m852_0004` | `vfx\mon\ifrit_852\skill04\m852_0004\bin\m852_0004` | 1,136 | `3481a24d0300a4d0d14d772654d0afa14422f762c49fc6051c86030166dbc739` | `9s/0; 0.55s/4` |
| `m852/wss/0004` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0005` | `mon_main` | `vfx\mon\ifrit_852\skill05\mon_main\bin\mon_main` | 1,456 | `dee52e3a14388b28276ccd2e2c5bb8307c994650f8ebca7ad59b1cb887edbe10` | `9s/0; 0.7s/7` |
| `m852/wss/0005` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0007` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0007` | `mon_main` | `vfx\mon\ifrit_852\skill07\mon_main\bin\mon_main` | 1,744 | `175554af2051685ff2d224776dd847bf1f1af3bc8724a8854e63c7d13c047a8f` | `9s/0; 0.7s/11` |
| `m852/wss/0007` | `m852_0007` | `vfx\mon\ifrit_852\skill07\m852_0007\bin\m852_0007` | 1,136 | `e34cee3cd7b38fc99364ef45b86c6593b48108252e983ecc7fda51bce04c51ce` | `9s/0; 0.5s/4` |
| `m852/wss/0008` | `mon_main` | `vfx\mon\ifrit_852\skill08\mon_main\bin\mon_main` | 1,536 | `3852d2c1d4a54edb1755a4361d865452bfa99f3b8facfba78f39ff0cc465c5bb` | `9s/0; 0.41s/8` |
| `m852/wss/0008` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0010` | `mon_main` | `vfx\mon\ifrit_852\skill10\mon_main\bin\mon_main` | 1,456 | `7cb30284ad5dfe4349a5d9e3f04f42d4d3ae722a0052792041e0845f2f2af976` | `9s/0; 0.7s/7` |
| `m852/wss/0010` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0012` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0012` | `mon_main` | `vfx\mon\ifrit_852\skill12\mon_main\bin\mon_main` | 1,648 | `2c5993e5d0792420de50649d65da1bc24d3edf81efbff901c38d7fd8ceb7e1b8` | `9s/0; 1.3s/10` |
| `m852/wss/0012` | `m852_0012` | `vfx\mon\ifrit_852\skill12\m852_0012\bin\m852_0012` | 1,136 | `e86ca905e42ea8013405bfd52625287e39190728009214f5f43285788aea67b1` | `9s/0; 0.53s/4` |
| `m852/wss/0013` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0013` | `mon_main` | `vfx\mon\ifrit_852\skill13\mon_main\bin\mon_main` | 1,648 | `ac56d1013639f420a4f3cd437112a0a0ae3068a8b7e1f52d50fa75c937149781` | `9s/0; 1.3s/10` |
| `m852/wss/0013` | `m852_0013` | `vfx\mon\ifrit_852\skill13\m852_0013\bin\m852_0013` | 1,136 | `597605558557d0b40274fa8068c1fac54a27266109a8852701ac065f663529ed` | `9s/0; 0.55s/4` |
| `m852/wss/0014` | `m852_0014` | `vfx\mon\ifrit_852\skill14\m852_0014\bin\m852_0014` | 1,152 | `6e9b28c7799c1646552ac949c62c6a99b0583684742661cb39a7f19b2def660a` | `9s/0; 0.46s/4` |
| `m852/wss/0014` | `mon_main` | `vfx\mon\ifrit_852\skill14\mon_main\bin\mon_main` | 1,648 | `7c94ccbf83038fe41615bcbf5cce0ee773eaab1e7e802dad2beea1ebbfcccd7e` | `9s/0; 1.3s/10` |
| `m852/wss/0014` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0015` | `mon_main` | `vfx\mon\ifrit_852\skill15\mon_main\bin\mon_main` | 1,632 | `94d22162149bf777ff777a108d43ce23f83b9c35720443dbcc2dd626692088a0` | `9s/0; 0.53s/9` |
| `m852/wss/0015` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0016` | `mon_main` | `vfx\mon\ifrit_852\skill16\mon_main\bin\mon_main` | 1,472 | `0d16457acaaa10e0973dcf1eee73f4d58cced28105e317060041c3ec636926b3` | `9s/0; 0.32s/7` |
| `m852/wss/0016` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0017` | `mon_main` | `vfx\mon\ifrit_852\skill17\mon_main\bin\mon_main` | 1,456 | `d3607a07e470a0f73b5f7c14141824b7a907e52f5705fe5c51461e49b4086617` | `9s/0; 0.9s/7` |
| `m852/wss/0017` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0018` | `mon_main` | `vfx\mon\ifrit_852\skill18\mon_main\bin\mon_main` | 1,632 | `8cc41fe5f05eea776ad731ef8e41a76da493ee468590da96a04226e3794d0733` | `9s/0; 0.41s/9` |
| `m852/wss/0018` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0019` | `mon_main` | `vfx\mon\ifrit_852\skill19\mon_main\bin\mon_main` | 1,632 | `b1be951a5c13ec9c95a35418c014c52c7491e53ba8f25cf57287d9d7d581f823` | `9s/0; 0.5s/9` |
| `m852/wss/0019` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0020` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0020` | `mon_main` | `vfx\mon\ifrit_852\skill20\mon_main\bin\mon_main` | 1,696 | `2de97879444dc22b719b696906047f6d62009a9eead66766a6acf2727f2214f6` | `9s/0; 0.8s/13` |
| `m852/wss/0021` | `main` | `system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0021` | `mon_main` | `mon\kuroko_999\skill02\mon_main\bin\mon_main` | 1,264 | `b6c2e38807d63d26638c2edf528391e3d2b61489fd780c26e9efbc738fe140cf` | `9s/0; 0.81s/6` |
| `m852/wss/0021` | `m999_0002` | `mon\kuroko_999\skill02\m999_0002\bin\m999_0002` | 1,136 | `c644a10d737b28422c310a3d116ee48d69925b0adfea02a6c5827315b6237d0d` | `9s/0; 0.5s/4` |
| `m852/wss/0022` | `main` | `system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m852/wss/0022` | `mon_main` | `mon\kuroko_999\skill03\mon_main\bin\mon_main` | 1,264 | `6767a41944e9b244c533a32376be7f28c5a5c24e8baf064cc3a04d5d6a056a86` | `9s/0; 0.63s/6` |
| `m852/wss/0022` | `m999_0003` | `mon\kuroko_999\skill03\m999_0003\bin\m999_0003` | 1,136 | `e63a64cf6dff5fae77bc3ad753483f885e53ba57b8310b1611800ffcaf234597` | `9s/0; 0.5s/4` |
| `m524/wss/0001` | `main` | `vfx\system\shoot_mon\main\bin\main` | 1,936 | `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m524/wss/0001` | `mon_main` | `vfx\mon\anchor_524\skill01\mon_main\bin\mon_main` | 1,792 | `1c830b159dac661488133829fd9fb26387b513fd968fcf1454d5ab76536f139a` | `9s/0; 1s/11` |

Repeated generic `main` hashes are separate live entries. They do not erase the unique actor `mon_main`, actor scheduler, or effect package beside them.

### Outer motion pairs: m852 BID (24 pairs)

| Bank | Motion ID | MTB path | Bones | FPS | Frames / seconds | MCB bytes / SHA-256 | MTB bytes / SHA-256 |
|---|---|---|---:|---:|---:|---|---|
| `m852/bid/0000` | `cbba_add_dmg_f` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmg_f` | 135 | 30 | 39 / 1.300s | 528 / `091f2358f9d904b13cc63828e5a31a9709bde1f42f00a98deb67daa90a60e54a` | 20,567 / `393430b0a2ba8989df0f06c008c3b075488f2036904260b501264749dd91c3f6` |
| `m852/bid/0000` | `cbba_add_dmgh_b` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_b` | 135 | 30 | 49 / 1.633s | 528 / `7b47b0fc7bd6df38697615523b0aa2d56d12ddccd622b95b57236c6c94761adc` | 31,927 / `224d02ea05dc9ad6622a0ffb858fb79c3c86767c4ca3514ede29eed9e694a0c4` |
| `m852/bid/0000` | `cbba_add_dmgh_f` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_f` | 135 | 30 | 49 / 1.633s | 528 / `125b1b25ee12b8257290710826c913fb33742bd0f14b604ee45667c3b3d3af80` | 33,239 / `ede4c493b2f14992c82062b7778789607472c3040db4b3e81ca007c2ed69bb64` |
| `m852/bid/0000` | `cbba_add_dmgh_l` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_l` | 135 | 30 | 49 / 1.633s | 528 / `e31eb5377bccbef55f7d2f03d762cacc9ddb2ed68ea265b53b3e26986754791c` | 33,767 / `2fa6b71b93417ae46c4ef1e9115e4332acd11076f0324bcd996a9f23c43674b0` |
| `m852/bid/0000` | `cbba_add_dmgh_r` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_r` | 135 | 30 | 49 / 1.633s | 528 / `d3c26aa4402f592d6e287d39609255ca3a3f1c11da6b0aa0f3e90b8647a16c8c` | 33,639 / `0103ba6c43e492bfdd9e721678c5528ec975dce69d07432d55bee5e753825cab` |
| `m852/bid/0000` | `cbbm_01f_lp0` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_01f_lp0` | 135 | 30 | 60 / 2.000s | 664 / `12dffe4d08b2d58815c8480b5f1c1a902a97d01a13825dfe12c18ed607cced2c` | 47,991 / `d29b8181c526417d97353571ff7253091d62279144f20a7cbc22a3e2ce021d8d` |
| `m852/bid/0000` | `cbbm_02f_lp0` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_02f_lp0` | 135 | 30 | 30 / 1.000s | 664 / `6daa359b2dd691b5eece7b5c5499dffea5288f544487e69379ae5bb46d59371b` | 30,791 / `4eda1884e5624853c7ef31e0e34ca898c49921a8433455db8919143a12b14e7e` |
| `m852/bid/0000` | `cbbm_abl_2lp` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_2lp` | 135 | 30 | 60 / 2.000s | 664 / `015112b433974fb9375fcbfa9f43fde5d59809af6e8f4f04094180283ee820b7` | 35,703 / `27405cd092a79fb4c153a6d78fbc55cfdfb62a255a0f876d49aded65b739c7d9` |
| `m852/bid/0000` | `cbbm_activ` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_activ` | 135 | 30 | 40 / 1.333s | 632 / `32756dd0503e23133fd6954ce2ae6d0a5d1063667eb7b03ce3ed466915c8ccdf` | 34,215 / `c37013a82c014acedd832e8df772b3912ad3a009651b0a9723a7f7a35e386a63` |
| `m852/bid/0000` | `cbbm_deact` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_deact` | 135 | 30 | 30 / 1.000s | 664 / `319808c45c6a97cfbe9566263f7777d5e69c1a330c18d708751c621fec06e22a` | 27,351 / `87447bacf952794859296b1dea059e861c4feef38575170381ac9a96bbb3ee59` |
| `m852/bid/0000` | `cbbm_ded` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_ded` | 135 | 30 | 155 / 5.167s | 856 / `96866702f8020064d92f5575b9486df65fe40713e9ee47666962a5edcf5aa8d3` | 110,167 / `8609497cae8091da3cdc9cab0a6e8d73e9a9be2e0907a63293790fd5b534787a` |
| `m852/bid/0000` | `cbbm_dedpose` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_dedpose` | 135 | 30 | 100 / 3.333s | 704 / `49399c2b0e595df66fe26fdb816d1ef346f9cee869ceeb6ed8c7080d08e3a6b9` | 4,919 / `f1d4bac7400c5e6877a1066a752545ba034180769f6ce856745838f5841e01ee` |
| `m852/bid/0000` | `cbbm_id0` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_id0` | 135 | 30 | 120 / 4.000s | 528 / `0999022b8f4a3ac138cab4ab1d674b3a0f3a4b8d5695c2eb4f3f9abc6a75a403` | 40,695 / `d7fac447fa28f32d3431b9982f86ec464b93bcee540cbef857de385891df5911` |
| `m852/bid/0000` | `cbbm_pb06_dmg` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_pb06_dmg` | 135 | 30 | 70 / 2.333s | 744 / `ad6dea7ce0f8dd7a21a1eadf0273af1be52460c2f82823881cfc3fa38b46ae33` | 58,695 / `8ada3f1901e232d003b9d034802e85018de81d36c338227ae5c174f8fe314ffb` |
| `m852/bid/0000` | `cbbm_pb07_dmg` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_pb07_dmg` | 135 | 30 | 70 / 2.333s | 744 / `e943916ee4632af0159853ea650907a337872239fc295c81bc10b2534ae68fbc` | 58,695 / `8ada3f1901e232d003b9d034802e85018de81d36c338227ae5c174f8fe314ffb` |
| `m852/bid/0000` | `cbbm_sp_a_2lp` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_a_2lp` | 135 | 30 | 90 / 3.000s | 592 / `870e6f846b15068a31956d65314d0d46a3b510607e9afb392ed9a8dc0ce80c68` | 44,375 / `d2ed7438f688869fb95f672e020d68254cb3251228c32fcf6480c7c9a34dd508` |
| `m852/bid/0000` | `cbbm_sp_b_2lp` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b_2lp` | 135 | 30 | 80 / 2.667s | 688 / `d960e9c98b262fdb25466da0724255da1bfa23aad1fe5b36b6f268d840486680` | 42,615 / `be58762feffc43f991c056db209eb7cf647ddf12162b425abf64bc96cdfbd690` |
| `m852/bid/0000` | `cbbm_trn_bl` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_trn_bl` | 135 | 30 | 40 / 1.333s | 632 / `bce58aa23181ca767e5104327e71394bd218ec68fa8b44f985837cdfea1095c2` | 36,151 / `a36c2895f85011cda06bbb72817f65a7abdc1c9dde008e1be73576f3d39d7f0a` |
| `m852/bid/0000` | `cbbm_trn_br` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_trn_br` | 135 | 30 | 40 / 1.333s | 632 / `64e8a300c689c2acbf51dffe5d522b8cfe5d2557d9b3d0e83b081dd4ce2e6040` | 36,663 / `03514a02993d644b3cef49594073ccc5c76720b3ef77a1261f6f96daf0448c98` |
| `m852/bid/0000` | `cbbm_trn_l` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_trn_l` | 135 | 30 | 40 / 1.333s | 632 / `301f5b814a7a95bc7789734a8620af2abece4b65e42021fc6fb255adfe3b1fbb` | 36,151 / `a36c2895f85011cda06bbb72817f65a7abdc1c9dde008e1be73576f3d39d7f0a` |
| `m852/bid/0000` | `cbbm_trn_r` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_trn_r` | 135 | 30 | 40 / 1.333s | 632 / `592ef088e16269e53ed96e1c7cda2596da075e0ab17da39c5e5eb4163c9b284d` | 36,663 / `03514a02993d644b3cef49594073ccc5c76720b3ef77a1261f6f96daf0448c98` |
| `m852/bid/0000` | `cbbm_wekid_2lp` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_wekid_2lp` | 135 | 30 | 140 / 4.667s | 528 / `8e63bc998a25c3ff3144586488d4989469043764dcf06860c0d8741f11fc3503` | 71,623 / `9a8c1dab92a50944e6407217be1af7feedf7cfb3340f50e9806c140942ae1bfc` |
| `m852/bid/0000` | `cbnm_id0` | `chr\mon\m852\animation\a001\normal\miga\base\b001\bin\cbnm_id0` | 135 | 30 | 120 / 4.000s | 528 / `e5de7e29f3da66dd4eecd3557dbc2c59e389ef2c5ba333780453d38afd4355c2` | 36,615 / `8df03bed7a515f7ee6ff315f91095fd858acdf4609b518ff1b3932c6ff04cc09` |
| `m852/bid/0000` | `cbnm_wekid_2lp` | `chr\mon\m852\animation\a001\normal\miga\base\b001\bin\cbnm_wekid_2lp` | 135 | 30 | 120 / 4.000s | 616 / `1c85378717a5a5c35eec59c0a8d616ee0b2bc1fb7b63a74d294cd8e69913ff70` | 42,103 / `10be4bb21dd659032b159f63ce83a41061134cc83ce4fbc4f488ba5a5f615c76` |

Rows in this subsection: **24**. Every row is a paired live outer entry.

### Outer motion pairs: all remaining lanes (39 pairs)

| Bank | Motion ID | MTB path | Bones | FPS | Frames / seconds | MCB bytes / SHA-256 | MTB bytes / SHA-256 |
|---|---|---|---:|---:|---:|---|---|
| `m852/btl/0001` | `cbbm_big_atk_f1` | `mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_big_atk_f1` | 135 | 30 | 85 / 2.833s | 720 / `cf773204dafde4de3be4796621674b72b846456b7722a5f6096b9c82227fa2ee` | 66,423 / `671f21767463f62a1ef10f2bc65577d48984057f67acec0b870150f70f4ebd0b` |
| `m852/btl/0001` | `cbbm_big_atk_l` | `mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_big_atk_l` | 135 | 30 | 85 / 2.833s | 800 / `2bc04bcaa351740c04558a49b64aab282e45f1b3fb10d61077e06dec18bfb708` | 67,703 / `369cbcc073ab075e9d6606bb98af74247b430c1f1e3164e0c55d83c946ead9fb` |
| `m852/btl/0001` | `cbbm_big_atk_r` | `mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_big_atk_r` | 135 | 30 | 85 / 2.833s | 800 / `53d4ddae4db060a0acffb1129753d801e2389d691862bfbc18522376249ee22c` | 67,943 / `7b4fe0bc08c6dd3cddf4ca065d4099b0713ba1524d2ecab5cc31bfd7d82e4a0b` |
| `m852/btl/0001` | `cbbr_big_atk_l` | `mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_big_atk_l` | 135 | 30 | 85 / 2.833s | 528 / `cb2cc8219cb8358ef12beae8e6c30d9c203fa011fd63088ee9e216caccbce1bf` | 460 / `f88e55f1bc19525828b698992ef71482d7052f500101431f1c9f6166290170a5` |
| `m852/btl/0001` | `cbbr_big_atk_r` | `mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_big_atk_r` | 135 | 30 | 85 / 2.833s | 528 / `019cc78bc39135979e17b29ebe29a70c73c46f12d67bd866c97b24e231568e67` | 460 / `f88e55f1bc19525828b698992ef71482d7052f500101431f1c9f6166290170a5` |
| `m852/mgc/0001` | `cbbm_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_3` | 135 | 30 | 70 / 2.333s | 592 / `49ec5ea5b033a5f91a70c244afd86baaadc3d3d95ac0903a22851cdd399b35f6` | 56,807 / `e98ceabfa19e4ede42a1241eac903344814207ac40bde0ef332813c99afdef76` |
| `m852/mgc/0001` | `cbbr_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_abl_3` | 135 | 30 | 70 / 2.333s | 528 / `3367c13b41f15284996f1c77cb33144d434480c3a6a01ed629510be61ab779b8` | 428 / `880e606b3b342a103b1bbb8c3f43577fe9fde8b74b912b3ac52ae425b2561f77` |
| `m852/mgc/0002` | `cbbm_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_3` | 135 | 30 | 70 / 2.333s | 592 / `49ec5ea5b033a5f91a70c244afd86baaadc3d3d95ac0903a22851cdd399b35f6` | 56,807 / `e98ceabfa19e4ede42a1241eac903344814207ac40bde0ef332813c99afdef76` |
| `m852/mgc/0002` | `cbbr_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_abl_3` | 135 | 30 | 70 / 2.333s | 528 / `3367c13b41f15284996f1c77cb33144d434480c3a6a01ed629510be61ab779b8` | 428 / `880e606b3b342a103b1bbb8c3f43577fe9fde8b74b912b3ac52ae425b2561f77` |
| `m852/mgc/0003` | `cbbm_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_3` | 135 | 30 | 70 / 2.333s | 592 / `49ec5ea5b033a5f91a70c244afd86baaadc3d3d95ac0903a22851cdd399b35f6` | 56,807 / `e98ceabfa19e4ede42a1241eac903344814207ac40bde0ef332813c99afdef76` |
| `m852/mgc/0003` | `cbbr_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_abl_3` | 135 | 30 | 70 / 2.333s | 528 / `3367c13b41f15284996f1c77cb33144d434480c3a6a01ed629510be61ab779b8` | 428 / `880e606b3b342a103b1bbb8c3f43577fe9fde8b74b912b3ac52ae425b2561f77` |
| `m852/mgc/0004` | `cbbm_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_3` | 135 | 30 | 70 / 2.333s | 592 / `49ec5ea5b033a5f91a70c244afd86baaadc3d3d95ac0903a22851cdd399b35f6` | 56,807 / `e98ceabfa19e4ede42a1241eac903344814207ac40bde0ef332813c99afdef76` |
| `m852/mgc/0004` | `cbbr_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbr_abl_3` | 135 | 30 | 70 / 2.333s | 528 / `3367c13b41f15284996f1c77cb33144d434480c3a6a01ed629510be61ab779b8` | 428 / `880e606b3b342a103b1bbb8c3f43577fe9fde8b74b912b3ac52ae425b2561f77` |
| `m852/wss/0001` | `cbbm_sp_01` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_01` | 135 | 30 | 60 / 2.000s | 592 / `ecef056b12c6774f658ad590ac7a4adedd74d2fac3f3ed6db2d29fdd461db44a` | 53,079 / `d32a84d60c4b0fc2e81ee329ca84838513eb145ae2dbaee032e72f2cd4d328c3` |
| `m852/wss/0002` | `cbbm_sp_02` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_02` | 135 | 30 | 30 / 1.000s | 592 / `bcc5f8e46cbfb1bc54bc7866c6458998d0a7bf979d5d895f2a994d632d428982` | 24,119 / `9a89221657c4301457ebdd074cb397df06837eb67d69e6aa3f268fbd12a00817` |
| `m852/wss/0003` | `cbbm_sp_a01` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_a01` | 135 | 30 | 80 / 2.667s | 592 / `7356fd1e8f93bd695878f6b7897f4dfecf5cd74e188f8dd89bc8cb906fcc936e` | 55,127 / `163caf017d10e2f76ee5d7880a814b107e1fa4a4ce003ef9d945a82e33e27d2a` |
| `m852/wss/0004` | `cbbm_sp_a02` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_a02` | 135 | 30 | 80 / 2.667s | 592 / `db043d42601a58dd126e223b4fd6793cd3efc01bc693ea26302dd6f7967674b7` | 59,111 / `b0f5d150c61dd62d3e4c5533446502363aaefcc70fc89e9e3429a825537b0ba8` |
| `m852/wss/0005` | `cbbm_sp_b01` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b01` | 135 | 30 | 70 / 2.333s | 592 / `3e3c13fb4cf9104f17ff0bb51114b1a8416c146387d16f882dfcebc0f01588ed` | 53,399 / `01b42372caa520dffe2eb78e465276f07e690917530bcf34718c181d580f4539` |
| `m852/wss/0007` | `cbbm_sp_b02` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b02` | 135 | 30 | 5 / 0.167s | 592 / `33221e7ce20363ea1c3599ee31c9c78c1b88ccaa616e2b670dd5a25dd029f410` | 10,199 / `6bc78f0944bd774d5c9f9ee8731142f6056eff74dcff48f08a44b20b0843d3f3` |
| `m852/wss/0008` | `cbbm_sp_b04` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b04` | 135 | 30 | 32 / 1.067s | 744 / `8012ab91f83fedec37bf7aff8afe1f32aff319affc94efaab40f7b70002fce1f` | 31,511 / `83ef1ad856e2049954df2675f03af246424cd172d7565e1dfe6f50ea10ab054c` |
| `m852/wss/0010` | `cbbm_abl_3` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_abl_3` | 135 | 30 | 70 / 2.333s | 592 / `49ec5ea5b033a5f91a70c244afd86baaadc3d3d95ac0903a22851cdd399b35f6` | 56,807 / `e98ceabfa19e4ede42a1241eac903344814207ac40bde0ef332813c99afdef76` |
| `m852/wss/0012` | `cbbm_sp_b03` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b03` | 135 | 30 | 130 / 4.333s | 592 / `89f9cd610c9f0c661b4df403549444cc3d9572d0ca789dc60d0be7ffdc86ed6f` | 97,063 / `d3216ca8bf31381c1fc0050177d214794081379d2330e6e2b730016a8baf9626` |
| `m852/wss/0013` | `cbbm_sp_b03` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b03` | 135 | 30 | 130 / 4.333s | 592 / `89f9cd610c9f0c661b4df403549444cc3d9572d0ca789dc60d0be7ffdc86ed6f` | 97,063 / `d3216ca8bf31381c1fc0050177d214794081379d2330e6e2b730016a8baf9626` |
| `m852/wss/0014` | `cbbm_sp_b03` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_b03` | 135 | 30 | 130 / 4.333s | 592 / `89f9cd610c9f0c661b4df403549444cc3d9572d0ca789dc60d0be7ffdc86ed6f` | 97,063 / `d3216ca8bf31381c1fc0050177d214794081379d2330e6e2b730016a8baf9626` |
| `m852/wss/0015` | `cbbm_sp_03` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_03` | 135 | 30 | 40 / 1.333s | 592 / `49242f9e6a33b154d354e8a8ac1d955b6d36581b660be78b7e859f8b6df39b91` | 33,959 / `bfc79951da2b11e69ffa570ebac98a25b557dc1443232d1ae1c8ce940cdfb797` |
| `m852/wss/0016` | `cbbm_sp_04` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_04` | 135 | 30 | 30 / 1.000s | 592 / `6c9dcd90dbad62e9d264cecf59c4c7117c582b66eb442e099b43a284c7646405` | 24,183 / `54dd649229c1fcda8450fdf28e8147fd9c181cdfc68b841e430b7ae5b2a30e2e` |
| `m852/wss/0017` | `cbbm_sp_07` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_07` | 135 | 30 | 90 / 3.000s | 592 / `d6b5d8e2ca6208e2d47cf8106f487e3265ea9e2de44bff24eb479dbb30186aa5` | 65,719 / `a1d7545ddfcfc4cad3099a1c5fe8319d17f3f4b93759af74e57b1a6ac474edf5` |
| `m852/wss/0018` | `cbbm_sp_05` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_05` | 135 | 30 | 5 / 0.167s | 592 / `fe86b6d5fe25db62010807c894c7dc5c591fa38dd2cc6bd83b23001a2af0de27` | 10,311 / `b645a5af73561f41acbf4b4faf511159554c0f25ef2520be523a89b7f285bb0c` |
| `m852/wss/0019` | `cbbm_sp_06` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_06` | 135 | 30 | 30 / 1.000s | 744 / `e0d04ca444ae6b01f17368211663edb3b9be4125e12514cbfa935cffc5fa9f02` | 27,271 / `5e8decd943d4b148349e27c2a85c42f35f393202574bd178d5fcbabfc045ca54` |
| `m852/wss/0020` | `cbbm_sp_03` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_03` | 135 | 30 | 40 / 1.333s | 592 / `49242f9e6a33b154d354e8a8ac1d955b6d36581b660be78b7e859f8b6df39b91` | 33,959 / `0de02543ae3d56c4bcadceb1319c013ce9efbe238f298c0a29643e6248643cf0` |
| `m524/bid/0000` | `cbnm_dedpose` | `mon\m524\animation\a001\normal\miga\base\b001\bin\cbnm_dedpose` | 12 | 30 | 1 / 0.033s | 704 / `fda2aa6289dfd8505e6ecc2fb48c5c2acb75af83b3be7e1ba5c60cb8c738aa33` | 887 / `5ce8419ca34ada7417596724c9ff6be2d51a652964d2e8ba97a6661b96045b30` |
| `m524/bid/0000` | `cbnm_id0` | `mon\m524\animation\a001\normal\miga\base\b001\bin\cbnm_id0` | 12 | 30 | 1 / 0.033s | 528 / `d170e8694888c6c1cceea7383e70a89e2d2ebd9a1c8417101fd0eb05476855cb` | 855 / `f6570a520c987a0718234d6ada56ae083ddfbc919d273e25a6b20ece01567011` |
| `m524/bid/0000` | `cbbm_ded` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_ded` | 12 | 30 | 30 / 1.000s | 760 / `9b902c586cc839003aab82d8ba9578da5f32d7dc4930675c73bfb303f7da9b47` | 2,599 / `272d1133134b89b4f09e69871316cbf42a1d9053de063dc39acdc05ceb27f1bc` |
| `m524/bid/0000` | `cbbm_dedpose` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_dedpose` | 12 | 30 | 1 / 0.033s | 704 / `b155896a2619d8e78904588bd34fe64aa8c18460db8bed4fd89f46e424fafff0` | 887 / `5ce8419ca34ada7417596724c9ff6be2d51a652964d2e8ba97a6661b96045b30` |
| `m524/bid/0000` | `cbbm_msb4_1` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_msb4_1` | 12 | 30 | 1 / 0.033s | 592 / `a2054bc2b9ca39698eb216a7dedad06554091fa3e9301bcc7d9c13a623e01b86` | 647 / `a67be74338cc330e724819cb24a7ee6b4bc4c4d1ac98db8eee9bf11b50c29ec3` |
| `m524/bid/0000` | `cbbm_activ` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_activ` | 12 | 30 | 30 / 1.000s | 528 / `c4bc7082325906d75476c1711241464cfd2a4f6db5b89adb1a94255d85fb4653` | 855 / `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` |
| `m524/bid/0000` | `cbbm_deact` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_deact` | 12 | 30 | 30 / 1.000s | 528 / `1c28739c81f1daf1abdd6874f0d12999811b04240ccdb007a987c2042da6f1bb` | 855 / `eedecde9c22cdf18af816f96e487fe6f4000a25683560b0d60732e91ca5d6e6d` |
| `m524/bid/0000` | `cbbm_id0` | `mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_id0` | 12 | 30 | 1 / 0.033s | 528 / `77f722cabb566ccbd8176dffa452343dbdd27534f20ad1e5e4d295e20b240136` | 855 / `f6570a520c987a0718234d6ada56ae083ddfbc919d273e25a6b20ece01567011` |
| `m524/wss/0001` | `cbbm_sp_01` | `chr\mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_01` | 12 | 30 | 90 / 3.000s | 592 / `f0bc6fc4ee499b0d876729c4561032b9510d38bf4e47832ecb6a586025ccc0ac` | 1,879 / `dd9ce2e2a0f918a3839101d40a9cb21fe9f7a12d84563727c2dcb3df138d9fd3` |

Rows in this subsection: **39**. Every row is a paired live outer entry.

### Every other outer action entry

This table closes the 251-entry outer census: every nested RES root and every CIBT/CIBC control not already represented by SCB/MCB/MTB tables.

| Bank | Type | ID | Resource path | Bytes | SHA-256 |
|---|---|---|---|---:|---|
| `m852/fid/1110` | `RES` | `caster` | `DataSet\caster` | 85,131 | `4591f9589175eaaeb41ea15847eb39603b1bc796e21776c5abae6493b825b256` |
| `m852/bid/0000` | `CIBT` | `cbbm_01f_lp0` | `chr\cib\cibt\template\bt_middle\cbbm_01f_lp0` | 144 | `f6b61e3c9d250b3ecc8563eabf1f0aa931a6d721985be67c2aaffa0b7a0f9301` |
| `m852/bid/0000` | `CIBT` | `cbbm_02f_lp0` | `chr\cib\cibt\template\bt_middle\cbbm_02f_lp0` | 144 | `da514b44e8d778b3c967f1b5d6a630adefbdc58bef1205bcf0e8d28fd0932907` |
| `m852/bid/0000` | `CIBT` | `cbbm_activ` | `chr\cib\cibt\template\bt_middle\cbbm_activ` | 64 | `daf9cbd444f0e2a4efb2b775fdada37f318a7074efdb1607933ed30b3889bf4b` |
| `m852/bid/0000` | `CIBT` | `cbbm_deact` | `chr\cib\cibt\template\bt_middle\cbbm_deact` | 64 | `e59eef4fba3e3e7d8ce3024011ae73958aa6b410e6a151cff7901e9acabfe11e` |
| `m852/bid/0000` | `CIBT` | `cbbm_ded` | `chr\cib\cibt\template\bt_middle\cbbm_ded` | 44 | `bc0d20eb89a7615397ca08515ba7e1b78e30410a92b8796341785a0a5a1e1878` |
| `m852/bid/0000` | `CIBT` | `cbbm_id0` | `chr\cib\cibt\template\bt_middle\cbbm_id0` | 384 | `aaefa24a3b4ca11164f33028d13d19bf8e9f429eaf7170baa4d34f95795891f1` |
| `m852/bid/0000` | `CIBT` | `cbbm_pb06_dmg` | `chr\cib\cibt\template\bt_middle\cbbm_pb06_dmg` | 64 | `221c337ffe73c5dc965c7747941a305e07c66d37e393e0d59d7d7dbced27321a` |
| `m852/bid/0000` | `CIBT` | `cbbm_pb07_dmg` | `chr\cib\cibt\template\bt_middle\cbbm_pb07_dmg` | 64 | `221c337ffe73c5dc965c7747941a305e07c66d37e393e0d59d7d7dbced27321a` |
| `m852/bid/0000` | `CIBT` | `cbbm_trn_bl` | `chr\cib\cibt\template\bt_middle\cbbm_trn_bl` | 44 | `4f3767804b39b061483f453c36cd0a3299a62af82d43812be9b34767a18f808f` |
| `m852/bid/0000` | `CIBT` | `cbbm_trn_br` | `chr\cib\cibt\template\bt_middle\cbbm_trn_br` | 44 | `4f3767804b39b061483f453c36cd0a3299a62af82d43812be9b34767a18f808f` |
| `m852/bid/0000` | `CIBT` | `cbbm_trn_l` | `chr\cib\cibt\template\bt_middle\cbbm_trn_l` | 44 | `4f3767804b39b061483f453c36cd0a3299a62af82d43812be9b34767a18f808f` |
| `m852/bid/0000` | `CIBT` | `cbbm_trn_r` | `chr\cib\cibt\template\bt_middle\cbbm_trn_r` | 44 | `4f3767804b39b061483f453c36cd0a3299a62af82d43812be9b34767a18f808f` |
| `m852/bid/0000` | `CIBT` | `cbbm_wekid_2lp` | `chr\cib\cibt\template\bt_middle\cbbm_wekid_2lp` | 44 | `7ba53d81f0c5579f2365783b5be6942c950dc516caa75ac685af751a0b50f7c9` |
| `m852/bid/0000` | `CIBT` | `cbnm_id0` | `chr\cib\cibt\template\bt_middle\cbnm_id0` | 384 | `6ec7feb9d9b26930e00b4225f95676ff3c5256934a82562d54a26d97ef198c2c` |
| `m852/bid/0000` | `CIBT` | `cbnm_wekid_2lp` | `chr\cib\cibt\template\bt_middle\cbnm_wekid_2lp` | 44 | `7ba53d81f0c5579f2365783b5be6942c950dc516caa75ac685af751a0b50f7c9` |
| `m852/bid/0000` | `CIBC` | `info_m852` | `chr\cib\cibc\mon\bid\info_m852` | 484 | `9b7fbfb2cb146df23bc9601654586bb7c39ba91ab5f930426c04843b273c62d9` |
| `m852/bid/0000` | `RES` | `msb_vfx` | `vfx\mon\ifrit_852\msb\rpe\msb_vfx` | 183,930 | `d73781dce4b04147b54a49e2c30dd1f33b6db970cfd08fa3ab0e591254e1bef4` |
| `m852/bid/0000` | `RES` | `s_bid00` | `chr\sch\mon\m852\emp_emp\s_bid00` | 19,141 | `73a5a288d761b4668107103bbc39c382eab56a653acb2110c953f8f82a6be468` |
| `m852/btl/0001` | `CIBT` | `cbbm_big_atk_f1` | `cib\cibt\template\bt_middle\cbbm_big_atk_f1` | 64 | `aec9b0cc71f6a989c13e5786b23e64ef6ef2c6a719c4db3ec88e32f65ae9766b` |
| `m852/btl/0001` | `CIBT` | `cbbm_big_atk_l` | `cib\cibt\template\bt_middle\cbbm_big_atk_l` | 64 | `aec9b0cc71f6a989c13e5786b23e64ef6ef2c6a719c4db3ec88e32f65ae9766b` |
| `m852/btl/0001` | `CIBT` | `cbbm_big_atk_r` | `cib\cibt\template\bt_middle\cbbm_big_atk_r` | 64 | `aec9b0cc71f6a989c13e5786b23e64ef6ef2c6a719c4db3ec88e32f65ae9766b` |
| `m852/btl/0001` | `RES` | `s_btl01` | `sch\mon\m852\emp_emp\s_btl01` | 13,435 | `35851159f6f91148c8d4872a216571dc8b9b3113d23cbb9b13526704ec4135fd` |
| `m852/mgc/0001` | `CIBT` | `cbbm_abl_3` | `chr\cib\cibt\template\bt_middle\cbbm_abl_3` | 64 | `655d64d28f0e8a182decc477bb75bed7af1dcc702ad93ca0a82715e8f256a8f7` |
| `m852/mgc/0002` | `CIBT` | `cbbm_abl_3` | `chr\cib\cibt\template\bt_middle\cbbm_abl_3` | 64 | `655d64d28f0e8a182decc477bb75bed7af1dcc702ad93ca0a82715e8f256a8f7` |
| `m852/mgc/0003` | `CIBT` | `cbbm_abl_3` | `chr\cib\cibt\template\bt_middle\cbbm_abl_3` | 64 | `655d64d28f0e8a182decc477bb75bed7af1dcc702ad93ca0a82715e8f256a8f7` |
| `m852/mgc/0004` | `CIBT` | `cbbm_abl_3` | `chr\cib\cibt\template\bt_middle\cbbm_abl_3` | 64 | `655d64d28f0e8a182decc477bb75bed7af1dcc702ad93ca0a82715e8f256a8f7` |
| `m852/wss/0001` | `RES` | `skill01` | `vfx\mon\ifrit_852\skill01\mon_main\sch_effect_data\skill01` | 183,843 | `3fe48cc8389d3acfbc8066324b1dd4c82c51476ce0c26c878b52e422907e653c` |
| `m852/wss/0001` | `CIBT` | `cbbm_sp_01` | `chr\cib\cibt\template\bt_big\cbbm_sp_01` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0002` | `RES` | `skill02` | `vfx\mon\ifrit_852\skill02\mon_main\sch_effect_data\skill02` | 190,421 | `a0eb875156df81dc60624fd66041c52661821de9644eaab2c7929cdecbc96a70` |
| `m852/wss/0002` | `CIBT` | `cbbm_sp_02` | `chr\cib\cibt\template\bt_big\cbbm_sp_02` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0003` | `RES` | `skill03` | `vfx\mon\ifrit_852\skill03\mon_main\sch_effect_data\skill03` | 291,725 | `5e4a438b2459100a08ba05abd40d10672b8e446f3ca5be77b8909d47b6f48aca` |
| `m852/wss/0003` | `CIBT` | `cbbm_sp_a01` | `chr\cib\cibt\template\bt_big\cbbm_sp_a01` | 64 | `5bf904f4f43987a14b71d76a140d2acbd8c2f01ee669d251e323bc21c2ca3992` |
| `m852/wss/0004` | `RES` | `skill04` | `vfx\mon\ifrit_852\skill04\mon_main\sch_effect_data\skill04` | 251,079 | `913f017902e69a1f2976c1e79811cd057eed228fc5e1b2389a3e4e07f8f1a8e2` |
| `m852/wss/0004` | `CIBT` | `cbbm_sp_a02` | `chr\cib\cibt\template\bt_big\cbbm_sp_a02` | 64 | `5bf904f4f43987a14b71d76a140d2acbd8c2f01ee669d251e323bc21c2ca3992` |
| `m852/wss/0005` | `RES` | `skill05` | `vfx\mon\ifrit_852\skill05\mon_main\sch_effect_data\skill05` | 57,658 | `3c8749dfd1608a0dc18632625052081f5578388e5f2216924ee5eccd820ed915` |
| `m852/wss/0005` | `CIBT` | `cbbm_sp_b01` | `chr\cib\cibt\template\bt_big\cbbm_sp_b01` | 64 | `bc2d08031a8d5a7267cc4a6a81090aa9f08c29cf59a2b0b10224a687ebf6458a` |
| `m852/wss/0007` | `RES` | `skill07` | `vfx\mon\ifrit_852\skill07\mon_main\sch_effect_data\skill07` | 349,759 | `c982d3255e5c072a7edc4ac39d4b113fff862ebc5ec67c36eb3b608ba0987cca` |
| `m852/wss/0007` | `CIBT` | `cbbm_sp_b02` | `chr\cib\cibt\template\bt_big\cbbm_sp_b02` | 64 | `bc2d08031a8d5a7267cc4a6a81090aa9f08c29cf59a2b0b10224a687ebf6458a` |
| `m852/wss/0008` | `RES` | `skill08` | `vfx\mon\ifrit_852\skill08\mon_main\sch_effect_data\skill08` | 32,338 | `efcd2289f9b6d9ac78d3b0f2831d66e3b532c43ae578d8816deaa94f554fc9a1` |
| `m852/wss/0010` | `RES` | `skill10` | `vfx\mon\ifrit_852\skill10\mon_main\sch_effect_data\skill10` | 86,522 | `ce2dbab536b5b28a134b80407e341bea972a3c8c15d9c11424e71102ba9c25ca` |
| `m852/wss/0010` | `CIBT` | `cbbm_abl_3` | `chr\cib\cibt\template\bt_middle\cbbm_abl_3` | 64 | `655d64d28f0e8a182decc477bb75bed7af1dcc702ad93ca0a82715e8f256a8f7` |
| `m852/wss/0012` | `RES` | `skill12` | `vfx\mon\ifrit_852\skill12\mon_main\sch_effect_data\skill12` | 409,013 | `c4c689676109112911f478f9f55f178927693c19fc41790afd53cc111c998f72` |
| `m852/wss/0012` | `CIBT` | `cbbm_sp_b03` | `chr\cib\cibt\template\bt_big\cbbm_sp_b03` | 64 | `bc2d08031a8d5a7267cc4a6a81090aa9f08c29cf59a2b0b10224a687ebf6458a` |
| `m852/wss/0013` | `RES` | `skill13` | `vfx\mon\ifrit_852\skill13\mon_main\sch_effect_data\skill13` | 434,157 | `9e5f1b0318a59d77ad8c822b8dd1c23e8928188f0c29bbd4fd61213af9373b9b` |
| `m852/wss/0013` | `CIBT` | `cbbm_sp_b03` | `chr\cib\cibt\template\bt_big\cbbm_sp_b03` | 64 | `bc2d08031a8d5a7267cc4a6a81090aa9f08c29cf59a2b0b10224a687ebf6458a` |
| `m852/wss/0014` | `RES` | `skill14` | `vfx\mon\ifrit_852\skill14\mon_main\sch_effect_data\skill14` | 527,061 | `1abcdcfab47788cfc95cf65308e54a50eeda61d1b073a2fc295b9510652d5e42` |
| `m852/wss/0014` | `CIBT` | `cbbm_sp_b03` | `chr\cib\cibt\template\bt_big\cbbm_sp_b03` | 64 | `bc2d08031a8d5a7267cc4a6a81090aa9f08c29cf59a2b0b10224a687ebf6458a` |
| `m852/wss/0015` | `RES` | `skill15` | `vfx\mon\ifrit_852\skill15\mon_main\sch_effect_data\skill15` | 30,938 | `f6915e8c7fef267e830b14eef3a92f114ff07c35b5bd1966a47653f9feee22b7` |
| `m852/wss/0015` | `CIBT` | `cbbm_sp_03` | `chr\cib\cibt\template\bt_big\cbbm_sp_03` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0016` | `CIBT` | `cbbm_sp_04` | `chr\cib\cibt\template\bt_big\cbbm_sp_04` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0017` | `RES` | `skill17` | `vfx\mon\ifrit_852\skill17\mon_main\sch_effect_data\skill17` | 91,938 | `40988571f10549d0263e666d27402d1403e5d795b83998587993951cd87e075f` |
| `m852/wss/0017` | `CIBT` | `cbbm_sp_07` | `chr\cib\cibt\template\bt_big\cbbm_sp_07` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0018` | `RES` | `skill18` | `vfx\mon\ifrit_852\skill18\mon_main\sch_effect_data\skill18` | 32,066 | `1816ae7318e02a12eac28ead4fb15de9ad268da09923bdccc2ad1a481af17383` |
| `m852/wss/0019` | `RES` | `skill19` | `vfx\mon\ifrit_852\skill19\mon_main\sch_effect_data\skill19` | 33,698 | `3696fb9587be9be2a5eca894dbb5c8d15fb7438e39f132fc153d9e635bbdb21c` |
| `m852/wss/0020` | `CIBT` | `cbbm_sp_03` | `chr\cib\cibt\template\bt_big\cbbm_sp_03` | 44 | `0df5d8d7bbd8d2278a2279926e07241e1e886449ddd83ed6ee7490434548ac46` |
| `m852/wss/0020` | `RES` | `skill20` | `vfx\mon\ifrit_852\skill20\lst\sch_effect_data\skill20` | 167,968 | `7886ecc5f53678fe538249406a36c6407ade3199b5f502c316c76f71e2dca5a0` |
| `m852/wss/0021` | `RES` | `skill02` | `mon\kuroko_999\skill02\mon_main\sch_effect_data\skill02` | 269,933 | `377dec9d26e11b69a0a21b2735610dad560211799e09b5c24add5c41b9215ea8` |
| `m852/wss/0022` | `RES` | `skill03` | `mon\kuroko_999\skill03\mon_main\sch_effect_data\skill03` | 271,029 | `acc9b27635392cd883ed06919c83a3d99eca75842192e571f8472776d77f4d66` |
| `m524/bid/0000` | `CIBT` | `cbnm_id0` | `cib\cibt\template\bt_small\cbnm_id0` | 384 | `df758668496fc218964f63abc54b0d6f2a0018197e9ddb128ea41c5b4a99fc9a` |
| `m524/bid/0000` | `CIBT` | `cbbm_ded` | `cib\cibt\template\bt_small\cbbm_ded` | 44 | `bc0d20eb89a7615397ca08515ba7e1b78e30410a92b8796341785a0a5a1e1878` |
| `m524/bid/0000` | `CIBT` | `cbbm_activ` | `cib\cibt\template\bt_small\cbbm_activ` | 64 | `11b6f476782c95ac2d293e83c80c31fac84d242fff7edebf846439a7c7cd7d59` |
| `m524/bid/0000` | `CIBT` | `cbbm_deact` | `cib\cibt\template\bt_small\cbbm_deact` | 64 | `35e18aa12e0119b6284cc991cb9436b204186b460f0445b132319c409710f98f` |
| `m524/bid/0000` | `CIBT` | `cbbm_id0` | `cib\cibt\template\bt_small\cbbm_id0` | 384 | `e3dda03c640c830b2f1d0af7420b499fec5c6187bfb9da2120070c89089cf7ad` |
| `m524/bid/0000` | `CIBC` | `info_m524` | `cib\cibc\mon\bid\info_m524` | 484 | `fd680e0f63cb913c6446b9c15b46303ef2c47daf9f2f8e362d5b33fe5a9314c9` |
| `m524/wss/0001` | `RES` | `skill01` | `\skill01` | 90,400 | `df3decfd64af98b6c28a9e2414e31e5e819ef18f959215206c6357587f8ba030` |

Rows in this subsection: **66**. Together with 59 SCBs and 126 MCB/MTB entries, this reconciles exactly to 251 live outer entries.

## Nested action schedulers and motions omitted by bank-level inventories

| Bank / package chain | Type | ID | Resource path | Bytes | SHA-256 | Timing/class |
|---|---|---|---|---:|---|---|
| `m852/fid/1110/outer/caster` | `MCB` | `eb_man30880a08x` | `mcc\bin\eb_man30880a08x` | 528 | `5386d87dbeeab9e4fdaf091cd37068e12c51a4d4a714454558d0dff6985dd1a4` | `paired curve map` |
| `m852/fid/1110/outer/caster` | `MTB` | `eb_man30880a08x` | `miga\bin\eb_man30880a08x` | 84,316 | `266768880d1d1c105f6b0601cd156ce365f070c966610bc1b957a9f8215fa074` | `135 bones; 30 fps; 120f/4.000s` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb4_0` | `ifrit_852\msb\init_msb4_0\bin\init_msb4_0` | 1,008 | `229c0f35c46abc5aaf5dbe013bedbaa27a4315712fedc326ff1c8a1e6d9af998` | `9s/0; 0.02s/2` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb4_1` | `ifrit_852\msb\init_msb4_1\bin\init_msb4_1` | 1,120 | `93d4901751526f67767a89eeed4a7ca60f3d5d37a6867d978af8cad5dab533ed` | `9s/0; 0.1s/4` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb6_0` | `ifrit_852\msb\init_msb6_0\bin\init_msb6_0` | 1,008 | `0974f6927b0e1a8ea8552611ccee256e0c00df74a7e98136c09476cf2dc4f272` | `9s/0; 0.04s/2` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb6_1` | `ifrit_852\msb\init_msb6_1\bin\init_msb6_1` | 1,520 | `86c8ce16dde3dd073c49f08344582806c6ff43b155361d011d61120bc4d4353c` | `9s/0; 0.05s/4` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb7_1` | `kuroko_999\skill04\init_msb4_1\bin\init_msb7_1` | 1,232 | `cef7f840816daab125531a943ded9e2b6db6bc85b191d62ac21ab785dfd982ce` | `9s/0; 0.24s/6` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb7_0` | `kuroko_999\skill04\init_msb4_0\bin\init_msb7_0` | 1,008 | `27f6a93b31e66adebe7eac0be89e2b2851a99833ad0317081480a1013a651623` | `9s/0; 0.05s/2` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb5_1` | `kuroko_999\skill05\init_msb5_1\bin\init_msb5_1` | 1,232 | `36e2818b521fb27b258823c010605d26df41d157573d74655c54528b5499fb60` | `9s/0; 0.2s/6` |
| `m852/bid/0000/outer/msb_vfx` | `SCB` | `init_msb5_0` | `kuroko_999\skill05\init_msb5_0\bin\init_msb5_0` | 1,008 | `61b73c999e996dd87cddce4cf8546e1233e89b3246693a6b375bf340da0419f8` | `9s/0; 0.1s/2` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cas00` | `chr\sch\mon\m852\emp_emp\cas00\bin\cas00` | 1,040 | `301f08a29c17cc0c0b45ccfd907bb780c957d05af0af507c0a464846d839f480` | `9s/0; 0.3s/3` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cas90` | `chr\sch\mon\m852\emp_emp\cas90\bin\cas90` | 1,040 | `301f08a29c17cc0c0b45ccfd907bb780c957d05af0af507c0a464846d839f480` | `9s/0; 0.3s/3` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `casa0` | `chr\sch\mon\m852\emp_emp\casa0\bin\casa0` | 1,040 | `301f08a29c17cc0c0b45ccfd907bb780c957d05af0af507c0a464846d839f480` | `9s/0; 0.3s/3` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `casb0` | `chr\sch\mon\m852\emp_emp\casb0\bin\casb0` | 1,040 | `c548224d55d5fbffdaf4c19f93b19b1ebc773d58341f461282ac3237c2b3ea30` | `9s/0; 0.7s/3` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `itm00` | `chr\sch\mon\m852\emp_emp\itm00\bin\itm00` | 1,248 | `777eee306f7eedab52777f3993c055eb6712f57f92110f0204a4f6c6db234c05` | `9s/0; 0.7s/4` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `pb06_1` | `chr\sch\mon\m852\partsbreak\pb06\bin\pb06_1` | 1,344 | `85f54574808640be22cf1373c45d2f78a6282dbc5d7595180786dd641768170c` | `9s/0; 0.7s/5` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `pb07_1` | `chr\sch\mon\m852\partsbreak\pb07\bin\pb07_1` | 1,344 | `07c4f8e3c53da44d8a8f8af2e87bdeec04e83748113fffd3aae80bb1178b32ef` | `9s/0; 0.7s/5` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_11` | `vfx\system\mon_cas01_a\bin\cast_mon_11` | 1,280 | `8cffbdc6d8f268d51db15dc705bb4eeecabf785b9b4006e93971faec61391d3b` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_12` | `vfx\system\mon_cas02_a\bin\cast_mon_12` | 1,280 | `9db00c0187ca81f997b0450f23b07109f18cdcbb1a3251d2f98044ca4cb912ca` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_13` | `vfx\system\mon_cas01_b\bin\cast_mon_13` | 1,280 | `6f2cc595d320d1cb09958d3e37b8891a46441bee24b00a07403596a33bc9ecee` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_14` | `vfx\system\mon_cas02_b\bin\cast_mon_14` | 1,280 | `9d8f8a6ba208bc17eeacd67d9cf3a725695103fe504ffa9e7768dca9888386ff` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_15` | `vfx\system\mon_cas02_0\bin\cast_mon_15` | 1,280 | `09810a1ae4c347e8677c7461f0260eebdd63dfc97fddc922cfe05e8b0354ddbc` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `cast_mon_16` | `vfx\system\mon_cas13_b\bin\cast_mon_16` | 1,280 | `0e01e30ea0a2d5ed1f454b52e8a2535d40a61b6d3b5f37658658e1740e2b9610` | `9s/0; 0.36s/7` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `init_pb06_1` | `chr\sch\mon\m852\partsbreak\init_pb06\bin\init_pb06_1` | 1,008 | `b03c06b6fbcdbbdad7a998e8273d821d8e5da0a0157bf9dd3b31402913b9d0da` | `9s/0; 0.1s/3` |
| `m852/bid/0000/outer/s_bid00` | `SCB` | `init_pb07_1` | `chr\sch\mon\m852\partsbreak\init_pb07\bin\init_pb07_1` | 1,008 | `bf2eb3510e06c4dacb6c088c139b4d556e25350d52f63898509c26e52e89b7b2` | `9s/0; 0.1s/3` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `main` | `pc\cmn\attack_m\bin\main` | 1,104 | `b0cc0efd3e073041f9d40e09f1da8bd039ff03fe1fa18984d48dde7b6716710c` | `9s/0; 12.34s/4` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk10_1_1` | `mon\m852\emp_emp\atk01\bin\atk10_1_1` | 1,440 | `38f8ba60fac9c19d205a316db9e0ee86d5c2a1e9026db8e89333633b6f5b41d7` | `9s/0; 0.65s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk20_1_1` | `mon\m852\emp_emp\atk03\bin\atk20_1_1` | 1,440 | `478aeb5bebd788ec1d8c82ebc5180860361d7feffe1bfde55bb39270aebafb1f` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk30_1_1` | `mon\m852\emp_emp\atk03\bin\atk30_1_1` | 1,440 | `478aeb5bebd788ec1d8c82ebc5180860361d7feffe1bfde55bb39270aebafb1f` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk40_1_1` | `mon\m852\emp_emp\atk03\bin\atk40_1_1` | 1,440 | `478aeb5bebd788ec1d8c82ebc5180860361d7feffe1bfde55bb39270aebafb1f` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk50_1_1` | `mon\m852\emp_emp\atk03\bin\atk50_1_1` | 1,440 | `478aeb5bebd788ec1d8c82ebc5180860361d7feffe1bfde55bb39270aebafb1f` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk60_1_1` | `mon\m852\emp_emp\atk07\bin\atk60_1_1` | 1,440 | `01164821b8953f2930facdb4dd34d91659256044f5cf745f97be944e8ab9fd5c` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk70_1_1` | `mon\m852\emp_emp\atk07\bin\atk70_1_1` | 1,440 | `01164821b8953f2930facdb4dd34d91659256044f5cf745f97be944e8ab9fd5c` | `9s/0; 0.85s/7` |
| `m852/btl/0001/outer/s_btl01` | `SCB` | `atk80_1_1` | `mon\m852\emp_emp\atk07\bin\atk80_1_1` | 1,440 | `01164821b8953f2930facdb4dd34d91659256044f5cf745f97be944e8ab9fd5c` | `9s/0; 0.85s/7` |
| `m524/wss/0001/outer/skill01` | `MCB` | `cbbm_sp_01` | `chr\mon\m524\animation\a001\bt_emp_emp\mcc\base\b001\bin\cbbm_sp_01` | 528 | `e770c4eaf9b44c5eec1ec8a09f8174a672864e236af2b37fb0df4f21e5a26416` | `paired curve map` |
| `m524/wss/0001/outer/skill01` | `MTB` | `cbbm_sp_01` | `chr\mon\m524\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_sp_01` | 1,879 | `dd9ce2e2a0f918a3839101d40a9cb21fe9f7a12d84563727c2dcb3df138d9fd3` | `12 bones; 30 fps; 90f/3.000s` |

Notable omissions: FID `1110` nests 120-frame `eb_man30880a08x`; BID nests eight MSB/init schedulers and 16 cast/parts-break schedulers; BTL nests the basic attack dispatcher and eight attack schedulers. Nail WSS1 repeats its 90-frame skeletal MTB inside the effect package, with a distinct inner MCB hash.

## Nested m852 visual controllers

Nested live-resource census: **38 ACB**, **38 LEAF**, **1 MCB**, **1 MTB**, **1 RES**, **32 SCB**, **36 VEFF**, **38 VINS**, **232 VMDL**, **180 VTEX**.

The following table lists every nested VEFF and ACB. VMDL/VTEX/VINS/LEAF render leaves are counted above and are transitively integrity-covered by their outer RES package hash in the preceding catalog; they are not additional animation selectors.

| Bank / package | Type | ID | Path | Bytes | SHA-256 | Embedded MTB classification |
|---|---|---|---|---:|---|---|
| `m852/bid/0000/outer/msb_vfx/m999_msb` | `VEFF` | `0Xv7Tfift_eish2` | `skill04\veff\bin\0Xv7Tfift_eish2` | 28,908 | `1e3d19959accc04b7d2ba78ad473040f7ce6353d4edfd86fc4e63ccaa31183a6` | `none` |
| `m852/bid/0000/outer/msb_vfx/m999_msb` | `ACB` | `msb4` | `skill04\init_msb4_1\bin\msb4` | 1,016 | `1251bb43d20acaa7b445028875b2c263654bee0b8365b8ee2e0391187d3e779d` | `3ch 38f@30` |
| `m852/bid/0000/outer/msb_vfx/m999_msb` | `VEFF` | `2Jckltift_skleb` | `skill05\veff\bin\2Jckltift_skleb` | 17,952 | `6c1767731acff97324e526a7d35891501e5d97c1619462f51738570da3dba83e` | `none` |
| `m852/bid/0000/outer/msb_vfx/m999_msb` | `ACB` | `msb5` | `skill05\init_msb5_1\bin\msb5` | 1,016 | `3ef6b7dbcede758176c4bfff486e1881aa92dd40b68778deb69ea55f264cc5b0` | `3ch 46f@30` |
| `m852/wss/0001/outer/skill01` | `VEFF` | `4hxifNift_sklc1` | `bin\4hxifNift_sklc1` | 31,388 | `98d42313755b4b6fc5aa77286fecd79362232e8acda8c3ce04b14fa9ece906f7` | `none` |
| `m852/wss/0001/outer/skill01` | `VEFF` | `3ETEayift_sklk1` | `bin\3ETEayift_sklk1` | 5,916 | `63438ee9b57ba99b832913b6ec807c159d0b96af7a96e19789cb1443c1b15f66` | `none` |
| `m852/wss/0001/outer/skill01` | `ACB` | `m852_0001_cas` | `mon_main\bin\m852_0001_cas` | 1,016 | `4e1b3f279d884befb1968bb406525d0e16a5e65ffd44472528f56e32e8cebac2` | `3ch 61f@30` |
| `m852/wss/0001/outer/skill01` | `ACB` | `m852_0001_ksk1` | `mon_main\bin\m852_0001_ksk1` | 1,016 | `cca15e6a081eca0eeeaa5c4e3795d048846b8847c0fb3bf7090ee060690577c9` | `3ch 21f@30` |
| `m852/wss/0001/outer/skill01` | `ACB` | `m852_0001_ksk2` | `mon_main\bin\m852_0001_ksk2` | 1,016 | `2f16dce5618eda82ac0520d52f97291dab711cbc2c42a162b7f366ec6618273a` | `3ch 21f@30` |
| `m852/wss/0001/outer/skill01` | `ACB` | `m852_0001_ksk3` | `mon_main\bin\m852_0001_ksk3` | 1,016 | `fe5a5f2eac0be91b7f38d590266d12b8646c87a9e2d8724d4122351e667ab786` | `3ch 21f@30` |
| `m852/wss/0001/outer/skill01` | `VEFF` | `3T5RIOift_sklt1` | `bin\3T5RIOift_sklt1` | 27,868 | `0d570f6e0ff406ad83c703b75e77d1985ad1b61004cc680e3574eac70e1417e5` | `none` |
| `m852/wss/0001/outer/skill01` | `ACB` | `m852_0001_tar` | `m852_0001\bin\m852_0001_tar` | 1,016 | `79c063fc4cd05ee2ea358f8e83966ca401df33dd45d4093cb5e55def519f6cb1` | `3ch 61f@30` |
| `m852/wss/0002/outer/skill02` | `VEFF` | `1TuSshift_sklc2` | `bin\1TuSshift_sklc2` | 24,620 | `1bf11da4feafbabb0d24af77f10dbbca5b6fd2115016716002c3a0dcadf64590` | `none` |
| `m852/wss/0002/outer/skill02` | `ACB` | `m852_0002_cas` | `mon_main\bin\m852_0002_cas` | 1,016 | `9d4fbf1d026b12249cae613c93f11c13a82eb649663416162fbddfdd6c60ca16` | `3ch 56f@30` |
| `m852/wss/0002/outer/skill02` | `VEFF` | `1v3rVuift_sklt2` | `bin\1v3rVuift_sklt2` | 25,100 | `094b11c4bd129af077bb7e57292bda840f2679f6c111d26a24b61632f242f3f4` | `none` |
| `m852/wss/0002/outer/skill02` | `ACB` | `m852_0002_tar` | `m852_0002\bin\m852_0002_tar` | 1,016 | `c2217ac703c5f92ab0da9061f5645a2ba98b7f244e7afef76985a609ea99957c` | `3ch 56f@30` |
| `m852/wss/0003/outer/skill03` | `VEFF` | `22xxxVift_sklc3` | `bin\22xxxVift_sklc3` | 34,625 | `5b6fff23a8714ae199ba292465d0a700b645e6cc7985ce028cf35cb95e11d57f` | `none` |
| `m852/wss/0003/outer/skill03` | `ACB` | `m852_0003_cas` | `mon_main\bin\m852_0003_cas` | 1,016 | `24a66d4403db5f522dac22a8a4bf9928f7cfa067fb1064c2635d92ea61fcbe6a` | `3ch 61f@30` |
| `m852/wss/0003/outer/skill03` | `VEFF` | `1EGptsift_sklt3` | `bin\1EGptsift_sklt3` | 25,964 | `a7831375df7c48de888db0a5cc7e6b12b69644abff4e7a71722d10f2e9031706` | `none` |
| `m852/wss/0003/outer/skill03` | `ACB` | `m852_0003_tar` | `m852_0003\bin\m852_0003_tar` | 1,016 | `ed3d82dbb540f045d3bfe59516e9ba628be8282818e2162d75ff46537a7e714e` | `3ch 45f@30` |
| `m852/wss/0004/outer/skill04` | `VEFF` | `03eeffift_sklc4` | `bin\03eeffift_sklc4` | 25,932 | `d30d09a4e2706aae1a823db0b027becf22d6f5c96635a1945aef41870d29ea68` | `none` |
| `m852/wss/0004/outer/skill04` | `VEFF` | `08lPJvift_sklb4` | `bin\08lPJvift_sklb4` | 26,944 | `41572481eaf1514d685110fbc2895cc3bf6796e2b75ed3b926e89d60f6fcbc33` | `none` |
| `m852/wss/0004/outer/skill04` | `ACB` | `m852_0004_cas` | `mon_main\bin\m852_0004_cas` | 1,016 | `8a3a9cc84b916cd97570fddbd83052bb0eddc2c956da113c8b11efcfeb628ef6` | `3ch 57f@30` |
| `m852/wss/0004/outer/skill04` | `ACB` | `m852_0004_fire` | `mon_main\bin\m852_0004_fire` | 1,016 | `c74f9a1a8842bc83314a4f83065d942d8e41ab41e3fd4b23ae8bdc15c644d3e9` | `3ch 53f@30` |
| `m852/wss/0004/outer/skill04` | `VEFF` | `4m2lmMift_sklt4` | `bin\4m2lmMift_sklt4` | 28,300 | `631dcb0da8eb9ada433691ff0769456f980366a11e4080d371d35143f181204a` | `none` |
| `m852/wss/0004/outer/skill04` | `ACB` | `m852_0004_tar` | `m852_0004\bin\m852_0004_tar` | 1,016 | `bea169b52a000bd092215ef71d485223f065d6a2db04e01b208875f1b3e11438` | `3ch 56f@30` |
| `m852/wss/0005/outer/skill05` | `VEFF` | `3hxlsvift_sklc5` | `bin\3hxlsvift_sklc5` | 15,356 | `3133849a5de75ac17aee97d1b6ada4eaaf8f5a8892fe450c9359ebc939336b97` | `none` |
| `m852/wss/0005/outer/skill05` | `ACB` | `m852_0005_cas` | `mon_main\bin\m852_0005_cas` | 1,016 | `b818c01609ef2ea75cec26203e237d01b032e96db3511ba64e4f32a89d00e15e` | `3ch 51f@30` |
| `m852/wss/0007/outer/skill07` | `VEFF` | `0E7xvUift_skls7` | `bin\0E7xvUift_skls7` | 23,216 | `106413f18a6c45b66aac28832983ee87cccaa48a6241cde7ed51a9fd6bb79869` | `none` |
| `m852/wss/0007/outer/skill07` | `VEFF` | `1OIs1Rift_sklc7` | `bin\1OIs1Rift_sklc7` | 33,612 | `6be6516aca5099fc6873691d4590f1ed4175ec5e2f86e3beb9ec49c682499def` | `none` |
| `m852/wss/0007/outer/skill07` | `ACB` | `m852_0007_cas` | `mon_main\bin\m852_0007_cas` | 1,016 | `d0abc39e97d27242d2bd56456f3eff1e294535a27c362840b3ef852da5fd6903` | `3ch 46f@30` |
| `m852/wss/0007/outer/skill07` | `ACB` | `m852_0007_fire` | `mon_main\bin\m852_0007_fire` | 1,016 | `4a127445227a8ce5200c43aff3482931f16ffe62e1101d62f04ad4e97b8ebe83` | `3ch 61f@30` |
| `m852/wss/0007/outer/skill07` | `VEFF` | `1qRjXoift_sklt7` | `bin\1qRjXoift_sklt7` | 32,556 | `8cbe84576626696dc804d9a2ea92aa004842f738cc737f5677e736f0bcd10f22` | `none` |
| `m852/wss/0007/outer/skill07` | `ACB` | `m852_0007_tar` | `m852_0007\bin\m852_0007_tar` | 1,016 | `83582d4ea6097030fadb19a47d8fe519ebed19ec8631b028fd0b4f04f7ba79e7` | `3ch 56f@30` |
| `m852/wss/0008/outer/skill08` | `VEFF` | `4w4wY1ift_sklc8` | `bin\4w4wY1ift_sklc8` | 8,816 | `65e582e692eadf7d7fa72a0232932933261b731f9e43a795d518d06dea9a25ff` | `none` |
| `m852/wss/0008/outer/skill08` | `ACB` | `m852_0008_cas` | `mon_main\bin\m852_0008_cas` | 1,016 | `c808b5296d7a75cf3b74866567f6d043d50d89e1acbca9146b3c64ecb9d75c6b` | `3ch 42f@30` |
| `m852/wss/0010/outer/skill10` | `VEFF` | `0N6g3Wift_sklca` | `bin\0N6g3Wift_sklca` | 19,884 | `5d7a053bbd545e6c88f00d2e6bd4e5979520df33ebc61da6e68bae62121bd512` | `none` |
| `m852/wss/0010/outer/skill10` | `ACB` | `m852_0010_cas` | `mon_main\bin\m852_0010_cas` | 1,016 | `c2605e22f50d56f9c5277762af3bf347efb9d1fe771cfc96ae3d21f2a31f2bdd` | `3ch 47f@30` |
| `m852/wss/0012/outer/skill12` | `VEFF` | `21tFk0ift_sklcc` | `bin\21tFk0ift_sklcc` | 65,852 | `ccd333097120052582e82addaacd9ed7ee13917ea6f72129ac45f83cac0175de` | `none` |
| `m852/wss/0012/outer/skill12` | `VEFF` | `260Ym0ift_sklbc` | `bin\260Ym0ift_sklbc` | 19,233 | `44d7ae18d97dbec5cee66648f4dbdea1e9ff6dc83f094a3e060096d0906a68c9` | `none` |
| `m852/wss/0012/outer/skill12` | `ACB` | `m852_0012_cas` | `mon_main\bin\m852_0012_cas` | 1,016 | `039d4876e04a3ddb4970ba745e8d2f0fe0de9f688ee66b8e813b013e554740ac` | `3ch 131f@30` |
| `m852/wss/0012/outer/skill12` | `ACB` | `m852_0012_bom` | `mon_main\bin\m852_0012_bom` | 1,016 | `12e726cef77f017786ad52a59de7492afed84fde544c37b2318258788cae18c4` | `3ch 111f@30` |
| `m852/wss/0012/outer/skill12` | `VEFF` | `1D2eNdift_skltc` | `bin\1D2eNdift_skltc` | 28,236 | `56ab38812e3a36390bff101169918c18b86ee05686c15f092f5e44e77026be31` | `none` |
| `m852/wss/0012/outer/skill12` | `ACB` | `m852_0012_tar` | `m852_0012\bin\m852_0012_tar` | 1,016 | `62a9aa21bf6117c9b63d4be2d185a943a592f1acb677be256892d6857bd038d0` | `3ch 56f@30` |
| `m852/wss/0013/outer/skill13` | `VEFF` | `1DMc1kift_sklcd` | `bin\1DMc1kift_sklcd` | 65,852 | `4f6139e652bcfa188d5364f75908f6feb246c769fef71c02bf3a37ef4f693827` | `none` |
| `m852/wss/0013/outer/skill13` | `VEFF` | `1ITNvAift_sklbd` | `bin\1ITNvAift_sklbd` | 19,233 | `d2ce016abe22ce06c73363a0cabba64b98eddb2b8f1317d290f9ea3456acd484` | `none` |
| `m852/wss/0013/outer/skill13` | `ACB` | `m852_0013_cas` | `mon_main\bin\m852_0013_cas` | 1,016 | `14594ee718c1ed0f550b9f8998875de45cf5225008eb01dd9ea7d4f9b971849f` | `3ch 131f@30` |
| `m852/wss/0013/outer/skill13` | `ACB` | `m852_0013_bom` | `mon_main\bin\m852_0013_bom` | 1,016 | `dfd2e96c0122c65fc4f660ed98df85d72f7cd2c0543ab6bbf6607a1e8fbae6c1` | `3ch 111f@30` |
| `m852/wss/0013/outer/skill13` | `VEFF` | `1fV3WRift_skltd` | `bin\1fV3WRift_skltd` | 40,592 | `98b6f9fd6a502aa31749b8053bbc4d622a246cb75baefba4863bae92a1cdca13` | `none` |
| `m852/wss/0013/outer/skill13` | `ACB` | `m852_0013_tar` | `m852_0013\bin\m852_0013_tar` | 1,016 | `69dfa927beb7e7c7a81f5803ff9cb3d58bb4ff05d60a6c0a54d5a7dc2ccb94d7` | `3ch 56f@30` |
| `m852/wss/0014/outer/skill14` | `VEFF` | `1NK9qcift_sklce` | `bin\1NK9qcift_sklce` | 84,684 | `36e8ae1dc06e4f101722e1f75d49bbfafdc499b2057dbff65b200796efb39f66` | `none` |
| `m852/wss/0014/outer/skill14` | `VEFF` | `1SRKUsift_sklbe` | `bin\1SRKUsift_sklbe` | 19,425 | `8a582f3ebecc8f8c66c519bac10562aa1eb7a8da39adfe5291a8bf7c950a42b9` | `none` |
| `m852/wss/0014/outer/skill14` | `ACB` | `m852_0014_cas` | `mon_main\bin\m852_0014_cas` | 1,016 | `6be91c16e1fe9a2fd5bb600edfc2e325b4482947ba4fdeee4fa20fe7da3fcfb6` | `3ch 66f@30` |
| `m852/wss/0014/outer/skill14` | `ACB` | `m852_0014_bom` | `mon_main\bin\m852_0014_bom` | 1,016 | `9c87905b156abbf2277a598dd8956e34b166f90e6c13d2db5a3426fe683d66bb` | `3ch 61f@30` |
| `m852/wss/0014/outer/skill14` | `VEFF` | `1pT1lFift_sklte` | `bin\1pT1lFift_sklte` | 46,124 | `98171e9a1b185874b9fe54c4b42be5601199ede2ae36e720b41e1fc60dd73372` | `none` |
| `m852/wss/0014/outer/skill14` | `ACB` | `m852_0014_tar` | `m852_0014\bin\m852_0014_tar` | 1,016 | `2805e5ec14329e7531fa838f7861643e10aeb7c6776a4e19d080b9585500344a` | `3ch 47f@30` |
| `m852/wss/0015/outer/skill15` | `VEFF` | `4vj8f8ift_sklcf` | `bin\4vj8f8ift_sklcf` | 8,636 | `b28092edd7373fc5ce92a3a8ab6e8f6cc3b8326e0e38a75a8669a8d5d87db267` | `none` |
| `m852/wss/0015/outer/skill15` | `ACB` | `m852_0015_cas` | `mon_main\bin\m852_0015_cas` | 1,016 | `f53ef1e643bb5d569caa9389f42b8850294a9cb4c607d340bcc14845ec5aa5f9` | `3ch 44f@30` |
| `m852/wss/0017/outer/skill17` | `VEFF` | `45YvB8ift_sklch` | `bin\45YvB8ift_sklch` | 24,556 | `c4261c0b3b5260e65468fbc8aa36594778da947eb3ab519bcdf3695a4b9ee2e9` | `none` |
| `m852/wss/0017/outer/skill17` | `ACB` | `m852_0017_cas` | `mon_main\bin\m852_0017_cas` | 1,016 | `2ea739b34e9523720f3441b7f45ec74cfef91579c72993ab8d0a914ab0f72454` | `3ch 44f@30` |
| `m852/wss/0018/outer/skill18` | `VEFF` | `4fWC2Mift_sklci` | `bin\4fWC2Mift_sklci` | 8,544 | `e0fb14fad370bd58c3a6a2e6ff46ee5a2b394ff38bb0683b1bbb06ddb6ac9904` | `none` |
| `m852/wss/0018/outer/skill18` | `ACB` | `m852_0018_cas` | `mon_main\bin\m852_0018_cas` | 1,016 | `1bef852716a4096ea02a24da10674ddee045ef607ae2e6a1164561a21ea9c3f2` | `3ch 42f@30` |
| `m852/wss/0019/outer/skill19` | `VEFF` | `2IEungift_sklcj` | `bin\2IEungift_sklcj` | 10,161 | `1b4613ca4c035d1dc414990706d744ffc6fc4eb50d58b614b3e575dc9ff89fc6` | `none` |
| `m852/wss/0019/outer/skill19` | `ACB` | `m852_0019_cas` | `mon_main\bin\m852_0019_cas` | 1,016 | `6afe23719d1985179f8db7b1e1bc4a54a71b643158d1c8bbd87602f2c057f438` | `3ch 42f@30` |
| `m852/wss/0020/outer/skill20` | `VEFF` | `4D2z61iff_skl20` | `bin\4D2z61iff_skl20` | 38,940 | `4b6b27ce521e20779c24c245fb7fa0415f737c135e732f0c2e7e210f8a3436fb` | `none` |
| `m852/wss/0020/outer/skill20` | `ACB` | `m852sk20` | `mon_main\bin\m852sk20` | 1,016 | `6a4a6c815939ca287360f8788e91e08585da840ebd815e19f1173594e582867d` | `3ch 44f@30` |
| `m852/wss/0021/outer/skill02` | `VEFF` | `3WXfCTift_sklc6` | `bin\3WXfCTift_sklc6` | 58,460 | `82b14539ad17047e7a5b31ace490a175fa0d08be6f7028dfc3ae5cd19caac6f0` | `none` |
| `m852/wss/0021/outer/skill02` | `ACB` | `m999_0002_cas` | `mon_main\bin\m999_0002_cas` | 1,016 | `1fbcc6cc2a8fe7b1555d39df02653468ac39da41aa3dc010e3b403f5df68c055` | `3ch 82f@30` |
| `m852/wss/0021/outer/skill02` | `VEFF` | `02ukO8ift_sklt6` | `bin\02ukO8ift_sklt6` | 32,556 | `23268536d46a33916e9279add8719b927800b0cad2f1d0454af7a808c3c24021` | `none` |
| `m852/wss/0021/outer/skill02` | `ACB` | `m999_0002_tar` | `m999_0002\bin\m999_0002_tar` | 1,016 | `ce701e32637ee803aa00602acf5ddc4ccda8f043d5edb75f508821eb09032947` | `3ch 56f@30` |
| `m852/wss/0022/outer/skill03` | `VEFF` | `0l2srIift_sklbb` | `bin\0l2srIift_sklbb` | 38,188 | `e4675cd6d2105aaa91f293f81b76ed651ad9fc1c87c8afa5b943db41328286fa` | `none` |
| `m852/wss/0022/outer/skill03` | `ACB` | `m999_0003_cas` | `mon_main\bin\m999_0003_cas` | 1,016 | `82d9c0b70493c780b3346915497b6538fdceb082a6d9fc6105923d54732b2c52` | `3ch 64f@30` |
| `m852/wss/0022/outer/skill03` | `VEFF` | `4nEJXiift_skltb` | `bin\4nEJXiift_skltb` | 32,556 | `d719652e0edb0f08ab95840665afe79f3c264d4f2041680bc1c8d403a4eedb23` | `none` |
| `m852/wss/0022/outer/skill03` | `ACB` | `m999_0003_tar` | `m999_0003\bin\m999_0003_tar` | 1,016 | `597c09c194e09ef0a959c8209296ca2c0520595987f2ae5d281fdd028dbfa818` | `3ch 56f@30` |

Every three-channel MTB above is an effect FCurve stored inside its hashed ACB. None is a second actor skeleton clip. This distinction prevents dash flames, plume/fire layouts, and Nail glow controls from being misreported as body animations.

## Nested m524 visual controllers

Nested live-resource census: **1 ACB**, **1 LEAF**, **1 MCB**, **1 MTB**, **1 VEFF**, **1 VINS**, **6 VMDL**, **5 VTEX**.

The following table lists every nested VEFF and ACB. VMDL/VTEX/VINS/LEAF render leaves are counted above and are transitively integrity-covered by their outer RES package hash in the preceding catalog; they are not additional animation selectors.

| Bank / package | Type | ID | Path | Bytes | SHA-256 | Embedded MTB classification |
|---|---|---|---|---:|---|---|
| `m524/wss/0001/outer/skill01` | `VEFF` | `0W7Ar9anc_sklc1` | `vfx\mon\anchor_524\skill01\bin\0W7Ar9anc_sklc1` | 25,504 | `d8ecaf7f619c5ff19547c26542e196cfb4e90ec5d1b811a66df7e8ee04da7c65` | `none` |
| `m524/wss/0001/outer/skill01` | `ACB` | `m524_0001_cas` | `vfx\mon\anchor_524\skill01\mon_main\bin\m524_0001_cas` | 1,016 | `c6602165b050dbebf6aecf36393be55d01ca25711df3f150170b05013ed6fa37` | `3ch 61f@30` |

Every three-channel MTB above is an effect FCurve stored inside its hashed ACB. None is a second actor skeleton clip. This distinction prevents dash flames, plume/fire layouts, and Nail glow controls from being misreported as body animations.

## Model-root state, orientation, render, and skeleton resources

### Complete model-state motion graph

`top_tex1` and `top_tex2` each physically contain the same motion pairs for their model. The hashes below are from `top_tex1`; the matching IDs in `top_tex2` have identical MCB/MTB hashes. Render textures differ and retain distinct file/TXB hashes.

| Model | State ID | MTB path | Bones | Frames / seconds | MCB bytes / SHA-256 | MTB bytes / SHA-256 |
|---|---|---|---:|---:|---|---|
| `m852` | `cbxs_st0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0` | 135 | 1 / 0.033s | 528 / `ee870592c3d89390529eaf2525e1ed57dcc8e3c58926e0922b7a25641ebf3f34` | 644 / `0b9deac4e80393bd0989c62cd2b4bcb6e69e507ed181a85822b8608331c4d67e` |
| `m852` | `cbxs_st0to1` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0to1` | 135 | 30 / 1.000s | 528 / `d46aa2898029777c3f9e715f603db174dc9ef7bce8452cd0301fa6ee46f09a62` | 692 / `1cad4fb1bbbfa78b5d580e953a86777f173455983303da11c9d8903a13281113` |
| `m852` | `cbxs_st0to2` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0to2` | 135 | 30 / 1.000s | 528 / `c3818fb215e3b9170318c77bf513b4dc8eff53b641bef5b89199b89a94f4e73a` | 692 / `d8d49d74aedd496f58cc14bdd35b10de46a9251341534ca14ea466597e253f8d` |
| `m852` | `cbxs_st0to3` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0to3` | 135 | 30 / 1.000s | 528 / `a7be2388a0d6bf51676f1214cc3feceb99e549b825223d0aeec492eb9352aa67` | 740 / `19273268af1bbc52b86e9fc312095ce6be20ceadf369dcba26ac110a05be6c96` |
| `m852` | `cbxs_st0to4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0to4` | 135 | 30 / 1.000s | 528 / `e99f7fa41149ab0075d26d191d0d4fe3286bff45112633590e49e4d60ebf1d70` | 788 / `251663ac31837196e5be94127f4253ab475893f596d7a2b95331aa55b388ec9d` |
| `m852` | `cbxs_st1` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st1` | 135 | 1 / 0.033s | 528 / `378923aac07f79b5fcefec28827815481513550aee84089d55d0d31e48b65211` | 644 / `ee7d0ba7186965227207d972c14d6e10eeb056c58badc77388b36b93f6f7ea91` |
| `m852` | `cbxs_st1to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st1to0` | 135 | 30 / 1.000s | 528 / `657408813dc070e660c974348ad50f3c145f3458913da794d79e95d4d0c4907b` | 692 / `1ee25ca6b49de6b95bc86cf0a3cc32e942edee7a5cde09fa792e5c0d4d8cf361` |
| `m852` | `cbxs_st2` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st2` | 135 | 1 / 0.033s | 528 / `64442910adce388f9c83dfdc9f9e913ad249405da38b59d5dfd569b93030bba6` | 644 / `12edd92751513b84e4499574c15c67fc952aa8085895f3da5f7d70e8122909aa` |
| `m852` | `cbxs_st2to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st2to0` | 135 | 30 / 1.000s | 528 / `7a83c59107bc48b6f97fcc3c0da9803b8d43bc4cf1ac4759c63c1dbcf8191685` | 692 / `f2bcbe07431129fe5dc81b66a4ee79beee8e29327d5536ff87f5b28392e2d43c` |
| `m852` | `cbxs_st3` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3` | 135 | 1 / 0.033s | 528 / `b9c6b8e08597486875ea264126fd178e7090402c51efec046da966e07fe4d77f` | 644 / `c8dcdfe9466f667bfdeae54eefcffbba2ba6c51ed663c50b218edfd44e32a957` |
| `m852` | `cbxs_st3to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3to0` | 135 | 30 / 1.000s | 528 / `b102e6183c48352bc0361c18feae6668b8961177e73a48beab5b3cb59948baf4` | 740 / `0edffb4a0ed749723c65c8de0e3fefc6d416794cc8e232d29494ecb7df7664cd` |
| `m852` | `cbxs_st3to4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3to4` | 135 | 13 / 0.433s | 528 / `f554b32097272b49b5bfba0c5d75b0a170a86c8019ca22cac6812fbc061931af` | 692 / `f63301c4a7fe2e88671deb9d9850a1b3e0376e2c21e8156949c30eb860cf0593` |
| `m852` | `cbxs_st4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4` | 135 | 1 / 0.033s | 528 / `e1463dfc6e2e073bada88d636da7548a874cefbce5d138cdd96ef71e9f6c91a9` | 644 / `cd7382e040bc8024a5763db437a917a7cf1800753e39f04d4485bde56f26ef67` |
| `m852` | `cbxs_st4to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4to0` | 135 | 30 / 1.000s | 528 / `88a457e6f351e5bae33763813e3f9a74ceb1ecd143263050f3f9420f2ee6a459` | 788 / `8ec5a54c8c091ea0cf4840629670f3dbd8422c8465ec5c3d2444d806d7b51c00` |
| `m524` | `cbxs_st0` | `chr\mon\m524\model\equip\e001\miga\v000\bin\cbxs_st0` | 12 | 99 / 3.300s | 528 / `951882c5e64e724a1d3093b94cd829f2479eabaa0acbabaeab66b703b2f5ad50` | 438 / `a22b0b315baaa602b52e7f144984e58e259c4a84feccbf36f3dcac6e90079141` |
| `m524` | `cbxs_st0to1` | `chr\mon\m524\model\equip\e001\miga\v000\bin\cbxs_st0to1` | 12 | 29 / 0.967s | 528 / `2378307204a6f9502c598b6367607f993f07897aed417bde1fdf1e98efe90fc9` | 486 / `2553840dd49ad9a9b70c7203db7eca494eb348ee871dd358bae66161fd714dbd` |
| `m524` | `cbxs_st1` | `chr\mon\m524\model\equip\e001\miga\v000\bin\cbxs_st1` | 12 | 99 / 3.300s | 528 / `84f05356dd8759ba008c5657c3d0aa6d1847f7a85f50d596ef5fe146263f83df` | 438 / `d7459f3e933ac94c96a29cbdb8fb9d069053bb409ae12808173105fd7669a12b` |
| `m524` | `cbxs_st1to0` | `chr\mon\m524\model\equip\e001\miga\v000\bin\cbxs_st1to0` | 12 | 9 / 0.300s | 528 / `f6c02774fdd66e6fbeb2ffea5eaabc8526e3cc8bee5c6b0aaa24b9d2d814303a` | 486 / `f9caaa6da5d357b74b267f9ac60bd176faaca796da00b0c388f0f4ea9440b5ae` |

The pre-reconciliation Ifrit baseline mentions `st0`, `st4`, `st0to4`, and `st4to0`, but omits `st1`, `st2`, `st3`, their return transitions, the `st0to1/2/3` branches, and the installed 13-frame `st3to4`. The corresponding Nail baseline omits all four m524 model-state pairs (`st0`, `st0to1`, `st1`, `st1to0`).

### m852 `skl/9999` orientation motions

| ID | MTB path | Frames / seconds | MCB bytes / SHA-256 | MTB bytes / SHA-256 |
|---|---|---:|---|---|
| `cbna_ori_b_d` | `miga\base\b001\bin\cbna_ori_b_d` | 1 / 0.033s | 528 / `8e35c89fbf16759931bb2b4279845ddf1ac56b2971c723645c6a6b5f1806ff62` | 375 / `d9c82135bb9c34680a665ad74230aba033c31ae9d5c4239d6b3e072e81d0a967` |
| `cbna_ori_b_l` | `miga\base\b001\bin\cbna_ori_b_l` | 3 / 0.100s | 528 / `12b32ffe1285727ca2e7e7d9d5a324c96f24fc40f2f7f60fca30e18accfb4194` | 391 / `367375c4df9f2c86484b01dc12ac76cddad83b9d33feaa4e005ffb36aea29cdc` |
| `cbna_ori_b_r` | `miga\base\b001\bin\cbna_ori_b_r` | 1 / 0.033s | 528 / `79d96de2b6b5bbe2c0e9c4ec2c35516881bb28db7a41276957cfcd2e1801f4f0` | 279 / `1e5186a01baf048b4400a4abddd3a0b65f747042dca4492ca36ee5a36559e8f3` |
| `cbna_ori_b_u` | `miga\base\b001\bin\cbna_ori_b_u` | 1 / 0.033s | 528 / `17de88bd78b78561128f3f329e30c0477f35dba0ad09a6c109dd65eae6463391` | 375 / `5c990e0f66941c4b5e3ec43a0e05036c84482446b95f4f9cb89bebd759e1e6d8` |
| `cbna_ori_f_d` | `miga\base\b001\bin\cbna_ori_f_d` | 1 / 0.033s | 528 / `6c941bd47804e266fc6518fe7953f3ba853f138c0f17435719efe5fb2ac645fc` | 375 / `982a11de27703ee1e636a780a0d87e0e904e7c5b2f258be67f628c430f0393d2` |
| `cbna_ori_f_l` | `miga\base\b001\bin\cbna_ori_f_l` | 1 / 0.033s | 528 / `7421a4c1b3e6c74470f886d68c3e48af4fec18f9e9227513c4aa918362a8ed06` | 375 / `8c10602ea51ac36c8415568000fb63da94779f1d49cbabab4f10c61c1e9652b9` |
| `cbna_ori_f_r` | `miga\base\b001\bin\cbna_ori_f_r` | 1 / 0.033s | 528 / `af8cd2c338857154442314582bb0a8c7e5837cdb5ce9878302fad09004d93243` | 375 / `89ff50808ba43d359756c92eceaa77be47453e7cbc298cd2fa1fb7b595850d71` |
| `cbna_ori_f_u` | `miga\base\b001\bin\cbna_ori_f_u` | 1 / 0.033s | 528 / `315a08bfe07413e13fe7f24a1f05b3f7b64cef2c0dce125f9b6852e2c6a9b0f7` | 375 / `341f54a1edf3a80a398b210474d96d37bcc493ed1fdfe12bbc7c701435b9f784` |
| `cbna_ori_s_d` | `miga\base\b001\bin\cbna_ori_s_d` | 1 / 0.033s | 528 / `34f9f95b8034e13302bfb8ee256ef15f48fa85d9d78647e26b4b35f4b7912f10` | 279 / `1e5186a01baf048b4400a4abddd3a0b65f747042dca4492ca36ee5a36559e8f3` |
| `cbna_ori_s_u` | `miga\base\b001\bin\cbna_ori_s_u` | 1 / 0.033s | 528 / `8b2fc9a009e5f722a322f1d528a6dce81ea88fe4ec439262c336e89aacf72aa8` | 279 / `1e5186a01baf048b4400a4abddd3a0b65f747042dca4492ca36ee5a36559e8f3` |

### Non-motion model/skeleton outer resources

| File | Type | ID | Path | Bytes | SHA-256 |
|---|---|---|---|---:|---|
| `m852/skl/0001` | `CIBB` | `info_m852` | `cib\cibb\mon\info_m852` | 84 | `1fbe42ac7dbd119d16b492aa45d8b9c233fb62d0b468097f3112c3c3e74245b7` |
| `m852/skl/0001` | `CIBS` | `info_m852` | `cib\cibs\mon\info_m852` | 16 | `84b7ba5db40d77cbe7d9b5f2b5dd4b8e92908b765855fe098e2376830fad9701` |
| `m852/skl/0001` | `CIBG` | `m852_cmn` | `cib\cibg\mon\m852\m852_cmn` | 16 | `1dc3bec8d2149b3e5142cabe0c1f32ba7de765e84bf56eb7e05ae567e4b11271` |
| `m852/skl/0001` | `TRB` | `skl_m852b001` | `mon\m852\skeleton\base\b001\mig\bin\skl_m852b001` | 31,082 | `8cd5988a805c31465602bad2639e708c28a9d79632285008ea3024a21a690ab4` |
| `m852/skl/0001` | `CIBM` | `template_mon2` | `cib\cibm\mon\template_mon2` | 3,776 | `4aae0567d4e79581794375152d1f3a0b201e6ac821c83c4d2203fb9a5bac95e1` |
| `m852/equ/e001/top_mdl/0001` | `TRB` | `m852e001` | `mon\m852\model\equip\e001\mig\bin\m852e001` | 833,455 | `c10d450a93023b24a8d1c5c6b71a359ff7a25835e235bb4cebfaa92592c52637` |
| `m852/equ/e001/top_mdl/0001` | `CIBE` | `top_m852e001` | `cib\cibe\mon\m852\top_m852e001` | 16 | `62dedc8bab94faea767e2d1f715c3164cabacb74cabddac7f639fea6a2549404` |
| `m852/equ/e001/top_tex1/0000` | `TXB` | `m852e001t_d` | `shaderlib\chr_mon\m852\sourceimages\low\e001\v000\bin\m852e001t_d` | 96 | `14caadca3073a1e84829da393273cb01d09d4f745c4d9cbad6d7e5a25d9d3421` |
| `m852/equ/e001/top_tex1/0000` | `TXB` | `m852e001t_n` | `shaderlib\chr_mon\m852\sourceimages\low\e001\v000\bin\m852e001t_n` | 96 | `bdf1cf867a9769bd3035912d0f792df713e3ea02e43afd9cfc16a23e71744843` |
| `m852/equ/e001/top_tex1/0000` | `TXB` | `m852e001t_s` | `shaderlib\chr_mon\m852\sourceimages\low\e001\v000\bin\m852e001t_s` | 96 | `bbc989ac4c6411b1a3d21de4a32547dddeee1c55195972c021602b32121fd9f0` |
| `m852/equ/e001/top_tex2/0000` | `TXB` | `m852e001t_d` | `shaderlib\chr_mon\m852\sourceimages\hi\e001\v000\bin\m852e001t_d` | 96 | `e31b1e99a2e98551cf39593106679a1b99b7ab969ad18c6ab6125b3f7cb0faec` |
| `m852/equ/e001/top_tex2/0000` | `TXB` | `m852e001t_n` | `shaderlib\chr_mon\m852\sourceimages\hi\e001\v000\bin\m852e001t_n` | 96 | `0cf5d5e99d2b2679991784f2c788b30d48bc64ca77ab5dd2d8593f0cd295b1d6` |
| `m852/equ/e001/top_tex2/0000` | `TXB` | `m852e001t_s` | `shaderlib\chr_mon\m852\sourceimages\hi\e001\v000\bin\m852e001t_s` | 96 | `c89b1fc6e4e755fbd01602739306bb1b8a2985dd1d6c54c9dfd275dc9180d08e` |
| `m524/skl/0001` | `CIBB` | `info_m524` | `cib\cibb\mon\info_m524` | 84 | `3266129e44203296db871aaec09ac44ece4797253bfd8a42f3cf9bcbb2c26ae9` |
| `m524/skl/0001` | `CIBS` | `info_m524` | `cib\cibs\mon\info_m524` | 16 | `1ef6b675cf9d17a7065dd00f1a60e681a07636037e2dce2571856657c9deb197` |
| `m524/skl/0001` | `CIBG` | `m524_cmn` | `cib\cibg\mon\m524\m524_cmn` | 16 | `58c487d9db3f842a352b24b4ca19b3bc2a267df84554357e57cdd4af7248f2cc` |
| `m524/skl/0001` | `TRB` | `skl_m524b001` | `mon\m524\skeleton\base\b001\mig\bin\skl_m524b001` | 6,474 | `555435cba76f8fcc5083350f04417b1adcd6985f78d53a88bb69aa949224c7eb` |
| `m524/skl/0001` | `CIBM` | `template_mon3` | `cib\cibm\mon\template_mon3` | 3,776 | `2a1b6e9e255b1a034cf6e189bb35036dd3617a0f19d357c0140f8f7d781a47fd` |
| `m524/equ/e001/top_mdl/0001` | `TRB` | `m524e001` | `mon\m524\model\equip\e001\mig\bin\m524e001` | 60,813 | `aca3df2e1624b9e7089e4de2d43e3a9f7acdf8f3db9c9289fbb36a5d65c9fd59` |
| `m524/equ/e001/top_mdl/0001` | `CIBE` | `top_m524e001` | `cib\cibe\mon\m524\top_m524e001` | 16 | `62dedc8bab94faea767e2d1f715c3164cabacb74cabddac7f639fea6a2549404` |
| `m524/equ/e001/top_tex1/0000` | `TXB` | `m524e001t_d` | `shaderlib\chr_mon\m524\sourceimages\low\e001\v000\bin\m524e001t_d` | 96 | `475a4cc007bb63f0bf506bba76f86ecfa046b0dd392d5963cad8ce8d487ffbdb` |
| `m524/equ/e001/top_tex1/0000` | `TXB` | `m524e001t_n` | `shaderlib\chr_mon\m524\sourceimages\low\e001\v000\bin\m524e001t_n` | 96 | `7138910cd47a6dec09781944942e8cd7b3a6ba33ce568c06ae8273e45705b9d4` |
| `m524/equ/e001/top_tex1/0000` | `TXB` | `m524e001t_s` | `shaderlib\chr_mon\m524\sourceimages\low\e001\v000\bin\m524e001t_s` | 96 | `028f70665be16f34687be23e3ab17dd5cb2a93e37fef225d460891ccf43a9dd8` |
| `m524/equ/e001/top_tex2/0000` | `TXB` | `m524e001t_d` | `shaderlib\chr_mon\m524\sourceimages\hi\e001\v000\bin\m524e001t_d` | 96 | `86f588c793fe42f03c1bd3e94a0d4af638013852b138bbb5e3560c0bc7a91ab8` |
| `m524/equ/e001/top_tex2/0000` | `TXB` | `m524e001t_n` | `shaderlib\chr_mon\m524\sourceimages\hi\e001\v000\bin\m524e001t_n` | 96 | `0f5606077c0f5672f32b1d1d755395812ffd31441e18f4988e85bf2b0d49a27b` |
| `m524/equ/e001/top_tex2/0000` | `TXB` | `m524e001t_s` | `shaderlib\chr_mon\m524\sourceimages\hi\e001\v000\bin\m524e001t_s` | 96 | `b75968381682c1603796598deead194dd0ffb87a512d561e1960ecaab4d8319c` |

Both 940-byte `top_snd/0000` files contain no SEDBRES/SCB/MCB/MTB tags. They remain in the direct manifest but provide no independently enumerable animation. `top_mdl` supplies model TRB/CIBE bindings, not an action selector.

## Complete death and persistent-aura model packages

| Model file / package chain | Type | ID | Path | Bytes | SHA-256 | Timing/class |
|---|---|---|---|---:|---|---|
| `m852/e001/met_mdl/outer` | `SCB` | `dead` | `\dead` | 1,344 | `21f2051ff6feccfa8349e828106671abd2bcf05b88abfed8690c51f8dc3242db` | `9s/0; 1.55s/5` |
| `m852/e002/met_mdl/outer` | `RES` | `dead` | `\dead` | 196,552 | `b7cc45a606ff80a248137f32619b7dbabbc4b25d2f8aade5f66a25ce1b5bf82c` | `` |
| `m852/e002/met_mdl/outer/dead` | `SCB` | `dead` | `bin\dead` | 2,288 | `e77a3cb585c7ff5b2294dc0f8c5ff28c24ac62fb4d7d1bad9b2e5aa884bfbf9d` | `9s/0; 2.55s/18` |
| `m852/e002/met_mdl/outer/dead` | `RES` | `dead` | `sch_effect_data\dead` | 193,995 | `708e7881231a06e9ab44ed7188c2e7384e1925c7793832fd77f399d03638bfe1` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `VEFF` | `2ZbTDMift_dead2` | `vfx\mon\ifrit_852\ded\bin\2ZbTDMift_dead2` | 11,040 | `142c0ba2ca16d7ade642e9a777c78ae7658b6e0050c1592ecd8afa19646dfc9c` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `VEFF` | `1wd495ift_dead1` | `vfx\mon\ifrit_852\ded\bin\1wd495ift_dead1` | 12,684 | `2965b9a7e23dbd2f5a557c8e6ff2f31fa33447eba7384bb6a3d4424fb2632df0` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `MCB` | `cbbm_ded` | `chr\mon\m852\animation\a001\bt_emp_emp\mcc\base\b001\bin\cbbm_ded` | 704 | `c74eae24de9b3f02a5b78badfcda9f5d2da2d6cc4399f99af686a530c6bd8922` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `MTB` | `cbbm_ded` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_ded` | 110,167 | `8609497cae8091da3cdc9cab0a6e8d73e9a9be2e0907a63293790fd5b534787a` | `135 bones; 155f/5.167s` |
| `m852/e002/met_mdl/outer/dead/dead` | `MCB` | `cbbm_dedpose` | `chr\mon\m852\animation\a001\bt_emp_emp\mcc\base\b001\bin\cbbm_dedpose` | 704 | `49399c2b0e595df66fe26fdb816d1ef346f9cee869ceeb6ed8c7080d08e3a6b9` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `MTB` | `cbbm_dedpose` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_dedpose` | 4,919 | `f1d4bac7400c5e6877a1066a752545ba034180769f6ce856745838f5841e01ee` | `135 bones; 100f/3.333s` |
| `m852/e002/met_mdl/outer/dead/dead` | `MCB` | `cbxs_st4to0` | `chr\mon\m852\model\equip\e001\mcc\v000\bin\cbxs_st4to0` | 528 | `88a457e6f351e5bae33763813e3f9a74ceb1ecd143263050f3f9420f2ee6a459` | `` |
| `m852/e002/met_mdl/outer/dead/dead` | `MTB` | `cbxs_st4to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4to0` | 788 | `8ec5a54c8c091ea0cf4840629670f3dbd8422c8465ec5c3d2444d806d7b51c00` | `135 bones; 30f/1.000s` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_body` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_body` | 1,016 | `ce18f6dc717f306d7d8778d437edf5fddae29cbb2e16c2f7e2d77f29dacf582b` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_chest` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_chest` | 1,016 | `800d2899f9895d57111199348a099b7d5d8d5b5912079848600d2e7c6ecac4b5` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_r_hand` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_r_hand` | 1,016 | `7993c596c18f1292397dad6dcbb4fe7f724f6e21d2f59e601635898aa6005123` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_l_hand` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_l_hand` | 1,016 | `1398a167a1978d3a08af247aa503c271ae8fbb97733302b4e273c725c1e2bb5d` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_l_asi` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_l_asi` | 1,016 | `d403372a55b9d1a13705e28030ac77cfcf94e4b2ee370566d208036c996cc332` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_r_asi` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_r_asi` | 1,016 | `f66b13c45ba514243d283e4919c94fcfb3768ee0735ae1c4f5eaedc39ff6ce0f` | `effect FCurve 171f@30` |
| `m852/e002/met_mdl/outer/dead/dead` | `ACB` | `m852_ded_fin` | `vfx\mon\ifrit_852\ded\dead\bin\m852_ded_fin` | 1,016 | `c433c0d801d40e03c5d60cdd5de53306c348338a59efd402dbd5dba7a23f6ee8` | `effect FCurve 43f@30` |
| `m524/e001/met_mdl/outer` | `RES` | `dead` | `\dead` | 55,688 | `7fb4aeaf4c12cd065f99e3e544d1dcd87e6ef6f051f9028dd8cb0a8ea1ea2d14` | `` |
| `m524/e001/met_mdl/outer/dead` | `SCB` | `dead` | `bin\dead` | 1,744 | `1b6fefc74b24d052e3342ffa7f4b96a498bf553937587d615c14e963e37471e9` | `9s/0; 0.99s/10` |
| `m524/e001/met_mdl/outer/dead` | `RES` | `dead` | `sch_effect_data\dead` | 53,667 | `2390921fd15400cb44a220731452653b0d827615bcffe469ddbf9d9e3bed414e` | `` |
| `m524/e001/met_mdl/outer/dead/dead` | `VEFF` | `151rmjanc_dead1` | `bin\151rmjanc_dead1` | 16,416 | `04ca2bc88275ff13e30298adc2b783cbcb48a524b863b638332ba11992e56f0c` | `` |
| `m524/e001/met_mdl/outer/dead/dead` | `ACB` | `m524_ded` | `dead\bin\m524_ded` | 1,016 | `dbb0bca727f54f111b73da2ba788f8f2fe28b3306dc2f1b4fa146f63465997df` | `effect FCurve 47f@30` |
| `m524/e002/met_mdl/outer` | `RES` | `dead` | `vfx\mon\anchor_524\ded\dead` | 55,832 | `33656662dce239b750b33e48e41e36aa74afb6c7fdcc58b59a8ff0f17f7b65e2` | `` |
| `m524/e002/met_mdl/outer/dead` | `SCB` | `dead` | `bin\dead` | 1,888 | `5b4b3631be6ac08e27f99efabc685893fe93e11e8146d2b73fabab1e03ea63f6` | `9s/0; 0.99s/12` |
| `m524/e002/met_mdl/outer/dead` | `RES` | `dead` | `sch_effect_data\dead` | 53,667 | `db7c182d71a182fc3f19158e0cde22884f7f9d1f23c16ac67b3b2a66e575c6ee` | `` |
| `m524/e002/met_mdl/outer/dead/dead` | `VEFF` | `151rmjanc_dead1` | `bin\151rmjanc_dead1` | 16,416 | `85745f0569c3b2f1aaa0ecf01267f586c86a2f4507b2aa64fa8e051fbc6a5278` | `` |
| `m524/e002/met_mdl/outer/dead/dead` | `ACB` | `m524_ded` | `dead\bin\m524_ded` | 1,016 | `1ef8ba001f98c3486633f2cf6c0ddaf52d8a98231ddacb1c0fb18c55670f89b1` | `effect FCurve 51f@30` |
| `m524/e002/met_mdl/outer` | `SCB` | `init_msb4_0` | `chr\sch\mon\m524\init\init_msb4_0\bin\init_msb4_0` | 1,312 | `8948d77253578e14feae4af3a0cc380ea063eebd9468c165f7f4fa38fe20809d` | `9s/0; 0.04s/4` |
| `m524/e002/met_mdl/outer` | `RES` | `init_msb4_1` | `vfx\mon\anchor_524\body\init_msb4_1` | 59,407 | `7462f69217ff14efe249f148cb8c588ed05a36cfbc06f5b3bfc7622310fe0d55` | `` |
| `m524/e002/met_mdl/outer/init_msb4_1` | `SCB` | `init_msb4_1` | `bin\init_msb4_1` | 1,552 | `4682daee18b7cd82344d40ec1826fc803c6994e4bbaa0a5553161c15690a0653` | `9s/0; 0.5s/8` |
| `m524/e002/met_mdl/outer/init_msb4_1` | `RES` | `body` | `sch_effect_data\body` | 57,581 | `5253fa94e0ffd3a8a564fb32068669cf5d08e44b0ffe45bf26af47c0696b7b83` | `` |
| `m524/e002/met_mdl/outer/init_msb4_1/body` | `VEFF` | `4rcIUdanc_body1` | `bin\4rcIUdanc_body1` | 21,216 | `5fe38c87f099221e40a92eb9fd51b89cf4105e659dcdf5229e483ca0ed4547b1` | `` |
| `m524/e002/met_mdl/outer/init_msb4_1/body` | `ACB` | `m524_body_aura` | `init_msb4_1\bin\m524_body_aura` | 1,016 | `be3618152096e9121dc7e83af3eb10f52638b3a413f651c768297171095d0410` | `effect FCurve 46f@30` |

The m852 e002 package proves a 155-frame death, 100-frame death pose, state-4 reset, two VEFFs, and seven actor-bound body-part controllers. Nail e001 and e002 have distinct 0.99-second death schedulers/effect bytes. Nail e002 additionally owns `init_msb4_0`, `init_msb4_1`, VEFF `4rcIUdanc_body1`, and ACB `m524_body_aura`; this persistent body presentation was absent from the pre-reconciliation Nail baseline and is now called out by its current-state addendum.

## m852-bound cutscene motion references

| Cut file | Bytes | SHA-256 |
|---|---:|---|
| `client/cut/sum6a000/sum6a000` | 2,563,296 | `2b2e7cfddf8effc655279e5645b7e436c80b2149ef556eb650daa3705ea1e66f` |
| `client/cut/man30880/man30880` | 2,358,128 | `ad3502659271a9d5a5dc384b7a8b2315a193bd693ff34ed8912077bb3c4a74bc` |
| `client/cut/man30850/man30850` | 4,777,472 | `2bad417f5fde6110215fa5872a11d0b5522d15d70b47e4162f7c5fd682b86474` |
| `client/cut/man40640/man40640` | 9,909,200 | `992d373847cedea4ea794aaf169d5c4bde5a9d63eb3aa66cad6062108e9646c0` |

A dataset is included below only when at least one of its resource-table paths explicitly contains `m852`; this excludes unrelated actors that happen to use a 135-bone skeleton.

| Cut / dataset | Motion ID | MTB path | Frames / seconds | MCB bytes / SHA-256 | MTB bytes / SHA-256 |
|---|---|---|---:|---|---|
| `sum6a000/outer/11000` | `eb_sum6a000a07x` | `event\sum\6a0\00\m852\animation\miga\bin\eb_sum6a000a07x` | 180 / 6.000s | 528 / `a2e7b031c58afd9c7c08f4f3e869bc7e9960c35b9f227c1a544347a093297d8f` | 143,420 / `14f5be8135fdbe97b0bb84588e1a3f877ef4eb138911e61e10e3ee6dff477e60` |
| `sum6a000/outer/11000` | `cbxs_st3` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3` | 1 / 0.033s | 528 / `b9c6b8e08597486875ea264126fd178e7090402c51efec046da966e07fe4d77f` | 644 / `4d62dd00ccaf41cbb732bef57ae8c7a0e275242464a19818db9d82345fd7b0d7` |
| `sum6a000/outer/11000` | `eb_sum6a000a08x` | `event\sum\6a0\00\m852\animation\miga\bin\eb_sum6a000a08x` | 90 / 3.000s | 528 / `d332573b172ac4fc58ce5bd5293acb63a7455778789eff0e428dbeebb495d782` | 64,588 / `1de7d3ff989d0113a3fc400641b561f70b32fbcc772f2903ea478579d5e642a7` |
| `sum6a000/outer/11000` | `cbxs_st3to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3to0` | 30 / 1.000s | 528 / `b102e6183c48352bc0361c18feae6668b8961177e73a48beab5b3cb59948baf4` | 740 / `0edffb4a0ed749723c65c8de0e3fefc6d416794cc8e232d29494ecb7df7664cd` |
| `sum6a000/outer/11000` | `cbxs_st0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0` | 1 / 0.033s | 528 / `ee870592c3d89390529eaf2525e1ed57dcc8e3c58926e0922b7a25641ebf3f34` | 644 / `0b9deac4e80393bd0989c62cd2b4bcb6e69e507ed181a85822b8608331c4d67e` |
| `sum6a000/outer/11000` | `eb_sum6a000a09x` | `event\sum\6a0\00\m852\animation\miga\bin\eb_sum6a000a09x` | 150 / 5.000s | 528 / `90d0f7dc52024fca9cfaf1ebdae412b0db9c129d0a628c5d07ab847644ae8663` | 123,884 / `53f4aaadad5149764efecc117774fcf6d30f98ce0b36981937f3e494bd57d071` |
| `sum6a000/outer/11000` | `cbxs_st0to3` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st0to3` | 30 / 1.000s | 528 / `a7be2388a0d6bf51676f1214cc3feceb99e549b825223d0aeec492eb9352aa67` | 740 / `19273268af1bbc52b86e9fc312095ce6be20ceadf369dcba26ac110a05be6c96` |
| `sum6a000/outer/11000` | `eb_sum6a000a10x` | `event\sum\6a0\00\m852\animation\miga\bin\eb_sum6a000a10x` | 211 / 7.033s | 528 / `d3532b3bc68a20437ea92feb83445609a89ed0541e3e6d3914bae000f6223df0` | 85,404 / `7d83baa2e3e3cd7d74b99433e9aa620cd6423ec01a340e5c2ae79ac350ab97c5` |
| `sum6a000/outer/11000` | `cbxs_st3to4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3to4` | 19 / 0.633s | 528 / `ff9d18edf15f0ead157b50a0e95a952d74d9eeef27394ad3f4744db2398a7b87` | 692 / `ca49f2cd4e2c7bf823ca220cc5b9934f57ea2ad8e556185ac177b2f924f25955` |
| `sum6a000/outer/11000` | `cbxs_st4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4` | 1 / 0.033s | 528 / `e1463dfc6e2e073bada88d636da7548a874cefbce5d138cdd96ef71e9f6c91a9` | 644 / `cd7382e040bc8024a5763db437a917a7cf1800753e39f04d4485bde56f26ef67` |
| `man30880/outer/11012` | `eb_man30880a01x` | `event\man\308\80\m852\animation\miga\bin\eb_man30880a01x` | 430 / 14.333s | 528 / `4618a83c72a2bebacf0d5122257a00d098bc5b791149052df9ac2198394904d4` | 337,388 / `acfe8fb52c15aaf3979ef4d34c7c7d96d448a7d239b0c6dadeeb4af8cc66927d` |
| `man30880/outer/11012` | `eb_man30850a03x` | `event\man\308\50\m852\animation\miga\bin\eb_man30850a03x` | 117 / 3.900s | 528 / `158632671590356689e978e1213c713456b642a3ffa53a8a38f3a3d350f4c932` | 101,820 / `903145a6852c261df947e12482685c8187da886e494518276834c1c9332b853c` |
| `man30880/outer/11012` | `cbbm_id0` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_id0` | 120 / 4.000s | 528 / `0999022b8f4a3ac138cab4ab1d674b3a0f3a4b8d5695c2eb4f3f9abc6a75a403` | 99,927 / `cb2b947da68a8eb1facac1c3906f10c8c472e1d01f6b92b28df7877d21b44342` |
| `man30880/outer/11012` | `eb_man30880a11x` | `event\man\308\80\m852\animation\miga\bin\eb_man30880a11x` | 180 / 6.000s | 592 / `57447da328281f50640ed5e6301c216440717ea349e6943b0391ad3e8379392d` | 125,836 / `0d3f303f72963b7182b9ae33b873d770091f6f62264ad522638a60f4dc297074` |
| `man30880/outer/11012` | `eb_man30880a12x` | `event\man\308\80\m852\animation\miga\bin\eb_man30880a12x` | 180 / 6.000s | 592 / `215792aae88e39aa33fca886b32031a82253e01e923e33d3ce92e1269beb31a6` | 128,476 / `4747d153450f971d5ab4dff66782518d900be2b8d253a60720b965036b9ce041` |
| `man30880/outer/11012` | `eb_man30850a02x` | `event\man\308\50\m852\animation\miga\bin\eb_man30850a02x` | 80 / 2.667s | 528 / `facb04d0e9a8cbbdd7e00de1e9877da736a96717f46d06838d05244111411b42` | 72,860 / `92682f7830b28eff7ece4c3ec6310843bf68c73e94c7f3ecf82f13d0469ac876` |
| `man30850/outer/11013` | `eb_man30880a11x` | `event\man\308\80\m852\animation\miga\bin\eb_man30880a11x` | 180 / 6.000s | 592 / `57447da328281f50640ed5e6301c216440717ea349e6943b0391ad3e8379392d` | 125,836 / `0d3f303f72963b7182b9ae33b873d770091f6f62264ad522638a60f4dc297074` |
| `man30850/outer/11013` | `eb_man30850a02x` | `event\man\308\50\m852\animation\miga\bin\eb_man30850a02x` | 80 / 2.667s | 528 / `facb04d0e9a8cbbdd7e00de1e9877da736a96717f46d06838d05244111411b42` | 72,860 / `92682f7830b28eff7ece4c3ec6310843bf68c73e94c7f3ecf82f13d0469ac876` |
| `man30850/outer/11013` | `cbbm_id0` | `chr\mon\m852\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_id0` | 120 / 4.000s | 528 / `0999022b8f4a3ac138cab4ab1d674b3a0f3a4b8d5695c2eb4f3f9abc6a75a403` | 99,927 / `cb2b947da68a8eb1facac1c3906f10c8c472e1d01f6b92b28df7877d21b44342` |
| `man30850/outer/11013` | `eb_man30850a03x` | `event\man\308\50\m852\animation\miga\bin\eb_man30850a03x` | 117 / 3.900s | 528 / `158632671590356689e978e1213c713456b642a3ffa53a8a38f3a3d350f4c932` | 101,820 / `903145a6852c261df947e12482685c8187da886e494518276834c1c9332b853c` |
| `man30850/outer/11013` | `eb_man30850a04x` | `event\man\308\50\m852\animation\miga\bin\eb_man30850a04x` | 320 / 10.667s | 528 / `a57f0af9c3a328081a66ea13b46a7a3014f72540ea01173d55c16f3ac7f66c8d` | 240,620 / `fe4c167340a2d9e8091280f956942415b07ba7e2d3d994f47f46805fb44d9fad` |
| `man40640/outer/11005` | `eb_man40640e09a` | `event\man\406\40\m852\animation\miga\bin\eb_man40640e09a` | 70 / 2.333s | 528 / `4c27d7cbeee77dd79aee28a7550a9db4e1f7b7cd9698615949fd9a3d14b0c559` | 39,436 / `41b8c0c7394726e8e7d3b3f0526113124ad81cc02c268402ecfa9039e4943259` |
| `man40640/outer/11005` | `cbxs_st4` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4` | 1 / 0.033s | 528 / `e1463dfc6e2e073bada88d636da7548a874cefbce5d138cdd96ef71e9f6c91a9` | 644 / `cd7382e040bc8024a5763db437a917a7cf1800753e39f04d4485bde56f26ef67` |
| `man40640/outer/11005` | `eb_man40640e09x` | `event\man\406\40\m852\animation\miga\bin\eb_man40640e09x` | 325 / 10.833s | 528 / `248c236aaa7cffde987dc036397bb21680a0c678bac877061818673738a47e6a` | 259,180 / `ee94d67f66b5b63e0365b80adb43db24ca327c29da0e955c887adf622292fc35` |
| `man40640/outer/11005` | `cbxs_st4to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st4to0` | 30 / 1.000s | 528 / `88a457e6f351e5bae33763813e3f9a74ceb1ecd143263050f3f9420f2ee6a459` | 788 / `8ec5a54c8c091ea0cf4840629670f3dbd8422c8465ec5c3d2444d806d7b51c00` |
| `man40640/outer/11005` | `cbxs_st3` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3` | 1 / 0.033s | 528 / `b9c6b8e08597486875ea264126fd178e7090402c51efec046da966e07fe4d77f` | 644 / `c8dcdfe9466f667bfdeae54eefcffbba2ba6c51ed663c50b218edfd44e32a957` |
| `man40640/outer/11005` | `eb_man40640e12x` | `event\man\406\40\m852\animation\miga\bin\eb_man40640e12x` | 120 / 4.000s | 528 / `4a14aee45e72529d59623079f485ecac8ca1beb319d238494f677da8dd076dc0` | 65,932 / `c490acdf4fb90eb417752f0b936e782dc30bd2ba2eaf64eae9aa75c904a7374d` |
| `man40640/outer/11005` | `cbxs_st3to0` | `chr\mon\m852\model\equip\e001\miga\v000\bin\cbxs_st3to0` | 30 / 1.000s | 528 / `b102e6183c48352bc0361c18feae6668b8961177e73a48beab5b3cb59948baf4` | 740 / `0edffb4a0ed749723c65c8de0e3fefc6d416794cc8e232d29494ecb7df7664cd` |

These are authored cinematic capabilities, not combat WSS mappings. Cut-local copies can differ despite an identical ID/path: `sum6a000` has a distinct `cbxs_st3` hash and a 19-frame `st3to4`, whereas the installed e001 model-state copy is 13 frames. A filename/token match must not erase those byte-level variants.

## m999 spillover and m526 shared-reference boundary

### Complete outer resources for the two literal m999 spillover files

| File | File bytes / SHA-256 | Type | ID / path | Resource bytes / SHA-256 | Timing |
|---|---|---|---|---|---|
| `m999/wss/0001` | 275,472 / `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94` | `SCB` | `main` / `system\shoot_mon\main\bin\main` | 1,936 / `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |
| `m999/wss/0001` | 275,472 / `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94` | `RES` | `skill01` / `mon\ifrit_852\skill09\mon_main\sch_effect_data\skill01` | 58,973 / `f36c3f057f7fef3855ab071620716a8796184ef08dd632f7033ee2d879d03f88` | `` |
| `m999/wss/0001` | 275,472 / `a849d146a606332e773e6f151a61bbbdfb22d6a15102a8f4c0c3d93881113a94` | `SCB` | `mon_main` / `mon\ifrit_852\skill09\mon_main\bin\mon_main` | 1,008 / `c0cdc65c918f24923e7e00f25068ae64f9dcf6eb68d21d5e82aab3a91ce7eb47` | `9s/0; 1.2s/2` |
| `m999/wss/0006` | 490,912 / `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | `RES` | `m999_0006` / `mon\kuroko_999\skill06\lst\sch_effect_data\m999_0006` | 190,709 / `0e1638b1ae3f11cf69e5bce694ef42ad2fcf0ea371ac4245d67222af82df2064` | `` |
| `m999/wss/0006` | 490,912 / `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | `SCB` | `mon_main` / `mon\kuroko_999\skill06\mon_main\bin\mon_main` | 1,360 / `66d6b520b17ef17be1433016aabc66166a86d1b1c1e35d5216ad8d2bdc82e102` | `9s/0; 0.65s/8` |
| `m999/wss/0006` | 490,912 / `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | `SCB` | `m999_0006` / `mon\kuroko_999\skill06\m999_0006\bin\m999_0006` | 1,136 / `a1dfbad975381fc8fb42169c2fbc9e9143e0ac4a15093d95779c868a5a22fd11` | `9s/0; 0.47s/4` |
| `m999/wss/0006` | 490,912 / `4eaa0bf9aeba22ae4b0fffb56425d080ea12aed36a1673139b7854b43c52308b` | `SCB` | `main` / `system\shoot_mon\main\bin\main` | 1,936 / `7da7c8b13a2096a23de59d6719c2e2cad385cb8e6e295974273b33e7a08c0422` | `9s/0; 0.6s/23` |

m999 WSS1 points literally to `mon\ifrit_852\skill09`; m999 WSS6 is a Kuroko/helper layout whose payload contains the recovered Ifrit spillover tokens. Neither file supplies a 135-bone outer Ifrit body motion. Their 3-channel embedded MTBs are effect controls.

### m526 BID file that names m524

File: `client/chara/mon/m526/act/emp_emp/bid/base/0000`, 44,448 bytes, SHA-256 `23e5a6fa702023a5f9d94de5d96c12ab5335e8aca2c39f44da6f61274de50a7a`.

Outer census: 11 CIBT, 18 MCB, 18 MTB, 1 RES.

| Motion ID | MTB path | Bones | Frames / seconds | MTB SHA-256 |
|---|---|---:|---:|---|
| `cbba_add_dmg_f` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmg_f` | 5 | 50 / 1.667s | `7a6961c35397a6043883fcf92bddd56824b7cacacddd53c882d52cb4d6a02139` |
| `cbba_add_dmgh_b` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_b` | 5 | 50 / 1.667s | `7a6961c35397a6043883fcf92bddd56824b7cacacddd53c882d52cb4d6a02139` |
| `cbba_add_dmgh_f` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_f` | 5 | 50 / 1.667s | `7a6961c35397a6043883fcf92bddd56824b7cacacddd53c882d52cb4d6a02139` |
| `cbba_add_dmgh_l` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_l` | 5 | 50 / 1.667s | `7a6961c35397a6043883fcf92bddd56824b7cacacddd53c882d52cb4d6a02139` |
| `cbba_add_dmgh_r` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbba_add_dmgh_r` | 5 | 50 / 1.667s | `7a6961c35397a6043883fcf92bddd56824b7cacacddd53c882d52cb4d6a02139` |
| `cbbm_activ` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_activ` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_deact` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_deact` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_ded` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_ded` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_dedpose` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_dedpose` | 5 | 100 / 3.333s | `4f9bebb9da9c63c484fe55439cd8dfcf6cb8eb6c8a54b4ab4395ce3876cad11a` |
| `cbbm_id0` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_id0` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_msb4_1` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_msb4_1` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_msb5_1` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_msb5_1` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_msb6_1` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_msb6_1` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_msb7_1` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_msb7_1` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbbm_wekid_2lp` | `mon\m526\animation\a001\bt_emp_emp\miga\base\b001\bin\cbbm_wekid_2lp` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbnm_dedpose` | `mon\m526\animation\a001\normal\miga\base\b001\bin\cbnm_dedpose` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbnm_id0` | `mon\m526\animation\a001\normal\miga\base\b001\bin\cbnm_id0` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |
| `cbnm_wekid_2lp` | `mon\m526\animation\a001\normal\miga\base\b001\bin\cbnm_wekid_2lp` | 5 | 30 / 1.000s | `c1287e46ea386677b53fbb02c0500866043ebedec23d2079ebe850d1d8e67374` |

The nested scheduler table in this m526 file contains literal `m524e001` and `skl_m524b001` references. However, its 18 outer body MTBs have **five bones**, not Nail's 12. This is a shared/cross-model dependency clue, not proof that an m524 Nail actor may select m526 BID motions. No current server selector or packet closes that edge.

## Coverage comparison and required corrections

| Surface | Pre-reconciliation baseline reports | Exhaustive finding / correction | Confidence |
|---|---|---|---|
| Direct action-bank files | Complete | 26 m852 + 2 m524 confirmed; hashes retained | High |
| Direct non-action model files | Missing | 15 equ/skl files, including state, death, aura, orientation, model/render controls | High |
| Printable BID/BTL motion leaves | Listed | Printable names are a declaration/reference surface; only 54 m852 and 9 m524 pairs are live outer embeddings | High |
| Outer schedulers | Bank-level active signature only | 59 exact SCB IDs/paths/sizes/hashes cataloged | High for bytes; medium for inferred block timing |
| Outer controls/effects | Token summaries | Every outer CIBT/CIBC and nested RES root cataloged; every nested VEFF/ACB cataloged | High |
| Dash flames | Token noted | WSS7 `m852_0007_fire` is an independent hashed ACB with a 61-frame 3-channel effect curve; body motion/movement alone cannot produce it | High for asset; current Hard invocation exists, retail selector/runtime render still unresolved |
| Jump / landing | WSS18/19 decoded | Confirmed as separate 135-bone clips plus cast ACBs; no command-to-bank retail join recovered | High asset, medium semantic |
| Ifrit model states | Partial `st0`/`st4` | Full 14-pair state graph plus cut-local variants recovered | High |
| Ifrit death | BID names only | e001 death scheduler and e002 full death motion/effect/body-part package recovered | High |
| Ifrit orientation | Missing | Ten `skl/9999` orientation pairs recovered | High |
| Nail lifecycle | BID/WSS detailed | Four model-state pairs, two death variants, and e002 persistent body-aura scheduler/controller were missing | High |
| Ground eruption/plumes | Candidate WSS tokens | Effect packages/ACBs/FCurves are fully separated from body MTBs, but SCB selector and owner remain unresolved | High asset, medium/low mechanic mapping |
| FID/common | Labeled idle | Outer `fxpf_idle` SCB exists, but its nested dataset physically embeds cinematic `eb_man30880a08x`; `idle` is not a complete description of payload provenance | High |
| BTL nested attacks | Omitted | Main dispatcher + eight `atk*` schedulers recovered | High |
| Cutscene references | Supplemental names only | Four explicit m852 datasets and every paired motion/state resource cataloged; cinematic-only boundary retained | High |
| m999 spillover | File-level WSS1/6 | Exact outer scheduler/package catalog added; effect-control/no-body-motion distinction retained | High |
| m526 -> m524 | Missing | Literal model/skeleton dependency exists, but five-bone motion incompatibility prevents promoting it to Nail animation ownership | High fact, unresolved semantics |

## Remaining ambiguity and non-claims

1. `SEDBSCB` is still not fully deserialized. Block signatures do not recover branch conditions, ordered clips, cancellation, helper spawning, or command selectors.
2. Installed existence is capability evidence, not proof of retail encounter use. In particular, cutscene motions are not combat banks and m526 is not an m524 donor without a selector/compatibility edge.
3. Model-state MTBs are skeletal state tracks, but their server/runtime state numbers are not proven solely by matching `stN` names.
4. Three-channel ACB MTBs are effect curves. Counting them as 135/12-bone actor animations would inflate coverage and obscure the actual missing flame/aura controller path.
5. `top_snd` and model/render leaves remain manifest-covered but expose no separate animation selector. VMDL/VTEX/VINS/LEAF rows are package-internal rendering data, not omitted body motions.
6. No literal scan can exclude a numeric-only, hashed, or executable-generated dependency. This report is exhaustive for the installed direct roots, their decoded SEDB resource graphs, and literal external references.
7. Ground-fire ownership remains the central unresolved join: actor/helper owner -> SCB selector -> ACB/VEFF -> world placement. Asset completeness does not manufacture that runtime proof.

## Bottom line

The baseline reports identified the right WSS candidates; this companion closes their broader asset-coverage gap. Ifrit dash parity requires the complete WSS7 scheduler path, especially `m852_0007_fire`, in addition to movement and the five-frame body clip. Nail parity requires the e002 `init_msb4_1` / `m524_body_aura` presentation and correct death/state handling, not only BID `activ/deact/ded`. Eruption and Plume assets are present as effect packages and helper layouts, but their retail selector/owner/placement edge remains unproven and must stay labeled as such.
