# Raw monster-model previews

Use the `spawnmodel` GM command to preview client `m###/equ/e###` assets without first creating an actor-class or appearance database row. Here, `e###` identifies a client resource set. It is historical `equ` namespace terminology, not a promise that the asset is wearable gear: a set can contain monster body parts, decorations, effect carriers, or textures.

```text
!spawnmodel <m###|###|10###> [e###|setId] [all|component] [variant] [color] [size] [wssBank]
```

Examples:

```text
!spawnmodel m980 e001
!spawnmodel m980 e035 body
!spawnmodel m980 e036 top
!spawnmodel m999 e001 all
!spawnmodel m999 e001 all wss15
!spawnmodel m023 e001 all 1 0 2
```

The default resource set is `e001`, component selection is `all`, variant and color are `0`, and size is `2`. `all` applies the requested set ID to every appearance component channel so any matching pieces in that asset folder can render. Missing channels are harmless. To isolate a component, use one of these equivalent names:

| Client resource component | Command names | Appearance slot |
|---|---|---:|
| `met` | `head`, `met` | 12 |
| `top` | `body`, `top` | 13 |
| `dwn` | `legs`, `dwn` | 14 |
| `glv` | `hands`, `glv` | 15 |
| `sho` | `feet`, `sho` | 16 |
| `wst` | `waist`, `wst` | 17 |

The command converts `m###` to appearance base `10000 + ###`. The actor appearance protocol happens to carry these resource-set selections in equipment-shaped component fields, packed as `(setId << 10) | (variant << 5) | color`. That packet layout does not determine what the asset means.

For example, `m999/e001`, `e002`, and `e003` each provide `met_mdl` and `top_mdl` resources, but `m999` is an invisible encounter-effect carrier whose visible effects are driven by WSS action banks under `m999/act`. For `m999`, the command therefore plays the same-numbered WSS bank by default: `!spawnmodel m999 e001 all` sends `0x13001000`. Use an inline bank such as `wss15` to override it, or `none` to inspect only the carrier appearance. Other model families do not auto-play an action, but any model can take an explicit final WSS bank after `size`. Missing or incomplete client assets can still produce a partial preview without implying that an actor-class row exists for the model.

## Combat recovery profiles

The [2026-09-13 mandragora authored-motion probe](mandragora_authored_animation_2026-09-13.md)
adds a new experimental Windower BID containing newly encoded idle, walk and run
curves for the native 24-bone m521 skeleton. It preserves all eleven WSS banks.
Its numerical/structural tests pass; native playback and TP transitions remain
unverified. The historical probe results below are preserved, not superseded by
a claim of live success.

`!spawnmonster` creates server-backed test actors for the installed 1.x monster assets:

```text
!spawnmonster <mandragora|dullahan|ziz|vulture|wyvern|clouddragon|sephirothdragon> [level] [mobile|stationary] [passive|aggressive]
```

The command does not make an incomplete asset complete. The installed action-bank boundary is:

| Profile | Client model | Installed banks | Missing baseline |
|---|---|---|---|
| Ziz/Vulture control | `m020` | BID 0000, BTL 0001, MGC 0001-0004, WSS 0001-0006 | No |
| Dullahan | `m050` | `2sw_emp` BTL 0001-0003, MGC 0001-0004, WSS 0001-0003 | BID |
| Wyvern | `m057` | `emp_emp` WSS 0001-0008 | BID, BTL, MGC |
| Mandragora | `m521` | `emp_emp` WSS 0001-0011 | BID, BTL, MGC |
| Cloud/Sephiroth Dragon | `m022` | `emp_emp` WSS 0001-0003, 0005-0007 | BID, BTL, MGC; WSS 0004 is also absent |

Dullahan, Wyvern, Mandragora, and both m022 dragon appearances therefore default to stationary and suppress server turn/look-at updates. Mandragora and m022 suppress auto-attacks because no BTL file exists. Wyvern uses its live-identified WSS 0005 body motion as an override on the server's ordinary auto-attack damage packet instead of requesting missing BTL 0001. Dullahan retains BTL auto-attacks and uses main-skill lane 11 plus a visible two-handed weapon selector, but it still has no idle or locomotion bank. Without an overlay these mitigations reduce unsupported client state requests but do not repair the bind pose.

