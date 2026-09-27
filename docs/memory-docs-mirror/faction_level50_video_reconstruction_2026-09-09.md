# Level-50 faction battle reconstruction

Implemented all **20 level-50 faction configurations**: 19 battles and the Intel
Outside delivery. IDs: 1011–1020, 1111–1119 and 1214. The 33 lower-level faction
configurations are unchanged. These are playable reconstructions, not a claim
that every 1.0 patch's balance, NPC scene or reward is reproduced.

[Map gallery, battle flows and test commands](maps/faction-level50-20260909/index.html) ·
[Placement manifest](../Data/guildleveplacements/faction_level50.json) ·
[Encounter definitions](../Data/scripts/directors/Guildleve/Leves/_faction_level50.lua)

Footage observations, archived mechanics, authored positions and recorded terrain
are separate evidence. Video map artwork does not establish ground height or
collision. No video minimap was calibrated into an exact spawn coordinate during
this pass. The observations below are sampled frames, not complete video
transcriptions. Times are approximate; recordings span multiple 1.0 patches.

## Footage inspected

- **1015, Up, Up, and Away:** [Leonesaurus](https://www.youtube.com/watch?v=ThAhHVNHktg).
  Around 1:50 the tracker shows three war wolves. Around 3:00 it shows 1/3;
  the second kill is followed by the escape phase. Around 3:45 the tracker is
  2/4 wolves and 0/1 Ixali bombardier, with two wolves and the bombardier at
  the destination. The Japanese archive means “three wolves; kill two, one
  flees,” not the English gloss's erroneous “two packs of three.”
- **1115, Princess Pudding:** [gcsammich](https://www.youtube.com/watch?v=YeAAQfpRJs4).
  Around 0:58 three Petit Puddings are visible together in the cove. At 2:20
  the party is still fighting a Petit Pudding. The tracker displays Princess
  Pudding 0/1, rather than treating the opening three as the final objective.
  At 4:09 Princess Pudding is in combat around the same pits.
- **1119, Vengeance:** [Leonesaurus](https://www.youtube.com/watch?v=0HzZdevIQIE).
  At 5:38 the H-I is in combat, the original vanguard has died, and W'mhelgo's
  dialogue acknowledges the second machine. The archive places its arrival
  at approximately half of the first machine's health.

## Additional footage inspected

| Leve | Footage | Observation |
| --- | --- | --- |
| 1011 Bloody Scales | [Leonesaurus, 2:41](https://www.youtube.com/watch?v=Srb46BB8hVY&t=161s) | Branded drake kill and a five-scale award visible. Server collection rates are retained, not matched to this award. |
| 1013 Pulling Fangs | [Leonesaurus, 5:24](https://www.youtube.com/watch?v=X5l_C-MIvYM&t=324s) | Branded drake phase and enemy-appearance notice. Final composition comes from archive/catalog evidence. |
| 1016 Shuteye | [Leonesaurus, 4:39](https://www.youtube.com/watch?v=FtfQTVMiSas&t=279s) | Natali Xhot the Howler in combat alongside wolves. |
| 1017 Leaving the Nest | [Kairi Sgheart, 8:51](https://www.youtube.com/watch?v=YlC4nlwolqM&t=531s) | Riversmeet battle beside rocky slopes and water; four named objectives, two already defeated. |
| 1018 Tailspin | [RydiaMist, around 3:02](https://www.youtube.com/watch?v=EHxKHkF6wf0&t=182s) | True Longtail with battle-drake reinforcements. Exact add interval was not measured. |
| 1019 Deepground | [WotgAshiee, around 4:03](https://www.youtube.com/watch?v=twLEj4ansnc&t=243s) | Zealot deaths and commander objectives visible. Eighteen-zealot composition comes from the archive; arrival thresholds are authored. |
| 1020 Crosseye | [Leonesaurus, 1:18 and 4:14](https://www.youtube.com/watch?v=HWjIFHhE5Fw&t=254s) | Party chooses east first, then fights Brontes there. The 2012 guide supplies the damage-type contrast. |
| 1113 Mammoth and Master | [Leonesaurus, 4:03](https://www.youtube.com/watch?v=Yq_DMrrRwfo&t=243s) | Large buffalo fight in the Bloodshore area. Bushel/master sequence uses archive/catalog evidence. |
| 1114 Ursulien | [RydiaMist, 1:25 and 9:07](https://www.youtube.com/watch?v=gN-KeG54smI&t=85s) | Doppelganger gargoyle and later Baraquel on a bridge. Five-guardian/tome sequence uses archive/catalog evidence. |
| 1116 Striped Lightning | [RydiaMist, around 8:49](https://www.youtube.com/watch?v=D8b_uwQA4mE&t=529s) | Fang and tamer overlap. Whisker Charge and a charged-whisker notice are visible. See the special-mechanic limitation below. |
| 1117 Porus | [Kairi Sgheart, 8:43](https://www.youtube.com/watch?v=SOH3Eg02c-I&t=523s) | Porus fight with the explicit requirement to protect Agid Westwood. |
| 1118 The Maskmaker | [Leonesaurus, 5:49](https://www.youtube.com/watch?v=cAZY0JC-ZnY&t=349s) | W'mhelgo attacks and comments on beasts appearing. The description also identifies her healing role. |
| 1214 Intel Outside | [samaspotion, 3:49–4:58](https://www.youtube.com/watch?v=yLGv0ADhmYg&t=229s) | Travel past ordinary aggressive wildlife, ending beside Diego Athral. Current implementation uses an interaction point. |

No video was sampled for 1012, 1014, 1111 or 1112; those use the archive/catalog.

## Shared source

The checked-in Japanese eLeMeN faction archives supply the roster and objective
flow when footage is incomplete. English glosses must be checked against the
Japanese original and the client catalog before deriving counts.

Sources: [Broken Blade](elemen-regional-guildleves/faction-brotherhood-of-the-broken-blade.md),
[Azeyma's Shields](elemen-regional-guildleves/faction-azeymas-shields.md),
[Horn and Hand](elemen-regional-guildleves/faction-horn-and-hand.md).
The [2012 faction guide](https://forum.gamer.com.tw/G2.php?bsn=17608&lorder=1&parent=138&sn=139)
describes Crosseye's east/west damage contrast and the four-minute delivery to
integer square (5,24). A [contemporary Leaving the Nest discussion](https://forum.square-enix.com/ffxiv/threads/52235-A-Relic-Reborn-BRD-Leve-%28Operation-Leaving-the-Nest%29?mode=linear&p=793666)
describes handling the four enemies around the rocks.

## Implementation

- Collection encounters rotate through three hunting areas. Under Siege,
  Wolfsbane, Pulling Fangs and Shuteye use separate linked patrol packs; final
  waves wait for **every** initial patrol actor to die. Completed patrol circles
  clear when the final phase appears.
- Up, Up, and Away starts with three wolves, protects the last survivor after
  two kills, runs it to the next area, then links it with one extra wolf and a
  bombardier. Existing protected movement and collision-aware smoothing are reused.
- Tailspin and Maskmaker have repeated reinforcements with a one-live-pack limit.
  Deepground has three six-zealot groups plus its two commanders, all at distinct
  recorded slots; all 20 must die. Crosseye places west Arges/east Brontes far apart
  with their contrasting damage reductions.
- Bushel and tome interactions follow the boss sequence. Princess Pudding follows
  all three Petits. Fang joins the tamer and two additional thugs. Vengeance's H-I
  appears once at half health, and both machines must die in either order.
- Agid receives tank/Provoke behavior; his death fails Porus. W'mhelgo uses sword
  attacks and healing. Profiles reuse the existing ally gambit engine.
- Explicit reviewed actor bindings fix incorrect monster identities selected by
  the generic objective-name resolver. Bloody Scales uses branded drakes despite
  inconsistent target-name fields in the catalog. Older faction configs are unchanged.

## Geometry and limits

The frozen sources cover zones 128, 129, 130, 131, 135, 145, 148, 152 and 174.
Riversmeet's new snapshot contains **1,221 nodes and 483 captured edges**. The
manifest stores each source hash and its own node IDs; recordings are not merged.
Every emitted XYZ is a whole recorded sample, including its original height.
These are authored positions, **not confirmed retail coordinates**.

Outdoor maps use the saved calibration. Mistbeard uses its own MapNavi row 600,
base (2400,2176), scale 2; the Pudding pack was moved into the western chamber
after examining the calibrated preview. Each circle has a 64-yalm radius.
Colored dots are available placement slots, **not simultaneous spawn counts**.
Map art does not prove the whole circle is walkable.

The 1015 chase has 64 points joined by captured edges from one frozen source.
The production shortest-course preview reduces its length from **262.7 to 156.0
yalms**; runtime collision checks may retain additional bends. See the
[route review](maps/faction-level50-20260909/flee-route-review.json). In-game
terrain and route clipping remain untested.

Remaining fidelity limits:

- Intel Outside's historical square (5,24) has no recorded ground, including the
  supplemental zone-129 snapshot. Its substitute destination is **294.8 yalms
  from the square's center**. The timer and delivery interaction work; the exact
  destination and Diego's complete start/report conversation are not reproduced.
- Tailspin's 45-second add cooldown, Maskmaker's 40-second cooldown, Deepground's
  arrivals at 2/4/5 initial zealot kills, and Fang's 65%-tamer trigger are authored
  pacing. Crosseye's 50% reductions and ally healing thresholds are authored tuning.
- Fang uses existing Coeurl skills/charge behavior. Its archived special charged
  damage escalation and head-B incapacitation interaction are **not implemented**.
  Other monsters use the existing family AI; not every NM-specific move or stat
  is verified against retail.
- Briefing/report scenes and every original NPC conversation are not rebuilt.
  Existing fixed difficulty, faction fees, reward pools and collection-drop policy
  remain. Historical rewards are not verified.
- All layouts still need in-game checks for terrain, pulls, circles, AI balance,
  companion healing and routes. Automated completion tests do not establish those.

## Activation and testing

Source and map-server build are prepared. **No database was changed and no
running server was restarted.** Existing installations need the additive
[W'mhelgo profile update](../Data/sql/updates/2026_09_09_faction_level50_companion.sql)
plus the rebuilt map server and new scripts. Fresh installations get that row
from `gamedata_guildleve_mob_types.sql`. It uses Agid's reviewed humanoid stat
baseline and W'mhelgo's existing actor appearance; Lua supplies her attacks/heals.

After loading the changes, `!factionleve <ID>` teleports to the first authored
area and starts a reward-free test through the real director. No journal purchase
is needed. If it changes zones, repeat the command after loading. The gallery provides every ID, flow, source and exact
`!pos <zoneId> <X> <Y> <Z>` command.

```text
!factionleve 1017
!factionleve 1015
!factionleve 1115
!factionleve 1119
!factionleve stop
```

Validation passed:

- Map-server build (existing package/advisory and Blowfish warnings remain).
- `validate_faction_level50.ps1`: all 20 encounters finish in both kill orders;
  phase boundaries, circle cleanup, chase/linking, repeat limits, allies, delayed
  tome, cancellation, delivery timeout and unchanged lower 33 configurations.
- Placement validator: frozen hashes, all 20 layouts, exact XYZ, spacing, circle
  bounds and captured edges; 125 configured spawn entries use reviewed profiles.
- `validate_faction_leve_rules.ps1`: 6,669 compiled assertions plus faction offers,
  fees, fixed difficulty, gates and publisher menus. The older fixture now supplies
  gate identity required by the current child-gate script.
- Shared encounter framework, reward/chest checks, tutorial and low-level repairs.
- Compiled director tests: protected route start/arrival, reinforcement grouping,
  obstacle veto, movement ownership, cancellation and no teleporting.
- All 18 map-coordinate calibration tests.

Use `python -B tools/mobspawns/faction_level50_placements.py build` to regenerate
the Lua positions and `render` to refresh the gallery. `check --runtime
.tmp/faction-level50/runtime.tsv` also verifies the exported encounter spawns.
`propose` refuses to overwrite the reviewed manifest; preserve manually selected
node IDs when adjusting an individual battlefield.
