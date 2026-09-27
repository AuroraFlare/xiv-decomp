# Level 30 and 40 regional battle guildleve video evidence

Later placement work: [2026-09-09 sampled video review and individual layouts](guildleve_individual_placements_2026-09-09.md). The counts and conclusions below describe the original September 7 pass.

Research date: 2026-09-07. Scope: the **102 ordinary regional battle leves** at level 30 (48) and level 40 (54). This inventory does not audit faction, gathering, local crafting, or Grand Company leves.

The bounded YouTube search found **135 title-matched candidate URLs covering 71 leve titles**: 40/48 level-30 titles and 31/54 level-40 titles. These are discovery results, not 71 independently watched or verified playthroughs. Twelve titles have sampled visual evidence described below. The other candidates are explicitly **metadata only**. A blank result means no matching candidate was found in this search, not that no recording exists.

## Method and preserved evidence

- Searched the official English titles parsed from `docs/elemen-regional-guildleves/battlecraft-*.md`, not the publisher's sometimes outdated labels. Each query was `Final Fantasy XIV "<title>" before:2013`, with the first five YouTube results retained. Initial general web searches were poor at discovering these low-view recordings, whereas direct YouTube metadata search found many original captures.
- Retained normalized title matches plus recognizable FFXIV context (FFXIV/XIV in title or the dedicated `LeveQuests` channel). Excluded unrelated FFXI BCNM clips and modern namesakes. Manually retained `12508` because its uploader uses “All Nine Ivies **in** a Stage.”
- Original search metadata is in `outputs/guildleve-level-30-40-video-20260907/search-<id>.json`; curated tables are `curated-video-map.json` and `curated-video-map.csv`. Metadata records include title, URL, channel, description snippet, and duration. Not every candidate's upload date was separately resolved.
- Browser playback was visually inspected for the named timestamp claims below. Public YouTube storyboard images were also decoded into local timestamped contact sheets (`<video-id>.contact-*.jpg`). Storyboard sampling is not a full continuous watch; its approximate timestamps come from YouTube's storyboard interval metadata.
- Full-video retrieval repeatedly returned HTTP 403, while browser playback and a subset of public storyboards worked. No successful full-video download is claimed. The retained `.info.json` files are metadata. The incomplete `.part` download was discarded; failures are retained in download logs.
- No preserved level-30/40 visual analysis was found in the guildleve docs at the start. `PopulaceGuildlevePublisher.lua` already contained the `13028` video URL; other publisher video comments concerned rank-20 leves.

## Visual findings and implementation limits

