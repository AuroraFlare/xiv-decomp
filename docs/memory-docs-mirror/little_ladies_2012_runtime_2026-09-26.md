# Little Ladies' Day 2012

The nine actors listed in
`outputs/orphan-seasonal-bgobj-atlas-20260712/little_ladies_actor_topology.csv`
now dispatch their exact native `Spl000` methods through
`little_ladies_event_npcs.lua`. The `little_ladies_2012_enabled` flag controls
the profile. The shared seasonal placement builder owns actor SQL/locations.

Q'kholbeh (1001986), Yda (1002000) and Ququmi (1001991) grant Peach Blossom
9030053 and achievement 1211. Native `spl000.csv` rows 3/5, 23/25 and 40/42
distinguish receipt from current possession; the helper preserves that native
zero/one parameter. The server validates current NPC event ownership, exact
gift actor, same-area identity, session, range and inventory capacity. An owned
earring selects the repeat text and cannot generate a second copy. A discarded
earring can be replaced, reflecting the possession-based native branch. Range
limits of eight horizontal/five vertical yalms are authored server policy.

Chief ladies-in-waiting keep the client's native optional lore question.
Seneschals keep their native introductory dialogue and sell Peach Confetti
3020507 and Sweet Rice Cake 3010416. Native `shopBase.csv` row 145 and
`shopItem.csv` rows 1071001/1071002 prove both item identities and the ten-gil
unit price; the existing `shop_prices.lua` already contains those rows. There
are no SQL shop tables to update. The native `Spl000` facade exposes no shop
widget; a custom menu provides item/quantity selection. The server validates
the three seneschal identities and accepted quantities 1–99, computes the
price, checks inventory before debit and refunds gil on ordinary delivery
failure. It does not accept prices from the client. Separate inventory writes
are not process-crash atomic.

The [original-event guide](https://finalfantasy.fandom.com/wiki/Little_Ladies%27_Day_%282012%29)
corroborates all three gift NPCs, three seneschals and both shop items. The
[contemporary Japanese guide](https://wikiwiki.jp/ff14n/イベント/2012プリンセスデー／街角の姫君),
last modified March 26, 2012, records Limsa Upper Decks (7,6), Gridania (6,5)
and Ul'dah (5,3). Its Gridania cell supersedes the secondary archive's (6,6).
Neither guide recovers native actor XYZ; placement remains separately audited.
The official [Sixth Astral Era character history](https://na.finalfantasyxiv.com/lodestone/character/149878/sixth_astral_era/)
records both the Peach Blossom and Royal Audience on March 13, 2012.

`tools/valentione-2012-tests` now also links the actual Little Ladies Player
partial: 21 checks cover ownership, disabled/foreign/distant/dead actors,
capacity and failed-delivery retry, achievement, all-city duplicate prevention,
replacement, item/quantity forgery, price multiplication and ordinary refund.
MoonSharp runs the actual helper for all nine native methods, gift failure,
shop success/cancel, missing scenario and disabled gates. These checks do not
constitute native rendering, shop-menu or floor acceptance in a live client.
