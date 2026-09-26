# Infernal Nail runtime problem decomp

Snapshot: **2026-08-02, installed-client/runtime audit at 20:39 and latest-source reconciliation through 20:56 -04:00**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Policy: **read/decompile and Markdown only**. No source, SQL, validator, client DAT, executable, build artifact, capture, or gameplay data was changed for this report.

> **Latest selector notice:** current source SHA `086300ae...` uses self-targeted X01 command `23366`, not the earlier `23001`, while retaining WSS1 animation `0x13001000`. This requests the recovered rise/growth bank; a fresh Nail entrance render capture is still required. See [LATEST_ERUPTION_NAIL_SOURCE_RECONCILIATION_2026-08-02.md](LATEST_ERUPTION_NAIL_SOURCE_RECONCILIATION_2026-08-02.md).

## Result

The Infernal Nail problem is not a missing model or a single missing animation file. The installed client has a coherent Nail lifecycle surface, and the current encounter now requests two important parts of it:

1. `m524` WSS `0001` for the three-second rise/ignite transition.
2. Monster breakage bit `4` for the e002 persistent body-aura package.

Those selectors are present in current source, but neither is proved by a current in-client render capture. Several other presentation edges remain genuinely absent or unresolved: no explicit Nail BID activation selector, no proved Nail-specific death/death-pose selection, no deactivation/consume tail for Nails surviving until Hellfire, and no replay of the entrance effect to a client that becomes ready after it has already run.

The current minimum publication-to-targetable delay is about **4.2 seconds**, plus any publication retry delay. Earlier documentation describing a targetless X00 WSS request after `0.1 s` and reveal after `1.5 s` is stale.

## Problem disposition

| Stage | Installed client capability | Current server request | What is still wrong or unproved |
|---|---|---|---|
| Initial ground flare / emergence | WSS1, `cbbm_sp_01`, `st0 -> st1`, fire/rock/glow/distortion package | Self-targeted X01 command `23366`, animation `0x13001000` | No Nail render capture of the current X01 path; exact contribution of BID `activ` remains unknown |
| Persistent burning Nail | e002 `init_msb4_1`, VEFF `4rcIUdanc_body1`, ACB `m524_body_aura` | Breakage index `4` is latched, then opcode `0x0144` is published | Source selection is confirmed; actual bit-to-package rendering is not |
| Targetable reveal | Nameplate/target lock enabled only after WSS1 and aura settle | About `4.2 s` after initial publication, excluding retries | Retail targetability timing is not captured; reveal may be later than the visible spike stabilizes |
| Player destruction | BID `ded`/`dedpose`; distinct e001/e002 death VFX packages | Generic `DEAD`, substate zero, state-flush envelopes, four-second one-shot lifecycle | Automatic selection of exact `m524` death assets is not proved |
| Hellfire consumption | BID `deact` exists and is one second | Living survivors are directly despawned | No consume/deactivation animation or effect-complete delay exists in the encounter path |
| Late join | Stable actor state and breakage substate may serialize | Living Nails are re-instantiated for ready players | WSS1 entrance is not replayed; aura reconstruction has not been captured |
| Administrative cleanup | Client has terminal assets | Direct removal of every Nail | Presentation is intentionally bypassed |

## Actor and appearance binding

The four encounter Nail roles all use `/Chara/Npc/Monster/Ifrit/IfritAnchor` and the `m524` family. The actor/class binding is not the missing edge.

| Role | Actor class | BNPC | Appearance | Base model | HP |
|---|---:|---:|---:|---:|---:|
| Normal | `2207306` | `3060` | `2207306` | `10524` / `m524` | 2,500 |
| Hard | `2207307` | `3061` | `2207307` | `10524` / `m524` | 2,000 |
| Extreme inner | `2207313` | `32702` | `2207313` | `10524` / `m524` | 2,500 |
| Extreme outer | `2207315` | `32703` | `2207315` | `10524` / `m524` | 2,500 |

The appearance rows and direct spawn both use size `2`, body selector `1024`, and head selector `2048`. That makes both installed equipment variants relevant: e001 supplies the main body/model-state surface, while e002 supplies the additional head/model package containing the persistent aura and a distinct death package. It is therefore too narrow to describe the live Nail as "e001 only."

Current source also applies presentation height `5.5` while retaining the authoritative ground Y for combat and floor checks. The `IfritAnchor` model bounding box reaches approximately `+5.4849`, so this is an intentional presentation offset, not evidence that the damage actor floats off the battlefield.

## Installed Nail animation inventory

### Direct files

