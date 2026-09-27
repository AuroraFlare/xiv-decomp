# Level 40 regional battle guildleves — 2026-09-07

All 54 archived regular level-40 regional battle leve rows now have numeric encounter files: nine each at Bald Knoll, Iron Lake, Halatali, Broken Water, Nine Ivies, and Treespeak. These are explicit reconstructions of the checked-in eLeMeN objective flows using the shared guildleve encounter runtime.

The numeric files retain each title, ID, archived objective text, source archive, pack composition, objective indexes, and encounter parameters. `_level40.lua` expands these specifications into waves, linked parties, search/arrival points, reveal candidates, and retreat stages. Existing tutorial and level-20 files are unaffected by this module.

## Evidence and limitations

- Primary objective evidence: [La Noscea archive](elemen-regional-guildleves/battlecraft-limsa-lominsa.md), [Thanalan archive](elemen-regional-guildleves/battlecraft-uldah.md), and [Black Shroud archive](elemen-regional-guildleves/battlecraft-gridania.md). Their original Japanese objective lines are retained alongside English glosses; some entries explicitly predate reconfirmation after Patch 1.19.
- Target slots and objective aims come from `Data/sql/gamedata_guildleves.sql`. Actor classes come from the existing target catalog and `tools/mobspawns/actor_id_mob_name_only.csv`. Where a DAT row has no target slot for a supporting enemy, an explicit class supplies the archived enemy family. The exact variant for these otherwise unspecified additions remains provisional. In particular, the archive uses general species names where the client displays a named guildleve variant.
- Wolf Poacher `2280122`, Boar Poacher `2280128`, and Brutal Karakul Ewe `2206011` are recovered named classes, not renamed substitute enemies. Open Season selects independently between the two poacher types at each patrol point.
- No rank-40 encounter capture exists in the local `C:/serverdata/guildleve_authoring` inventory consulted for this change. The separate `_regional_placements.lua` module supplies provisional terrain placements. Five rank-40 camps use recorded navmesh nodes and connected route segments. Iron Lake uses the actual faction-leve `!mypos` anchor `{-162.380, 71.010, -2330.882}` with compact offsets; its enemy offsets and route segments need an in-game terrain pass. None of these positions is presented as a captured retail guildleve layout.
- Slippery Skins, All Cracked Up, Tickling Whiskers, and the other item-collection contracts use **85% one-item drops** with replacement packs until every required item counter completes. The archive establishes the collection targets and pack sizes; this rate and yield are conservative playable tuning, not measurements from the footage.
- Search outcomes use **50% success** and replace a failed search only after its ambush dies. This prevents exhaustion of points before the required successful discoveries. Point population, discovery order, and the number of false searches are provisional; successful target/page counts match the archive.
- Disguise contracts choose exactly two real groups from four candidates, covering all six combinations. The correct pair disappears together, then its true enemies appear. Candidate count and distribution remain provisional. Real candidates survive a lethal first hit until replacement. Resource contracts present every unresolved candidate identically as a neutral, protected decoy requiring one Reveal charge per group. False groups resolve in place without target credit. Suppliers grant one guaranteed charge per kill and replenish while the target objective remains incomplete, supporting all four investigations and participants who join after the starting supply is collected. The replenishment policy is playable tuning, not a recovered retail measurement.
- Defenses use the archived **300 seconds**, except Sharing the Load at **400 seconds**. A fresh attack rolls every **60 defended seconds** at the same location. A living participant must reach the 30-yalm destination to start; the countdown and waves pause when nobody remains there, without immediate failure. The native Defense Duration display uses its own timer fields. Attackers explicitly acquire a participant despite zero passive detection range in their profiles. Radius, pause policy, cadence and exact attacking variants remain reconstruction choices; the supplied duration and final enemy requirements are source-backed. Different arrivals have distinct tags and link groups even when previous attackers remain alive.
- “During combat” patrol ambushes trigger on the first damage (HP at most 99%). The archived mid-fight chase branches use a provisional 50% HP threshold. Those thresholds are tuning where the archive gives no exact HP value.
- Stalking the Stalkers (`11704`) has an evidence conflict: the archive describes three initial peistes and two reinforcements, while the checked-in DAT-derived counter is four. The script preserves the five-enemy archived encounter and manually gates completion until all five die. The HUD still caps at the existing four-count aim. This discrepancy requires footage or an authoritative packet capture before changing the DAT row.

## Video evidence

A separate helper searched YouTube for the rank-30 and rank-40 titles. Search metadata alone is a **footage lead**, not confirmation of mechanics. See the shared video research report and `outputs/guildleve-level-30-40-video-20260907/search-<ID>.json` records.

Two directly inspected rank-40 observations informed validation:

- [Dropping Like Flies — RIGHwfb_PlY](https://www.youtube.com/watch?v=RIGHwfb_PlY): sampled footage shows slug attacks, a final Gigantoad around 3:48–4:18, and the reward around 4:38. The clip is edited or accelerated relative to the archive's five-minute defense. The implementation waits for the final toad to die; it does not complete merely when the defense timer expires.
- [Keeping the Peace failure — jx7jV8pzHEQ](https://www.youtube.com/watch?v=jx7jV8pzHEQ): a directly inspected frame at 2:27 identifies Dirty Mongrel with its yellow leve marker; the script uses class `2201413` for that attacker. The June 2011 recording shows 07:34 remaining on the defense display, establishing an earlier, longer-duration version. The implementation retains the later archive's five-minute contract. At 4:02 the player has zero HP, a KO-related Second Wind message, and 02:01 remaining. A “left the levequest destination” warning appears during Return; no observed immediate failure establishes a separate radius rule.

Every rank-40 title with a video lead is included in the authored set.

## Completion and progression

All these configurations set `manualCompletion=true`. Completing a DAT counter alone cannot finish a search, defense, chase, or Necrologos before its mandatory follow-up enemies are defeated.

- Elimination packs advance after the preceding wave clears. Linked parties retain their separate membership.
- Item collections repeat across the placement areas and check every active objective counter.
- Chase contracts preserve one- and two-retreat sequences and require every survivor and reinforcement to die.
- Necrologos searches can finish one page set while the other remains incomplete. Each completed set summons its own enemies exactly once. Final completion requires every page counter and every summoned wave to clear.
- Bait searches check that the interacting participant holds the temporary leve resource. Inspecting without bait leaves the point available. The archive says to carry the bait, so inspection does not consume it.
- Reveals use the established native `40002` content command and per-pair resource scope. One charge resolves either a true or false group through the command or its first paid hit; linked hits and later commands cannot charge that resolved group again. Empty stock leaves every candidate protected. True groups are replaced by objective enemies, while false groups become hostile in place and retain no target credit. Manual reveals engage the acting participant.
- Arrival points activate by proximity. Final “during combat” reinforcements appear while the damaged patrol enemy is still alive, and both groups must die.
- Defenses with final enemies spawn those enemies when the timer expires and require their deaths. Zero-aim defenses complete at the supplied duration.

## Coverage

| ID | Title | Encounter |
|---|---|---|
| 10901 | Annexing the Knoll | battle |
| 10902 | Fearsome Foliage | battle |
| 10903 | Slippery Skins | drops |
| 10904 | Wyrston's Herd | chase |
| 10905 | Escape from Cell E05 | disguise |
| 10906 | Keeping the Peace | survival |
| 10907 | Dropping Like Flies | survival |
| 10908 | On the Beating Path | survival |
| 10909 | Off With Their Heads | search |
| 10921 | Soft Targets | battle |
| 10922 | Annexing the Lake | battle |
| 10923 | Meating Demand | drops |
| 10924 | Mutton over Mongrels | chase |
| 10925 | Unholy Moley | disguise |
| 10926 | Necrologos: The Abased | page search |
| 10927 | Sharing the Load | survival |
| 10928 | Cliff Haranguers | survival |
| 10929 | Great Hoary Toads | search |
| 11701 | Desert Defilement | battle |
| 11702 | Cat Eat Dog | drops |
| 11703 | Juggling Knives | drops |
| 11704 | Stalking the Stalkers | chase |
| 11705 | Secrets of the Sultanate | disguise |
| 11706 | Necrologos: All Things Must Die | page search |
| 11707 | Bigger Fish to Fry | patrol |
| 11708 | Restless be the Damned | patrol |
| 11709 | Preventing the Plague | search |
| 11721 | A Terrible Thirst | battle |
| 11722 | Hiding Under the Beds | battle |
| 11723 | All Cracked Up | drops |
| 11724 | Netting the Gnats | chase |
| 11725 | A Devilet's Best Friend | disguise |
| 11726 | Necrologos: Ranine Reveries | page drops |
| 11727 | Whipping the Curs | patrol |
| 11728 | Thwack Ye Mole | patrol |
| 11729 | Dunesfolk for Dinner | search |
| 12501 | Reforesting Nine Ivies | battle |
| 12502 | The All-seeing Eyes | battle |
| 12503 | Tickling Whiskers | drops |
| 12504 | Efts from Afar | chase |
| 12505 | What the Devilet Dons | disguise |
| 12506 | Necrologos: The Fallen | page search |
| 12507 | Fire Fighting | survival |
| 12508 | All Nine Ivies is a Stage | survival |
| 12509 | Slugging it Out | patrol |
| 12521 | A Toad's Taste | battle |
| 12522 | Stealing Apples from a Lemur | drops |
| 12523 | Blacksand in Hand | drops |
| 12524 | Do Toads Dream | chase |
| 12525 | Out of its Shell | disguise |
| 12526 | Necrologos: Rockbound Mists | page drops |
| 12527 | All Treespeak is a Stage | survival |
| 12528 | Sweet Revenge | survival |
| 12529 | Open Season | patrol |

## Validation

Run:

```powershell
pwsh -NoProfile -File tools/validate_guildleves_level40.ps1
```

This compiles every new Lua file with MoonSharp, resolves every referenced actor class and nonzero DAT mob slot, and runs the actual shared Lua engine through **324 complete encounter simulations** (six per leve).

The simulations exercise successful and failed item/search rolls, all six true-disguise assignments, resource-backed command and damage reveals, inspection without bait, per-page-set summons, mandatory final enemy deaths, one- and two-stage retreats, random patrol foes, first-damage ambushes, and the full 300/400-second defense clocks. Resource disguise runs investigate both false groups first, test empty stock and invalid command sources, obtain four charges as a late participant from replenished suppliers, and replay both linked targets with another participant who still has stock. They verify one payment per candidate group, paid-hit/command races, no supplier or false-target credit, and exactly two true replacement groups. One defense run deliberately leaves earlier waves alive to check concurrent arrivals for duplicate tags or incorrectly shared link groups.

Defense cases also delay arrival beyond the original duration, leave and return, and reject completion when the destination is never visited. They check local defended time, paused timers/waves and mandatory finales. Compiled-server tests separately exercise actual nearest-participant selection, hate/AI engagement and native timer field serialization.

The fake director checks counter clamping, action-batch balance, early completion, unresolved target slots/classes, duplicate live tags, and unrelated simultaneously living waves sharing a link group. These are encounter behavior tests, not an assertion that terrain, animation timing, balance, or a live server session has been verified.