Cloud Dragon actor `2208101` and Sephiroth Dragon actor `2208102` both select
the installed 1.0 `m022` model (`base = 10022`). Their only appearance
difference is the body resource variant: 1024 for Cloud and 1056 for
Sephiroth. The shared GM mob type `1400` and skill list `7202` expose generic
server attack mechanics for exactly the installed WSS banks 0001-0003 and
0005-0007. This is recovery plumbing, not evidence that any bank is a
data-faithful named dragon move.

The 1.x-only BID probe at `outputs/legacy-monster-bid-probe-20260728` changes the practical boundary for Wyvern and Mandragora. It keeps the installed `m020` baseline state graph, removes every `m020` motion-transform payload, replaces all 21 MTB resources with the target model's own WSS 0001 transform, advertises one frame, and uses the target WSS motion controller for `cbbm_id0` and `cbnm_id0` so look-at is suppressed. The resulting extensionless BID files are delivered through Windower DAT Overlay; no installed client file is overwritten.

Live 1.0 testing on 2026-07-28 established container acceptance but not a valid Mandragora idle. Close tests found held WSS 0001 malformed, full-loop WSS 0007 head-spinning, and held WSS 0007 visually unchanged. Raw WSS 0007 briefly raises Mandragora upright, but the supplied one-second recording shows a noisy deliberate special action, not a calm idle. The user reported that the separately deployed Wyvern probe worked, but no Wyvern recording was supplied, so its exact pose and transitions remain user-reported. These probes are experimental reconstructed containers, not recovered retail BID banks; none proves authentic idle, breathing, or locomotion.

The follow-up 1.x-only donor experiment is reproducible through
`tools/build_legacy_wyvern_donor_bid_probes.py` and packaged under
`outputs/legacy-wyvern-donor-bid-probes-20260731`. It creates three mutually
exclusive raw compatibility probes from Hippogryph `m005`, Drake `m034`, and
Ziz/Vulture `m020` BID banks. Only fixed-width model and skeleton references
are redirected to `m057`; donor motion tracks and their original bone counts
are deliberately retained. These are not retargeted animations. Bind pose,
malformation, rejection, or a client crash are all possible live outcomes.
Hippogryph is the recommended first probe because its BID advertises 67 motion
bones versus the Wyvern skeleton's 70 named bones, but the similar count does
not prove compatible ordering. No raw donor probe may be called working until
it is observed in the live 1.0 client.

The first live Hippogryph probe on 2026-07-31 initially left Wyvern in its bind
pose because the original Windower overlay redirected file opens only; it could
not expose metadata for a path absent from the retail tree. After adding
read-only `GetFileAttributesA/W` overlay redirection, the log recorded both a
metadata redirect and a file-open redirect for
`client\chara\mon\m057\act\emp_emp\bid\base\0000`. The Wyvern then moved into
a severely malformed pose, with wing and body transforms applied to incorrect
joints. This proves the donor BID loaded and rules out direct Hippogryph track
reuse. It does not rule out a future bone-name remapper. The Ziz/Vulture bird
bank is the next raw anatomical comparison; its result must be evaluated
separately because it has a different track ordering and only 60 motion bones.

The subsequent live Ziz/Vulture probe also loaded but produced a severely
folded and spiked Wyvern pose. This independently rules out raw bird-track
reuse: anatomical similarity does not compensate for different skeleton index
ordering. Both malformed donor packs were removed from the active overlay. The
safe fallback is `WyvernBidProbe`, whose state graph comes from `m020` but whose
21 MTB resources all contain the Wyvern's own 70-bone WSS 0001 transform held
at its first frame. That fallback can provide a skeleton-correct held posture;
it is not recovered idle, breathing, turning, or locomotion.

