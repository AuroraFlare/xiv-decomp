# Grand Company client command sheet — 2026-09-18

Commands cover the eighteen requested GC quests, including their story conversations, native cutscenes, battles and dungeon connections. They do not cover unrelated main-scenario quests.

## Before testing

- Install the matching current server DLL, Lua and main SQL first. This sheet does not deploy them; deployment of the finalization build is not verified.
- Use one route at a time. Close dialogue and return to the public map before staging another checkpoint. Enter commands one at a time and wait for each zone load.
- `!questcomplete ID SEQUENCE` stages a quest; despite the name, it does not complete it. It uses the existing force-add path so disabled quests can be tested. Plain `!quest ID SEQUENCE` cannot add a disabled quest.
- Staging changes your character’s journal and can grant real quest rewards through normal play. It does not reset old flags, items, counters or completion history. Prefer a test character for repeat reward tests.
- Sequence 0 starts the first quest conversation on an already-added journal entry. This tests story playback; it does not prove ordinary offer eligibility or acceptance.
- A checkpoint cannot conjure required proof items. For complete story/handoff coverage, start at 0 and follow the route instead of skipping forward.
- Position commands below use current main-SQL NPC coordinates. Step away from the NPC if you land overlapping it. No new floor certification is implied.

## Full story: start here

Run the staging command, then the position command, then talk to the named NPC. Continue naturally to see the subsequent story scenes. Watch once; on a separate run, skip scenes that offer a Skip option.

| Quest | Stage first conversation | Go to NPC | Talk to |
| --- | --- | --- | --- |
| The Price of Integrity | `!questcomplete 111401 0` | `!pos 232 168.900000 0.000000 -175.700000` | Storm Lieutenant Guincum |
| Testing the Waters | `!questcomplete 111402 0` | `!pos 232 168.900000 0.000000 -175.700000` | Storm Lieutenant Guincum |
| Seals for the Whorl | `!questcomplete 111403 0` | `!pos 232 168.900000 0.000000 -178.500000` | Storm Sergeant Grizzly Gnat |
| Engineering Victory | `!questcomplete 111404 0` | `!pos 232 168.900000 0.000000 -175.700000` | Storm Lieutenant Guincum |
| Imperial Devices — Limsa | `!questcomplete 111410 0` | `!pos 232 168.900000 0.000000 -175.700000` | Storm Lieutenant Guincum |
| Into the Dark — Limsa | `!questcomplete 111411 0` | `!pos 232 168.900000 0.000000 -175.700000` | Storm Lieutenant Guincum |
| Breaking the Seals | `!questcomplete 111601 0` | `!pos 234 169.000000 0.000000 -174.700000` | Serpent Lieutenant Fulke |
| Why Did It Have to Be Snakes | `!questcomplete 111602 0` | `!pos 234 169.000000 0.000000 -174.700000` | Serpent Lieutenant Fulke |
| Adder’s Nest Egg | `!questcomplete 111603 0` | `!pos 234 169.000000 0.000000 -177.300000` | Serpent Sergeant Haurtelle |
| The Mail Must Get Through | `!questcomplete 111604 0` | `!pos 234 169.000000 0.000000 -174.700000` | Serpent Lieutenant Fulke |
| Imperial Devices — Gridania | `!questcomplete 111610 0` | `!pos 234 169.000000 0.000000 -174.700000` | Serpent Lieutenant Fulke |
| Into the Dark — Gridania | `!questcomplete 111611 0` | `!pos 234 169.000000 0.000000 -174.700000` | Serpent Lieutenant Fulke |
| Career Opportunities | `!questcomplete 111801 0` | `!pos 233 169.000000 0.000000 -174.700000` | Flame Lieutenant Aubrey |
| Kindling a Flame | `!questcomplete 111802 0` | `!pos 233 169.000000 0.000000 -174.700000` | Flame Lieutenant Aubrey |
| Burning a Hole in One’s Pocket | `!questcomplete 111803 0` | `!pos 233 169.000000 0.000000 -177.300000` | Flame Sergeant Rahz |
| Arms Race | `!questcomplete 111804 0` | `!pos 233 169.000000 0.000000 -174.700000` | Flame Lieutenant Aubrey |
| Imperial Devices — Ul’dah | `!questcomplete 111810 0` | `!pos 233 169.000000 0.000000 -174.700000` | Flame Lieutenant Aubrey |
| Into the Dark — Ul’dah | `!questcomplete 111811 0` | `!pos 233 169.000000 0.000000 -174.700000` | Flame Lieutenant Aubrey |

