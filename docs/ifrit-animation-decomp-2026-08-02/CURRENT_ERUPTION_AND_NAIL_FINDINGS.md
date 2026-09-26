# Current Ifrit Eruption and Infernal Nail findings

Snapshot: **2026-08-02, installed-client audit through 20:39 and source reconciliation through 20:56 -04:00**  
Installed client: **`2012.09.19.0001` (FFXIV 1.23b)**  
Policy: **viewing/decomp and Markdown only**. No source, SQL, validator, DAT, executable, build, capture, or gameplay data was changed.

## Read these reports

| Report | Scope |
|---|---|
| [LATEST_ERUPTION_NAIL_SOURCE_RECONCILIATION_2026-08-02.md](LATEST_ERUPTION_NAIL_SOURCE_RECONCILIATION_2026-08-02.md) | Authoritative latest-source correction: Nail command `23366`, exact WSS1/aura/reveal sequence, current source pins, runtime-trace evidence boundary, and unchanged Eruption conclusions |
| [IFRIT_ERUPTION_ANIMATION_DECOMP.md](IFRIT_ERUPTION_ANIMATION_DECOMP.md) | Complete Eruption donor topology, WSS2 target fire-ring package, current server geometry/packet ownership, WSS10 correction, WSS22 helper comparison, logs, probes, and closing capture matrix |
| [INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md](INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md) | Complete current Nail publication/entrance/aura/death/Hellfire/late-join audit and all outstanding runtime problems |
| [INFERNAL_NAIL_CLIENT_CURVE_APPENDIX.md](INFERNAL_NAIL_CLIENT_CURVE_APPENDIX.md) | Exact Nail rig, rise/growth curves, model-state graph, activation/deactivation/death curves, active e002 death scheduler, hit-reaction boundary, and sound boundary |

These reports are current addenda to the original Ifrit decomp bundle. Older Markdown remains useful for its installed manifest and historical source snapshots, but the following invocation claims are superseded.

## Superseded claims

| Older claim | Current finding |
|---|---|
| WSS10 is the strongest general Eruption solution | WSS10 is the strongest caster-centered rock burst, but it has no target branch. WSS2 has the current target fire ring; WSS22 is the stronger remote rock/fire comparison |
| Current Nail activation is targetless X00 after `0.1 s` | Current activation requests self-targeted X01 command `23366`/WSS1 after `0.5 s` publication lead and `0.2 s` ACTIVE lead; actual entrance rendering remains unproved |
| Nail reveal occurs after `1.5 s` | Current reveal is about `4.2 s` after publication, plus any retry delay |
| Stable Nail aura has no explicit live selector | Current encounter latches monster breakage bit `4` and publishes substate to request e002 `init_msb4_1`/`m524_body_aura`; rendering remains unproved |
| Nail mode byte `setMode(1)` selects the aura | The current selector is byte-0 breakage bit `0x10`; byte-4 mode is a different field |
| Generic Nail death has no known complete asset path | Active e002 `dead` cancels the aura, runs `ded`, `st1to0`, `m524_ded`, `dedpose`, sound, and target unlock; generic `DEAD` selecting it automatically remains unproved |

## Current bottom line

Eruption damage geometry is frozen correctly on the server, but its result packet addresses actors and carries no world coordinate. The current Normal/Hard WSS2 donor contains real target-side flames, yet no encounter actor is anchored at the frozen point. The expected visible rock eruption may also be a donor-variant mismatch: radius-eight named Eruptions use WSS1/WSS3, while current Normal/Hard uses compact/no-rock WSS2. Static decomp does not authorize choosing a replacement.

Nails have the correct model, a proven three-second below-ground rise/spike-growth WSS, an installed persistent aura, complete active death assets, and current source requests for WSS1 plus breakage-bit-4 aura. Remaining problems are current render proof, exact targetability timing, automatic e002 death selection, late-client reconstruction, and the complete absence of a survivor-consume/deactivation tail before Hellfire cleanup.

## Current source anchors

| Input | SHA-256 |
|---|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | `7a421e1e589ecde284ee062f46a3f39f651f477d30be6d6971d4ffe46d0b4749` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | `a98598cd9d64d495d93e6ae3e66db23080788109b072f60acf0791becb2ed769` |
| `Map Server/Primals/IfritManager.cs` | `6ad2c0d2fac92beafbd8ab95dffc7f4dc503ca92275b8bc0cf24985fa0fb9c4f` |
| `Map Server/WorldManager.cs` | `5b67b1acf80b5dcc228e0d81c6ac809690d1d64454c70fc14bf1863c1946ad2b` |
| `Data/scripts/commands/gm/testifrit.lua` | `ca6fc7f72c78e72040597340e7fbc9b90d53f39a6762c81ce8115ee3e6a3b692` |

The repository was changing during the pass, so all current-source statements are time-bounded to the hashes above. Installed-client sizes and hashes are independently stable for the named 1.23b files.

