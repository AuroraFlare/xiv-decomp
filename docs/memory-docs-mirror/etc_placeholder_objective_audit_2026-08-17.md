# Etc `???` objective-trigger audit

## Finding

`4000257` is the client display-name row for `???`; it is not an actor class.
Nineteen `Etc` scripts had copied that display-name ID into `SetENpc` and
`onPush` actor checks, so no server actor could ever satisfy the objective.

The quest-marker X/Z values are world coordinates with the same signs. They
must not be X-negated. A direct control is marker `11211001` at
`(243.858, -1030.137)`, which matches Mutamix's populated world position
`(243.988, -1030.140)`.

## Objective triggers fixed

| Quest | Marker points | Trigger actors | Result |
| --- | --- | --- | --- |
| `110654` / `Etc1g0` / Proceed with Caution | `11065401`-`03` | `1090193`-`1090195` | Three distinct targetable `???` Watchers; each is click-only with a map/minimap marker but no floating world badge, and its unique completion flag is the authoritative count. |
| `110655` / `Etc1g1` / Playing with Fire | `11065501`-`03` | `1090196`-`1090198` | Three distinct hearths; each can count once, and the journal map refreshes to the ordered remaining hearths after every interaction. |
| `110642` / `Etc1l9` / Seashells by the Seashore | `11064202` | `1090199` | Manually verified Bloodshore conch-shell trigger; quest enabled for testing. |
| `110668` / `Etc2g4` / To Deskunk a Beer | `11066803` | `1090215` | Manually verified Central Shroud sourleaf trigger; quest enabled for testing. |
| `110648` / `Etc2l5` / Carving a Name | `11064803` | `1090216` | Manually verified Iron Lake strongbox trigger; simplified quest flow enabled for testing. |
| `110682` / `Etc1u7` / Clasping to Hope | `11068201` | `1090217` | Manually verified Halatali clasp trigger; simplified quest flow enabled for testing. |
| `110683` / `Etc1u8` / Traumaturgy | `11068301` | `1090218` | Manually verified northeast Halatali ring trigger; simplified quest flow enabled for testing. |
| `110667` / `Etc2g3` / Hunting the Hunters | `11066702` | `1090219` | Manually verified Ixal objective near Quarrymill; simplified quest flow enabled for testing. |
| `110669` / `Etc2g5` / Losing One's Thread | `11066901` | `1090220` | Manually verified stolen needle-box objective east of Camp Tranquil; simplified quest flow enabled for testing. |
| `110644` / `Etc2l1` / Moonstruck | `11064401` | `1090221` | Manually verified road objective toward Bloodshore; simplified quest flow enabled for testing. |
| `110685` / `Etc2u0` / The Unheard Horizon | `11068502` | `1090222` | Manually verified beast objective near Camp Horizon; simplified quest flow enabled for testing. |
| `110690` / `Etc2u5` / No Other Dodo Will Do | `11069002` | `1090223` | Manually verified young-dodo objective north of Camp Drybone; simplified quest flow enabled for testing. |
| `110735` / `Etc3g1` / Scrubbing the Soul | none (content-owned) | `1001581` / Yayatu | Manually verified scarred-tree/Garlean encounter south of Camp Bentbranch; simplified encounter handoff enabled for testing. Yayatu's talk condition is enabled only for the sequence-2 objective. |
| `110736` / `Etc3g2` / Disorganized Crime | none (content-owned) | `1090225`-`1090226` | Manually verified distinct Lifemend Stump and Redbelly Wasp den objectives; simplified encounter handoffs enabled for testing. |
| `110744` / `Etc3l1` / Winds of Change | none (content-owned) | `1090227` | Manually verified Garlean cave/depression west of Camp Bearded Rock; simplified encounter handoff enabled for testing. |
| `110745` / `Etc3l2` / Shot Through the Heart | none (content-owned) | `1001634` / Malin | Manually verified beach east of Cassiopeia Hollow; simplified encounter and Echo handoffs enabled for testing. |
| `110726` / `Etc3u1` / Quid Pro Quo | none (content-owned) | `1090224` | Five real delivery recipients plus manually verified airship-wreck objective northwest of Ul'dah; simplified encounter handoff enabled for testing. |
| `110727` / `Etc3u2` / There Might Be Blood | none (content-owned) | `1001718` / Rycharde | Manually verified Rycharde encounter position at Little Ala Mhigo's west entrance; simplified encounter handoff enabled for testing. |
| `110708` / `Etc2i2` / Blood Price | none (content-owned) | `1090228`; Foxe `1001839` | Manually verified Gwyr-Aen objective and Foxe's Owl's Nest placement wired. Quest remains disabled and labeled partially implemented because the retail battle director is absent. |

