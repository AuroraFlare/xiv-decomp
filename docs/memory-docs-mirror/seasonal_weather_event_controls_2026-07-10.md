# Seasonal Weather and Event Controls - 2026-07-10

## Additive overlay update - 2026-07-12

The optional AuroraFlare Windower overlay now restores all-city Halloween and
Starlight atmosphere as new in-range weather IDs `8070` and `8071`. Named
`!weather halloween` and `!weather starlight` aliases therefore work when that
overlay is enabled. Final-client `8027`, Moonfire `8029`, and Dalamud thunder
`8032` remain present and unchanged.

The pre-overlay command restrictions described later in this document remain
accurate for an unmodified final client, but are superseded while the additive
overlay is active. See
`docs/windower_additive_seasonal_weather_overlay_2026-07-12.md` for the file
layout, provenance, commands, validation, and rollback procedure. Decorations
remain a separate layout/scheduler layer; the overlay currently restores the
weather atmosphere only.

## Historical scope correction

The controls below distinguish installed `2012.09.19.0001` / `1.23b` behavior from retail history. Recovered official patches prove all-city Moonfire `8029` in July 2011, all-city Halloween `8027` in October 2011, and all-city Starlight `8032` in December 2010 and 2011. The 21 July 2012 patch changes all three 8032 payloads to Dalamud thunder and only Gridania's 8027 payload to Starlight.

| historical patch | Limsa | Gridania | Ul'dah | control result |
| --- | --- | --- | --- | --- |
| 2010-12-13 Starlight | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | exact all-city `wtr_xmas`; extracted payloads contain Xmas camera/bind resources |
| 2010-12-21 Heavensturn candidate | no binding/root target | no binding/root target | no binding/root target | negative weather/city-layout probe; obfuscated scripts remain |
| 2011-02-01/10 Valentione candidates | no binding/root target | no binding/root target | no binding/root target | same 1,641 paths, 1,346 revised payload hashes, no weather/city-layout lane |
| 2011-03-01 Little Ladies | no new row/root DAT | no new row/root DAT | no new row/root DAT | pre-existing 8031 is star/cloud themed but lacks an authenticated event call |
| 2011-04-13 Hatching-tide | city layouts changed | city layouts changed | city layouts changed | b972/b973 and all-city layout lane, no Hatching weather row |
| 2011-07-20 Moonfire | `8029 -> 0x29D9001E` | `8029 -> 0x29B0001D` | `8029 -> 0x615A0022` | exact all-city `wtr_smmr` plus city layout changes |
| 2011-10-04 All Saints | `8027 -> 0x29D9001F` | `8027 -> 0x29B00020` | `8027 -> 0x615A0023` | exact all-city Halloween payloads and 36 city DAT targets |
| 2011-12-14 Starlight | `8032 -> 0x29D9001A` | `8032 -> 0x29B0001A` | `8032 -> 0x615A001D` | exact all-city Xmas payloads and 25 city DAT targets |
| 2012-07-21 transition | 8032 becomes thunder | 8032 becomes thunder; 8027 becomes Starlight | 8032 becomes thunder | creates the final-client control map |

## Corrected result

Live testing established that `8027` is a combined environment/decoration pack, not a weather-only control. Named seasonal aliases remain routed to `!eventdecor`, while raw numeric `!weather 8027` is deliberately available as an explicit discovery command and warns that decorations may load.

| area family | weather row | DAT | recovered atmosphere evidence | result |
| --- | ---: | --- | --- | --- |
| `sea_s0` / Limsa and La Noscea | `8027` / `wtr_hall` | `0x29D9001F` | `sdef_hallo_imp`, `coasthall`, `wtr_hall` | combined Halloween pack; `!eventdecor halloween` owns it |
| `wil_w0` / Ul'dah and Thanalan | `8027` / `wtr_hall` | `0x615A0023` | `sdef_hallo_imp`, `wildshall`, `wtr_hall` | combined Halloween pack; `!eventdecor halloween` owns it |
| `fst_f0` / Gridania and Black Shroud | `8027` / `wtr_hall` | `0x29B00020` | `vfx_cam_xmas`, `cbind_xmas`, `time_xmas_se` | combined Starlight/Xmas pack; `!eventdecor starlight` owns it |

