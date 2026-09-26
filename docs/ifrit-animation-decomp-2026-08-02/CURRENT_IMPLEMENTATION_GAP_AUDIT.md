# Historical implementation gap audit (superseded)

Documentation-only audit of the live AuroraFlare Ifrit encounter. No encounter, SQL, packet, client, or gameplay asset was changed for this report.

> **Historical snapshot notice:** every implementation statement below this notice is intentionally pinned to Lua SHA `1d55423f...`; it is retained to document the worktree's evolution, not as current behavior. [LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md](LIVE_IMPLEMENTATION_SNAPSHOT_2026-08-02.md) supersedes all current-state conclusions. At current Lua SHA `f868e997...`, Hard plays WSS `0007`, `0018`, `0019`, and one-time WSS `0015`; WSS `0008` is absent; pre-Hellfire/Nail-phase Cyclone is one body/one crossing and post-Hellfire is one simultaneous three-body triangle crossing; Hard has managed class-`2207310` Eruption/Plume helpers; Nail spawn selects `m524` WSS `0001`; killed Nails use a four-second ordinary `DEAD`/fade plus permanent one-shot removal; and the GM shatter path applies lethal damage. Old statements below such as “no helper spawn,” “directly removes every Nail,” and “assigns HP = 0” describe the historical pin only. Client-asset measurements remain valid.

## Snapshot and drift

The requested evidence snapshot named `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` SHA-256 `87360bbe370a78b79c112a3b98d0d3e9f0166085f0ee1aeb447a1f7c071e0112`. During the audit that file changed independently. The relevant later reads were:

| Input | Last write | Bytes | SHA-256 |
|---|---:|---:|---|
| `IfritEncounter.lua` (intermediate WSS7-first order) | `2026-08-02T15:37:44.8872823-04:00` | 54,732 | `ba369568b9e155bca48592579de921fff986b3aba131dd027bfb2e570fc13c6b` |
| `IfritEncounter.lua` (historical movement-first order) | `2026-08-02T15:59:51.4090908-04:00` | 56,323 | `1d55423fcf86d5421e23e0289fff84ea9f2a323da740e950191fbbfe1d807d87` |
| `Map Server/Primals/IfritManager.cs` | `2026-08-02T11:56:37.3689659-04:00` | 55,700 | `d6605e8e88c9acb860a50a4a11871aba4e0953c636286585f2d19396bdf7466c` |
| `Data/sql/server_battle_commands.sql` | `2026-08-02T14:34:53.3177199-04:00` | 576,173 | `f384837334acdf9dafa9bd0bfb750a15dcb814ba12578b797534dac2b092bc96` |
| `tools/validate_ifrit_family.ps1` (historical read) | `2026-08-02T16:01:20.3182377-04:00` | 49,358 | `34bab73c15d90b9a741ff8b3ac60bad7d30d971ef9b1f192f047693da989f54b` |

The supplied `87360bbe...` snapshot had Hard-mode lane movement but no explicit rush or landing battle action. The `ba369568...` file added direct WSS7/WSS8 calls and sent WSS7 before movement. The final `1d55423...` snapshot retains those banks but sends the active movement packet first so its movement pose does not immediately replace WSS7. Findings below describe that final snapshot and explicitly identify older behavior where relevant.

## Crimson Cyclone by difficulty

| Difficulty | Exact route at SHA `1d55423f...` | Consequence |
|---|---|---|
| Normal | `queueNormalRotation` includes private command `23984` in its ordinary order and calls generic `enqueue` (`IfritEncounter.lua:1071-1075`). | It plays the normal command presentation but never enters the perimeter/lane, dash, stop, or recovery state machine. |
| Hard | Both the normal Hard rotation and the Nail-phase special route Cyclone through `enqueueCyclone` (`IfritEncounter.lua:1078-1111`, `1026-1029`). | This is the only difficulty with custom perimeter placement and server movement choreography. |
| Extreme | `queueExtremeCyclone` calls `enqueueRepeated(SKILL.CrimsonCyclone, ...)` and then Incinerate (`IfritEncounter.lua:1137-1145`). | Repeated generic casts do not use the custom lane/dash state machine. |

### Exact Hard sequence at SHA `1d55423f...`

