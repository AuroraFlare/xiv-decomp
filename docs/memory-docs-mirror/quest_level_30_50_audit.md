# Quest Level 30-50 Audit

Audit date: 2026-05-31.

Scope: quest rows in `Data/sql/gamedata_quests.sql` with `minLevel` from 30 through 50, matched to Lua files under `Data/scripts/quests`. This follows the same raw-SQL approach as the level 1-30 audit.

Important caveat: job quest rows (`War0j*`, `Mnk0j*`, `Whm0j*`, `Blm0j*`, `Pld0j*`, `Brd0j*`, `Drg0j*`) are stored in SQL with `minLevel = 15`, so they are not included in the raw 30-50 count even though their client text gates later steps at levels 35, 40, 45, and 50. Current local job `0j1`-`0j6` template wrappers exist and are gated by `job_quests_enabled=false`; they are hidden scaffolds, not retail-complete job quest implementations.

## Summary

| Area | Scripted | Notes |
| --- | ---: | --- |
| All level 30-50 quest rows | 109 / 143 | 34 rows do not have a matching Lua script. |
| Static-clear scripted rows | 1 / 143 | Only `Etc1g4` clears this pass without template placeholders, missing BNPC rows, no-completion flow, or an obvious `GetActorClassId` call bug. |
| Scripted but partial/risky | 106 / 143 | Mostly scaffolds/templates, Grand Company wrappers, sidequest scripts with missing target validation, or dungeon/trial/reward flows without retail parity. |
| Scripted with no completion path | 2 / 143 | `Trl0g1` and `Trl0u1`. |
| Missing scripts | 34 / 143 | Current missing rows are class/guild tails only. |

## By Area

| Area | Scripted | Missing / risk |
| --- | ---: | --- |
| Main scenario (`Man`) | 5 / 5 | All scripts exist; `Man304`, `Man308`, `Man402`, and `Man406` are scaffold scripts, not full retail sequence parity. |
| World/settlement (`Wld`) | 1 / 1 | `Wld0l4` exists, but has the likely Lua `npc.GetActorClassId()` dot-call bug. |
| Grand Company (`Com`, `Gcl`, `Gcg`, `Gcu`) | 39 / 39 | All are template-driven. GC quest visibility is off by default, and instance/NM fights are placeholders. |
| Side/other (`Etc`) | 22 / 22 | All scripts exist; many still need objective/reward validation and special visibility guards. |
| Class/guild quests | 35 / 69 | Level 30 and 36 are mostly present as class-template shims; level 40/50 tails remain mostly missing. |
| Primal/special (`Sum`) | 4 / 4 | Scripts exist as disabled scaffold primal rows; no trial lifecycle parity. |
| Tutorial (`Trl`) | 3 / 3 | `Trl0g1` and `Trl0u1` have no completion path; `Trl0l3` is scaffold/no-offer. |

## Non-Story Snapshot

Excluding main scenario rows, 104 / 138 level 30-50 quests have scripts and 34 are missing. Only `Etc1g4` clears the current static pass.

| Non-story bucket | Current state |
| --- | --- |
| Side/world field quests | 23 scripted rows total: 22 side quests and `Wld0l4`. The side quests are mostly open-world kill/objective scripts, not private instances; most still need target validation, visibility guards, or Lua actor lookup cleanup. `Wld0l4` is a talk/travel style world quest with the same likely actor lookup bug. |
| Grand Company | 39 / 39 scripts exist, but all are shared-template wrappers. 16 of them point at battle placeholders; none launch the real raid/instance flow yet. |
| Class/guild | 35 / 69 scripts exist. Remaining missing rows are mostly level 40/50 class/guild tails. |
| Primal/special | 4 / 4 scripts exist as disabled scaffolds. All four remain battle/raid content candidates without launch parity. |
| Relic/dungeon side | `Etc200`, `Etc201`, `Etc304`, and `Etc106` now have scripts. `Etc200/201/304` are visibility risks; `Etc106` is guarded/partial. |
| Tutorial | 3 / 3 scripts exist; `Trl0g1` and `Trl0u1` have no static completion path, and `Trl0l3` is scaffold/no-offer. |

## By Level

| Level | Scripted |
| ---: | ---: |
| 30 | 28 / 29 |
| 31 | 1 / 1 |
| 32 | 1 / 1 |
| 34 | 2 / 2 |
| 35 | 2 / 2 |
| 36 | 19 / 20 |
| 37 | 1 / 1 |
| 38 | 1 / 1 |
| 40 | 8 / 25 |
| 42 | 1 / 1 |
| 45 | 35 / 35 |
| 46 | 1 / 1 |
| 47 | 1 / 1 |
| 50 | 8 / 23 |