A focused scan found no second mapped Gridania Halloween *weather* row. That does not mean the decorations are absent: Gridania's public and interior layout DATs contain 21 explicit Halloween show/hide pairs. `0x29AB001F` is another Xmas asset pack, not the missing Halloween atmosphere.

A later structural decode closes the activation gap. The six public/interior
city layouts contain weather selector vectors, and every Halloween scheduler
family reconciles with an `8027`-only show mask: Gridania `21/21`, Limsa
`22/22`, and Ul'dah `17/17`. The weather packet therefore drives an authored
client layout scheduler condition; the failed manual scheduler probes were not
evidence that the decoration names were inert. Full evidence is in
`docs/city_seasonal_weather_selector_datamine_2026-07-11.md`.

`seasonal`, `wtr_hall`, `halloween`, `allsaints`, `starlight`, and `xmas` fail closed in `!weather` without emitting opcode `0x000D`. Limsa/Ul'dah route to `!eventdecor halloween`; Gridania routes to `!eventdecor starlight`. Numeric `8027` and short numeric `27` each emit exactly one weather packet in the mapped city families for explicit research.

## Mapped weather families

These are authored `RegionResourceData` rows, not all executable `!weather` IDs. Runtime removes combined `8027`, fences debug `8065`-`8069`/`8081` behind `!weather probe`, and unions normal IDs from exact server zone/region weather pools.

| family | mapped positive weather IDs |
| --- | --- |
| `sea_s0` | 8001, 8002, 8003, 8004, 8006, 8007, 8027, 8029, 8030, 8031, 8032, 8065, 8066 |
| `sea_s1` | 8001, 8002, 8003, 8004, 8007, 8030, 8031, 8032 |
| `roc_r0` | 8001, 8002, 8003, 8004, 8006, 8007, 8028, 8030, 8031, 8032, 8065 |
| `roc_r1` | 8001, 8002, 8028 |
| `fst_f0` | 8001, 8002, 8003, 8004, 8007, 8010, 8027, 8028, 8029, 8030, 8031, 8032, 8065, 8066, 8067, 8068 |
| `wil_w0` | 8001, 8002, 8003, 8004, 8007, 8012, 8014, 8027, 8028, 8029, 8030, 8031, 8032, 8065, 8066, 8067, 8068, 8069 |
| `lak_l0` | 8001, 8002, 8003, 8004, 8007, 8017, 8030, 8031, 8032, 8065 |
| `ocn_o0` | 8010, 8065, 8066 |
| `ocn_o1` | 8001, 8002, 8003, 8004, 8010, 8030, 8031, 8032 |
| `ocn_o2` | 8001, 8002, 8003, 8004, 8006, 8007, 8010, 8017, 8081 |
| `srt_o0` | 8001, 8002, 8003, 8004, 8010, 8029, 8030, 8031, 8032 |
| `prv_00` | 8001, 8007 |
| `prv_f0`, `prv_i0`, `prv_s0`, `prv_w0` | 8001 |
| `art_f0` | 8001, 8002, 8003, 8004, 8007, 8010 |
| `art_r0`, `art_s0` | 8001, 8002, 8003, 8004, 8006, 8007 |
| `art_w0` | 8001, 8002, 8003, 8004, 8007, 8012 |

`8015` / snow and `8016` / wintry are explicit protocol constants in the original server and occur in the server's Coerthas natural-weather pools. The installed `RegionResourceData` revision does not repeat them as city rows, but the command now permits both in Limsa, Gridania, and Ul'dah as the all-city snowfall controls requested for live verification.

Use `!weather list` to print current-area weather-only IDs, natural pool IDs, debug probes, and the blocked combined-event route. Hidden rows require `!weather probe <name|id> ...`.

## Halloween furnishing show/hide recovery

The expanded scan covers public, interior, secondary-town, line, and airship layouts. It finds 89 total paired schedulers, including 60 Halloween pairs across all three city-state families. The immediately adjacent public-layout `isgrp_######` labels provide stronger owner tuples than the earlier nearest-SQL-object guesses; the interior groups still need owners.

