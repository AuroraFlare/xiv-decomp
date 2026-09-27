# Aurum Vale: position-free 1.21 implementation

Historical baseline: the [2026-09-07 populated-route pass](legacy_raid_routes_2026-09-07.md)
adds default rooms, transporters, coffers, objective tracking, and route authoring.
Its current scope and reconstruction limits supersede this document's placement omissions.

This implements the original Final Fantasy XIV 1.x Aurum Vale encounter contract without inventing permanent mob, circle, morbol-part, or treasure coordinates. The five previously recovered DoorServer barriers retain their existing SQL placements. Everything else that still needs a location is exposed through runtime placement/objective hooks and leaves `server_battlenpc_spawn_locations.sql` untouched.

The target is the dungeon as launched in patch 1.21. Patch 1.22 later relaxed entry to 4–8 players; that later rule is intentionally not used here.

## Implemented runtime

- Zone 245, content ID 6, `InstanceRaid/InstanceRaidAurumVale`, field/battle music 5/6, a 60-minute limit, saved return points, reconnect replay, and idempotent cleanup.
- Normal entry requires the party leader, exactly eight level-45-or-higher Disciples of War or Magic, completion of one of the three `Into the Dark` Grand Company quests, and no active Aurum retry timer. The current server uses a direct Tristechambel handoff because the recovered raid-entry response widget is incomplete.
- A 15-minute retry lock begins on clear or voluntary withdrawal. Failure, timeout, an all-dead party, or an empty instance applies five minutes. GM test instances do not alter retail timers.
- The 14-member position-free roster: Vale Diremite, Vale Banemite, Lily of the Vale, Nether Nix, Vale Wasp, Eftstool, Coincounter, Miser's Mistress, imperial primus ordinarius, Imperial Myrmillo, Imperial Speculator, Imperial Veles, Abacus Slug, and Imperial Sagittarius.
- `What Glitters Always Isn't Gold` advances only when actor class 2307002, the imperial primus ordinarius, dies. Speaking to the entrance NPC no longer fabricates the objective.

## Hazards and barriers

Gold Lung runtime volumes apply status 223258 and send the recovered enter/leave messages 52063/52064. The existing mapped Goldbile polygons apply 223259. Both effects survive death, matching the recovered client status class.

Morbol fruit grants Aurum Veil II and sends messages 52070/52072; morbol root/vine grants Aurum Veil and sends 52071/52072. Their recovered reduction parameters are 0.20 and 0.65 respectively. The client lifetimes 330 and 630 are interpreted as half-second units, producing 165 and 315 seconds. The protections reduce both environmental effects; they do not cleanse either one. Goldbile strength is reapplied immediately when protection changes, avoiding a stale full- or reduced-damage status.

Enemies standing in Goldbile enter and leave the recovered recovery state with messages 34273/34274. Client text proves the state but not its server-owned healing rate, so the current 1% maximum HP every three seconds is explicit policy.

Magitek-circle visuals are restricted to the recovered two-through-six-player b936 variants. Only living members of the original party on the same floor count. The radius (3.75 yalms) and hold time (1.5 seconds) are reconstructed because no server values survive. Activation sends message 52069 and opens the linked DoorServer object with `hide`; reconnect replay uses `hide` at offset 5 for open barriers and `show` for closed barriers. Mob-kill prerequisites remain placement-dependent and are not guessed.

## Boss contracts

Coincounter uses the contiguous m055 client animation contract:

| Command | Meaning | Client bank |
|---|---|---|
| 23476–23482 | 10/100-tonze attacks, Eye, Glower, and the dedicated substate Swing | WSS1–WSS7 |
| 23483 | hidden Giant Swing recovery transition | WSS8 |
| 23484 | Animal Instinct | WSS9 |

Command 23483 is presentation-only and never enters the autonomous skill list. When the dedicated WSS7 substate command is selected, it sets m055 model-state bit `0x10`, suppresses actions, then WSS8 clears it. The state assets and command order are recovered; the original WSS7 selection condition, set/clear direction, and three-second hold are reconstruction, not recovered server rules. Animal Instinct performs the period-observed full hate reset and queues an immediate Eye of the Beholder or 100-tonze Swing follow-up. The exact selection rule is unknown.