## Familiar battles: opening movie, fight and aftermath

Run each pair, then talk to Urianger. Sequence 20 enters the actual story/battle route. Do not use the materialization-only `!sqbprivate` probe as proof of story playback.

| Battle | Stage | Position |
| --- | --- | --- |
| Peiste — Limsa | `!questcomplete 111401 20` | `!pos 130 1528.579956 60.752934 -1258.280029` |
| Drake — Gridania | `!questcomplete 111601 20` | `!pos 154 1195.693359 0.075892 1090.483887` |
| Anole — Ul’dah | `!questcomplete 111801 20` | `!pos 172 -1722.310059 56.414021 102.220001` |

Win normally and let the aftermath and return finish. Expected next stage is 40; speak to Walcher / Ailith / Taylor respectively, then return to the company officer. Check `!quest info ID` after returning.

## Three-wave field encounters

The X/Z markers are native and the reviewed Y values below are now in main SQL. Limsa and Gridania were captured at exact native X/Z. Ul'dah retains native X/Z and uses accepted nearby floor Y from a capture 0.826080 yalms away. These commands are for client combat/playthrough checks; if a quest is already at 10, approaching its marker may start it immediately.

| Encounter | Reviewed position | Optional recapture | Stage battle |
| --- | --- | --- | --- |
| Engineering Victory | `!pos 130 983.919983 64.456551 -1566.650024` | `!gcbattle capture com0l4` | `!questcomplete 111404 10` |
| The Mail Must Get Through | `!pos 152 -636.609985 18.128950 -2031.650024` | `!gcbattle capture com0g4` | `!questcomplete 111604 10` |
| Arms Race | `!pos 171 1152.500000 311.773834 -952.159973` | `!gcbattle capture com0u4` | `!questcomplete 111804 10` |

`!pos` prints your current coordinates. A recapture records evidence; it does not update SQL. Formation targets use explicit reviewed Y from nearby frozen walking nodes at the retained authored X/Z, with support distances from 0.906554 to 2.955584 yalms. This supports their floor height but does not establish retail enemy XYZ, facing or client combat acceptance.

After staging, walk away from and back into the field marker to trigger the encounter. These shortcuts skip the preceding officer story conversation; use sequence 0 above to include it. No separate field opening/aftermath movie is configured by these shortcuts. Expect three waves and victory stage 20.

- Engineering: Guincum → battlefield → Guincum → Ebrelnaux → Guincum.
- Mail: Fulke → battlefield → Fulke → Radulf → Fulke.
- Arms Race: Aubrey → battlefield → Aubrey → C’ndanya, Raaka Maaka and Bamponcet → Aubrey.

## Dungeon routes

For full story and required items, use sequence 0 above and follow these paths. Enter through the quest NPC; a direct GM dungeon warp does not test the quest’s entry conversation/transfer.

| Route | Conversation/objective order | Entry checkpoint for transfer-only testing |
| --- | --- | --- |
| Imperial Devices — Limsa | Guincum → Zerig → Bloisirant → owned dungeon moogle → Bloisirant → Guincum | `!questcomplete 111410 10` |
| Imperial Devices — Gridania | Fulke → Bloisirant → A-Ruhn-Senna → owned dungeon moogle → Bloisirant → Fulke | `!questcomplete 111610 10` |
| Imperial Devices — Ul’dah | Aubrey → Nuala → Bloisirant → owned dungeon moogle → Bloisirant → Aubrey | `!questcomplete 111810 10` |
| Into the Dark — Limsa | Guincum → Hasthwab → Quiliane → Dyrstweitz → Captain objective → Quiliane → Guincum | `!questcomplete 111411 30` |
| Into the Dark — Gridania | Fulke → Yuhelmeric → Dyrstweitz → Captain objective → Yuhelmeric → Fulke | `!questcomplete 111611 20` |
| Into the Dark — Ul’dah | Aubrey → Vairemont → Dyrstweitz → Captain objective → Vairemont → Aubrey | `!questcomplete 111811 20` |

