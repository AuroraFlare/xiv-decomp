# Garuda Mistral Song: named-video and native-motion follow-up

This supersedes the unresolved Song/WSS1 status in the September 7 reports.
Private Song commands **23992 and 23994 now use m851 WSS6**, packed animation
`0x13006000` / `318791680`. This is a named-video/motion inference, not a recovered
retail selector packet. Plume explosion selector uncertainty is unaffected.
Later update: the [plume-color follow-up](garuda-plume-color-followup-2026-09-08.md)
adds four material regressions; the 529-check count below is the Song snapshot.

## Evidence and difficulty boundary

The newly inspected recording is
[FFXIV Garuda (Lvl 40) - Seraphim](https://www.youtube.com/watch?v=7_8SNw_CLdA).
The original 1.x UI identifies The Howling Eye, without the Hard suffix, and
shows six players. A [May 2012 blog archive](https://kajimaru.blogspot.com/2012/05/)
already embeds this same video in its May 1 Garuda post. This is **Normal footage**:
it is used only to compare a positively named attack with the shared m851 model.
It does not justify changing Hard's phases, damage, placement or attack frequency.

The paused browser video reported duration 804.581 seconds. Observations below
use video time, not the in-game countdown. Seeking and frame stepping were done
through the player; screenshots were inspected inline, not exported. No new
video was downloaded. The handoff therefore contains timestamped observations
and reproducible native measurements, **not retained screenshots of this video**.
Browser decimal times locate inspected frames; they do not establish equivalent
precision for attack onset, network timing or native frame synchronization.

### First positive Song sequence, approximately 8:56–8:59

| Inspected video time (seconds) | Observation |
|---|---|
| 533.150–535.025 | Garuda absent after the jump; previous Featherlance and Downburst lines remain in the log |
| 536.025–537.275 | Returned, upright with broadly spread wings |
| 537.608 | Asymmetric wing sweep begins |
| 537.942 | Bright wind/refraction overlaps the rising body |
| 538.275 | High-wing posture with visible body displacement from the return position |
| 538.775 | Recovery toward the earlier position; newly appended combat result names Mistral Song, 877 damage to the viewer |
| 539.275 | Upright recovery; the named Song result remains visible |

The name comes from a new combat result, not a label guessed from a green flash.
Player effects overlap the release and are not all attributed to Garuda. Camera
and actor movement also occur: screen-space displacement is supporting context,
not a world-distance measurement or proof that every displacement is a bone key.

### Second occurrence, approximately 9:49–9:52

At 584.275 Garuda is absent; 589.275–590.275 shows her returned upright and moving
relative to the group. At 590.775 an elevated asymmetric wing posture is visible
inside the green refraction. At 591.275 she remains upright with upper wings
raised while curved wind streaks and simultaneous party damage numbers appear.
At **591.775**, she recovers to broadly spread wings and the newly appended log
positively names Mistral Song for **811 damage**. This corroborates the repeated
upright release, rather than Shriek's head-down inversion.

Neither damage number is treated as base potency. No second Song is claimed at
563 seconds: that frame retained the first occurrence's old log line.

## Decoded motion comparison

The preserved WSS6 bank is `client/chara/mon/m851/act/emp_emp/wss/base/0006`,
498,304 bytes, SHA-256
`62fa3b9395d1fd0a858930b38afe3ae24871351f42507a3cf753fbe5995dbc40`.
Its motion `cbbm_sp_b03` has 52 frames at 30 fps (1.733 seconds). Unlike the bare
WSS10 motion bank, WSS6 includes real action and effect envelopes, including
`skill06/skl06cas01m.veffbin` and `skill06/skl06tar01m.veffbin` references.
These resource names alone do not establish the Song join.

`tools/garuda-motion-followup/song_probe.py` calculates every integer-frame root,
head and foot position from the preserved skeleton and full decoded keys.
It records input/helper hashes in
`outputs/garuda-song-followup-20260908/motion_comparison.json`.

| Model-root measurement | Old WSS1 throw | WSS6 recoil candidate |
|---|---:|---:|
| Integer-frame Y minimum / maximum | 2.706681 / 2.857692 | 2.309438 / 3.677239 |
| Integer-frame Z minimum / maximum | -0.025114 / 0.203520 | -2.282385 / -0.011085 |
| Z span | 0.228634 | 2.271300 |

WSS6 holds root Z below -1.99 through frames 10–25. At frame 20 its root is about
Y 3.625, Z -2.213, with the head Y 4.132; it returns to root Y about 2.730 and Z
near zero at frame 52. The old WSS1 has small root travel, not zero travel, and
does not reproduce this sustained rise/recoil/return. This positive body sequence
supports WSS6 more strongly than selecting an unused bank by elimination.

These are **model-space**, integer-frame samples, not continuous-curve extrema
or gameplay movement. Existing scientific pose figures are not native rendering.
Skinning, physics, scheduler blends, actor facing and overlapping VFX are not
reproduced. Applying the same motion to both same-name Song variants remains an
explicit shared-model reconstruction; their historical server-side join is absent.

## Implementation, deployment and tests

Only the two private seed rows' `modelAnimation` and `battleAnimation` fields
change. Canonical client names/IDs (23540 and 23568), 0/1000-ms casts, Wind damage,
30-yalm 90-degree cones, separate 50-yalm anchors and all phase/placement policy
remain unchanged. The engine already passes each ordinary command's SQL animation
through its result presentation path; no new C# override is needed.

`Data/sql/live migrations/garuda_song_animation_20260908.sql` is a separate,
idempotent incremental migration guarded by both private ID and expected name.
Deploy it **after** `garuda_hard_contact_20260907.sql` on an existing installation;
the full seed also has the final values. Neither migration was run here.

New regression coverage checks both SQL selectors, both migration fields and ID/name
guards, plus the decoded recoil/hold/recovery compared with the throw baseline.
The selector test failed with the old seed before the production change.

Fresh isolated Map build: **0 errors**, four existing dependency advisories and
one existing Blowfish warning. **368 C# + 118 Lua/interop + 26 motion + 17 effect
tests = 529 passing checks.** Static validation and deterministic command,
motion, range, effect, texture and new Song comparison checks pass.

```powershell
python tools/garuda-motion-followup/song_probe.py --check
python -m unittest discover -s tools/garuda-motion-followup -p test_*.py -v
```

See the [current handoff](garuda-ai-handoff-2026-09-07.md) for the full test recipe.
No live client/server was started, database changed, installed client edited,
or additional mob placement changed. Exact plume explosion selectors, retail
tuning and native client acceptance remain unproven; this is not a claim of
100% retail parity.
