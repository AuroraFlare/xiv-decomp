# Dzemael 1.x: the two circled alcoves

Research date: 2026-09-15. Follow-up to the [online map search](dzemael_1x_online_map_research_2026-09-15.md). This is a source review, not a placement change.

## Location matching

The user's screenshot shows **map one**. Matching the corridor shapes against the [July 2011 Archylte map](https://archylte.blog.shinobi.jp/Entry/306/) identifies:

- **Lower circle:** the end of the first northbound branch off the entrance corridor, northeast of the guide's **A**. It is distinct from the optional gate and room at **B**.
- **Upper circle:** the short east-pointing dead-end immediately east of Grand Hall, at the first junction on the route from **E** toward **F**. It is north of the printed Gullet label; the Gullet room itself is **D**.

This is a topological match. No pixel-to-world conversion or retail XYZ is claimed.

## What the evidence supports

| Question | Finding | Confidence / limit |
|---|---|---|
| Ordinary chest near the lower branch? | Yes: the first coffer is near the branch entrance / first junction. Period drops include Warlock's Pattens and Dark Matter. | Strong agreement between a participant's account and guide map. Does not establish another chest deep inside the circle. |
| AF chest in either circle? | The documented WHM and MNK AF crates are on **map two**, in the drake room after Deepvoid Slave. | Strong location evidence from legacy quest instructions and a September 2012 player report. |
| Orobon at the lower branch's far end? | The user reports orobon. No inspected period source or clear footage frame independently resolves that exact pocket's pack. | Preserve the user report; exact count and homes remain open. |
| Mobs at the upper dead-end? | Hedgemoles are the current reconstruction's candidate. Period sources establish hedgemoles/Nix along the broader route, but not an exact pack at this dead-end. | Do not promote authored positions into recovered retail evidence. |
| Chest at the upper dead-end? | None is marked there on the inspected period coffer guides. | Absence of a marker is not proof that no object ever appeared there. |

## New first-coffer corroboration

[Ayerc, July 23, 2011, post 249428](https://forum.square-enix.com/ffxiv/threads/17439?p=249428&viewfull=1#post249428) places the first chest at the corner entering the first dead-end chamber and reports repeated Warlock's Pattens or Dark Matter drops. The author explicitly had not established the other chest locations. The post's “Warlock Patterns” spelling is clarified by the following reply and the established item name; this is not an additional item.

Archylte's **A** marks a short detour just beyond the first junction. Its map puts the marker before the lower circled chamber. The [Elemen legacy raid guide](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/DzemaelDarkhold.html) and previously inspected nWiki dungeon notes are consistent with this general location. Their marks do not supply an exact object home.

## AF crates: a different room on a different map

| Job | Item in Darkhold | Legacy instruction |
|---|---|---|
| White Mage | **Healer's Culottes** | Examine the wooden crate labelled `???` in map two's drake room, grid **(6,5)**. |
| Monk | **Temple Gloves** | Examine the wooden crate labelled `???` in that same room / grid. |

Sources: [nWiki WHM old-data quest guide](https://wikiwiki.jp/ff14n/旧データ/クエスト/ジョブクエスト/白魔道士), displayed last modification 2012-05-23; [nWiki Monk old-data quest guide](https://wikiwiki.jp/ff14n/旧データ/クエスト/ジョブクエスト/モンク). These describe item retrieval, not the number of distinct physical actors or their server coordinates. The integer grid is a cell reference.

[Nix80, September 25, 2012, post 840961](https://forum.square-enix.com/ffxiv/threads/54829?p=840961&viewfull=1#post840961) independently directs players left after the first boss into the drake room. The author also reports that clearing the room straight ahead makes the drake-room creatures and AF crates disappear. That is useful period testimony about progression, not a recovered despawn implementation or a universally tested rule.

The Fandom page labelled version 1.0 calls both artifacts legwear, conflicting with the more specific Monk instructions above. Its mixed-era enemy/boss list is another reason not to use that page as sole evidence.

## Additional footage inspected

These are direct browser frame observations. No video files or frame assets were downloaded or preserved. Samples do not constitute a continuous survey of either chamber.

| Source | Samples | Observation and limit |
|---|---|---|
| [Dzemael Darkhold 5 Chest Run in 24:40](https://www.youtube.com/watch?v=FfGVL2hUIOY&t=64s), linked by Cursive on August 11, 2011 | 1:04, 1:09, 1:14 | First junction / main corridor, with Recluse Hippogryph nameplates. By 1:14 the log includes Grade 5 Dark Matter loot and Bone Nix engagement. The camera does not show a chest opening or a readable orobon pack at the branch's far end. |
| [Same 2011 run](https://www.youtube.com/watch?v=FfGVL2hUIOY&t=240s) | 4:00, 4:15, 4:30 | Grand Hall imperials/orobon, then the room exit and route toward the upper corridor after Field I feedback. No exact upper-alcove pack can be identified from these samples. |
| [Dancing Mad four-player five-chest run](https://www.youtube.com/watch?v=0H-vgjk0saE&t=69s), description says taken March 31, 2012 | 1:09, 1:19 | First-junction corridor with hippogryph combat. By 1:19 the log includes gil and Grade 5 Dark Matter. No direct opening or view of the lower chamber's occupants. |
| [Same 2012 run](https://www.youtube.com/watch?v=0H-vgjk0saE&t=286s) | 4:46, 4:51, 4:56, 5:01 | Party leaves Grand Hall and follows the northbound corridor, with the dead-end shape visible on the minimap. No readable exact-pack evidence inside the upper pocket. |

The 2011 video's source link was verified in [Cursive's post 285050](https://forum.square-enix.com/ffxiv/threads/19663?p=285050&viewfull=1#post285050). Its later discussion concerns boss tactics; it adds no alcove-specific roster. Upload/post date alone does not establish a video's run date or patch.

## Preservation and remaining gap

Four successfully retrieved public forum pages are preserved as decoded UTF-8 HTML with checked file hashes in [the alcove manifest](../Data/raidroutes/evidence/dzemael-map-search-20260915/alcoves/manifest.json). Original HTTP response hashes are recorded separately. Direct requests to the two nWiki quest pages returned challenge pages; those failed captures were excluded, and the quest content was read through web results.

The remaining missing evidence is a camera view into each pocket with readable enemy names, ideally before engagement and before the relevant wave change. Current reconstruction homes, regional group-size reports, and pulled enemies on the main path cannot resolve that gap. No SQL, runtime actor, static position, nav recording, or combat setting was changed by this research.