| city | layout/owner instance | scheduler families | command/status |
| --- | --- | --- | --- |
| Gridania | `321 / 3392` | `time_bg_hlw1a..1i`, `time_bg_hlw2a..2b` | `!eventdecor halloween show` / `hide`; recovered scheduler control |
| Gridania interior | `331 / unresolved` | 10 `hwa/hwf/hws/hww` families | inventory only until owner recovery |
| Limsa Lominsa | `121 / 3215` | `time_bg_hw_obj1_h..8_h` | `!eventdecor halloween show` / `hide` in zone 133 or 230 |
| Limsa interior | `131 / unresolved` | 14 `hw_*` families | inventory only until owner recovery |
| Ul'dah | `421 / 4313` | `time_bg_hw1..9` | `!eventdecor halloween show` / `hide` in zone 175, 184, or 209 |
| Ul'dah | `421 / 4326` | `time_bg_hw0` | included in the same batch command |
| Ul'dah interior | `431 / unresolved` | 7 `hwa/hwe/hwf/hwg` families | inventory only until owner recovery |

Follow-up live testing corrected the activation model. In Ul'dah, all ten `_runBgSchedulerFromMidstream` packets reached the client successfully but neither `show` nor `hide` changed furnishing visibility. Weather resource 8027 did load the Halloween decorations. Therefore normal `!eventdecor halloween show|hide` now uses the empirically backed `8027` / `8001` resource switch in Ul'dah and Limsa. These clients couple the recovered decor and environmental ambience in that resource; they are not independently controllable through the current bridge.

The decompiled `WeatherDirectorBaseClass.processUpdateWork` exposes only `_setWeather(weatherId, transition)`; it has no independent environment-versus-furnishing selector. Repeated live tests likewise show that 8027 is one bundled client resource. Named 8027 aliases remain separate from `!weather`; raw numeric 8027 is exposed only so its area-dependent result can be researched. `!eventdecor halloween show|hide` is the working Limsa/Ul'dah bundled-event control, and `!eventdecor starlight show|hide` owns the Gridania pack.

The raw owner/scheduler path remains available as `probe-show` / `probe-hide`. It creates or reuses a temporary map-object controller bound to each raw layout/instance tuple, rebinds it to the player, and invokes `_runBgSchedulerFromMidstream` for every recovered family. Successful packet delivery is not reported as a successful visual change.

The probe sends the rebind and scheduler packets synchronously in queue order. It does not suspend into a timer callback, so a command-side scheduler error is handled by the normal GM-command error boundary.

These scheduler names and owner tuples are DAT-proven, but the resulting visibility remains a live-client probe. Always follow a `show` test with `hide` (or vice versa) and record which clusters changed.

## Crash diagnosis and hardening

The Release log captured the `!eventdecor halloween show` failure at 20:00:59:

```text
MoonSharp.Interpreter.ScriptRuntimeException: cannot access field RunMapObjScheduler of userdata<Meteor.Map.Actors.Npc>
```

The shared Lua command was newer than the running Release Map Server binary. The command reached its first delayed scheduler call, but that binary did not yet expose `Npc.RunMapObjScheduler`; the timer callback had no exception boundary and terminated the server. Release has now been rebuilt with the bridge. `LuaEngine.PulseSleepingOnTime` also catches, logs, and cancels failed delayed coroutines so an equivalent Lua error cannot terminate Map Server.

The first screenshot was captured after weather 8027 and the raw Ul'dah `421/4313` controller bind, but before the first scheduler call completed. Later isolated testing established that 8027, not the scheduler packets, activates the visible decorations. The apparent earlier "aura" is not a separately recovered weather control; the 8027 DAT supplies an environment/ambience resource and does not guarantee a precipitation-style or dramatic sky effect.

## Other recoverable seasonal layers