| Installed path | Bytes | SHA-256 | Relevance |
|---|---:|---|---|
| `client/chara/mon/m524/act/emp_emp/bid/base/0000` | 16,960 | `d2b2761da954a4704145e7ed644e31d39b20d6742b499d76eba9adfbf5df8c17` | Activation, deactivation, idle, special-state, hit, death, and death-pose motions |
| `client/chara/mon/m524/act/emp_emp/wss/base/0001` | 239,336 | `c64e37d06b0cf34df4e5c77d8de4b3fb9c6aad4851af223b61502a07c36e35df` | Rise/ignite action and actor-bound effect package |
| `client/chara/mon/m524/equ/e001/met_mdl/0001` | 230,816 | `4a0445d0b136e0d8aae1cf019c183b9226a14a706d58aa68daeb2f4b313940b8` | e001 death package |
| `client/chara/mon/m524/equ/e001/top_mdl/0001` | 61,168 | `750c86c87e39b3504be8d1781202b60f19eef33d1e971655812c11105b880b0a` | Main Nail model binding |
| `client/chara/mon/m524/equ/e002/met_mdl/0001` | 352,064 | `5a5a4414c7327ca5dd0f04d78677e76827d535126b8db3edd5633a7ea24784ff` | e002 aura and death packages |
| `client/chara/mon/m524/skl/0001` | 10,896 | `4186e060a67dd8c3d673e639d1c5a777e78c77e93082c9c0603bb5a37503d149` | Twelve-bone Nail skeleton |

### BID `0000`

The decoded BID contains all of the following meaningful body motions:

| Motion | Frames at 30 fps | Duration | Interpretation boundary |
|---|---:|---:|---|
| `cbbm_activ` | 30 | 1.000 s | Authored activation motion; current encounter does not explicitly select it |
| `cbbm_deact` | 30 | 1.000 s | Authored deactivation motion; current Hellfire cleanup does not select it |
| `cbbm_ded` | 30 | 1.000 s | Death collapse candidate; exact automatic `DEAD` binding is unproved |
| `cbbm_dedpose` | 1 | 0.033 s | Stable death pose |
| `cbbm_id0` | 1 | 0.033 s | Stable idle pose |
| `cbbm_msb4_1` | 1 | 0.033 s | Skeleton pose associated with monster breakage state 4; not the aura effect by itself |

`activ` and `deact` use separate controllers despite sharing the same sampled transform bytes. A byte-identical pose does not make the two state transitions interchangeable.

### WSS `0001` rise/ignite package

| Component | Decoded evidence |
|---|---|
| Body motion | `cbbm_sp_01`, 90 frames / 3.000 s |
| Model states | `cbxs_st0`, `cbxs_st0to1`, `cbxs_st1`; the model transition is 29 frames / 0.967 s |
| Outer effect package | `skill01`, 90,400 bytes, SHA-256 `df3decfd64af98b6c28a9e2414e31e5e819ef18f959215206c6357587f8ba030` |
| Actor scheduler | `mon_main`, 1,792 bytes, SHA-256 `1c830b159dac661488133829fd9fb26387b513fd968fcf1454d5ab76536f139a` |
| Actor VEFF | `0W7Ar9anc_sklc1`, 25,504 bytes, SHA-256 `d8ecaf7f619c5ff19547c26542e196cfb4e90ec5d1b811a66df7e8ee04da7c65` |
| Actor effect curve | `m524_0001_cas`, 1,016 bytes, SHA-256 `c6602165b050dbebf6aecf36393be55d01ca25711df3f150170b05013ed6fa37` |
| Effect vocabulary | Fire, rock, glow, muzzle-like light, distortion, camera shake, and attachment token `005_n_hara` |

This proves that the entrance is more than a skeletal pose. Sending only a state or model motion cannot reproduce the flare, rocks, glow, distortion, and camera/effect layers embedded in the action scheduler.

### Persistent aura package

| Package | Bytes | SHA-256 | Timing/class |
|---|---:|---|---|
| e002 `init_msb4_0` SCB | 1,312 | `8948d77253578e14feae4af3a0cc380ea063eebd9468c165f7f4fa38fe20809d` | 0.04 s / 4 active entries |
| e002 `init_msb4_1` RES | 59,407 | `7462f69217ff14efe249f148cb8c588ed05a36cfbc06f5b3bfc7622310fe0d55` | Nested aura package |
| Nested `init_msb4_1` SCB | 1,552 | `4682daee18b7cd82344d40ec1826fc803c6994e4bbaa0a5553161c15690a0653` | 0.5 s / 8 active entries |
| `4rcIUdanc_body1` VEFF | 21,216 | `5fe38c87f099221e40a92eb9fd51b89cf4105e659dcdf5229e483ca0ed4547b1` | Persistent body visual |
| `m524_body_aura` ACB | 1,016 | `be3618152096e9121dc7e83af3eb10f52638b3a413f651c768297171095d0410` | 46-frame effect curve at 30 fps |