## Looks Implemented Enough to Test

| Quest | Level | Notes |
| --- | ---: | --- |
| `Etc1g4` The Penultimate Prank | 30 | Script exists, has completion, journal/map hooks, and its target actor `2104508` has mob type and spawn rows. This is the only level 30-50 row that clears the static pass. |

## Scripted But Blocking or Risky

### Main Scenario

| Quest | Level | Gap |
| --- | ---: | --- |
| `Man300` Toll of the Warden | 30 | Script exists, but BNPC actors `2106408` and `2106537` are missing from `server_battlenpc_mob_types.sql`. |

### Side and World Quests

These scripts exist, but likely will not play cleanly until their static issues are fixed.

| Quest | Level | Gap |
| --- | ---: | --- |
| `Etc1g8` Say it with Wolf Tails | 30 | Missing BNPC actor `2100609`; likely `npc.GetActorClassId()` bug. |
| `Etc1g9` Embarrassing Excerpts | 30 | Actor `2100503` now has active mob type/spawn rows; keep the likely `npc.GetActorClassId()` bug warning. |
| `Etc1l7` Have You Seen My Son | 30 | Missing BNPC actor `2101609`; likely `npc.GetActorClassId()` bug. |
| `Etc1u4` The Customer Comes First | 30 | Missing BNPC actors `2180210`, `2180211`, `2180212`; likely `npc.GetActorClassId()` bug. |
| `Etc2g0` A Forbidden Love | 30 | Missing BNPC actor `2102708`; likely `npc.GetActorClassId()` bug. |
| `Etc2u1` Freedom Isn't Free | 32 | Missing BNPC actor `2106541`; likely `npc.GetActorClassId()` bug. |
| `Etc1g6` The Ultimate Prank | 35 | Missing BNPC actor `2101908`; likely `npc.GetActorClassId()` bug. |
| `Etc1u0` A Knock in the Night | 35 | Missing BNPC actor `2101711`; likely `npc.GetActorClassId()` bug. |
| `Wld0l4` Sniffing Out a Profit | 37 | Likely `npc.GetActorClassId()` bug. |
| `Etc2g1` Last Respects | 40 | Missing BNPC actor `2100512`; likely `npc.GetActorClassId()` bug. |
| `Etc1l3` Revenge on the Reavers | 45 | Missing BNPC actors `2180301`, `2180302`, `2180303`; likely `npc.GetActorClassId()` bug. |
| `Etc1u2` Dressed to Be Killed | 45 | Missing BNPC actor `2101816`; likely `npc.GetActorClassId()` bug. |
| `Etc3u9` Monster of Maw Most Massive | 45 | Missing BNPC actor `2102717`; likely `npc.GetActorClassId()` bug. |

### Tutorial Rows

| Quest | Level | Gap |
| --- | ---: | --- |
| `Trl0g1` Getting Started | 30 | Script exists, but no static completion path was found. |
| `Trl0u1` `[en]` | 36 | Script exists, but no static completion path was found. |

### Grand Company Template Rows

Every level 30-50 GC row has a Lua wrapper, but those wrappers call `InitGrandCompanyQuest(...)` from `Data/scripts/quests/com/gc_quest_template.lua`. The template advances most steps through the GC officer and has a TODO for real instance/NM placement. `Data/map_config.ini` also currently has `grand_company_quests_enabled=false`, so these are hidden unless the toggle is changed.

Missing GC battle target actor rows:

| Actor ID | Intended target | Affected quests |
| ---: | --- | --- |
| `2207302` | Ifrit | `Gcl101`, `Gcg101`, `Gcu101` |
| `2303501` | Batraal / Dzemael Darkhold clear placeholder | `Com5l1`, `Com5g1`, `Com5u1` |
| `2206305` | Qiqirn poison-cake NM | `Gcl303` |
| `2209501` | Garuda | `Gcl104`, `Gcg104`, `Gcu104` |
| `2210902` | Nael van Darnus | `Gcl107`, `Gcg107`, `Gcu107` |
| `2303003` | Myrmidon Princess / Cutter's Cry clear placeholder | `Gcl305`, `Gcg305`, `Gcu305` |

## Instanced and Battle Content Candidates

