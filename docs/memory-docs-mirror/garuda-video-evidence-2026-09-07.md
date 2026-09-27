# Garuda Hard: video cross-check, 2026-09-07

This report covers the original FFXIV 1.x Hard encounter. The supplied recording
and two additional contemporary player recordings were opened in YouTube and
visually inspected at the timestamps below. These are sampled frame
observations, not a complete frame-by-frame analysis or a packet capture.
Existing boss, tower and add spawn coordinates are outside this work.

## Recordings and method

| Recording | Identity / availability | Use in this pass |
|---|---|---|
| [FFXIV: A Relic Reborn - Garuda (Hard)](https://www.youtube.com/watch?v=rzVsuAo30hs) | 2012-07-25; 560 seconds; current channel Kairi Sgheart | Supplied run, South wind and sleep warning cross-check |
| [Garuda - Hard mode (Monk POV)](https://www.youtube.com/watch?v=4PPUsXfjWRM) | 2012-06-20; 481 seconds; chardrizard | West-to-South timing, actual Great Whirlwind damage log, Satin defeat and Mirage transition |
| [Garuda WHM pov](https://www.youtube.com/watch?v=V-fCnnk7ZYg) | Same contemporary creator; visible original 1.x UI, 8:36/8:37 player duration | Independent view with West, Mirage and South messages plus Satin defeat |
| [Official patch 1.22 preview](https://www.youtube.com/watch?v=KC7qcJcmzfQ) | Official upload 2012-04-24 explicitly says under development | Located, but not used to calibrate retail behavior |

Two linked 1.22b Bard recordings, `bhmYrgkES2s` and `w5NWj-rkFOE`, are now
unavailable. Another embedded video, `_6jQwGgy_Ek`, is private. Their associated
guide remains readable; that text is not a substitute for watching those videos.
The August strategy thread also links `8H1uExJUUXM`; it was located but not
watched in this pass.

Public metadata was read with the existing local yt-dlp installation. Direct
video downloads failed with HTTP 403, so actual inspection used YouTube playback
in the in-app browser, pausing and seeking with the visible player controls.
Screenshots were viewed in the tool results. No completed video download or local
screenshot export is claimed by this report. Seeking can initially show the
previous decoded image; observations below were read after the new frame loaded.

## Directly observed frames

Times are player positions, rounded to whole seconds. Five-second brackets are
deliberate; they must not be promoted to exact retail timers.

| Recording / time | Visible evidence | Consequence |
|---|---|---|
| [Monk 4:48](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=288s) | West-wind summon appears in the log; Chirada is targeted and alive alongside Garuda. | This is a West clone pattern, not a moving-plume pattern. |
| [Monk 5:16](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=316s) | Chirada has very little HP; Suparna is still visible and alive. | Clone phase has not completed. |
| [Monk 5:26](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=326s) | Suparna is targeted with low but nonzero HP. | Last clone remains alive at this sampled time. |
| [Monk 5:31](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=331s) | Target has returned to Garuda; Suparna is absent. The outer brown storm remains. | Last clone disappears between 5:26 and 5:31. |
| [Monk 5:36](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=336s) | Group attacks Garuda inside the surrounding storm, without a new add pattern. | Add death does not immediately end the current wind environment. |
| [Monk 6:05](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=365s) | No new South-wind message; group attacks Garuda. | New pattern has not visibly begun. |
| [Monk 6:10](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=370s) | South summon is newly present in the log; a Razor Plume appears while Garuda performs a rising animation. | South begins between 6:05 and 6:10. |
| [Monk 6:15](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=375s) | South message remains and wind forms near the fighting group with live plumes. | South combines moving-party wind avoidance with killable plumes. |
| [Monk 6:25](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=385s) | Combat log records Great Whirlwind dealing 1,176 damage to Fowabro Rowine. Other log records Rayleigh Heart defeating the satin plume; live Razor Plumes remain nearby. | Great Whirlwind is an actual damaging South action. One mitigated hit does not recover its base potency. Satin can be killed early. |
| [Monk 7:13](https://www.youtube.com/watch?v=4PPUsXfjWRM&t=433s) | Warp-and-bend message appears while Garuda has low HP. | A Mirage transition follows this South pattern roughly a minute later. |
| [Supplied 7:22](https://www.youtube.com/watch?v=rzVsuAo30hs&t=442s) | South-wind summon and party kite instruction remain visible; a player types `zzz`; live Razor Plumes are present. | Sleep is a concern immediately after South starts. The chat message alone does not prove the exact sleep application time or caster. |
| [Supplied 7:27](https://www.youtube.com/watch?v=rzVsuAo30hs&t=447s) | Party follows Garuda with brown wind close to one side and attacks a plume. | There is a moving safe corridor. The camera does not expose every wind origin. |
| [Supplied 7:32](https://www.youtube.com/watch?v=rzVsuAo30hs&t=452s) | Plume defeat messages are visible; nearby ground is clear in the camera view. | Compatible with movement and/or a wind-off interval; does not by itself distinguish them. |
| [Supplied 7:37](https://www.youtube.com/watch?v=rzVsuAo30hs&t=457s) | Brown wind again borders the group on the right. | Consistent with continued wind avoidance after plume deaths. |
| [WHM 6:07](https://www.youtube.com/watch?v=V-fCnnk7ZYg&t=367s) | West summon log and post-Aerial group combat are visible. | Independent original-game West-phase evidence. |
| [WHM 7:44](https://www.youtube.com/watch?v=V-fCnnk7ZYg&t=464s) | Log preserves West, warp-and-bend and South messages, followed by Riones Walsam defeating the satin plume; Razor Plume is still visible. | Independent South combination and early Satin death, but not an observed Satin timeout. |

### Timing conclusion

In the Monk recording, last-sister disappearance is bracketed by 5:26-5:31 and
South activation by 6:05-6:10. The corresponding gap is approximately 34-44
seconds. The existing reconstruction of waiting roughly 40 seconds **after add
completion** is consistent with this evidence. Starting that same 40-second
timer at the earlier wind-pattern start would transition while the observed
sisters were still alive. This pass therefore does not support that change.

The observed South-to-Mirage span is about 63 seconds, also compatible with a
short plume-killing interval followed by the existing post-add delay. It does
not establish an exact branch duration independent of add deaths.

## Contemporary written evidence, kept distinct from footage

The [August 2012 firsthand strategy thread](https://forum.square-enix.com/ffxiv/threads/51171-Time-to-share-strategies-Garuda)
contains a more specific South account: one middle tornado and two outside
tornadoes, with the outside route followed clockwise. In its
[later transition discussion, posts 64-65](https://forum.square-enix.com/ffxiv/threads/51171-Time-to-share-strategies-Garuda?p=790768),
Chardrizard says the middle tornado switches off periodically, allowing a
crossing. Their earlier response also describes the bordering tornadoes during
side-position combat switching on and off every few seconds. This is direct
player testimony for safe crossing windows, although neither the interval nor
the duty cycle is quantified.

That later post also describes two consecutive clone cycles forcing plumes next
and no immediate repetition of the same clone layout. Treat this as a reported
selection rule, not a recovered random-choice algorithm.

The [Taiwanese guide, updated August 2012](https://forum.gamer.com.tw/G2.php?bsn=17608&lorder=3&parent=134&sn=140)
instead describes four moving South tornado locations. It identifies a single
sleep plume mixed into the other plumes, favoring the rear group, and says
sleep lasts 30 seconds. It describes two wind hits about two seconds apart
against sleeping players. The 30-second number in that paragraph is **sleep
duration**, not a demonstrated Satin lifetime. Its West section says wind
damage pulls players toward arena center; its final West section describes a
larger storm and smaller safe center. It also caveats the claimed non-repetition
rule because the author thinks they saw three clone phases consecutively.

The [May 2012 translated Japanese strategy](https://forum.square-enix.com/ffxiv/threads/44438-Garuda-Strat-from-a-Jp-Lodestone-Blog?mode=linear&p=672024)
also describes four South spots rotating clockwise and roughly 1,700 damage
with displacement on contact. This agrees on movement and danger but differs
from the later explicit three-active-column description. Its Mirage account
uses four fixed locations selected by Garuda's east/west destination.

## Implementation recommendations and confidence

### Preserved contemporary diagrams

The guide's published overview images are preserved locally and were visually
inspected during this pass. They are strategy illustrations, not frames from
the recordings sampled above:

- [South overview](../outputs/garuda-video-evidence-20260907/guide-south-overview.jpg),
  original [image](https://i.imgur.com/z0g6T.jpg): **one central circle plus
  three surrounding circles**, with a clockwise arrow. This independently
  supports a center obstruction and four total potential hazard regions. It
  does not depict four equally spaced orbiting columns. It also conflicts with
  the August account's specific count of two outer columns.
- [Final West overview](../outputs/garuda-video-evidence-20260907/guide-final-west-overview.jpg),
  original [image](https://truth.bahamut.com.tw/s01/201208/dfa7e04a31f6c37f7f41a7b78ce57d99.JPG):
  broad outer annulus surrounding a small safe center.
- [Mirage overview](../outputs/garuda-video-evidence-20260907/guide-mirage-overview.jpg),
  original [image](https://truth.bahamut.com.tw/s01/201208/b6b770cad67deea31228904188f1cb91.JPG):
  center, far-side, and two near-side circles enclose the group's side pocket.

The illustrations cannot establish which potential regions are simultaneously
active. The selected implementation reconstruction uses one pulsing central
column and three outer columns spaced 120 degrees apart and moving clockwise.
The three outer columns would remain visible while the center is off; this
could reconcile the August count of three with the four-region illustration.
That reconciliation is an inference, not a demonstrated retail rule.

| Behavior | Confidence and implementation boundary |
|---|---|
| Damaging wind | High. Actual Great Whirlwind hit is readable in footage. Players receive damage; attacks do not destroy the wind. |
| Post-add delay | High for retaining the existing broad approach. One measured clear is consistent with about 40 seconds after the final sister disappears. |
| Clockwise South avoidance | High across contemporary sources; visibly a kite phase. Exact orbit radius, speed and angular offsets remain reconstruction. |
| South middle tornado | Source-backed by two August firsthand descriptions, including its crossing window. The sampled cameras do not independently count all origins. |
| South center plus three outer columns | Selected reconstruction follows the explicit preserved diagram and four-spot guides. Three columns during center-off windows could explain the August count, but the sampled footage does not prove that explanation. |
| South center off windows and Mirage bordering-column off windows | Source-backed. Sampled video is compatible, but does not measure a complete repeat period. |
| Four seconds on / four seconds off | A tunable implementation choice only. No inspected frame sequence establishes these exact values. |
| Two-clone cap | Reported by one firsthand player, contested by the Taiwanese guide. Preserve this uncertainty if adopting it. |
| Wind hit interval | A roughly two-second repeated-hit interval has guide support. The inspected footage has only one readable Great Whirlwind sample, so cannot establish a universal cadence. |
| Wind displacement direction | Generic English knockback conflicts with a specific center-pull description for West. South push-away and West pull-in are reasonable distinct reconstructions, not video-measured vectors. |
| Satin/Silky sleep and self-destruction | Early kill urgency and sleep are supported. Both observed Satin examples die to players, so their natural timeout and the exact cast-to-despawn ordering remain unobserved. |

The engine can implement helper-owned collision and damage, active/inactive
windows, phase cleanup and finite add lifecycles without claiming those choices
are original server code. Keep exact guessed values named and documented. VFX
mesh/culling bounds still do not establish combat hitbox radii.

## Remaining visual checks

The missing decisive sample is a high, wide camera continuously showing the
whole South arena for one full cycle, and a side-Mirage recording that keeps
both bordering columns in view across several on/off cycles. For life-cycle
timing, a run deliberately leaving Satin alive would be more useful than the
successful early kills inspected here. Retail command result and helper movement
packets would settle cadence and geometry more precisely than footage.