A live 1.0 retest on 2026-07-31 confirmed that the restored
`WyvernBidProbe` produces a useful correctly formed stationary Wyvern and that
WSS 0001 can play from it. This is user-reported live-client evidence without a
recording, so it establishes practical stationary usability but not authentic
idle motion, locomotion quality, or every action-to-baseline transition.

After targeting a spawned profile, `!mobanimation` replays only banks proven present in the installed 1.x client:

```text
!mobanimation <wss|btl|mgc> <bank>
```

This command sends a raw animation ID and performs no damage or mechanics. Use `!usemobskill <skillId>` to test the full server battle command. The raw probe accepts WSS 1-11 for Mandragora, WSS 1-8 for Wyvern, BTL 1-3/MGC 1-4/WSS 1-3 for Dullahan, and the complete control ranges above for Ziz/Vulture.

Live Wyvern testing confirmed visible native animations for WSS 0001 and
0003-0008. WSS 0002 produced no visible animation. WSS availability proves
that discrete special-action transforms can drive `m057`; it does not provide
the missing BID state machine needed for idle, locomotion, or transitions.

The user identified WSS 0003 as a plausible idle-like body cycle and WSS 0005
as the Wyvern's apparent auto-attack motion during live animation-only replay.
Live testing of a timed raw WSS 0003 replay rejected that implementation: every
replay had a visible end pause and activated an unwanted eye-glow effect. The
server no longer replays WSS 0003 and `!mobidle` deliberately rejects Wyvern.
`WyvernWss3IdleLoopProbe` instead puts only the 80-frame WSS 0003 MTB body
transform into the two BID idle slots, keeps the safe held WSS 0001 transform
in the other 19 slots, and copies no WSS 0003 BCS/effect resources. This is the
current candidate for a continuous effect-free idle, but its loop and effect
behavior remain live-client unproven. Wyvern spawns also enable normal server
auto-attacks with WSS 0005 substituted as their battle-result animation;
damage, accuracy, TP gain, and enmity still use the existing auto-attack command
path. That combined WSS-0005-plus-damage packet remains live-client unproven.

`CloudDragonWss3IdleLoopProbe` applies the same effect-free construction to
`m022`: only the model's own 70-frame WSS 0003 MTB transform is placed in the
two BID idle slots, the other 19 states use a one-frame m022 WSS 0001 fallback,
and no WSS effect resource is copied. It serves both Cloud and Sephiroth
appearances because they share the same skeleton and model family. The pack is
structurally validated but has not yet been observed in the live 1.0 client.

## Read-only ARR comparison boundary

A read-only scan found ARR monster `m0040` carrying the exact same set of 64
bone names as 1.0 `m022`, though their serialized order differs. Its resident
animation archive includes `cbbm_id0`, and a local XAT extraction produced a
40-frame, 1.3-second FBX reference animation. This is unusually strong lineage
evidence, but the ARR PAP/Havok payload is not byte-compatible with 1.0's
`SEDBmtb`/`SpuBinary` motion container. No ARR file was copied into an overlay
or written back to either game install. Until a reproducible 1.0 MTB encoder or
converter exists, the ARR animation remains reference-only and the active
Cloud/Sephiroth probe contains native 1.0 data exclusively.

For Mandragora, `!mobidle on` still periodically replays WSS 0007 while
unengaged for diagnostic comparison; it remains opt-in because live testing
disqualified WSS 0007 as a true idle. `!mobidle off` stops its ambient replay.

The original reproducible evidence pack is in `outputs/legacy-monster-animation-recovery-20260726`. Its 24-patch scan found no BID entry for `m050`, `m057`, or `m521`, and its exact-skeleton scan found no donor BID referencing `skl_m050b001`, `skl_m057b001`, or `skl_m521b001`. That still rules out direct copying or renaming of a shipped compatible BID. The later probe is a structurally rebuilt experimental state container, documented and reproducible through `tools/build_legacy_monster_bid_probe.py`. Server tests prove command plumbing only; live 1.0 client observation remains required for every visual claim.