1. Extra bodies are configured by reusing the active profile's boss class, BNPC, and appearance, then instantiated hidden and untargetable (`IfritEncounter.lua:299-337`). No recovered `IfritDummy` or other helper class is selected.
2. The real boss and clones are frozen, made invulnerable, combat-presentation-hidden, untargetable, and warped to opposing lane starts (`IfritEncounter.lua:340-388`, `391-429`).
3. Each body starts private command `23984`; the caster remains at the captured lane origin through its three-second cast (`IfritEncounter.lua:443-500`; `MobSkillState.cs:55-64`, `193-205`).
4. The crossing is one segment over `0.5` seconds (`CYCLONE_CROSS_SECONDS = 0.5`, `CYCLONE_CROSS_SEGMENTS = 1`, `IfritEncounter.lua:23-24`). The final snapshot sends one `DashToPosition` endpoint packet, then `DoBattleAction(23007, 0x13007000)`, before waiting `0.5` seconds (`IfritEncounter.lua:530-582`). SQL command `23007` selects Ifrit WSS7 (`server_battle_commands.sql:763`). Comments at lines 564-568 record the ordering reason: an active `0x00CF` packet sent after WSS7 replaces its visible pose.
5. It then sends `StopAtCurrentPosition`, `DoBattleAction(23008, 0x13008000)`, waits `1.5` seconds, and resolves (`IfritEncounter.lua:585-606`). SQL command `23008` selects WSS8 (`server_battle_commands.sql:764`). The ordinary `23984` result animation is suppressed for this manually presented path (`Character.cs:3404-3410`).
6. Clones are directly despawned and the real boss is restored at the endpoint (`IfritEncounter.lua:607-631`, `242-297`).

`DashToPosition` and `StopAtCurrentPosition` publish movement state/coordinates through `0x00CF` (`Actor.cs:785-872`). Movement itself cannot provide fire, fade, takeoff, or landing VFX. Historical SHA `1d55423f...` requested WSS7/WSS8 through the battle-action channel, so the earlier statement “Hard is movement only” applies specifically to supplied SHA `87360bbe...`. The top notice and canonical live report supersede this historical WSS8 sequence.

The code at SHA `1d55423f...` still had no raw `PlayAnimation` call, no WSS18/WSS19 high-vertical takeoff/return request, no helper actor for a destination impact, and no explicit color-fade control. Those were distinct from the then-new WSS7/WSS8 calls; see the top notice for the superseding source behavior.

## Private command presentation mapping

`BattleCommand.GetClientPresentationId` translates the server-only `23980..23988` commands to canonical client donors (`BattleCommand.cs:448-467`). The selected model-animation field is the WSS bank:

| Private ID | Mechanic | Normal/Hard donor | WSS | Extreme donor | WSS |
|---:|---|---:|---:|---:|---:|
| 23980 | Sear | 23361 | 1 | 23577 | 1 |
| 23981 | Vulcan Burst | 23362 | 1 | 23578 | 1 |
| 23982 | Incinerate | 23363 | 1 | 23579 | 1 |
| 23983 | Eruption | 23364 | 2 | 23582 | 1 |
| 23984 | Crimson Cyclone | 23365 | 1 | 23580 | 1 |
| 23985 | Radiant Plume | 23367 | 1 | 23583 | 2 |
| 23986 | Hellfire | 23368 | 1 | 23581 | 1 |
| 23987 | Radiant Plume, center | 23376 | 3 | 23593 | 2 |
| 23988 | Radiant Plume, outer | 23404 | 1 | 23595 | 4 |

Thus the ordinary Cyclone presentation at this snapshot still selects WSS1. Only the Hard manual path at SHA `1d55423f...` selects WSS7/WSS8. Normal and Extreme do not.

## Eruption and Plumes

- Eruption snapshots the selected actor's world position at cast start (`BattleNpcController.cs:1453-1505`; `MobSkillState.cs:100-106`) and later runs `FindWithinAreaAtPosition` there (`MobSkillState.cs:207-215`). That is authoritative damage geometry.
- Crimson Cyclone likewise snapshots its lane origin for damage geometry (`MobSkillState.cs:55-64`, `193-205`).
- Plume variants use their configured target-finding shapes through the same mob-skill completion path; the encounter queues commands but spawns no surface actor at each affected coordinate (`IfritEncounter.lua:1041-1137`).
- Completion emits `DoBattleCommand` (`MobSkillState.cs:223`). The result packet contains source actor, animation, command ID, target actor, amount/text/effect fields, but no world coordinate (`CommandResultX01Packet.cs:40-66`). A captured Eruption position therefore cannot, by itself, anchor a persistent client effect at that position.
- There is no Ifrit encounter `PlayBGAnimation` call and no Eruption/Plume helper spawn. The recovered `IfritHotAir` and Dummy classes are not used by encounter code; the only direct script reference to HotAir is the GM spawn alias `ifrithotair = 2207310` (`Data/scripts/commands/gm/spawnnpc.lua:16`).

