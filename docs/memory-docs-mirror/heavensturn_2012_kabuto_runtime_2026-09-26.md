# Heavensturn 2012 representative gifts

The three representatives now deliver their colored Dragon Kabuto after Gone
with the Snow (110802), through the existing native Spl0i4 gift/owned dialogue.
Limsa actor 1001824 gives crimson 8012605; Gridania 1001825 gives black 8012607;
Ul'dah 1001826 gives gold 8012606. The original quest retains blue 8012604.

Native `spl0i4.lua` and `spl0i4.csv` expose distinct gift and already-owned
methods for all three cities. The [contemporary Japanese event guide](https://wikiwiki.jp/ff14n/イベント/2012降神祭),
last modified 2012-01-02, records the color mapping. Its January 2 firsthand
comments specifically report repeat delivery after putting a hat on a retainer
or discarding it. Consequently current carried possession controls the branch;
there is no invented daily timer or permanent claim flag. The old temporary
dialogue flag issued no items and has been removed.

The server validates the flag, completed quest, exact representative, owned
event, live session, area identity, life/zone state and proximity before delivery.
Full bags or delivery failure leave the gift eligible and do not play the gift
success scene. Received hats unlock native achievements 1202-1205, with 1206
based on the persistent four-achievement history. Quest completion refreshes the
blue achievement. Main item/quest/achievement SQL already contains these rows;
this correction introduces no database data or migration.

The production-linked fixture checks all three bindings, replay, replacement,
foreign/disabled/uncompleted interactions, full bags and failed delivery, plus
the native Lua success/failure branches. No live client acceptance is claimed.
The pre-existing Waldomar-driven three-clue fallback remains separate from this
reward correction; the source describes three glowing investigation targets and
a scene near Hyrstmill's exit, whose live actor mapping is not yet recovered.
