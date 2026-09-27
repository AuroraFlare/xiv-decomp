# Thornmarch: 1.x decompilation, footage review and implementation

The [September 25 follow-up](moogle_retail_accuracy_2026-09-25.md) supersedes this
pass's shared Maximoogle targeting and generic lesser Mogdive scheduling. It also
fixes Cure IV's NPC ally selection and the director's King level override. The
evidence and test totals below describe the September 7 pass.

This pass targets the original Good King Moggle Mog XII encounter with the installed
`2012.09.19.0001` client. It updates the existing reconstruction with verified
command fields, corrected combat behavior and executable regression coverage.
It does not establish that every server value or animation matches retail.

## Evidence and its limits

The read-only extractor verified **56 typed rows for 28 command IDs** against the
installed DAT bytes and retained CSV schema. It parsed **47 Moogle action banks**,
**1,102 nested resources**, **1,027 scheduler clips** and **97 motion resources**,
with **zero parse diagnostics**. Source hashes, offsets, raw row bytes and all
decoded fields are in `outputs/moogle-decomp-20260907`.

Eleven retained client Lua chunks were freshly decompiled with the existing
`unluac_2015_06_13.jar`. The seven role classes, king, base class and two directors
contain inheritance declarations or empty initialization. They contain no
original server combat rotation, HP table, damage formula or loot distribution.
`lua_manifest.json` records both input and output hashes and identifies these as
previously extracted client chunks, separately from the freshly read command DATs.

The original combat animation dispatch table has not been recovered. The existing
contiguous WSS reconstruction is retained; WSS6 is now selected for ordinary
Ranged Attack. The installed bank files and their contents are exact evidence;
the assignment of a command to a bank is a reconstruction. An outer nine-second
scheduler envelope is not a nine-second cast. Common LIB dance/jump/bounce banks
also require client playback review in their combat context.

Primary historical references used:

- [Official patch 1.20 notes](https://forum.square-enix.com/ffxiv/threads/32606-patch1.20-Patch-1.20-Notes): original content and reward contract.
- [Erwald's January 2012 battle strategy](https://forum.square-enix.com/ffxiv/threads/35955-Good-King-Moggle-Mog-XII-Battle-Strategy): firsthand party tactics, role behavior, approximate damage and defensive interactions. Its observations support an escapable Flare, Decoy against Eye Shot, and Bind clearing on enlargement changes.
- [Famitsu's December 2011 clear report](https://www.famitsu.com/news/201112/18007297.html): independent firsthand combat account, including physical resistance, fixed enlarged hits and inheritance. This predates 1.20a; its statement about the king's initial immunity and declining defense has no recovered numeric curve and is not treated as a confirmed 1.23b formula.
- [Rabanastre SeeD's own strategy post](https://www.ffxiah.com/forum/topic/27940/rabanastre-seeds-moogle-strategy/): identifies its linked recording as post-1.20a.

The official archive's 1.20a link failed to open during this pass. A contemporary
[player quotation of those notes](https://forum.square-enix.com/ffxiv/threads/34171-1.20a-Patch-notes)
was read as corroboration, not substituted for recovered code. It mentions
enmity recovery, death/action ordering, Break/Decoy messaging and range fixes,
with a Pukla Flare exception. That exception does not by itself establish an
arena-wide damage radius. The older eLeMeN URL in the source was unavailable
during this pass; earlier repository findings based on it remain historical.

## Video review

Both sources are original 1.x recordings, with the original interface and combat.
This pass sampled footage; it did not transcribe or watch every frame of both videos.

| Recording | Inspected samples | Observations and use |
|---|---|---|
| [Retained 21:13 recording](https://www.youtube.com/watch?v=hDZy_jGvHxk) | Earlier contact sheet around 5:50–6:20; fresh transition frames/log crops through 6:36; 7:30, 10:30, 15:00, 20:00 and 21:00 samples | Court/king reveal, party mitigation, spread-out combat, role actions and late encounter order. At 10:30 the log explicitly shows Furryfoot using Cure IV on Woolywart for **2,080 HP**. This supports retaining the named Cure IV behavior; it does not recover the cure formula. |
| [Rabanastre SeeD, Conjurer POV](https://www.youtube.com/watch?v=IdMbBbsQw3k) | Browser playback paused at 2:57, 5:54 and 11:48 of 14:45 | Corroborates the restored court, split combat, mitigation and the king inheriting a defeated member's power. The recording contains compressed/edited time; its timeline was not used to fit the wave timer. |

The first recording's log appears frozen/scrolled in some transition frames, so
it cannot establish the exact damage-resolution tick. The observed roughly
five-second entrance presentation does not override the installed **three-second
Memento cast**. The director retains a separate impact/settling allowance.

`tools/build_moogle_video_evidence.py` reproducibly extracts 16 overview/log pairs
from the already-retained local video and records its SHA-256, FPS, frame count
and timestamps. Extraction is not proof of human/model inspection of every output.
It makes no network request and does not download another copy of either video.

## Recovered command contract

The `range` column is the installed command range field. Choosing a caster-centered
circle for the corresponding AoEs also uses observed behavior; it is not inferred
from a separate nonzero client effect-radius field. The effect-range fields are
zero in these rows. Server-side actor overrides are possible in the original client.

| ID | Name | Native cast | Native range | Damage interpretation used |
|---:|---|---:|---:|---|
| 23414 | Mogdive | 1 s | 6 | Physical, blunt |
| 23415 | Whisker Bash | 1 s | 6 | Physical, blunt |
| 23417 | Moogle-Go-Round | 1 s | 8 | Physical, slashing from period observations |
| 23419 | Ranged Attack | 0 s | 20 | Physical projectile from role/footage |
| 23420 | Moogle Eye Shot | 2 s | 20 | Physical projectile from role/Decoy interaction |
| 23421 | Pom Flare | 4 s | 12 | Magic, Astral element 11 |
| 23422 | Maximoogle | 2 s | 50 | Support to another court member |
| 23423 | Mognesia | 4 s | 12 | MP drain |
| 23424 | Memento Moogle | 3 s | 50 | Magic, Astral element 11 |
| 23438 | Break | 2 s | 12 | Magic, Earth element 8; petrification after unabsorbed damage |
| 23451–23453 | Memento Moogle variants | 3 s | 50 | Same native cast/range/element |

The neutral attribute `13` alone does not establish slashing/projectile damage.
It is distinct from the element column and from this emulator's action-type enum.
Unknown named slots were retained in the evidence output without invented abilities.
Native TP costs are 1,000 for Mogdive, Whisker Bash and Mognesia; 800 for Go-Round.
Break's native recast is three seconds. Director cadence and native recast are
separate concepts; the current forced-skill API clears recast when issuing an art.

## Implemented behavior

- **Memento transition:** the king and restored court remain inert and immune
  through the entrance. Phase two advances only after the actual C# action state
  publishes completion. Accepted, failed and interrupted casts are distinct;
  interruptions retry. A partial replacement spawn rolls back cleanly.
- **Eye Shot:** four seconds of warning precede the native two-second cast. The
  marked player is retained, with a 20-yalm center-distance check before release.
  Dead, departed or escaped targets are not silently replaced. Physical damage
  keeps the director's authored amount, and the real Decoy hook can force a miss.
- **Role actions:** native casts and channels replace generic placeholders.
  Woolywart receives ranged attacks. Flare uses a 12-yalm caster circle, Astral
  magic defense and the existing damage-interruption policy. Break uses Earth
  magic and cannot petrify through fully absorbed damage. Whiskerwall receives
  encounter-local physical resistance.
- **Maximoogle:** its completed support result identifies the singer for threat
  transfer. Enlargement applies slow, immunity and 1,000/1,500 base auto damage
  for lesser/king, suppresses skills, then restores size, speed and prior auto
  configuration. Expiry clears Bind and reacquires a live target. Ritual entry
  ends enlargement before applying its separate immunity.
- **Scheduling and lifecycle:** each caster holds at most one pending intent;
  ordinary overdue intents expire. Busy or resource-starved actors do not block
  other roles. Existing per-role enmity restoration, learned arts, all-eight
  victory condition, Raise/reconnect recovery, result cleanup and return-point
  exit remain covered by executable scenarios.

The shared C# additions are opt-in: per-execution magic damage routing, generic
director-authored fixed damage/auto damage, and Moogle-tagged cast outcomes.
They do not require command-cache mutation. Maximoogle's SQL target masks must
allow allies **before** the Lua preparation hook, because the controller checks
the cached command first; changing Lua alone cannot repair that rejection.

## Explicit reconstruction values

These are implemented tuning choices, not recovered original server constants:

| Setting | Current value / boundary |
|---|---|
| Lesser HP | 5,000–8,500 by role; king 26,000 |
| Whiskerwall physical reduction | 50%; resistance behavior is supported, exact percentage unknown |
| Flare base potency | Pukla 1,300; king 2,000; scoped to these spawned actors |
| Eye Shot base damage | 1,400 / inherited 2,200; exact original damage formula remains unverified |
| Memento base damage | 450 / 1,800 / 3,500 / 9,999 for 0 / 1 / 2 / 3+ survivors |
| Mognesia MP drain | 1,000 / inherited 1,600, clamped to available MP; period estimates differ |
| Ordinary cadence and hate resets | Existing randomized director timings; no original server rotation recovered |
| Enlargement / frenzy movement | 0.5 / 0.08 speed multipliers; exact retail speeds not recovered |
| Arena center and spawns | Existing provisional world anchor and placements retained |

Flare now has enough potency to be a substantial party threat while retaining
stat-based magic defense, normal variance, resistance and player mitigation.
The production magic formula's reference fixture uses level 50, Intelligence
172, magic potency 43 and defender magic resistance 240. One validated sample
produced **1,566 Pukla / 2,276 king** base damage; increasing magic resistance to
5,000 reduced Pukla to **1,151**. These fixture inputs are not a recovered retail
player's gear, and random variance means subsequent samples differ.

The fixed hit resolver honors forced avoidance, immunity and optional Stoneskin
and damage-down effects. Fixed attacks do not currently roll ordinary random
critical/block/parry/evasion results. That limitation is explicit; this pass does
not claim every defensive interaction has been reproduced.

## Validation and activation

Passed locally:

- Read-only decompilation and typed CSV/DAT agreement: 56 rows, 47 banks, zero diagnostics.
- `python tools/validate_moogle_encounter.py`: static contract and 13 seed rows.
- Moogle MoonSharp harness: **15 behavioral scenarios**, including the real director
  entry through waves, Memento, result, reward, cooldown and exit with engine doubles.
- Moogle production-assembly harness: **58 checks**, including actual damage
  resolution, completion counters, command isolation and Flare calibration.
- Map Server build: no errors. Existing dependency warnings remain.
- Shared Garuda static and Lua regression harnesses passed, including the latest
  20 wind-publication scenarios. An earlier C# run passed 275 checks. After the
  final Map build, concurrently edited Garuda tests added a failing reproduction
  for moving wind contact admission (`VerifySnapshotAdmission`, command 23998).
  The new test was written after that assembly was built and expects a validation
  origin field absent from the current source/assembly at review time. It fails
  in `BattleNpc.CanUse`, outside the Moogle paths changed here. The final expanded
  Garuda suite is therefore **not green**; its active contact-admission work needs
  its own rebuild/retest. None of these harnesses proves in-client visuals.

Reproduction commands are in the two Moogle harness READMEs and the evidence
directory README. No live database was changed and no running server was restarted.
Fresh databases use the updated seed. Existing databases need
`Data/sql/live migrations/moogle_command_contract_20260907.sql`, then a Map Server
restart to reload cached commands along with the rebuilt assembly and Lua changes.
The migration is restricted by both ID and name to thirteen Moogle commands and
can be reapplied. It intentionally leaves unrelated rows and player state alone.

In-game review remains necessary for the target-marker effect (currently a text
warning), WSS/LIB playback, caster roaming and detailed enmity-reset behavior,
the provisional world origin and encounter balance against real gear. The king's
possible court-dependent defense curve needs further evidence. The existing
conservative Kupo Nut Charm reward policy and return-point exit remain; original
weapon/token probabilities, a physical reward coffer and the Fretful Moogle exit
conversation are still unresolved. These gaps prevent a claim of complete retail parity.