Current behavior consequently proves damage geometry and canonical source-body action selection, not fixed ground eruption, plume telegraph, or plume detonation presentation. Supporting classes `2207303/4/5/8/9/10/12/14` remain uninvoked candidates; their names are evidence for probing, not proof of retail ownership.

## Infernal Nails

The current class binding is correct; the missing link is lifecycle invocation.

- Profiles use Nail classes `2207306`, `2207307`, `2207313`, and `2207315` (`IfritEncounter.lua:76-137`). All currently bind `/Chara/Npc/Monster/Ifrit/IfritAnchor` with appearance base model `10524` (`gamedata_actor_class.sql:6320-6321,6327,6329`; `gamedata_actor_appearance.sql:6347-6348,6354,6356`).
- Spawn config supplies the correct class/BNPC, appearance, direct base model `10524`, size `2`, body gear `1024`, and head gear `2048`; it then sets floating presentation height `5.5`, marks the Nail combat-inert, registers it, and instantiates it (`IfritEncounter.lua:735-841`).
- No Nail activation/rise, idle/pulse, hit, player-killed shatter, or Hellfire-consume animation is explicitly requested.
- Living Nails are republished each tick (`IfritEncounter.lua:962-968`), but Hellfire cleanup directly removes the director member and calls `DespawnActor` for every Nail (`IfritEncounter.lua:883-890`, `931-939`). Surviving Nails therefore receive no deactivation/consume tail.
- A normally killed BattleNpc can enter generic `DeathState`, which sets the main state dead and retains a fade window (`DeathState.cs:31-42`). The encounter does not explicitly select the Nail's recovered `ded`/`dedpose` resources.
- `IfritManager.ShatterTestNails` only assigns `nail.HP = 0` (`IfritManager.cs:696-711`). The HP setter changes the numeric field/update flag only (`Character.cs:864-881`), while `IsDead` consults the AI container state (`Character.cs:2741-2748`). This GM command does not prove entry into `DeathState` or any death animation.

## Battlefield and helper use

The server creates zone `240`, region `104`, content `BowlOfEmbers`, shell `Instance/CircularArena128`, sets music `23`, and applies a circular boundary (`IfritManager.cs:22-31`, `771-786`). `BowlOfEmbers.lua:3-21` reapplies music and weather `8074` on zone-in.

No Ifrit-specific helper actor, map object, background animation, arena flame/barrier transition, or floor animation is emitted. The packet capability exists (`Npc.cs:733`, `PlayBGAnimation.cs`), but the encounter/content scripts do not use it. Ambient fire visible from the base zone layout or weather is therefore separate from server-driven mechanic presentation.

## Validation coverage and blind spots

The validator captured with this historical snapshot does assert:

- Nail height before publication and nonblocking republish (`validate_ifrit_family.ps1:168-170`, `257-260`).
- Hard Cyclone body/wave routing, suppression, warp, one movement segment, stop, and recovery timing (`:231-233`, `291-315`).
- The WSS7/WSS8 rush/landing calls, movement-before-WSS7 order, and duplicate-result suppression (`:309-318`).
- Canonical private-to-client command mappings and SQL rows (`:354-421`).
- Direct Nail cleanup and registry removal (`:529-533`).

It does not establish:

- Normal or Extreme routing through the custom lane choreography.
- Successful in-client rendering of WSS7 fire/fade and WSS8 recovery on all bodies.
- WSS18/WSS19 takeoff/landing behavior.
- Any Eruption/Plume helper actor, fixed ground VFX, or BG animation.
- Nail `activ`, `deact`, `ded`, `dedpose`, `msb4_1`, or WSS1 lifecycle invocation.
- Packet ordering, helper spawn lead, or effect-complete despawn tails.

## Bottom line

At SHA `1d55423...`, Hard Cyclone is no longer merely “almost there”: it has one authoritative half-second endpoint dash, immediately followed by an explicit WSS7 rush request, plus WSS8 recovery after the stop. Normal and Extreme still use generic `23984`; no difficulty explicitly drives the recovered jump pair; ground Eruption/Plume anchoring is absent; Nails have correct class/model bindings but no explicit animation lifecycle; and the battlefield has no server-driven helper/BG presentation. These are choreography and selector gaps, not missing client assets or incorrect current Nail class paths.