| Leve | Source and inspected times | Observed behavior | Confidence / limit |
| --- | --- | --- | --- |
| `13028` Necrologos: The Moons’ Mistress | [ChocoFeru](https://www.youtube.com/watch?v=jS-oK5Pm1aI), browser 0:02 and 8:10; contact sheets across the run | Initial wolves; objective is Torn Necrologos Page 0/5. At 8:10 the page counter is 5/5, two Downcast Hippocerfs have appeared, and living Skulking Wolves remain. The last-page notification and summoned foes are simultaneously visible. | High for immediate summon and two finishers. This is early footage: the current client DAT/SQL requires **4** pages. Retain the current DAT threshold and document the old 5-page variant. At least three wolves are visible early in this duo run; that does not establish the current solo pack size. |
| `10845` Escape Artist | [LeveQuests, 2010-11-01](https://www.youtube.com/watch?v=s1mJyr77OUw), browser 0:54, 1:48, 2:36 | At 0:54 two Fire Elementals are visible, with Darkwing Devilet 0/2 in the objective. Later the combat log and visible enemies establish a Darkwing Devilet plus Fire Elemental fight. | High for the **2010** elemental-disguise variant. The later English commission's Ocean Roseling wording conflicts; current DAT and late archival evidence must decide the shipped variant. |
| `10846` Necrologos: Lords of Skyey Realms | [LeveQuests, 2010-11-03](https://www.youtube.com/watch?v=zICuScHpoO8), browser 1:28 and 2:04 | At 1:28 two yellow-leve-flagged **Downcast Hippocerfs** are visible. The old Charred Necrologos Page counter is 3/3. At 2:04 the combat log records both defeats and completion beside the reward current. | High for the specific Hippocerf variant and two final foes. Use current DAT for the page threshold. A nearby Fat Dodo lacks a leve flag and is not evidence for an added encounter target. |
| `11685` Secret of the Sewers | [Bracsith, 2011-01-22](https://www.youtube.com/watch?v=eAYoa5_Z4qY), browser 1:20 and 2:31 | Two Longclaw Galagos are visible at 1:20. At 2:31 the chat records the galago group's defeat while a Darkwing Devilet and Fire Elemental are visible. Objective rows are Darkwing Devilet 0/2 and Fire Elemental 0/2. Uploader description independently lists those objectives. | High for disguise family, reveal families and counts. Does not establish every random real/decoy selection or exact spawn placement. |
| `11424` Spooring Spores | [LeveQuests, 2010-11-03](https://www.youtube.com/watch?v=6EG8lYbXJ3c), browser 1:15, 2:30, 3:20 | At 1:15 the Lowland Nannygoat objective is **2/6** and the flee notification appears. At 2:30 a second flee follows the fifth nannygoat defeat. At 3:20 the HUD shows Nannygoat 6/6 and Billygoat 2/3, and three leve-flagged Lowland Billygoat names are visible. | High for two pursuit transitions (after 2 and 5 nannygoat defeats), six nannygoats total and three final billygoats. Source-grounded XYZ paths still need separate placement captures. |
| `10847` Necrologos: Elemental Thralldom | [LeveQuests, 2010-10-29](https://www.youtube.com/watch?v=fnvaVjlvJOI), contact sheets ~10-second intervals and browser 1:35 | Ground lights are searched. At 1:35 the target and combat log explicitly identify **Fire Bomb**, the unexpected-monster message is visible, and both page counters show 1/3. Earth Elementals appear around 2:00; Wind Elementals later around 2:57–3:37; reward around 3:47. | High for ground-search interaction, bomb traps and separate elemental summons. A nearby Fat Dodo initially looked like the trap in small storyboard frames; full-size inspection identifies it as a bystander, not evidence for changing the archived bomb roster. This run does not justify hard-coding which page family is found first. |
| `10926` Necrologos: The Abased | [predziak, 2011-01-18](https://www.youtube.com/watch?v=PunyUxwqD_4), contact sheets ~25-second intervals | Ground-light search, slug combat, two large peistes, a later return to light searching, and Brutal Karakul Ewes late in the run are visible. | Medium; visual sequencing supports multiple page objectives and separate summons. Small storyboard text is insufficient to claim exact page thresholds or random odds. |
| `11706` Necrologos: All Things Must Die | [himesworld, 2011-07-03](https://www.youtube.com/watch?v=nZU1u8lW9OU), contact sheets ~25-second intervals | Ground lights and repeated inspection/combat are visible, with later summoned-enemy combat rather than a plain kill quota. | Medium for search/combat structure. Enemy identities, exact thresholds and point-selection probabilities remain archival/DAT-backed. |
| `10906` Keeping the Peace | [PliktSaga, 2011-06-09](https://www.youtube.com/watch?v=jx7jV8pzHEQ), storyboard and browser 2:27, 4:02 | At 2:27 **Dirty Mongrel** has the yellow leve flag. The player is KO’d, Defense Duration is **07:34**, and a destination-leaving notification appears while the Return menu is open. At 4:02 the player again has 0 HP and Defense Duration is **02:01**. | High for encounter-enemy identity and KO under enemy pressure. This old recording has a longer defense phase than the later five-minute archive. Leaving produces feedback but these frames do not show immediate failure. The title “Failure” is not evidence of a fail-on-leaving rule. |
| `10907` Dropping Like Flies | [himesworld, 2011-05-01](https://www.youtube.com/watch?v=RIGHwfb_PlY), contact sheets ~10-second intervals | Slug waves are followed by a large Gigantoad around 3:48–4:18; a reward/current scene appears around 4:38. | High for the distinct final enemy before reward; five-minute timer length remains archival because this clip's edited/accelerated duration cannot measure retail elapsed time. |
| `10903` Slippery Skins | [tragicnate, 2010-12-07](https://www.youtube.com/watch?v=Qezx9vifNFo), contact sheets ~25-second intervals | Multiple peiste engagements precede the reward current. | Medium for target family and completion. Frames do **not** support a quantified item drop percentage or yield distribution. |
| `12508` All Nine Ivies is a Stage | [tragicnate, 2010-12-06](https://www.youtube.com/watch?v=l69QrgoHBpk), contact sheets ~25-second intervals | A fixed search/defense area and repeated monster waves appear throughout the run. | Medium for general defense structure. Does not establish a fail-on-leaving radius or exact timer. |

Video evidence and current DAT can describe different patches. In particular, preserve current-client IDs, objective slots and counts when an early-2010 video contradicts the later client unless there is additional evidence that the client data is wrong. No XYZ placement or exact random/drop percentage was recovered from the clips in this research pass.

## Complete title-to-video inventory

“Sampled” means only the visual evidence above was inspected; the additional URLs on the same row can still be metadata-only. All remaining nonempty rows are metadata-only candidates. Links open the original recording.

### Cedarwood — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `10841` | Where the Goat Goes | [8XGHCN8BPnU](https://www.youtube.com/watch?v=8XGHCN8BPnU) | Metadata only |
| `10842` | Yarz on Me | [lXko2VDmapg](https://www.youtube.com/watch?v=lXko2VDmapg) | Metadata only |
| `10843` | Where's the Meat | [JRJSpLOL5F0](https://www.youtube.com/watch?v=JRJSpLOL5F0), [6OYaWWx8_Jk](https://www.youtube.com/watch?v=6OYaWWx8_Jk), [Fml9JEHPsKI](https://www.youtube.com/watch?v=Fml9JEHPsKI) | Metadata only |
| `10844` | Bombs Away | No matching candidate found | Not inspected |
| `10845` | Escape Artist | [s1mJyr77OUw](https://www.youtube.com/watch?v=s1mJyr77OUw) | Sampled; see findings |
| `10846` | Necrologos: Lords of Skyey Realms | [DlcZDbs2GNM](https://www.youtube.com/watch?v=DlcZDbs2GNM), [zICuScHpoO8](https://www.youtube.com/watch?v=zICuScHpoO8), [xiNkRRp7ga4](https://www.youtube.com/watch?v=xiNkRRp7ga4), [1vjmutUy70M](https://www.youtube.com/watch?v=1vjmutUy70M) | Sampled; see findings |
| `10847` | Necrologos: Elemental Thralldom | [Ayit1xKjpQM](https://www.youtube.com/watch?v=Ayit1xKjpQM), [NtN0GvxwqHE](https://www.youtube.com/watch?v=NtN0GvxwqHE), [fnvaVjlvJOI](https://www.youtube.com/watch?v=fnvaVjlvJOI) | Sampled; see findings |
| `10848` | Necrologos: Lightsome Verdure | [4wKNXtapzLs](https://www.youtube.com/watch?v=4wKNXtapzLs) | Metadata only |

### Cassiopeia Hollow — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `11421` | Protecting the Pilgrims | No matching candidate found | Not inspected |
| `11422` | Awful Offal | No matching candidate found | Not inspected |
| `11423` | Orbs for the Ossuary | [gRO_mapF_WI](https://www.youtube.com/watch?v=gRO_mapF_WI), [5F5kUKg6eqM](https://www.youtube.com/watch?v=5F5kUKg6eqM), [x75znNy3TZQ](https://www.youtube.com/watch?v=x75znNy3TZQ), [IZnn7oLM_5Y](https://www.youtube.com/watch?v=IZnn7oLM_5Y) | Metadata only |
| `11424` | Spooring Spores | [6EG8lYbXJ3c](https://www.youtube.com/watch?v=6EG8lYbXJ3c) | Sampled; see findings |
| `11425` | Crabs in a Barrel | No matching candidate found | Not inspected |
| `11426` | Escape from Cell D72 | No matching candidate found | Not inspected |
| `11427` | Necrologos: The Boughs Above | [IKO1-FJsfoA](https://www.youtube.com/watch?v=IKO1-FJsfoA), [beb8xaWKVew](https://www.youtube.com/watch?v=beb8xaWKVew), [XB0xKIBdbUM](https://www.youtube.com/watch?v=XB0xKIBdbUM), [BZ_L1yUOarI](https://www.youtube.com/watch?v=BZ_L1yUOarI) | Metadata only |
| `11428` | Necrologos: Inferno | [K0jGardO4Pg](https://www.youtube.com/watch?v=K0jGardO4Pg), [zwHvxoVImdM](https://www.youtube.com/watch?v=zwHvxoVImdM), [v-QaSmteW6w](https://www.youtube.com/watch?v=v-QaSmteW6w) | Metadata only |

### Nophica’s Wells — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `11681` | Securing Nophica's Wells | [pk4POCDQ9QE](https://www.youtube.com/watch?v=pk4POCDQ9QE), [-mQNQ3gHVrg](https://www.youtube.com/watch?v=-mQNQ3gHVrg), [taxCByhCgYg](https://www.youtube.com/watch?v=taxCByhCgYg), [yZMQXoSsf-Q](https://www.youtube.com/watch?v=yZMQXoSsf-Q) | Metadata only |
| `11682` | A Drop in the Pond | No matching candidate found | Not inspected |
| `11683` | Volatile Vitals | [SkLFHDUILUk](https://www.youtube.com/watch?v=SkLFHDUILUk), [U-GTzbTXWAA](https://www.youtube.com/watch?v=U-GTzbTXWAA) | Metadata only |
| `11684` | Dodos and Popotoes | [yBX6_iB4h38](https://www.youtube.com/watch?v=yBX6_iB4h38), [N0kDFOsNFBg](https://www.youtube.com/watch?v=N0kDFOsNFBg) | Metadata only |
| `11685` | Secret of the Sewers | [eAYoa5_Z4qY](https://www.youtube.com/watch?v=eAYoa5_Z4qY) | Sampled; see findings |
| `11686` | Necrologos: The Light's Corrivals | [aTNHkq8piPU](https://www.youtube.com/watch?v=aTNHkq8piPU) | Metadata only |
| `11687` | Necrologos: Amongst Leaves Most Green | [Uzm6rdLauwo](https://www.youtube.com/watch?v=Uzm6rdLauwo), [z4txqwKl04I](https://www.youtube.com/watch?v=z4txqwKl04I), [pvlFv2E4Nkc](https://www.youtube.com/watch?v=pvlFv2E4Nkc), [nCAc_3su4PU](https://www.youtube.com/watch?v=nCAc_3su4PU) | Metadata only |
| `11688` | Necrologos: Levinshower | [k6X35bMsl-w](https://www.youtube.com/watch?v=k6X35bMsl-w), [bBphnoId-uM](https://www.youtube.com/watch?v=bBphnoId-uM), [6eLjs586wD0](https://www.youtube.com/watch?v=6eLjs586wD0) | Metadata only |

### Nanawa Mines — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `12221` | Overtime in the Mines | [1WXPFuT2y1U](https://www.youtube.com/watch?v=1WXPFuT2y1U), [kvQAC4aGoOg](https://www.youtube.com/watch?v=kvQAC4aGoOg) | Metadata only |
| `12222` | Tuning In | [BvVmqIOGmyw](https://www.youtube.com/watch?v=BvVmqIOGmyw), [wEjXDD4qxHQ](https://www.youtube.com/watch?v=wEjXDD4qxHQ) | Metadata only |
| `12223` | The Potter's Price | No matching candidate found | Not inspected |
| `12224` | Spirited Below | [3YGdq-QUTRA](https://www.youtube.com/watch?v=3YGdq-QUTRA), [KPgNENwjH1I](https://www.youtube.com/watch?v=KPgNENwjH1I) | Metadata only |
| `12225` | Antling Invasion | [5Y5vpFAgtlE](https://www.youtube.com/watch?v=5Y5vpFAgtlE), [UtKYygWMOpI](https://www.youtube.com/watch?v=UtKYygWMOpI) | Metadata only |
| `12226` | Corpus Adamance | [2zN4aBKWY54](https://www.youtube.com/watch?v=2zN4aBKWY54) | Metadata only |
| `12227` | Necrologos: Torn Asunder | [tiIcnvMnsV0](https://www.youtube.com/watch?v=tiIcnvMnsV0), [_oTz6kiomGs](https://www.youtube.com/watch?v=_oTz6kiomGs), [C_PvU-lV7tc](https://www.youtube.com/watch?v=C_PvU-lV7tc), [UZkp32Zjo0E](https://www.youtube.com/watch?v=UZkp32Zjo0E) | Metadata only |
| `12228` | Necrologos: Adamantine Wills | [sa0YzgenZ4A](https://www.youtube.com/watch?v=sa0YzgenZ4A), [s3Js_DVxquA](https://www.youtube.com/watch?v=s3Js_DVxquA), [z1-UjxLzWeQ](https://www.youtube.com/watch?v=z1-UjxLzWeQ), [AYHJnxJDxQ0](https://www.youtube.com/watch?v=AYHJnxJDxQ0), [EGx91pQ-DQU](https://www.youtube.com/watch?v=EGx91pQ-DQU) | Metadata only |

### Humblehearth — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `12481` | Reforesting Humblehearth | No matching candidate found | Not inspected |
| `12482` | From the Sea to the Trees | [6fQPlS9TY28](https://www.youtube.com/watch?v=6fQPlS9TY28) | Metadata only |
| `12483` | The Goodwill Traders | [IhWGPkB3HSA](https://www.youtube.com/watch?v=IhWGPkB3HSA) | Metadata only |
| `12484` | The Root of the Problem | [5Am1nCidO_A](https://www.youtube.com/watch?v=5Am1nCidO_A), [j9Mqj-xOEdE](https://www.youtube.com/watch?v=j9Mqj-xOEdE), [n4ZMq4ExvuA](https://www.youtube.com/watch?v=n4ZMq4ExvuA) | Metadata only |
| `12485` | Underneath the Shell | [MR84kjpiYZQ](https://www.youtube.com/watch?v=MR84kjpiYZQ) | Metadata only |
| `12486` | Necrologos: In Shadow Bemantled | [dfoyWXX-o_I](https://www.youtube.com/watch?v=dfoyWXX-o_I), [uFi8VYTSryI](https://www.youtube.com/watch?v=uFi8VYTSryI) | Metadata only |
| `12487` | Necrologos: Celeritous Impetus | [QHqJlM4JT5U](https://www.youtube.com/watch?v=QHqJlM4JT5U), [TuU0KqB_yn0](https://www.youtube.com/watch?v=TuU0KqB_yn0), [o5-Q4WOhf-w](https://www.youtube.com/watch?v=o5-Q4WOhf-w), [6ka45c7BcTs](https://www.youtube.com/watch?v=6ka45c7BcTs) | Metadata only |
| `12488` | Necrologos: Thousandfold Agony | [2VvaGYjaZr0](https://www.youtube.com/watch?v=2VvaGYjaZr0), [CCYfy6fCNwQ](https://www.youtube.com/watch?v=CCYfy6fCNwQ) | Metadata only |

### Mun-Tuy Cellars — level 30

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `13021` | Wizening Up | [xlqgp60y1RQ](https://www.youtube.com/watch?v=xlqgp60y1RQ), [M6g6w52TtvI](https://www.youtube.com/watch?v=M6g6w52TtvI) | Metadata only |
| `13022` | Undercutting the Competition | [wTU4J1gz8ao](https://www.youtube.com/watch?v=wTU4J1gz8ao) | Metadata only |
| `13023` | Orbs for the Ceremony | [T7yrq4rw6mo](https://www.youtube.com/watch?v=T7yrq4rw6mo), [obTQAE7iSnE](https://www.youtube.com/watch?v=obTQAE7iSnE), [SEPWw_1iWWk](https://www.youtube.com/watch?v=SEPWw_1iWWk), [efiWkmP1_QE](https://www.youtube.com/watch?v=efiWkmP1_QE), [ypihgAU88nM](https://www.youtube.com/watch?v=ypihgAU88nM) | Metadata only |
| `13024` | Tracking the Pack | [yck2U_I879c](https://www.youtube.com/watch?v=yck2U_I879c), [vbObYvfAk9A](https://www.youtube.com/watch?v=vbObYvfAk9A), [6FsqwNakco0](https://www.youtube.com/watch?v=6FsqwNakco0) | Metadata only |
| `13025` | Crabs in the Cellar | [5GRs7m9QNno](https://www.youtube.com/watch?v=5GRs7m9QNno) | Metadata only |
| `13026` | My Fey Lady | [zoCVB3CL40Q](https://www.youtube.com/watch?v=zoCVB3CL40Q) | Metadata only |
| `13027` | Necrologos: The Ever-reaching Claw | [R7w5XTqNwIo](https://www.youtube.com/watch?v=R7w5XTqNwIo), [Tx0N_AhHZF4](https://www.youtube.com/watch?v=Tx0N_AhHZF4) | Metadata only |
| `13028` | Necrologos: The Moons' Mistress | [m-WGQ8KrGEg](https://www.youtube.com/watch?v=m-WGQ8KrGEg), [jS-oK5Pm1aI](https://www.youtube.com/watch?v=jS-oK5Pm1aI), [U9J02GyPkXM](https://www.youtube.com/watch?v=U9J02GyPkXM), [X8fis5mGueQ](https://www.youtube.com/watch?v=X8fis5mGueQ), [Img3a-T0Sb8](https://www.youtube.com/watch?v=Img3a-T0Sb8) | Sampled; see findings |

### Bald Knoll — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `10901` | Annexing the Knoll | [VrDwwHpElnc](https://www.youtube.com/watch?v=VrDwwHpElnc) | Metadata only |
| `10902` | Fearsome Foliage | No matching candidate found | Not inspected |
| `10903` | Slippery Skins | [Tiw2IA_so1U](https://www.youtube.com/watch?v=Tiw2IA_so1U), [Qezx9vifNFo](https://www.youtube.com/watch?v=Qezx9vifNFo) | Sampled; see findings |
| `10904` | Wyrston's Herd | No matching candidate found | Not inspected |
| `10905` | Escape from Cell E05 | [Fd3hr3kYrUM](https://www.youtube.com/watch?v=Fd3hr3kYrUM) | Metadata only |
| `10906` | Keeping the Peace | [jx7jV8pzHEQ](https://www.youtube.com/watch?v=jx7jV8pzHEQ) | Sampled; see findings |
| `10907` | Dropping Like Flies | [RIGHwfb_PlY](https://www.youtube.com/watch?v=RIGHwfb_PlY) | Sampled; see findings |
| `10908` | On the Beating Path | No matching candidate found | Not inspected |
| `10909` | Off With Their Heads | [eJBlf5LGIE4](https://www.youtube.com/watch?v=eJBlf5LGIE4), [ArPhL9h85j0](https://www.youtube.com/watch?v=ArPhL9h85j0) | Metadata only |

### Iron Lake — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `10921` | Soft Targets | No matching candidate found | Not inspected |
| `10922` | Annexing the Lake | No matching candidate found | Not inspected |
| `10923` | Meating Demand | [Eu5b74zdTS4](https://www.youtube.com/watch?v=Eu5b74zdTS4) | Metadata only |
| `10924` | Mutton over Mongrels | No matching candidate found | Not inspected |
| `10925` | Unholy Moley | [5UJnFzvIUCM](https://www.youtube.com/watch?v=5UJnFzvIUCM) | Metadata only |
| `10926` | Necrologos: The Abased | [PunyUxwqD_4](https://www.youtube.com/watch?v=PunyUxwqD_4) | Sampled; see findings |
| `10927` | Sharing the Load | No matching candidate found | Not inspected |
| `10928` | Cliff Haranguers | [ci3K6LtrPW0](https://www.youtube.com/watch?v=ci3K6LtrPW0) | Metadata only |
| `10929` | Great Hoary Toads | [LuYN1rsxadw](https://www.youtube.com/watch?v=LuYN1rsxadw), [9uzD5Q8pEpE](https://www.youtube.com/watch?v=9uzD5Q8pEpE) | Metadata only |

### Halatali — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `11701` | Desert Defilement | [hkh3UoC2jYw](https://www.youtube.com/watch?v=hkh3UoC2jYw) | Metadata only |
| `11702` | Cat Eat Dog | No matching candidate found | Not inspected |
| `11703` | Juggling Knives | [ZijDCexwy-I](https://www.youtube.com/watch?v=ZijDCexwy-I) | Metadata only |
| `11704` | Stalking the Stalkers | No matching candidate found | Not inspected |
| `11705` | Secrets of the Sultanate | [D0W8QKsEMAo](https://www.youtube.com/watch?v=D0W8QKsEMAo) | Metadata only |
| `11706` | Necrologos: All Things Must Die | [nZU1u8lW9OU](https://www.youtube.com/watch?v=nZU1u8lW9OU) | Sampled; see findings |
| `11707` | Bigger Fish to Fry | [3u24XBHk16A](https://www.youtube.com/watch?v=3u24XBHk16A) | Metadata only |
| `11708` | Restless be the Damned | No matching candidate found | Not inspected |
| `11709` | Preventing the Plague | [F955Hk0U76Y](https://www.youtube.com/watch?v=F955Hk0U76Y) | Metadata only |

### Broken Water — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `11721` | A Terrible Thirst | [UCn680-JfSI](https://www.youtube.com/watch?v=UCn680-JfSI) | Metadata only |
| `11722` | Hiding Under the Beds | [dMtqrKOZYss](https://www.youtube.com/watch?v=dMtqrKOZYss) | Metadata only |
| `11723` | All Cracked Up | [sbE-pdQGk_c](https://www.youtube.com/watch?v=sbE-pdQGk_c) | Metadata only |
| `11724` | Netting the Gnats | [c9fdXHCQozk](https://www.youtube.com/watch?v=c9fdXHCQozk) | Metadata only |
| `11725` | A Devilet's Best Friend | [Cn9X6JHTk_0](https://www.youtube.com/watch?v=Cn9X6JHTk_0) | Metadata only |
| `11726` | Necrologos: Ranine Reveries | No matching candidate found | Not inspected |
| `11727` | Whipping the Curs | [BKA485dFTcw](https://www.youtube.com/watch?v=BKA485dFTcw) | Metadata only |
| `11728` | Thwack Ye Mole | [OPruQYs4DNg](https://www.youtube.com/watch?v=OPruQYs4DNg) | Metadata only |
| `11729` | Dunesfolk for Dinner | [eKbREpsGN-s](https://www.youtube.com/watch?v=eKbREpsGN-s), [pNKuxqV8HRE](https://www.youtube.com/watch?v=pNKuxqV8HRE), [YyBYHg9h2AM](https://www.youtube.com/watch?v=YyBYHg9h2AM), [2ob1Kr1SSUg](https://www.youtube.com/watch?v=2ob1Kr1SSUg) | Metadata only |

### Nine Ivies — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `12501` | Reforesting Nine Ivies | [RnnlbSrRFiw](https://www.youtube.com/watch?v=RnnlbSrRFiw), [NFuqp39a6wQ](https://www.youtube.com/watch?v=NFuqp39a6wQ), [rrWETvIQxnk](https://www.youtube.com/watch?v=rrWETvIQxnk) | Metadata only |
| `12502` | The All-seeing Eyes | No matching candidate found | Not inspected |
| `12503` | Tickling Whiskers | No matching candidate found | Not inspected |
| `12504` | Efts from Afar | [7pMRSCLIsHk](https://www.youtube.com/watch?v=7pMRSCLIsHk) | Metadata only |
| `12505` | What the Devilet Dons | No matching candidate found | Not inspected |
| `12506` | Necrologos: The Fallen | [z1bfou1fbmo](https://www.youtube.com/watch?v=z1bfou1fbmo) | Metadata only |
| `12507` | Fire Fighting | No matching candidate found | Not inspected |
| `12508` | All Nine Ivies is a Stage | [l69QrgoHBpk](https://www.youtube.com/watch?v=l69QrgoHBpk) | Sampled; see findings |
| `12509` | Slugging it Out | No matching candidate found | Not inspected |

### Treespeak — level 40

| ID | Title | Candidate videos | Inspection |
| --- | --- | --- | --- |
| `12521` | A Toad's Taste | No matching candidate found | Not inspected |
| `12522` | Stealing Apples from a Lemur | [slSMf0Z_Gi0](https://www.youtube.com/watch?v=slSMf0Z_Gi0) | Metadata only |
| `12523` | Blacksand in Hand | No matching candidate found | Not inspected |
| `12524` | Do Toads Dream | No matching candidate found | Not inspected |
| `12525` | Out of its Shell | No matching candidate found | Not inspected |
| `12526` | Necrologos: Rockbound Mists | [6PYcrTxxbd0](https://www.youtube.com/watch?v=6PYcrTxxbd0), [aBrNQK0OHNU](https://www.youtube.com/watch?v=aBrNQK0OHNU) | Metadata only |
| `12527` | All Treespeak is a Stage | No matching candidate found | Not inspected |
| `12528` | Sweet Revenge | No matching candidate found | Not inspected |
| `12529` | Open Season | No matching candidate found | Not inspected |
