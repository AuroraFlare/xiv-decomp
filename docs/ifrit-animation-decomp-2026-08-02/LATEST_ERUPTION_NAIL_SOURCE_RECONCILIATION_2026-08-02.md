# Latest Eruption and Nail source reconciliation - 2026-08-02

Final source drift check: **2026-08-02 20:56 -04:00**; runtime-trace review through **21:03 -04:00**  
Policy: **read-only inspection and Markdown only**. No source, SQL, validator, client asset, executable, build, capture, or gameplay data was changed.

## Why this note exists

`IfritEncounter.lua` changed again after the 20:39 decomp snapshot. The installed-client findings and Eruption ownership analysis remain unchanged. One Nail invocation field changed and must supersede the earlier reports:

| Field | 20:39 snapshot | Latest 20:56 source |
|---|---:|---:|
| `NAIL_ACTIVATION_COMMAND` | `23001` | **`23366`** |
| Packed Nail animation | `0x13001000` / WSS1 | `0x13001000` / WSS1 |
| Packet topology | Self-targeted X01 | Self-targeted X01 |
| Publication/ACTIVE lead | `0.5 s` + `0.2 s` | unchanged |
| WSS stable wait | `3.0 s` | unchanged |
| Aura selector | breakage index `4`, bit `0x10` | unchanged |
| Aura settle/reveal | `0.5 s`; about `4.2 s` total plus retries | unchanged |

The two 20:39 report drafts originally recorded command `23001`; [INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md](INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md) and [CURRENT_ERUPTION_AND_NAIL_FINDINGS.md](CURRENT_ERUPTION_AND_NAIL_FINDINGS.md) are now reconciled to **command `23366`**. Any `23001` reference in an older historical snapshot is superseded for the latest source. All asset hashes, WSS1 curve findings, self-target ownership, aura analysis, death gaps, Hellfire-survivor gap, late-join gap, and timing conclusions remain valid.

## Latest Nail activation command

SQL row `23366` is:

- local name `unknown_ability_23366`;
- a monster action row using WSS1 packed animation `318771200` / `0x13001000`;
- cast type `11`;
- animation duration `3` seconds;
- fire property `9`;
- damage/action fields present even though the scripted presentation supplies a zero-amount self result.

The static command bridge and current validator route `23366` through the recovered `MonsterSubStatWeaponSkill` handler, making it a more specific presentation envelope than generic attack command `23001`; it does not change the selected client bank. The SQL row remains unnamed, and its recovered target flags do not prove a self-only or Nail-exclusive retail purpose. Self-target ownership comes from the encounter's manual X01 send, which bypasses ordinary `BattleCommand` targeting.

The latest sequence is therefore:

1. Publish the correct `m524` Nail UI-hidden and untargetable.
2. Wait `0.5 s` after publication/retries.
3. Re-instantiate and publish `ACTORSTATE_ACTIVE`.
4. Wait `0.2 s`.
5. Send self-targeted X01 command **`23366`**, animation `0x13001000`.
6. Wait the full WSS1 `3.0 s` rise/growth window.
7. Latch breakage index `4` and publish opcode `0x0144` substate.
8. Wait `0.5 s` for the e002 aura initialization window.
9. Show the combat presentation and enable targetability.

Minimum fixed delay remains about **4.2 seconds**, excluding up to approximately `0.5 s` of initial recipient retries.

## Eruption conclusions after the drift

The later source edit does not alter the Eruption findings in [IFRIT_ERUPTION_ANIMATION_DECOMP.md](IFRIT_ERUPTION_ANIMATION_DECOMP.md):

- Normal/Hard private `23983` still resolves to canonical `23364` / WSS2.
- Extreme still resolves to `23582` / WSS1.
- WSS2 still has a target-side compact fire-ring/glow/sonic package and no recovered rock.
- The server still freezes damage geometry without placing that coordinate in X01.
- The Hard second-train helper remains an action source at arena center, not a ground anchor at the snapshot.
- WSS10 remains caster-only.
- WSS22 remains the strongest target-capable rock/fire helper comparison with no live encounter selector.

The 20:55 source edit also changes Crimson Cyclone timing/damage plumbing and clone glow order. Those changes are outside this Eruption/Nail correction and are not reinterpreted here.

## Latest source pins

| Input | Bytes | Last write (-04:00) | SHA-256 |
|---|---:|---|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | 73,084 | `2026-08-02T20:55:31.1026437-04:00` | `086300ae812c2896ac32c634a56052f843d65f0646b69a71fde53ad4fda67931` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | 196,423 | `2026-08-02T20:33:42.3685820-04:00` | `a98598cd9d64d495d93e6ae3e66db23080788109b072f60acf0791becb2ed769` |
| `Map Server/Primals/IfritManager.cs` | 67,657 | `2026-08-02T20:33:11.5745023-04:00` | `6ad2c0d2fac92beafbd8ab95dffc7f4dc503ca92275b8bc0cf24985fa0fb9c4f` |
| `Map Server/WorldManager.cs` | 648,855 | `2026-08-02T20:31:17.6729807-04:00` | `5b67b1acf80b5dcc228e0d81c6ac809690d1d64454c70fc14bf1863c1946ad2b` |
| `Data/scripts/commands/gm/testifrit.lua` | 2,777 | `2026-08-02T20:31:39.9734116-04:00` | `ca6fc7f72c78e72040597340e7fbc9b90d53f39a6762c81ce8115ee3e6a3b692` |
| `tools/validate_ifrit_family.ps1` | 70,143 | `2026-08-02T20:56:12.6909322-04:00` | `3d1f849ddc3fad825fcbb302f791f1d57fb852126971b60ae8e6e5464f1c4425` |
| `tools/validate_ifrit_eruption_snapshot.py` | 4,212 | `2026-08-02T10:18:21.7409660-04:00` | `ac22ee238a5495bfa76446b79a1e294d1b05b228a009cd715258839d5f2f819d` |
| `Data/sql/server_battle_commands.sql` | 576,173 | `2026-08-02T14:34:53.3177199-04:00` | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |

The validator source now explicitly requires command `23366`, self-targeted X01, full WSS1 wait, breakage-bit-4 aura publication, and the final reveal. The latest validator was inspected but not executed during this final drift check, avoiding any non-Markdown side effects. No Map Server process was running, so the latest command envelope still lacks fresh in-client render proof.

## Post-reconciliation runtime trace boundary

The later `21:02` trace adds transport evidence without closing the visual gap:

- Nail publication began and completed in about `4.55 s`; opcode `0x0139` action traffic and `0x0144` substate traffic were reported without a Nail exception.
- This proves that the current packets were emitted, not that the client rendered the WSS1 entrance or persistent aura.
- Later `[manim] 23366` probes targeted the player, not a Nail, so they are not Nail lifecycle evidence.
- GM `nailaura` probes manually forced a living Nail's breakage bit OFF, ON, then OFF. Those records are manual tests rather than automatic lifecycle transitions, and the final observed probe state was deliberately OFF.

## Final current conclusion

The latest source strengthens the Nail action envelope without changing the decompiled client bank: command `23366` now requests the same self-targeted WSS1 rise/growth bank, followed by the e002 aura request. The actual outstanding problems remain WSS1 entrance render proof, persistent-aura render proof, exact death scheduler selection, targetability timing, late-client reconstruction, and missing Hellfire-survivor deactivation/consumption.