| event/special layer | all three city families | command/status |
| --- | --- | --- |
| Moonfire/fireworks | weather 8029, nine `vfx_hanabi1..9` groups, and eight compiled hanabi scheduler bodies in every city root | `!weather moonfire 0 1` controls atmosphere only; six structural bank owners are recovered (`103/41,62`, `101/199,222`, `104/251,265`), with four independently present in 82 transform records; no retail spawn rows survive; Gridania lacks expanded timeline names but retains both compiled scheduler banks |
| Dalamud/comet | mapped as 8030 | `!weather dalamud 0 1`; Gridania also has a `time_bg_comp_show/hide` pair, but its raw owner is not yet strong enough for the batch command |
| Aurora/chry/star | mapped as 8031; Dec 2010 payloads are all-city star/cloud/camera resources with no direct Little Ladies token or event call | `!weather aurora 0 1`; atmosphere/VFX only; not authenticated Little Ladies weather |
| Dalamud thunder | final 1.23b maps 8032; the exact conversion from all-city Starlight occurs in `D2012.07.21.0000` | `!weather dalamudthunder 0 1`; do not route the final client to its historical meaning |
| Starlight | Dec 2010 and Dec 2011 prove all-city 8032/Xmas; July 2012 moves only Gridania's surviving Starlight payload to 8027 | final client: `!eventdecor starlight show|hide`; raw numeric 8027 remains available only as an explicit combined-resource probe |
| Hatching-tide | five `vfx_egg` groups and 15 matching scheduler tokens in each city root, 23 portable variants including three repeated five-shape `b984` blocks, plus explicit all-city EASTER/egg-pod quest functions | `MapObjFireworks` drives `v_l#`/`v_c#`/`v_r#` directly at night; no weather or SpecialEventWork lane |
| Little Ladies' Day | nine exact city/role actors and methods with 30 character-scheduler calls; `b929` Hina display plus six `b930..b932` blossom variants | actors and portable models recovered; no retail city placement owner or weather call |
| Valentione's Day | nine Valentione actors form three roles per city; `b981` is one arch × three identity slots and `b982` is three brazier geometries × three identity slots | slots structurally align with city types 1/2/3; no retail coordinates/placement owner or weather call |
| Foundation Day | modes 8/11, nine dialogue methods, 12 actor-class leads, eight spawn rows, and seven items cover all three companies | event/shop/NPC flow recovered; the Gridania-only `gcflag` bank has no seasonal controller or mode-11 bridge and is excluded as decoration proof; no weather call exists |
| Heavensturn | Japanese `spl0i4` title explicitly identifies Heavensturn; Dragon Kabuto, three city representatives, an orphan marker spine, and three `b901` `kado`/kadomatsu variants survive | actor route and portable models proven; no retail city placement owner or weather call |

Moonfire scheduler probes should be separated by at least nine seconds. The
compiled primitives have a nine-second envelope and six-second active block;
faster calls can overlap and obscure which owner or `vtp` variant produced a
burst.

Ul'dah layout 431 additionally contains `time_bg_xmas1_show/hide` and `time_bg_xmas2_show/hide`. Those are exposed only as `!eventdecor starlight probe-show|probe-hide` because instance 3550 is a weak-distance owner candidate, not a confirmed owner. Limsa has Starlight quest/actor/item evidence but no safe named layout switch yet.

## Recommended live matrix

For each city:

1. Run `!weather reset 0 1`, then `!weather list`.
2. Test `!weather snow 0 1`, then `!weather wintry 0 1`; both are enabled in all three city families.
3. Use raw `!weather 8027 0 1` only when intentionally testing the combined city seasonal resource; named seasonal aliases remain blocked and routed to `!eventdecor`.
4. In Limsa/Ul'dah, run `!eventdecor halloween show`, inspect, then `hide`.
5. In Gridania, separately run `!eventdecor halloween show|hide` and `!eventdecor starlight show|hide`.
6. In Ul'dah, optionally test `!eventdecor starlight probe-show`, then `probe-hide`; treat delivery as experimental.
7. Run weather-only overlays from `!weather events`; each accepted command sends exactly one weather change.
8. Run hidden rows only as `!weather probe <name|id> 0 1` when `!weather list` shows them.

For unresolved visuals, test only IDs printed by `!weather list`. The three primary city families now print and accept `8015`/`8016`.