Period 1.x evidence shows late Abacus Slugs in the Coincounter encounter, but no reliable HP threshold, count, or cadence survives. They are therefore present in the runtime roster and objective hooks but are not automatically spawned at a fabricated threshold.

Miser's Mistress uses the non-numeric m012 animation order recovered from the client: Ranged Attack, Sour Breath, Bad Breath, Vine Probe, Sweet Breath, Sweeping Lash, and Tendril Tremor map to WSS1–WSS7. Archive effects are implemented: Sour Breath applies Paralysis/Amnesia/Slow, Bad Breath applies Paralysis/Amnesia/Poison/Blind/Heavy/Slow, Vine Probe binds, Sweet Breath sleeps, Sweeping Lash stuns, and Tendril Tremor knocks back. Chances and durations are server policy where the archive does not provide numbers.

Miser's lethal command result, death state, and resource updates are placed on the wire before clear processing. Only then are achievements, the clear event, retry timer, and coffers published.

## Treasure and achievements

Six observed regular-coffer pools are implemented through position-free hooks. A regular coffer is committed only after an item reaches a party loot pack; a full party inventory leaves it available.

At Miser's death, eligibility is captured atomically for up to five 90-second completion coffers:

1. Defeat Miser's Mistress.
2. Clear in under 25 minutes.
3. Complete the first-two-room slug condition.
4. Open all six regular coffers.
5. Defeat all required imperials.

The base coffer always appears. The other four appear only when earned. Missing/destroyed unopened coffer actors are recreated during the reward window, and an opened coffer is committed only after loot is delivered.

Contemporary observations preserve the item pools and four Darklight regions but not a complete condition-to-position join or exact rate. The current condition associations are clearly marked reconstruction in code. Darklight is a 1-in-20 policy roll; the speed pool has no invented rare item.

- Achievement 1305 (`Miser Neutralizer`) unlocks on clear.
- Achievement 1306 (`Raiding the Vale`) unlocks only when all five earned completion coffers exist and all five are opened.
- Achievement 1307 (`Breathless`) is evaluated per player and requires that player not to have consumed fruit or root/vine during the run.

## GM verification hooks

```text
!aurum goto
!aurum start
!aurum enter
!aurum status
!aurum roster
!aurum barriers
!aurum mob coincounter
!aurum mob abacusslug
!aurum mob imperialsagittarius
!aurum mob primus
!aurum mob miser
!aurum gas 7 goldenpools
!aurum circle 4 goldenpoolssouth
!aurum fruit
!aurum root
!aurum regular 1       (repeat through 6)
!aurum objective slugs
!aurum objective imperials
!aurum leave
```

`mob` spawns a small formation in front of the caller. `gas` and `circle` use the caller's current location. These hooks never persist placement rows.

Apply `Data/sql/live migrations/aurum_vale_runtime_contract.sql` to an existing database before testing. New databases receive the same records through the normal SQL seeds.

## Evidence boundary

Primary period sources include the [official patch 1.21 notes](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes?p=580985&viewfull=1), the contemporary [Aurum Vale completion/reward discussion](https://forum.square-enix.com/ffxiv/threads/39150-Aurum-Vale-Duty-Complete%21), the [period loot-table print view](https://forum.square-enix.com/ffxiv/printthread.php?page=30&pp=10&t=39150), the [1.x Coincounter discussion](https://forum.square-enix.com/ffxiv/threads/54908-Coincounter), and surviving 1.x runs [QI0fvbDKHxw](https://www.youtube.com/watch?v=QI0fvbDKHxw) and [gs8nEtHrCr8](https://www.youtube.com/watch?v=gs8nEtHrCr8). Local 1.0 DAT tables, Lua, installed scheduler assets, and focused client decomp provide the status, message, actor, WSS, mode, director, and barrier contracts.

Still intentionally absent: permanent mob/circle/morbol-part/coffer coordinates, patrol routes, automatic room packs, exact Gold Lung room volumes, Coincounter's unrecovered slug threshold/cadence, magitek kill prerequisites, and a claimed entry/clear cutscene binding. Do not import ARR Locksmith, Gold Rush stacks, Burrs/seedlings, or ARR fruit-stack cleansing.

Run `tools/validate_aurum_vale.ps1` after changes. The Map Server project must also build with zero errors; warnings from the legacy target and dependency set are expected.