The one-frame `cbbm_msb4_1` body pose and `m524_body_aura` are separate resources. A model pose alone cannot stand in for the aura controller.

### Death packages

Both reachable equipment variants carry distinct Nail death packages:

| Variant | Outer package | Scheduler | VEFF / effect curve |
|---|---|---|---|
| e001 | `dead` RES, 55,688 bytes, SHA `7fb4aeaf...` | `dead`, 0.99 s / 10 active entries | `151rmjanc_dead1`; `m524_ded`, 47 frames at 30 fps |
| e002 | `dead` RES, 55,832 bytes, SHA `33656662...` | `dead`, 0.99 s / 12 active entries | distinct `151rmjanc_dead1` bytes; `m524_ded`, 51 frames at 30 fps |

The installed files prove that a Nail-specific death effect exists. They do not prove which variant the 1.x client chooses from the generic `DEAD` transition or whether both equipped pieces contribute.

## Retail reference timeline

The supplied close Nail footage was inspected as visual reference, not as packet-selector proof:

| Approximate time | Visible stage |
|---:|---|
| `0.00`-`0.25 s` | Small flare on the ground |
| About `0.50 s` | Bright smoke/flash bloom |
| About `0.75 s` | Vertical beam begins to rise |
| `1.00`-`1.25 s` | Nail emerges and reaches the recognizable spike form |
| After `1.25 s` through at least `5.75 s` | Vertical beam and burning/molten body remain visible |

This agrees with a layered WSS entrance followed by a persistent aura. It does not identify the packet, prove BID `activ`, establish targetability timing, or prove whether the retail beam and body aura are the same scheduler.

## Current server sequence

The live sequence at the audited source point is:

| Relative time | Server action | Presentation implication |
|---:|---|---|
| Spawn | Direct `m524` appearance, height `5.5`, combat-inert, four-second death timer, one-shot lifecycle | Correct model and non-retaliating objective behavior |
| Before first publication | Clear both nameplate properties and targetability with `broadcast=false` | Suppresses UI/locking, but does **not** hide the 3D model |
| Publication retries | Instantiate for ready recipients, retrying up to five times with `0.1 s` waits when necessary | Adds up to about `0.5 s` before the fixed timeline |
| `+0.5 s` | Re-instantiate, publish `ACTORSTATE_ACTIVE` | Establishes active actor state before the WSS request |
| `+0.7 s` | `DoSelfTargetedBattleAction(23366, 0x13001000)` | X01 names the Nail as both source and explicit target; requests WSS1 |
| `+3.7 s` | `toggleBreak(4, true)` and `SubstateModified()` | Requests byte-0 bit `0x10`, the e002 `msb4` aura state |
| `+4.2 s` | Show combat presentation and enable targetability | Nameplate, enmity UI, and lock become available after aura settle |

`SetEncounterCombatPresentationVisible(false)` changes nameplate properties, suppresses client enmity indicators, and can blank an already-known actor's name when broadcast. It does not set model opacity or otherwise hide the model. Because the initial call uses `broadcast=false` before publication, it also does not send the extra blank-name packet. A capture must therefore check both the intended visible `st0 -> st1` growth and any residual grey base-name leak during the entrance.

The breakage selector is specifically `toggleBreak(4, true)`: substate byte 0, bit `0x10`, delivered through opcode `0x0144`. It is not the byte-4 mode field. Earlier `setMode(1)` and targetless-X00 descriptions are live-disproved for the current source.

## Destruction and cleanup

### Player or GM destruction

Lethal damage follows the ordinary BattleNpc pipeline:

1. HP reaches zero and `Die` is guarded against duplicate execution.
2. The AI enters `DeathState` and main state `DEAD`.
3. The client state packet is serialized with substate `0`, not the live monster/aura substate.
4. State serialization is followed by X00 `0x72000062` and self-targeted X01 `0x7C000062` using command `21001`.
5. `DEAD` remains the terminal presentation state. `DEAD2` is treated as recovery/get-up and is not the primary death route.
6. The Nail's configured four-second corpse window and server fade grace complete before one-shot removal from the director and area.

