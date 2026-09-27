# Moonfire Faire quest and captain services

The 2011 `Spl0i1` / 110799 and 2012 `Spl102` / 110860 quest scripts now use
the recovered city-specific acceptance dialogue, claim the initial uniform,
offer explicit ash exchanges, and complete after the first successful exchange.
Completed players retain the captain's exchange service. The independent
`moonfire_2011_enabled` and `moonfire_2012_enabled` switches gate these paths.

`moonfire_event_data.lua` owns presentation choices; the C#
`SeasonalRewardCatalog` owns prices and gender eligibility. A client can select
a row, but cannot submit a price, quantity, or currency. The server checks
entitlement, inventory, ownership, and costs again before a transaction.
The initial uniform claim uses persisted quest flag 7 and retries missing
pieces after an inventory failure. An unsuccessful claim prevents the quest
from completing before that entitlement is fulfilled.

The damaged decompilation of the native reward selector is not used to guess
its selected row. The existing launcher CustomMenu presents every supported
reward and an explicit Nothing choice, followed by confirmation. Cancel,
timeout, invalid selection, inventory rejection, and failure leave the quest
uncompleted and do not announce a reward. This menu is a compatibility choice;
it does not claim to reproduce the native visual layout.

## Authenticated data

| Year | Limsa Lominsa | Gridania | Ul'dah |
|---|---|---|---|
| 2011 | Xheh Jakkya 1001669 | Judye 1001671 | Miette 1001670 |
| 2012 | Xheh Jakkya 1002081 | Judye 1002082 | Miette 1002083 |

The name/city associations join `gamedata_actor_class` to native journal rows
11501101-03, which bind display names 1900175, 1100355, and 1300152 to the
Limsa, Gridania, and Ul'dah map families. The 2012 quest returns those three
native marker IDs, filtered to the player's city even when the deployed server
does not contain the documentation CSV. This does not supply NPC ground Y.

2011 exchanges are Lominsan/Ul'dahn/Gridanian Sparklers for one matching
red/blue/green ash; Red Lion, Blue Spinner, and Green Comet for three matching
ash. Azeyma's Candle costs **three of every color**, including black: twelve
ash in total. The two consecutive native text calls in `Spl0i1` carry all four
costs; a black-only price would be incorrect. The contemporary August 2011
guide specifies ten city sparklers per ash; each rocket exchange delivers one.
The Lunar uniform on acceptance is 8032405 + 8051305 for men and
8032410 + 8051310 for women.

The 2012 selector lists eight rewards per gender: three yukata, three
drawers/knickers, clogs, and Bombard Bloom. Their Bombard Ash 10011253 prices
are respectively 1, 30, 50, 1, 30, 50, 5, and 1. Native acceptance dialogue
receives the existing body/leg ownership booleans. The initial uniform uses
the base-price body and leg variants, 8032834 + 8051521 for men or 8032837 +
8051524 for women. Firsthand 2012 footage and the contemporary Japanese event
guide confirm men's indigo yukata, women's red yukata, and black legwear.

