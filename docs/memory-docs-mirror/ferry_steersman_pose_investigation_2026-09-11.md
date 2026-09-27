# Intermittent Ferry Steersman reference pose

Status: unresolved; no runtime or client asset change made.

## Report and live checks

The user supplied a screenshot of the Ferry Steersman standing in a reference
pose with the wheel near his feet. They notice it while standing on deck, and
report that he stays stuck rather than resuming steering himself.

The user reported that targeting him and running `!setsubstate 0 2072 true`
did not restore steering. This is a reported result, without a packet trace or
command-output capture; it does not prove that client reconstruction succeeded.

The subsequent proposed probe, `!playanimation 4 1037 0`, was **not tested**:
the user had already left the ferry. The failure is intermittent. Do not treat
that direct-action probe as a verified repair or schedule it periodically.

## Server evidence

- `Data/sql/server_eventnpc_spawn_locations.sql` rows 889 and 890 use actor
  class 1001291 in zone 200, with motion pack 2072. Their unique IDs are
  `ferry_man_thantonocea` and `ferry_man_noceatothan`.
- `Data/sql/gamedata_actor_appearance.sql` gives class 1001291 PC family 1
  (`c001`).
- `Npc` copies the spawn motion pack into `currentSubState.motionPack` and
  serializes it in the initial spawn via opcode 0x0144. No ferry-specific pose
  update or recovery exists.
- `Data/scripts/quests/dft/DftSrt.lua` delegates talk to
  `defaultTalkWithPilot_001`. Its recovered client body only calls `say`.
  This does not establish that all downstream client dialogue behavior is
  harmless to the pose.
- `WorldManager.SendFerrySteersmanAnnouncement` uses log type 0x20.
  `Player.TryPlayNpcSpeakingAnimation` only runs for log type 1, so the
  server's speaking-animation helper does not fire for these announcements.
- `!setsubstate ... true` calls `Npc.RebindForPlayer`. That method queues
  removal/reconstruction, but its train differs from the normal Session
  spawn/init/event-status path. A failed manual rebind alone cannot rule out
  a loading or lifecycle problem.

## Installed asset evidence

Read-only inspection used the installed client beneath
`C:/Program Files (x86)/SquareEnix/FINAL FANTASY XIV` and the existing
`walk_pwib_resources`, `parse_scb`, and Garuda motion-decoder helpers.

| Client-relative bank | SHA-256 | Contents |
| --- | --- | --- |
| `client/chara/pc/c001/act/cmn/fid/base/2072` | `1e9b9fea8f61bea7127265c5dd6e6ddaa57db06fc5bd1432da204cb782ede05a` | Persistent `fxpf_idle`; both authored motion clips reference `cbmm_h2_sud_b`. |
| `client/chara/pc/c001/act/cmn/lib/base/1037` | `a1f4d5a21329225c098299eb764e4d342488b3445d7f1b56c4581b8c736e028a` | Direct-action `main` scheduler for the same `cbmm_h2_sud_b` motion. |
| `client/chara/pc/c001/act/cmn/fid/base/2013` | `ecffdb6b6abd35209f7b147c7c6ab63822a88facf81d0d6a4c70458eb71ac729` | Different motion, `cbmm_h2_sud_a`; not an equivalent replacement. |

FID 2072 includes both MCB and MTB resources for its referenced motion and
the expected `skl_c001b001` skeleton references. Its scheduler contains two
authored blocks and a RandomClip in the first block. Both motion references
resolve inside the bank. The motion decoder reads 95 bones; sampled arm
rotations at source positions 0, 50, 100, 200, 300, 400 and 530 differ from the
skeleton's reference pose. These samples do not prove native playback or rule
out a scheduler, resource-lifetime, blend, or client-state failure.

## Next discriminating observation

When the issue is naturally available again, capture the command output from
`!getinfo` for the targeted actor and the result of the existing direct-action
probe `!playanimation 4 1037 0`. Record whether it stays frozen, briefly steers
then freezes, or resumes normally. The command selects LIB category 4, bank
1037, effect 0; it does not change the stored motion pack. No further live
testing was requested once the user said they had left the ferry.

Do not replace 2072, add periodic animation restarts, or describe a spawn-order
change as a proven fix from the current evidence.

## Existing test result

`dotnet run --project tools/ferry-transport-tests/FerryTransportTests.csproj
--no-restore` reached `FerryDepartureCutscenesBoardAfterPlayback` and failed its
existing source-text assertion: "the predicate-specific native trace finding
remains documented beside the fix" (`Program.cs:201`). No tested source had
been edited by this investigation. This is not evidence of an animation
failure, and the harness does not validate live character poses.