The marker X/Z positions come directly from `docs/Dat Mining/quest_marker.csv`.
Y comes from checked-in quick-navmesh where coverage exists and the nearest
same-zone retail population anchor otherwise. Push is disabled by default and
armed only by the owning player's quest state.

## Manual position verification

| Quest | Point | Proposed position | Status |
| --- | --- | --- | --- |
| `Etc1g0` | Watcher 1 / `11065401` | `!pos 150 390 5 -532` | Confirmed in game by Drime on 2026-08-21. |
| `Etc1g0` | Watcher 2 / `11065402` | `!pos 150 55 20.5 -709` | Confirmed in game by Drime on 2026-08-21. |
| `Etc1g0` | Watcher 3 / `11065403` | `!pos 150 -193.78 3.6 -995.77` | Confirmed in game by Drime on 2026-08-21. |
| `Etc1g1` | Hearth 1 / `11065501` | `!pos 152 -1538.21 32.1 -1759.28` | Confirmed in game by Drime on 2026-08-21. |
| `Etc1g1` | Hearth 2 / `11065502` | `!pos 150 -448 6.107 -460` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21. |
| `Etc1g1` | Hearth 3 / `11065503` | `!pos 150 -192.83 3.8 -628.22` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `-3.110`. |
| `Etc1l9` | Conch-shell objective / `11064202` | `!pos 130 1267 1 -827` | Confirmed in game by Drime on 2026-08-21. |
| `Etc2g4` | Sourleaf objective / `11066803` | `!pos 150 -568 3.8 -813.84` | Confirmed in game by Drime on 2026-08-21. |
| `Etc2l5` | Strongbox / `11064803` | `!pos 135 576.66 52.1 -1697.24` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `0`. |
| `Etc1u7` | Amalj'aa/clasp objective / `11068201` | `!pos 171 1586.03 256.9 -124.82` | Confirmed in game by Drime on 2026-08-21. |
| `Etc1u8` | Amalj'aa/ring objective / `11068301` | `!pos 171 1778.23 258 -522.88` | Confirmed in game by Drime on 2026-08-21. |
| `Etc2g3` | Ixal objective / `11066702` | `!pos 154 1269.86 -9.4 1094.05` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `0`. |
| `Etc2g5` | Needle-box objective / `11066901` | `!pos 154 1028.88 0.273 1130.86` | Confirmed in game by Drime on 2026-08-21. |
| `Etc2l1` | Road objective / `11064401` | `!pos 130 767 54.6 -1088` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `0`. |
| `Etc2u0` | Beast objective / `11068502` | `!pos 172 -1055 55.86 -129` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `0`. |
| `Etc2u5` | Young-dodo objective / `11069002` | `!pos 171 1181.55 279.9 -768.36` | Corrected and confirmed from an in-game `mypos` capture by Drime on 2026-08-21; rotation `0`. |
| `Etc3g1` | Scarred-tree/Garlean encounter / content-owned | `!pos 150 399.31 4.69 -409.56` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3g2` | Lifemend Stump encounter / content-owned | `!pos 150 -789.14 21.23 -1071.11` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3g2` | Redbelly Wasp den / content-owned | `!pos 154 818.14 -11.44 1443.45` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3l1` | Garlean cave/depression / content-owned | `!pos 128 -156.62 25.6 -92.19` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3l2` | Malin/beach encounter / content-owned | `!pos 130 1599.96 -0.084 -690.87` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3u1` | Airship-wreck encounter / content-owned | `!pos 170 -153.27 185.48 -210.15` | Confirmed in game by Drime on 2026-08-21. |
| `Etc3u2` | Rycharde encounter / content-owned | `!pos 171 1084.54 248.31 123.31` | Confirmed in game by Drime on 2026-08-21; rotation `0`. |
| `Etc2i2` | Gwyr-Aen encounter / content-owned | `!pos 144 654 302 -1404` | Confirmed in game by Drime on 2026-08-21. |

### `Etc2i2` / Blood Price giver verification

| NPC | Position | Verification |
|---|---|---|
| Foxe / actor `1001839` | `!pos 145 2626.51 175 1306.59` | Confirmed in game by Drime on 2026-08-21; X/Z independently recovered from client quest marker `11102102`. |

### `Etc3u1` / Quid Pro Quo recipient verification

| Client event | Resolved recipient | Position | Verification |
|---|---|---|---|
| `processEvent005_K` | Kukusi / actor `1001463` | `!pos 209 -195.01 228.2 293.18` | Confirmed in game by Drime on 2026-08-21. |
| `processEvent005_R` | Rorojaru / actor `1000374` | `!pos 175 28.93 192 109.69` | Confirmed in game by Drime on 2026-08-21. |
| `processEvent005_S` | Singleton / actor `1001445` | `!pos 209 -191.98 194.6 181.33` | Confirmed in game by Drime on 2026-08-21. |
| `processEvent005_A` | Abylgo Hamylgo / actor `1000965` | `!pos 209 -180.83 193.2 206.51` | Confirmed in game by Drime on 2026-08-21; the Coliseum-stand default dialogue independently corroborates the mapping. |
| `processEvent005_N` | Neymumu / actor `1001419` | `!pos 209 -0.31 206.02 303.69` | Confirmed in game by Drime on 2026-08-21. |

## Remaining battle-dependent implementation

All nineteen affected scripts now have quest-specific actors at manually
verified positions. `Etc2i2` / Blood Price remains disabled despite its fixed
Gwyr-Aen trigger and public Foxe actor because the corresponding
SimpleQuestBattle server director is absent.

`Etc3g1`, `Etc3g2`, `Etc3l1`, `Etc3l2`, `Etc3u1`, and `Etc3u2` now use manually verified public placements with
simplified encounter handoffs. Their retail battle directors are still
absent, so the enabled paths deliberately advance through the recovered
dialogue rather than claiming full encounter parity.

Full retail parity still requires the battle directors, encounter lifecycle,
failure/retry behavior, and private content ownership. Blood Price stays
disabled so its current completion-only handoff is not advertised as working
content; the other listed quests are explicitly labeled partially implemented.

## Marker data exceptions

- `Etc2i2` / Blood Price has twenty identical generic rows at `(-431, 187)`
  targeting `1600179` on layout `101/121`. The same filler geometry appears
  under unrelated quests, so it was rejected. The objective instead uses the
  manually confirmed Gwyr-Aen position `(654, 302, -1404)` in zone `144`.
- `Etc3g1`, `Etc3g2`, `Etc3l1`, `Etc3l2`, `Etc3u1`, and `Etc3u2` have no
  quest-specific rows in `quest_marker.csv`. Their placeholder constants must
  be reconstructed from named NPC/content actors and encounter data rather
  than guessed from the marker table.
- `Etc3g1` has now been split into the existing Alaire actor `1000831` for its
  Gridanian interview and the distinct Yayatu actor `1001581` for its later
  encounter. Yayatu now has a manually verified public placement south of
  Camp Bentbranch, and the simplified encounter handoff is enabled for testing.
  Her baseline `talkDefault` is disabled and quest state enables it only during
  sequence 2, preventing an unowned PopulaceStandard talk event before or after
  that objective.
- `Etc3g2` now uses distinct invisible actors `1090225` and `1090226` at the
  manually verified Lifemend Stump and Redbelly Wasp den positions. The
  simplified two-stage encounter handoff is enabled for testing.
- `Etc3l1` now uses invisible actor `1090227` at the manually verified Garlean
  cave/depression west of Camp Bearded Rock. Its post-battle dialogue still
  resolves L'trimmna `1001575`, Lowell `1001576`, and Kopel Yorpel `1001577`
  as content-owned actors, while the simplified encounter handoff is enabled.
- `Etc3l2` now uses the visible Malin actor `1001634` at the manually verified
  beach east of Cassiopeia Hollow. The same quest-gated push actor drives both
  the initial encounter handoff and Malin's follow-up Echo dialogue.
- `Etc2i2` now uses invisible actor `1090228` at the manually verified Gwyr-Aen
  objective. Its confirmed Owl's Nest giver uses the existing retail Foxe actor
  `1001839`, whose name and appearance are distinct from private-scene actor
  `1000111`. The missing retail battle director remains the main enablement
  blocker, and full reward parity still needs verification.