Static script search did not find a working level 30-50 quest flow that creates a battle content area or asks the client to enter a raid. The scripted battle/instance candidates in this slice are GC template placeholders plus disabled/scaffolded primal, raid, relic, and Raven-era scripts; none prove real content launch parity.

### Scripted Placeholder Battles

These have Lua wrappers, but the shared GC template only marks a BNPC objective placeholder. It does not launch the instance/raid, and the referenced actors are missing active server mob rows.

| Quest(s) | Level | Expected content | Placeholder actor | Current status |
| --- | ---: | --- | ---: | --- |
| `Gcl101`, `Gcg101`, `Gcu101` It Kills with Fire | 30 | The Bowl of Embers / Ifrit | `2207302` | Placeholder uses `2207302`; loot reference says `2207301` is the It Kills with Fire Ifrit and `2207302` is Ifrit Bleeds. |
| `Gcl303` It's a Piece of Cake to Bake a Poison Cake | 40 | Qiqirn NM encounter | `2206305` | Placeholder only; not confirmed as a full instance. |
| `Com5l1`, `Com5g1`, `Com5u1` Into the Dark | 45 | The Dzemael Darkhold / Batraal | `2303501` | Placeholder only. |
| `Gcl104`, `Gcg104`, `Gcu104` In for Garuda Wakening | 45 | The Howling Eye / Garuda | `2209501` | Placeholder only. |
| `Gcl107`, `Gcg107`, `Gcu107` To Kill a Raven | 45 | Rivenroad / Nael van Darnus | `2210902` | Placeholder only; `InstanceRaidGuide.lua` has commented `askEnterInstanceRaid(15)` logic. |
| `Gcl305`, `Gcg305`, `Gcu305` Oil Crisis / A Taste for Death / Challenge Accepted | 50 | Cutter's Cry / Myrmidon Princess | `2303003` | Placeholder only. |

2026-06-21 note: `Gcl/Gcg/Gcu104` and `107` are not Garuda/Rivenroad launch bridges. They remain placeholder BNPC/objective lanes until guide acceptance is connected to content creation, zoning, director start/relogin, clear/fail, exit, and reward cleanup.

### Present Scaffold/Partial Scripts With Instance or Battle Evidence

| Quest | Level | Expected content or evidence |
| --- | ---: | --- |
| `Etc200` A Light in the Dark | 45 | Cutter's Cry entry/quest; DAT text requires a 4-8 player level 45+ party. |
| `Etc201` What Glitters Always Isn't Gold | 45 | Aurum Vale entry/quest; DAT text sends the party into the dungeon and mentions teleportation inside. |
| `Etc304` Living on a Prayer | 45 | Unlock/lead-in for The Raven, Nevermore; DAT text says the battle can be initiated from Gridania Landing. |
| `Sum6a0` Ifrit Bleeds, We Can Kill It | 45 | The Bowl of Embers Ifrit fight; loot reference has Ifrit and infernal nail actors. |
| `Sum6m0` A Feast of Fools | 45 | Thornmarch / Good King Moggle Mog XII; loot reference has Good King Moggle Mog XII and moogle actors. |
| `Sum6g0` Taming the Tempest | 45 | The Howling Eye (Hard); loot reference has Garuda and razor plume actors. |
| `Sum6w0` The Raven, Nevermore | 45 | Rivenroad (Hard); DAT text has 30-minute battle and retry-timer text, and `InstanceRaidGuide.lua` has commented `askEnterInstanceRaid(16)` logic. |
| `Man308` Lord Errant | 38 | Battle target evidence only; loot reference has tempered captive actors for Paglth'an / Lord Errant. |
| `Man406` Futures Perfect | 46 | Battle target evidence only; loot reference has imperial juggernaut `2202401` for Futures Perfect. |
| `Etc106` A Relic Reborn | 50 | Relic chain; patch/dungeon notes tie it to Aurum Vale, Cutter's Cry, and Bowl of Embers Extreme conditions. |

## Missing Script Buckets

### Main Scenario Scaffold/Partial

| Quest | Level |
| --- | ---: |
| `Man304` Forever Taken | 34 |
| `Man308` Lord Errant | 38 |
| `Man402` Of Men They Sing | 42 |
| `Man406` Futures Perfect | 46 |

These scripts exist as scaffolds; full retail sequencing, objectives, and rewards remain absent.

### Class/Guild Missing

Class/guild coverage is now 35 / 69. Level 30 is mostly present except `Acn300`; level 36 is mostly present except `Acn306`; level 40 is missing except `Cul400`; level 50 tails remain mostly missing.

