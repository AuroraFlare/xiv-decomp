# All Saints' Wake 2011: decompilation and implementation contract

## Runtime switch

Set these values under `[General]` in `Data/map_config.ini`, then restart Map Server:

```ini
halloween_event_enabled=true
halloween_event_weather_id=8070
halloween_pumpkin_npc_percent=33
```

`8070` selects AuroraFlare's restored all-city Halloween atmosphere. `8027`
remains available as the final stock-client combined selector, but that final
selector maps Gridania to Starlight while Limsa Lominsa and Ul'dah map to
Halloween. The weather packet does not activate the furnishing layouts by
itself; the event runtime separately runs every recovered Halloween scheduler.

The Halloween switch also enables the seasonal quest gate. The individual
quest allowlist enables only `110800`, so unrelated seasonal scaffolds do not
become offers.

All six capital-zone variants replace their ambient day and night channels
with the authenticated Halloween music ID `75`. Each zone retains its normal
battle track. Disabling the event and restarting reloads the ordinary city
music from `server_zones`.

## Recovered city-decoration lane

The event furnishings are resident client layout objects, not server-authored
copies. A private per-player MapObj bridge attempts their saved show schedulers
after the city's actor table is ready. When the final client accepts those
schedulers, this preserves the object placement, rotation, grouping, and
animation authored in the 1.x city DATs rather than approximating those
transforms from screenshots.

| City | Public/interior layouts | Recovered groups |
|---|---|---:|
| Gridania | 321 / 331 | 21 |
| Limsa Lominsa | 121 / 131 | 22 |
| Ul'dah | 421 / 431 | 17 |

The 60 recovered scheduler pairs are documented in
`docs/city_seasonal_weather_selector_datamine_2026-07-11.md`. The weather
opcode is `0x000D`; `SpecialEventWork` (`0x0196`) is a separate control plane
and is not used as the Halloween switch.

Both the public and interior layout profiles are activated for each of the six
server-side capital-zone variants. Gridania runs 11 public and 10 interior
groups, Limsa Lominsa runs 8 public and 14 interior groups, and Ul'dah runs 10
public and 7 interior groups. If Starlight and Halloween are accidentally
enabled together, Starlight wins, matching the city's single seasonal weather
selection and preventing two incompatible decoration sets—or pumpkin-headed
NPCs—from being layered.

## Pumpkin-headed city NPCs

While `halloween_event_enabled` is true, an authored stable selection of
ordinary humanoid NPCs in the six capital-zone variants wears one of the four
recovered Pumpkin Head color variants. The default selection is 33 percent;
operators may use `halloween_pumpkin_npc_percent=0` to disable it or `100` to
costume every eligible NPC.

This is a presentation-only packet override. It never changes the actor's SQL
row or in-memory equipment, and therefore disappears when Halloween is disabled
and Map Server is restarted. Battle NPCs, map objects, non-humanoid models,
event runners/disguises, adjacent winter-event actors, and active GM gear
previews are excluded. The actor-derived roll and color remain stable across
viewers instead of changing whenever the actor enters range.

The four graphics are the existing item appearances `8013301` through
`8013304`: equipment 48, color variants 0 through 3. Period material supports
NPCs wearing pumpkin heads during the event, but no surviving source establishes
a retail selection percentage or randomization algorithm. The 33-percent
default is therefore an explicit reconstruction policy, not a recovered rate.

The direct portable event model is BG object `b976/e001`, the glowing Halloween
sweets/treat basket (`v11_hlsw`, shader stems `o_v11_hlsw01_1h` and
`o_v11_hlsw02_1h`). Actor/appearance `1200254` carries its localized “treat
basket” name. The event reveals one beside a suspicious citizen only after its
imp has successfully awarded cookies.
The thematically plausible `b937` coffin is not spawned because its Halloween
ownership is not authenticated. The upright Halloween booth is a separate prop.