Sources: `docs/Dat Mining/spl0i1.csv`, `spl102.csv`, `xtx_itemName.csv`,
`quest_marker.csv`, and the corresponding recovered scripts under
`tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl/`.
The [contemporary sidequest guide on the official forum](https://forum.square-enix.com/ffxiv/threads/7722-List-of-All-Sidequests-%28work-in-progress%29.?mode=hybrid)
corroborates the 2011 Lunar acceptance reward, first-ash-exchange completion,
colored-ash recipes, and the four-color Solar recipe.

## 2011 mortar service

`PopulaceSumFes.lua` implements a separate confirmed choice of Red Lion,
Blue Spinner, Green Comet, or Azeyma's Candle. `TryLaunchMoonfireMortar`
revalidates the owned NPC, current event, session, area, distance, event profile,
quest entitlement and one required rocket. The server chooses the matching
red/blue/green/solar swimwear for the character's sex and gives only missing
pieces. It preflights the entire missing set, compensates a failed partial
delivery, and leaves both rocket and inventory unchanged on a normal refusal.
The native text has both one-item and two-item reward branches; treating those
as the missing pieces of one matching set is a reconstruction consistent with
the period guide. Lunar gear remains the quest acceptance gift.

The one supported mortar home is at Gridania's documented (5,1) cell, using
the complete frozen node 275 XYZ. Assignment of the identical b939/e001 prop
1001678 to that city is reconstructed. Limsa (6,7) and Ul'dah (6,5) have no
frozen samples inside their documented cells; their heights are not borrowed
from other locations. The ferry home is also unresolved. Reviewed native map
crops and their frames are under `docs/maps/seasonal-20260926/moonfire2012/`.

The mortar delivers the supported reward conversion. The recovered native
city hanabi banks have no authenticated rocket-color-to-`vtp` selector join,
so the conversion does not falsely claim to launch the correct visual burst.
The native mortar cleaning delay is also unrecovered.

## 2012 Bombard defense

`Moonfire2012Director` supplies a playable public field round at the La Noscea
(26,30) site. The main seasonal SQL supplies Cascadier L'mogavha; the owned
director spawns the native four-balloon b992/e001 model and native Bombard/
Bombard King event actors. It registers target-bound Fire Dance emote 156,
checks the exact player, session, owner, area, distance and quest entitlement,
and awards participation only for an accepted dance. Generic combat deaths,
foreign replacements, removed actors and disabled profiles invalidate a round;
they never substitute for dance credit or farm ordinary combat loot/XP.

Normal Bombards take one empowered dance, Kings three. The native text says
the yukata improves Fire Dance; the nonuniform half-strength rule is authored.
Per-target and per-player gates prevent overlapping/replayed dances from
counting. Four intact balloons yield 20 ash, then 10/6/3 for three/two/one;
failed-round participants receive one. Completion requires every configured
wave and living Bombard to be resolved, with at least one surviving balloon.
Contact with an undefended balloon destroys one balloon and retires that
Bombard. The common b992 model's native `initf_idle` reads `extrastat` and
references 0x10/20/40/80 destruction branches and their exact `ex16/32/64/128`
children. Publishing the accumulated destruction mask through opcode 0x145 is
a reconstructed binding awaiting a live client test; other bits are preserved.

Earned ash is a server-side quantity stored by character and unique round in
`characters_moonfire_2012_rewards`. Duplicate completion retries cannot reopen
a claimed ticket. A full inventory retains the ticket, and the native cadet
capacity/reward dialogue supports later claims, including after reconnect or
restart. A failed completion save retries in memory. The existing inventory
API commits inventory separately from this ticket transaction; normal errors
are compensated, but a process crash between the two database commits remains
a shared inventory atomicity limitation.

The complete five field XYZ samples in `moonfire2012_field128.json` are from
one frozen recording, pinned to its hash and source-local node IDs. Role
assignments and facing are reconstructed. The b992 root has not been checked
against its model-local balloon footprint in the client. Navigation uses the
normal required-navmesh route controller and does not invent direct paths
when navigation fails. A bounded lifetime cleans a stalled encounter.

The JSON explicitly labels its editable **four-wave, fourteen-Bombard** roster,
spawn offsets, approach policy, 15-second contact warning, 3-second dance gate,
12-yalm range and 600-second lifetime as reconstruction defaults. The native
director's array length 24 is not treated as a recovered mob count. A ten-second
countdown is visible in [the contemporary firsthand video](https://www.youtube.com/watch?v=0IrHLHVN1oM)
at 31:28; that run spans about 31:38–39:13, with the next start at 40:29. The
75-second intermission approximates that single observation. The video also
corroborates one/three empowered hits and 20 ash for four surviving balloons.
The [contemporary Japanese event guide](https://wikiwiki.jp/ff14n/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88/2012%E7%B4%85%E8%93%AE%E7%A5%AD%EF%BC%8F%E3%83%9C%E3%83%B3%E3%83%90%E3%83%BC%E3%83%89VS%E6%B5%B4%E8%A1%A3%E4%BA%BA%E9%96%93)
also corroborates the uniform colors, participation and reward ladder.

## Remaining gameplay and fidelity work

The 2011 escort, elemental/chigoe interference, Festive Furnace and colored-ash
sources still require their own director and supported placements. The native
`populaceSwimSuit2011` text says the provoked Bombard follows the cadet, not the
player; this must not be replaced with the 2012 dance-defense game. Other 2012
field sites, exact retail wave roster and cadence, dance VFX/lockout, native
public-effect widgets, and the b992 destruction/reset rendering remain open.
The selected 2201606/2201607 native Bombard variants are a reconstructed
appearance choice; similarly named 2201611/2201612 are larger variants whose
precise year/site assignment is not recovered.

The native Lua demonstrates dialogue and reward prices, not the complete
server encounter state machines or actor XYZ. Live acceptance, uniform
delivery, menu rendering, captain placement, fireworks quantities, and quest
completion presentation still need client verification. No live deployment or
client acceptance is asserted here.

## Validation

`dotnet run --project tools/moonfire-quest-tests/MoonfireQuestTests.csproj`
runs the actual server Lua through MoonSharp with mocked player/client
boundaries. It covers all six captain routes, every offered reward for both
genders, refusal, disablement, foreign-year actors, invalid rows, cancellation,
timeout, explicit confirmation, inventory/entitlement rejection, uniform
retry, completion, repeat service, and deployed marker filtering.
It additionally covers mortar/cadet/emote services, both genders' mortar
recipes, partial delivery rollback, the native reward ladder, participation,
cooldowns, terminal replay, and exact hash-pinned ground. This pass has 1,300
Lua checks and 183 C# rules/ground checks.

`dotnet run --project tools/moonfire-field-tests/MoonfireFieldTests.csproj`
links the production director with mocked transport, actors, path admission
and persistence boundaries. Its 34 checks exercise actual countdown/spawn,
range/floor/session/owner rejection, dance success, cleanup, participation,
delayed contact, no combat credit, foreign replacement, persistence retry and
partial-spawn failure. These tests do not validate native client presentation,
navmesh traversal or a real database connection. Inventory debit, refund, and
gender enforcement also have separate C# coverage in the seasonal exchange suite.