| Level | Missing class/guild suffixes |
| ---: | --- |
| 30 | `Acn300` |
| 36 | `Acn306` |
| 40 | `Pgl400`, `Gla400`, `Exc400`, `Arc400`, `Lnc400`, `Thm400`, `Cnj400`, `Acn400`, `Wdk400`, `Bsm400`, `Gld400`, `Tan400`, `Wvr400`, `Alc400`, `Min400`, `Hrv400`, `Fsh400`; `Cul400` is present but `noOffer=true` |
| 50 | `*500` for `Exc`, `Arc`, `Lnc`, `Cnj`, `Acn`, `Wdk`, `Bsm`, `Gld`, `Tan`, `Wvr`, `Alc`, `Cul`, `Min`, `Hrv`, `Fsh` |

### Side, Special, Relic, and Tutorial Present But Partial

| Quest | Level | Category |
| --- | ---: | --- |
| `Etc2g4` To Deskunk A Beer | 31 | Side |
| `Etc1u7` Clasping to Hope | 34 | Side |
| `Etc1u8` Traumaturgy | 36 | Side |
| `Etc2i2` Blood Price | 45 | Side |
| `Etc200` A Light in the Dark | 45 | Dungeon/side |
| `Etc201` What Glitters Always Isn't Gold | 45 | Dungeon/side |
| `Etc304` Living on a Prayer | 45 | Side |
| `Etc2l5` Carving a Name | 47 | Side |
| `Etc106` A Relic Reborn | 50 | Relic |
| `Sum6a0` Ifrit Bleeds, We Can Kill It | 45 | Primal/special |
| `Sum6m0` A Feast of Fools | 45 | Primal/special |
| `Sum6g0` Taming the Tempest | 45 | Primal/special |
| `Sum6w0` The Raven, Nevermore | 45 | Primal/special |
| `Trl0l3` Selecting a Different Path Companion | 50 | Tutorial |

Every row in this table now has a local script. Keep it as a present-but-partial list: side rows still need objective validation, `Etc200/201/304` need visibility guards, `Etc106` is guarded/partial, `Sum6*` rows are disabled primal scaffolds, and `Trl0l3` is no-offer.

## Target and Marker Coverage

The level 30-50 scripted rows reference 25 unique BNPC actor IDs. At least `2104508` and `2100503` now have active mob type plus spawn rows. The remaining unresolved actor IDs still need mob type/spawn or private-content spawning data before kill/objective scripts can be trusted.

DAT marker data is better than script coverage: 101 / 143 rows have `quest_marker.csv` rows. That means many missing scripts have enough client-side map marker data to reconstruct the UI pass once the quest flow and actor/objective IDs are mapped.

## Highest Priority Gaps

1. Main scenario after level 30 exists as scaffold scripts, but `Man304`, `Man308`, `Man402`, and `Man406` still need full retail sequencing, objectives, and reward/completion validation.
2. Class/guild progression is partly scaffolded at 35 / 69 scripts; level 40/50 tails remain the major missing set, and job quest wrappers remain hidden/mutation-risky scaffolds.
3. GC rows need to graduate from the shared template to real content. The wrappers exist, but the toggle is off by default and the instance/NM fights are placeholders with missing BNPC actor rows.
4. Existing sidequest scripts need a small correctness sweep before content expansion: fix `npc.GetActorClassId()` dot calls, add missing BNPC mob type/spawn rows, and verify completion paths.
5. Primal, relic, and Raven-era special quests exist as disabled/scaffold/guarded scripts, but they are not retail-complete and do not launch trials/raids.

## 2026-06-21 Current Visibility Correction

- Some older "missing" wording above is stale. Job quest wrappers, Sum6 scaffold wrappers, dense `300/306` class-template shims, and handwritten `Etc200`, `Etc201`, and `Etc304` now exist locally.
- Normal visibility is mostly hidden by gates: job, special, seasonal, primal, tutorial, and class scaffolds are gated or no-offer where expected.
- The visible risk candidates are `Etc200`, `Etc201`, and `Etc304`: SQL-visible level-45 special rows with no script-level special-event guard. `Etc304` is the widest surface because it has Louisoix talk plus prayer object push/emote paths.
- `Cul400` is locally present but `noOffer=true`. `Bsm400`, `Exc400`, and `Fsh400` remain recovered-only/no local loader.
- GM/debug `player:AddQuest` can force disabled rows into the journal regardless of config; that is not normal visibility, but it matters for test shards.