The original event also had an upright black-and-orange photo booth beside
Mudede in Gridania. It is visible at the start of [this 1.x event recording](https://www.youtube.com/watch?v=Yn8L_t8sCTk),
and a [19 October 2011 player account](https://forum.square-enix.com/ffxiv/showthread.php?p=402603)
describes people standing inside the event's screenshot box. The exact native
portable model is `b940/e001` (actor class `1200253`, appearance `20940`). Its
decoded diffuse texture and full mesh show the black pointed frame, red upper
slits, orange opening, and pumpkin figures visible in the recording. The
`v11_snbl` shader stem previously caused a mistaken winter classification;
the actual model is the Halloween booth, not the horizontal `b937` coffin or
Ul'dah's `w0t0_h0_hlw7t_h` scenery. `!spawnbgmodel b940 e001` can preview it.
The Halloween switch now spawns one visual-only, non-interactive booth near
each of the three city runners. Starlight's precedence suppresses these booth
spawns when a winter event switch is enabled at the same time. The existing
main-SQL actor-class and appearance rows already bind `1200253` to model
`20940`, so no new database row or live migration is needed.

| City / native page | Booth XYZ / facing radians | Placement support |
|---|---|---|
| Limsa Lominsa / Upper Decks `914` | `-441.97308, 39.999996, 283.35526` / `0` | Exact live zone-230 nav node 7; 12.8 yalms from Ursielle |
| Gridania `2800` | `33.9031, 10.13475, -1293.8494` / `1.571` | Exact live zone-206 nav node 472; 6.3 yalms from Mudede |
| Ul'dah / Merchant Strip `1800` | `-178, 196, 20` / `0.991` | Map-reviewed X/Z near Yvane; Y is an authored same-plaza estimate from Yvane's anchor because no nearby nav sample exists |

These are playable first-pass homes, **not recovered retail booth XYZ**. The
Limsa and Gridania sources are respectively `Data/quicknavmesh/zone_230.tsv`
(SHA-256 `300ab7ad4751a858dcb84bcd59970bb92b9d325c4b92ba228a933e9ed3d6a833`)
and `Data/quicknavmesh/zone_206.tsv`
(SHA-256 `688b482a9073389de26f7a32adce3f8bbe7b4c660e640bedc7c01aa7314eb63b`).
The Ul'dah page uses zone-175 `1800`; its local recording has no points within
30 yalms of the candidate. All three rotations face approximately toward
their runners and need a live client visual/clearance check. Event activation,
model rendering, floor fit, and booth orientation have not yet been accepted
in the live client.

## Impish Impositions (`110800`, `Spl0i2`)

The first FFXIV 1.0 Halloween event ran from October 18 through November 1,
2011. The implemented quest is level 1 and uses the three recovered city
acceptance functions:

| City | Runner | Actor class | Client function | Runtime XYZ | Historical map anchor |
|---|---|---:|---|---|---|
| Limsa Lominsa | Ursielle | 1001789 | `processEventHWLStart` | `-442.5, 40.0, 296.1` | Upper Decks X7, Y6 |
| Gridania | Mudede | 1001790 | `processEventHWGStart` | `40.183, 10.329, -1293.985` | X6, Y5 |
| Ul'dah | Yvane | 1001791 | `processEventHWUStart` | `-170.94, 196.0, 24.62` | Merchant Strip X5, Y3 |

Nine appearance-backed classes `1001792`–`1001800` provide the recovered
“suspicious” disguises. They appear near authenticated guild/shop decoration
clusters from 19:00 through 05:00 Eorzea time. Each disguise and basket has an
independent active-quest flag. The shared encounter authority allows only the
first player answering a visible imp to receive its 9/5-cookie reward. After a
successful inventory transaction, that disguise vanishes and its Treat Basket
appears for twenty Eorzea minutes. Every player may take one 3-cookie share from
that basket generation; after it expires, the disguise returns.

Correct answers yield 9 Pumpkin Cookies (`3010417`), incorrect answers yield 5,
and each treat basket yields 3. The complete twenty-answer decompilation is:

1. Ala Mhigo
2. Merlwyb Bloefhiswyn
3. Kan-E-Senna
4. The Mythril Eye
5. Dalamud
6. The Sixth Astral Era
7. Garleans
8. Dzemael Darkhold
9. Toto-Rak
10. Wood Wailers
11. Great Buffalo
12. The Coffer & Coffin
13. 15 summers past
14. Menphina
15. The Dragons of Dravania
16. Bloodshore
17. Gunhalberd
18. The Roost
19. Coblyns
20. Treespeak

Each disguise draws from all twenty preserved riddles when addressed. Those
actor classes use the recovered stock-client
`PopulaceHalloweenTrans` class and its `firstTalkNomalEvent` /
`firstTalkAskEvent` flow. Talking to a disguise therefore plays the reveal
dialogue, opens the native three-choice riddle widget, and plays the recovered
correct or incorrect response before the server grants 9 or 5 cookies. The
server awards nothing if the native method does not return a valid result; the
specialized disguise actor cannot safely use the PopulaceStandard menu overlay.
While one player is answering, another receives the recovered `occupyEvent`
dialogue. If the winner's inventory is full, the recovered `itemFullEvent`
dialogue plays, the reservation is released, and the imp remains visible—just
as its text explains that it cannot perform the vanishing act without dropping
the cookies.

The runner exchange is server-authoritative and transactional. The selected
row is re-resolved against the four exact item/cost pairs, ownership and cookie
count are checked again, and inventory capacity is preflighted. Cookies are
then debited before the reward is added; if that authoritative add fails, the
exact debit is restored. Cancel, timeout, insufficient-cookie, inventory-full,
and unique-item paths do not spend cookies.

| Reward | Item | Cookie cost |
|---|---:|---:|
| Pumpkin Head | 8013301 | 3 |
| Unripened Pumpkin Head | 8013302 | 10 |
| White Pumpkin Head | 8013303 | 50 |
| Ripened Pumpkin Head | 8013304 | 99 |

The native `RewardSelectWidget` is proven to return a 1-based row index and
`-1` on cancel, but the recovered `processEventSUMFES001` method lost its
selector variable, compares a constant `8`, and ends with a damaged constant
return. It therefore cannot safely return the player's choice to the server
without a client quest-script patch. The launcher-installed CustomMenu overlay
now presents all four rewards plus an explicit Nothing row; there is no silent
automatic purchase fallback. The runner presents this list even when the player
has no cookies, then the authoritative transaction reports an insufficient
balance for the selected item. The quest completes on the first successful
exchange, matching the recovered client flow and journal contract. The three
runner actors retain a PopulaceStandard service after completion, so the
3/10/50/99 exchanges remain repeatable.

Completed players also retain the nighttime suspicious-citizen and treat-basket
service, instead of becoming unable to earn the remaining hats after their
first exchange. Completed players participate in the same shared encounter
cycle: one global imp winner, one share per player from the temporary basket,
then a fresh generation when the disguise returns.

Marker IDs `11080001`–`11080006` are intentionally not used: their real owner is
quest `110674` (Seeing the Seers), where they point to Kinnison, Sybell, Khuma
Moshroca, Nellaure, Mestonnaux, and Lefwyne.

The event's actual client-resident journal marker group is `11500701`–
`11500711`. Rows 01–03 identify Ursielle, Mudede, and Yvane in the three city
states; rows 04–11 are the disguised-imp search areas. The quest returns the
full recovered group and the journal request handler filters it to the player's
current city family before sending `qtmap`.

## Sources and evidence

No independently recoverable FFXIV 1.0 gameplay recording was found during the
implementation audit. A locally cited YouTube ID (`Yn8L_t8sCTk`) was not
searchable or fetchable in that audit, so no placement, widget, or completion
claim depends on it. The DAT layouts, recovered client Lua/text, and contemporary
archives below remain the implementation authorities:

- [All Saints' Wake 2011 event archive](https://ffxiv.consolegameswiki.com/wiki/All_Saints%27_Wake_%282011%29)
- [Contemporary October 2011 event notice](https://www.ffxivinfo.com/all-saints-wake-impish-impositions-160)
- [Archived Japanese 2011 guide](https://wikiwiki.jp/ff14n/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88/2011%E5%AE%88%E8%AD%B7%E5%A4%A9%E7%AF%80)
- `docs/Dat Mining/spl0i2.csv`
- `docs/Dat Mining/populaceHalloweenTrans.csv`
- `tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl/spl0i2.lua`

## Known fidelity boundary

The broad guild/shop spawn clusters are supported by the 2011 guide and are
anchored to recovered scheduler-owner positions. Exact retail XYZ/rotation for
the roaming disguises was not retained in the extracted normal-spawn table.
The static furnishings themselves do use the authentic resident transforms.
The archived guide proves the twenty-Eorzea-minute basket lifetime, but it does
not authenticate the exact delay before that encounter's disguise becomes
available again; the runtime currently restores it immediately when the basket
expires. The 60 scheduler groups and pumpkin-head packet override are verified
offline but still require a live client pass for rendering, overlap, and head
fit across every eligible humanoid model. The interior Halloween owner instances
remain unrecovered; their provisional bridges reuse each interior layout's
known-safe Starlight instance. Public bridges likewise retain the existing safe
placed probes rather than claiming the closer raw DAT-adjacent IDs as proven
owners. Scheduler delivery therefore establishes packet intent, not visible
client acceptance.

## Validation

The focused `--halloween-only` custom-menu/runtime suite covers active and
completed quest routing, native riddle results, occupied/global resolution,
full-inventory retention, post-event finalization, reward selection including a
zero-cookie player, temporary-basket claims, and embedded city marker filtering.
The new `--halloween-booth-only` contract check verifies three event-gated,
non-interactive `b940` placements and the existing main-SQL model binding; it
passes with a single-worker Map Server build. At this check, the broader
`--halloween-only` run stopped in its pre-Halloween `TestStandardNpcEventFallback`
Lua fixture (`attempt to index a nil value`). Its no-op `require` setup left
`DalamudController`, `FerryScene`, and `LocalGuildleveNpcs` nil; that fixture
now supplies inert handlers for all three before exercising the fallback.
The change has not been rerun, so the broader pass still cannot be claimed for
the current working tree. A prior pass of the additive seasonal
weather server validator, seasonal runtime contract validator, and full
Windower seasonal-overlay validator covered all 31 restored Halloween rows and
all 60 resident scheduler groups; those broader checks were not rerun for the
booth addition. `git diff --check` reports no whitespace errors. The build
retains the repository's existing DotNetZip
and System.Security.Cryptography.Xml vulnerability warnings.