Toto-Rak entry NPC: `!pos 154 835.642000 -12.682000 643.485000` — talk to Bloisirant.

Darkhold entry NPC: `!pos 143 -77.489000 250.803000 389.743000` — talk to Dyrstweitz.

Toto-Rak normally requires level 25 and 2–4 eligible combat players; Darkhold requires level 45 and 4–8. Solo refusal is not evidence of a broken scene. Entry-only staging skips access-item handoffs and is not a full reward-path test. Dungeon objective actors must be the actual owned instance actors; do not spawn lookalikes on a public map.

## NPC position lookup

Use these during natural progression. Teleporting does not change the quest stage.

| NPC | Position command |
| --- | --- |
| Ailith (1001628) | `!pos 154 1415.915771 -14.134044 929.076660` |
| Bamponcet (1001633) | `!pos 230 -853.559998 4.000000 268.119995` |
| Bloisirant (1001150) | `!pos 154 835.642000 -12.682000 643.485000` |
| C'ndanya (1001632) | `!pos 230 -828.913147 6.000000 256.318420` |
| Dyrstweitz (1001154) | `!pos 143 -77.489000 250.803000 389.743000` |
| Ebrelnaux (1060011) | `!pos 145 1335.983643 227.415268 1336.344849` |
| Flame Lieutenant Aubrey (1500198) | `!pos 233 169.000000 0.000000 -174.700000` |
| Flame Sergeant Rahz (1500201) | `!pos 233 169.000000 0.000000 -177.300000` |
| Hasthwab (1001064) | `!pos 230 -778.320000 16.350000 383.490000` |
| Nuala (1000681) | `!pos 206 195.170000 27.900000 -1578.800000` |
| Quiliane (1001635) | `!pos 145 2555.627686 173.186462 1279.944946` |
| Raaka Maaka (1001631) | `!pos 230 -842.657532 3.104267 270.509735` |
| Radulf (1001334) | `!pos 171 1131.960000 251.290000 207.868000` |
| Serpent Lieutenant Fulke (1500200) | `!pos 234 169.000000 0.000000 -174.700000` |
| Serpent Sergeant Haurtelle (1500203) | `!pos 234 169.000000 0.000000 -177.300000` |
| Storm Lieutenant Guincum (1500199) | `!pos 232 168.900000 0.000000 -175.700000` |
| Storm Sergeant Grizzly Gnat (1500202) | `!pos 232 168.900000 0.000000 -178.500000` |
| Taylor (1001447) | `!pos 172 -2195.310000 14.361000 -417.438000` |
| Urianger (1060009) | `!pos 172 -1722.310059 56.414021 102.220001` |
| Urianger (1500204) | `!pos 130 1528.579956 60.752934 -1258.280029` |
| Urianger (1500314) | `!pos 154 1195.693359 0.075892 1090.483887` |
| Vairemont (1000586) | `!pos 145 2632.199951 175.228470 1368.310059` |
| Walcher (1001629) | `!pos 130 622.041000 53.794000 -1206.780000` |
| Yuhelmeric (1000370) | `!pos 145 2550.820068 175.351761 1304.719971` |
| Zerig (1000510) | `!pos 206 -350.220000 6.820000 -1705.420000` |

## What to record

After every scene or transfer: move, open the journal and talk to the next NPC. Record quest ID, last NPC, watched/skipped, `!quest info ID`, and whether movement/interaction works.

For the six battles, also test death/retry, timeout and disconnect/relogin. After a failure, allow cleanup/return to finish before issuing staging commands. Test full inventory and seal caps at the normal handoffs, without skipping proof acquisition. Failed-transfer testing needs a controlled server test; do not invent packet-loss commands.

To replay a familiar battle after fully returning, rerun its sequence-20 command. To replay a field encounter after cleanup, rerun sequence 10 and enter its marker. This only replays combat; it is not a fresh item/reward test. Removing a test quest with `!quest ID remove` abandons its current journal entry and does not erase carried items or completion history.

All eighteen routes remain disabled for normal offers pending recorded client acceptance.