The source comments say `DEAD` should drive model-specific collapse, corpse hold, and opacity fade. Static source cannot prove that the client chooses BID `cbbm_ded`, `cbbm_dedpose`, and the e001/e002 `dead` packages for `m524`; that remains a capture requirement.

### Hellfire survivor cleanup

After Hellfire resolution, ordinary `cleanupNails(..., false)` directly removes every Nail that is still alive. Already-dead Nails are deliberately left to finish their normal collapse/fade lifecycle. No `deact`, consume WSS, helper VFX, effect-complete wait, or terminal state is requested for living survivors.

Administrative cleanup uses `cleanupNails(..., true)` and can directly remove both living and dead Nails. That path is teardown, not animation parity.

## Log evidence and its limit

The persisted `2026-08-02` map log contains a Hard Nail publication window from `20:21:53.812` to `20:21:58.011`, with X01 (`0x0139`) and substate (`0x0144`) traffic present in the surrounding transport summaries. It also contains repeated Eruption and diagnostic-probe entries. These logs prove that an earlier build reached the relevant scheduler/packet paths; they do **not** prove visible rendering, and they predate the final current-source pins in this report.

The `20:22:00.676` line labeled `[manim]` explicitly names player `_pc00000001`; it is a manual player test and must not be misattributed to a Nail.

At the final audit point no Map Server process was running. The latest source therefore has static/validator evidence but no fresh render capture.

## Remaining Nail problems, in priority order

1. **Current entrance render is unproved.** Capture the self-targeted X01 WSS1 path and verify ground flare, smoke/flash, beam, emergence, and the complete three-second scheduler.
2. **Persistent flames are unproved.** Verify that breakage bit `4` actually selects e002 `init_msb4_1` and keeps `m524_body_aura` visible.
3. **Reveal timing may be late.** The model can be visible during staging, but targetability waits about 4.2 seconds plus retries; retail targetability timing is unknown.
4. **Exact death selection is unproved.** Generic `DEAD` exists, but the automatic `ded`/`dedpose` and e001/e002 package join has no capture.
5. **Hellfire survivors have no consume tail.** They are directly removed despite installed `deact` content.
6. **Late clients miss the entrance.** Re-instantiation reconstructs the actor, but WSS1 is not replayed. Aura substate reconstruction is also uncaptured.
7. **Administrative teardown bypasses presentation.** This is acceptable for teardown but must not be used as evidence for normal encounter visuals.

## Capture checklist

| Capture | Required fields | Decisive observation |
|---|---|---|
| Fresh Nail spawn | Actor ID, X01 source/target, command, packed animation, state/substate, `0x0144`, video frame time | WSS1 renders all entrance layers; bit `0x10` starts persistent aura |
| Targetability timing | Spawn/init, name/property packets, lock availability, visible spike frame | Exact UI/target reveal relative to emergence |
| Player kill | Lethal result, deferred `DEAD`, X00/X01 envelopes, substate, removal time, video | Exact `ded`/`dedpose` and model death VFX selection |
| Hellfire survivor | Last pre-Hellfire state through removal | Whether retail uses `deact`, a consume effect, or direct disappearance |
| Late join | Full actor init and substate after WSS1 has elapsed | Whether stable state/aura reconstruct without entrance replay |

## Source pins

The repository was changing during the investigation. These claims are time-bounded to:

| Input | SHA-256 at 2026-08-02 20:39 -04:00 |
|---|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | `7a421e1e589ecde284ee062f46a3f39f651f477d30be6d6971d4ffe46d0b4749` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | `a98598cd9d64d495d93e6ae3e66db23080788109b072f60acf0791becb2ed769` |
| `Map Server/Actors/Chara/Character.cs` | `e7a436a774911831b1f48f30385068d111340ccfa35b5b555b7ad581a5a6220b` |
| `Map Server/Actors/Chara/Ai/State/MobSkillState.cs` | `fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240` |
| `Data/sql/server_battle_commands.sql` | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |

The current validators passed at that audit point, but validator success proves source structure and geometry, not client rendering.

## Final conclusion

The Nail asset set is present and substantially wired: correct `m524` actor binding, self-targeted WSS1 entrance, breakage-bit-4 aura request, generic `DEAD`, and permanent one-shot removal all exist. The remaining failures are at the selector-to-render and terminal choreography boundaries. Persistent flames/aura, exact death resource selection, late-client reconstruction, and Hellfire survivor consumption are still unproved or absent. No data change is justified by this decomp alone; the next decisive evidence is a packet-synchronized client capture.

