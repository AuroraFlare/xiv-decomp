# Job Quest Route Audit

## Corrected result

The client scenario Lua is an event-method library, not the missing server-side
quest dispatcher. Method order in a decompile is therefore not quest order, and
methods ending in `Follow` or `After` are commonly reminder/ambient variants.
They must not be invoked automatically after a similarly named event.

The dated 1.21 walkthroughs at
[eLeMeN's Job Quest archive](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/JobQuest/index.html)
were reconciled with all 42 local scenario decompilations. The actual objective
split is:

| Objective family | Quests | Template stop |
| --- | ---: | --- |
| Instanced or open-world combat | 34 | `battle = {}` |
| AF coffer / destination-object interactions | 8 | `interactions = {}` |

Marker-only boundary tables are deliberate hard stops. They do not mean an
empty objective; they mean the destination is known, but its actor/content
contract is not yet safe to execute. No reward, action, job crystal, AF item,
EXP, or quest completion is reachable from those stops.

## State contract

| Sequence | Meaning |
| ---: | --- |
| `0..4` | Proven ordered NPC route steps. |
| `5` | Combat boundary. A configured target/director must advance it. |
| `6` | AF-coffer or destination-object boundary. A verified interaction actor must advance it. |
| `10` | Proven post-combat reward-NPC return. |

`onKillBNpc` advances only when `battle.targets` contains the killed actor
class. Unrecovered target lists remain absent; the promoted private adapters
are the explicit exceptions and each has its own director/validator contract.

The eight non-combat objective quests enter sequence `6` after acceptance.
This makes their intentional stop distinct from route sequence `0`. Their
audited destination markers are visible, but no interaction actor or reward
path is exposed while the content tables have no actor contract.

## Proven pre-combat NPC route

The template currently represents only steps confirmed by both the walkthrough
and a matching client event method:

| Quest | Ordered route before combat |
| --- | --- |
| `War0j1` | Neale -> Curious Gorge |
| `Mnk0j1` | Gagaruna -> Erik |
| `Mnk0j3` | Erik -> Widargelt |
| `Whm0j1` | Soileine -> Raya-O-Senna |
| `Blm0j3` | Lalai -> Kazagg Chah |
| `Blm0j6` | Da Za -> Dozol Meloc -> Kazagg Chah -> Lalai |
| `Pld0j1` | Lulutsu -> Jenlyns |
| `Brd0j1` | Georjeaux -> Jehantel -> Pukno Poki |
| `Drg0j1` | Haurtefert -> Alberic |
| `Drg0j2` | Alberic -> Alberic (recovered second-talk handoff) |
| `Drg0j3` | Alberic -> Alberic (recovered second-talk handoff) |

`Blm0j1` is intentionally not in that table: the retail route is Yayake ->
combat -> Yayake. Lalai and the three beast-tribe `Follow` methods are ambient
dialogue, not ordered objectives for that quest.

`Mnk0j3` is now bound to Widargelt's `processEventStartAfter`: that dialogue
directs the player onward to the Mun-Tuy Cellars before the Prince of Pestilence
fight. `Blm0j6` uses the historically documented interrogation order and the
matching dispatch variants `processEventDozol01`, `processEventKazagg02`, and
`processEventLalai02`; Lalai then directs the player to Nald's Reflection.

The other finale methods do not establish additional static-NPC route steps.
They are destination-owned scenes or follow/reminder dialogue immediately before
their battles. In particular, `Mnk0j6` has a Widargelt dialogue at Silvertear
Falls, but the only active Widargelt placement is his Little Ala Mhigo spawn.
Binding that actor would send the player to the wrong zone, so the retail route
still stops at its battle/content boundary until the destination placement is
recovered. The currently enabled Monk slice is explicitly a private adapter: it
starts from Erik, uses the recovered default-fade lead-in, and uses the private
content return as the after-warp boundary. That adapter is not evidence that the
public Silvertear Falls route owner has been recovered.

`Drg0j3` is now the safe open-world adapter exception. Its scenario supplies
`processEventALBERICStart` for the offer and `processEvent000_ALBERICS` for the
second Alberic handoff. The local DAT/SQL contract resolves Spitfire to actor
class `2106207`, display `3106209`, public mob type `3101`, and Spriggan skill
list `1`; the profile's source position is unavailable. The private director
therefore owns one exact Spitfire copy, accepts only its battle-sequence kill,
permits the journal's four-person total, and returns the owner to Alberic. The
three completion presentation hooks remain attached to the public reward
interaction; the adapter does not claim to have recreated the Millers' Glade
field trigger or retail NM balance.

`Drg0j2` is the preceding safe open-world adapter. Its journal and decomp
name Bomb Baron in Cassiopeia Hollow and recommend four total participants;
the local public profile resolves actor class `2101610`, display `3101612`,
mob type `3007`, and fire skill list `12`. The second Alberic handoff is
bound to `processEvent000_ALBERICS`, and the private director owns one exact
Bomb Baron copy plus the `51126`/`2000204`, action `27272`, and linkshell
event `1000275`/`85` completion presentation. The source profile has no
verified field transform, so this adapter does not claim to recreate the
Cassiopeia Hollow trigger or a Self-destruct phase threshold.

`Blm0j2` is a direct open-world adapter rather than a proven ordered route. The
scenario supplies Lalai's `processEventLALAIStart`, while its
`processEvent000_LALAI`/`KAZAGGCHAH`/`DOZOLMELOC`/`DAZA` methods are reminder
variants, not a static objective chain. The local contract resolves Daddy
Longlegs to actor class `2105513`, display `3105515`, public mob type `3013`,
and skill list `71`; its source position is unavailable. The private director
therefore owns one exact target, caps the adapter at three party members, and
returns to the Lalai completion gate. It preserves the legacy linkshell/action
widgets without claiming a recovered Western Thanalan trigger or retail phase.

`Pld0j2` and `Pld0j3` are the next direct open-world adapters with live Jenlyns
ownership. Their local contracts resolve Alux to actor class `2102609`, public
mob `3000`, skill list `42`, and Old Six-arms to actor class `2107614`, public
mob `3078`, skill list `21`. The public profiles provide only source-location
evidence, so each private director owns one exact target, uses the shared
three-member cap, and returns to Jenlyns after the matching completion widgets
(`27147`/event `95` and `27149`/event `96`). The Mun-Tuy and Lower La Noscea
markers remain journal hints; no retail NM phase or public trigger is claimed.

## Actor identity correction

Quest markers and talk comparisons use actor-class IDs, matching
`server_eventnpc_spawn_locations.sql` and `GetActorClassId()`. The earlier
scaffold stored display/model IDs such as `1600318` for Curious Gorge and
`2700007` for Raya-O-Senna. Those were replaced by actor-class IDs such as
`1060028` and `1001570` throughout all 42 rows.

Some required NPCs are still absent from the active spawn table, notably
Raya-O-Senna, Jehantel, and Pukno Poki. Their DAT markers prove the zone and
horizontal position, but do not contain terrain height or facing. The quest
rows remain hidden until complete spawn transforms are restored and verified.

| Missing actor | Actor class | Display | Marker | Map | DAT X / Z |
| --- | ---: | ---: | ---: | ---: | ---: |
| Raya-O-Senna | `1001570` | `2700007` | `11222001` | `303` | `-1540.98 / -1588.34` |
| Jehantel | `1060039` | `1200133` | `11225001` | `305` | `737.49 / 1025.73` |
| Pukno Poki | `1001936` | `2480005` | `11225002` | `305` | `1139.02 / 1012.67` |

## Marker provenance correction

The second pass recovered the actual job-marker family. It is independent of
the journal quest IDs:

| Chain | DAT marker groups |
| --- | --- |
| Warrior | `112200xx`–`112205xx` |
| Monk | `112210xx`–`112215xx` |
| White Mage | `112220xx`–`112225xx` |
| Black Mage | `112230xx`–`112235xx` |
| Paladin | `112240xx`–`112245xx` |
| Bard | `112250xx`–`112255xx` |
| Dragoon | `112260xx`–`112265xx` |

This is not based on the numeric pattern alone. The non-placeholder rows match
the walkthrough objective order, actor display IDs, regions, and coordinates.
For example, `11225001` is Jehantel, `11225002` is Pukno Poki,
`11225003` is the battle destination, and `11225004` returns to Jehantel.
Likewise, `11223501`–`11223504` exactly follow Dozol Meloc, Kazagg Chah,
Lalai, and the final Black Mage battle destination.

The template now stages 92 audited markers: the current NPC route step, then
the combat or object boundary, and a return marker where it is already proven.
The tempting `111201xx`–`111203xx` and `111301xx`–`111303xx` rows remain
excluded. Active `wld0g2`–`wld0g4` and `wld0u2`–`wld0u4` scripts explicitly
consume those IDs for unrelated NPCs and field objectives. For example,
`11130101` points to Papala and `11130102` to an unrelated quest area.

## Non-combat objective backlog

These routes must not be treated as talk-to-complete quests:

| Quest | Remaining interaction work |
| --- | --- |
| `War0j4` | Four AF coffers |
| `Mnk0j5` | Four AF coffers; all destination X/Z values, item set, and per-item widget event are staged |
| `Whm0j5` | Four AF coffers, then return to Raya-O-Senna |
| `Blm0j4` | Gem-activated stone-stela interaction; inactive/active events and destination X/Z are staged |
| `Blm0j5` | Four AF coffers; all destination X/Z values, item set, and fourth-item completion are staged |
| `Pld0j4` | Four AF coffers |
| `Brd0j5` | Four AF coffers |
| `Drg0j4` | `Drg0j410` destination scene, then four AF coffers with independently corroborated item/location pairs |

The local scenario `processEvent_getAF_info` methods show client widgets; they
are not proof that talking to the offering NPC completes a coffer route.

The item side of those objectives is recoverable from `gamedata_items.sql`:

| Quest | Recovered level-45 AF grants |
| --- | --- |
| `War0j4` | Fighter's Breeches `8051403`; Gauntlets `8071403`; Jackboots `8081803`; Burgeonet `8013503` |
| `Mnk0j5` | Temple Gloves `8071402`; Gaskins `8051402`; Circlet `8013502`; Boots `8081802` |
| `Whm0j5` | Healer's Culottes `8051406`; Gloves `8071406`; Boots `8081806`; Circlet `8013506` |
| `Blm0j5` | Wizard's Tonban `8051407`; Gloves `8071407`; Crakows `8081807`; Petasos `8013507` |
| `Pld0j4` | Gallant Cuisses `8051401`; Gauntlets `8071401`; Sollerets `8081801`; Coronet `8013501` |
| `Brd0j5` | Choral Tights `8051405`; Ringbands `8071405`; Sandals `8081805`; Chapeau `8013505` |
| `Drg0j4` | Drachen Breeches `8051404`; Gauntlets `8071404`; Greaves `8081804`; Armet `8013504` |

That is not enough to enable the interactions. The historical walkthroughs
provide legacy map-grid locations, while `server_open_world_coffers.sql`
explicitly leaves stronghold world-space positions unseeded. Actor `1200161`
is a locally reused Guildleve coffer substitute, not a recovered identity for
these quest coffers. Each objective still needs a verified actor/unique ID and
runtime `(x, y, z)` placement before its item grant can be bound safely.

The dormant rows now retain exact DAT X/Z/map-area evidence for Mnk0j5,
Blm0j5, and Drg0j4, but those values are quest guidance markers rather than
coffer transforms. They provide no Y, rotation, actor class, or unique spawn
identity. Mnk0j5 and Blm0j5 expose no return state: the strongest client/journal
contract is four independent persisted acquisitions, each calling
`processEvent_getAF_info(itemId)`, with the fourth completing in place. Drg0j4
first needs marker `11226301` to own `processEvent_NQ_Drg0j410` and transition
to `processEvent_ALBERIC_Guidance`; its four later item/location pairs are
corroborated, but their coffer actors are still unknown.

Blm0j4 is not a coffer route. `processEvent000_SEKIHI` is the inactive
moss-covered-stela description, while `processEvent005` is the Gem of Shatotto
activation. Marker `11223301` fixes the West Shroud X/Z at
`(-1691.359985, 124.540001)`, but its `4000257` display is ambiguous and no
stela actor/full transform exists. Its completion widgets are now mapped as
`onJobQuestCompleteFirst`/`Second`, but the quest remains hidden before that
boundary.

## Fade and zone rule

Normal cutscene methods own their fade-out, scene, and fade-in. A method ending
in `startFadeInCutSceneAfterWarp` must remain attached to its event until the
server performs the matching zone change. The generic template does not invoke
those methods. In particular, the private-content owner must coordinate the
after-warp branches in `Pld0j1`, `Pld0j5`, `Brd0j4`, `Drg0j6`, `Blm0j6`,
`Mnk0j6`, and `Pld0j6` with `DoZoneChangeContent`.

`Mnk0j6` is the first multi-target adapter exception in the current playable
inventory: its private shell supplies the missing content transition, so the
template can call the default `processEvent005` branch before entry and the
after-warp `processEvent015` branch after private return. The underlying public
route contract remains unresolved and is not promoted to a static NPC step.

`War0j1` is the complementary safe private-adapter exception. The recovered
journal explicitly names Antling Workers north of Curious Gorge's cave, and
local DAT/SQL data binds that family to actor class `2203001` and ant-crawler
skill list `3`. No public Western Thanalan BNPC profile or spawn is present, so
the playable slice keeps Neale -> Curious Gorge as the public route and owns a
four-copy Antling Worker roster inside the private battle shell. The four-copy
formation is adapter tuning for the journal's “group”; the empty client
director exposes no retail count or phase rule. The adapter returns the owner
to Curious Gorge for `processEventClear`/`processEventJob`/`ClearAfter`.

`War0j2` is another direct open-world adapter with a live Curious Gorge owner.
The local contract resolves Sirocco to actor class `2100309`, display `3100311`,
public mob `3097`, and skill list `4` (`23078`, `23079`, `23166`, `23196`).
Its source position is unavailable, so the private director owns one exact
target, uses the shared three-member cap, and returns to Curious Gorge with the
recovered ability `27187` and linkshell event `75`; the Central Shroud trigger
and agile-monster phase remain explicitly unclaimed.

`Pld0j1` is the next private-adapter exception. The recovered journal names
the four undead resource types and preserves the Lulutsu -> Jenlyns route;
the client `QuestDirectorPld0j101` is an empty simple-battle shell, so the
server owns a four-target exact-kill boundary using the three quest-specific
actor classes plus generic `SpecterStandard` for the empty
`SpecterNormalPld0j1` shell. `processEvent010` is used as the lead-in before
the private content copy, and `processEvent020`/`processEventKokuti` own the
Jenlyns return/reward presentation. The private return is the adapter's
after-warp substitute; it is not evidence that the original Western Thanalan
content owner or retail formation has been recovered.

## Forty-two-quest boundary manifest

This is the complete scenario-surface inventory used by the template. “Default”
means the recovered method closes its own fade in the current area. “AfterWarp”
means the event must be kept alive across a matching server-side transition; it
must not be called until that content owner and its destination transform exist.
Methods listed after a boundary are recorded for the future fight/content owner,
not invoked by the safe pre-battle template.

| Warrior | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `War0j1` | Private battle | No scenario NQ entry surface; private Antling Worker adapter owns the fight, while `processEventClear`/`processEventJob`/`ClearAfter` are post-content. |
| `War0j2` | Private open-world adapter | Curious Gorge offer scene owns the direct handoff; private Sirocco `2100309/3097` owns the kill and completion uses the legacy NPC link-shell event 75. |
| `War0j3` | Held private battle + aftermath waypoint | The four-person fight is only marker `11220201` and exact Canyon Condor actor `2201208`; “flock” has no numeric count and the actor has no profile. East-gate marker `11220202` then owns `processEvent005`/`war0j310`; `processEvent010` and `processEventKokuti` own the cave return and Collusion reward. |
| `War0j4` | Four AF coffers | No NQ surface before the interaction stop. |
| `War0j5` | Held open-world NM | The accept method owns a local fade; Audhumbla `2100804` is one named target at marker `11220401` with an eight-person total recommendation, and completion uses the legacy NPC link-shell handoff. Audhumbla has no exact combat profile; Great Buffalo `2100801/3045` is a different NM and is not substituted. |
| `War0j6` | Held private battle | `processEvent010` owns a Default fade; `processEvent020` owns `war0j620` with Default fade. One frenzied Curious Gorge `2289037/3012/list 15` and quest-specific Cliffdiver `2201209` are exact, but the bird profile/copies/waves and Broken Mountain/content transitions are unresolved. |

| Monk | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Mnk0j1` | Held destination-triggered battle | Erik sends a four-person party to marker `11221002`, where exactly three level-35 Runagate Imps `2202611` precede automatic `processEvent010`/`mnk0j110` and reward widgets. The imp profile, destination trigger/full transform, and automatic completion owner are absent; the generic route would launch at Erik and wait for a reward-NPC click. |
| `Mnk0j2` | Open-world NM | No scenario NQ surface; completion uses the legacy NPC link-shell handoff. |
| `Mnk0j3` | Held open-world NM + point interaction | Routed `processEventStartAfter` owns a local fade; one Prince of Pestilence `2100610/3081/list 6026` is exact and should return sequence `6`. Measurement marker `11221203` has no actor class/full transform, so Outdated Aetheriometer `11000553` cannot yet be location-bound; `processEventClear` owns `mnk0j310` only after that second objective. |
| `Mnk0j4` | Held open-world NM | Erik grants Experimental Aetheriometer `11000555`; one level-53 Apep `2100723` at marker `11221301` is exact with an eight-person cap, and the item shatters before Dragon Kick/link-shell completion. Apep's profile/skills and the marker's spawn owner/full transform are absent; generic basilisk data is not substituted. |
| `Mnk0j5` | Four AF coffers | No NQ surface before the interaction stop. Each exact acquisition uses `processEvent_getAF_info(itemId)`; the fourth appears to complete in place. Four coffer actors/full transforms and marker-to-item bindings are missing. |
| `Mnk0j6` | Private battle | `processEvent005` owns `mnk0j610` with Default/AfterWarp branches; `processEvent015` owns `mnk0j620` and ends AfterWarp. |

| White Mage | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Whm0j1` | Held destination-triggered battle | Raya routes a four-person party to Mun-Tuy marker `11222002`: one Diremite Straggler `2201115` plus three Miteling Stragglers `2201114`, then `processEventClearNQ` owns `whm0j110` and the job/action widgets. Both profiles, wave/formation, Nirvana transition, entry actor/full transform, and Raya/moogle public spawns are missing; the generic route would launch at Raya. |
| `Whm0j2` | Private open-world adapter | Raya-O-Senna's accept method owns `whm0j210`; exact Downy Dunstan `2106017/3019` (skill list `6010`) owns the four-person private kill, then `processEvent005` presents Regen and completes at the public return. |
| `Whm0j3` | Private open-world adapter | Raya-O-Senna's offer hands off to exact Cactuar Jack `2100910/3009` (skill list `6006`) in a four-person private shell; `processEvent005` presents Esuna after the exact kill. |
| `Whm0j4` | Held private battle + public return | An eight-person bandit/minions objective at Bearded Rock precedes `processEventNQ`/`whm0j410`, then Raya marker `11222302` owns `processEventClear` and Holy. Nearby bandit actors `2289031`–`2289034` are unbound candidates with no profiles/counts/waves; Oha-Sok is not a proven ally, and entry/linkpearl ownership is missing. |
| `Whm0j5` | Four AF coffers | No NQ surface before the interaction stop; return is `processEvent_RAYA_O_clear`. |
| `Whm0j6` | Held private battle | Explicit pre-battle `processEventCutSceneBeforeBattle` owns `whm0j605` with Default fade; `processEventNQ`/`NQ03` own `whm0j610` after content. The eight-person fight names six elemental families; only Icebound `2204707/3055` and Earthbound `2204907/3020` have exact local pairs, so the earlier one-Icebound adapter has been removed. |

| Black Mage | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Blm0j1` | Held private battle | Guano Gnat `2200610/3050/list 94` is exact, but the journal's “several” count is not. `processEvent010` owns `blm0j110`; `processEvent020` owns `blm0j120`; both use Default fades and must stay under the eventual content owner's sequence lifecycle. |
| `Blm0j2` | Private open-world adapter | No ordered scenario NQ surface; private Daddy Longlegs `2105513/3013` owns the kill and completion uses the legacy NPC link-shell handoff. |
| `Blm0j3` | Private battle | `processEvent005` owns a local fade; the private director owns the remaining lifecycle. |
| `Blm0j4` | Stone-stela object | `processEvent000_SEKIHI` is inactive text; `processEvent005` activates the Gem/inscription. Marker `11223301` has exact X/Z but no actor/full transform; completion widgets are mapped but unreachable. |
| `Blm0j5` | Four AF coffers | No NQ surface before the interaction stop. Each exact acquisition uses `processEvent_getAF_info(itemId)` and the fourth completes in place; coffer actors/full transforms and ordinal item binding are missing. |
| `Blm0j6` | Held private battle with respawning adds | The exact Da Za → Dozol → Kazagg → Lalai route reaches one Barbatos `2203503/3002/list 10` and “several” Void Lanterns at Nald's Reflection with an eight-person cap. Kill Barbatos to win; lanterns respawn continuously unless all die together, then return after 45 seconds. Count/actor mapping/profiles, boss level/spells, entry transform, scheduler, and scene branch ownership are unresolved; `NQ01` owns `blm0j610`, `NQ02`/`NQ03` own `blm0j620`. |

| Paladin | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Pld0j1` | Private battle | `processEvent010` owns `pld0j110` and ends AfterWarp; `processEvent015` is its Default-return variant. |
| `Pld0j2` | Private open-world adapter | Jenlyns offer scene owns the direct handoff; private Alux `2102609/3000` owns the kill and completion uses the legacy NPC link-shell event 95. |
| `Pld0j3` | Private open-world adapter | Jenlyns offer scene owns the direct handoff; private Old Six-arms `2107614/3078` owns the kill and completion uses the legacy NPC link-shell event 96. |
| `Pld0j4` | Four AF coffers | No NQ surface before the interaction stop. |
| `Pld0j5` | Private battle | `processEvent_005NQ_1` owns `pld0j510` with Default/AfterWarp branches; `_015NQ_2` owns `pld0j520` with Default fade. |
| `Pld0j6` | Held private battle | Manipulated Eye `2201706/3069/list 2` and Manipulated Ogre `2202503/3070/list 34` are exact, but copies/waves and allied Jenlyns/Solkzagyl behavior are not. `processEventNQ01` owns `pld0j610` with Default/AfterWarp branches; `NQ02`/`NQ03` own `pld0j620` with AfterWarp/Default exits. |

| Bard | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Brd0j1` | Held private battle | No scenario NQ surface; the route proves four Qiqirn Shirrer `2206306` and a four-person cap, but the actor has no mob profile/skills and Jehantel/Pukno have no public spawn contracts. The return is `processEvent015` plus `processEventJob(3020410)`. |
| `Brd0j2` | Private open-world adapter | Jehantel's offer hands off to exact Bardi `2101413/3003` (skill list `6002`) in a four-person private shell; the exact kill returns to the public-information/action widgets and legacy NPC link-shell handoff. |
| `Brd0j3` | Private open-world adapter | Jehantel's offer hands off to exact Phaia `2101509/3080` (skill list `6025`) in a four-person private shell; the exact kill returns to the public-information/action widgets and legacy NPC link-shell handoff. |
| `Brd0j4` | Held private battle | `processEventNQ01` owns `brd0j410` with Default/AfterWarp branches; `NQ02` is Default and `NQ03` owns `brd0j420`. Exact named families are Ixali Scout `2206412` (level 52) and Scout Wolf `2201428` (level 50), but neither has a mob profile and copies/waves are unknown. |
| `Brd0j5` | Four AF coffers | The accept method owns a local fade; no destination NQ surface precedes the coffer stop. |
| `Brd0j6` | Held private battle | Yotoli `2206413/3117/list 14` plus sabreur/strongbeak/bravewing/fogcaller `2206414`–`2206417` are exact enemy types at Griffin Crossing with an eight-person cap, but multiplicities/waves are not. Four profiles and Yotoli's CNJ spell list are missing; Jehantel and scene sabreur `1001964` are non-target scene actors. `processEvent_010` owns `brd0j610`; clear eventually presents `processEventClear(8032705)`. |

| Dragoon | Stop | Recovered fade / scene surface |
| --- | --- | --- |
| `Drg0j1` | Held private battle + Alberic return | Haurtefert → Alberic → three level-33 Crabfishers `2204511` plus one level-35 Ironshell `2207612` near Nine Ivies is exact with a four-person cap. Both profiles/wave partition and the entry transform are missing. `processEventNQ` owns `drg0j110` after content; Alberic later owns `processEventClear` and `processEventKokuti(3020410)`. Estinien is cutscene-only. |
| `Drg0j2` | Private open-world adapter | Alberic offer + second-talk handoff are recovered; private Bomb Baron `2101610/3007` owns the kill and the three completion widgets remain on the Alberic return. |
| `Drg0j3` | Private open-world adapter | Alberic offer + second-talk handoff are recovered; private Spitfire `2106207/3101` owns the kill and the three completion widgets remain on the Alberic return. |
| `Drg0j4` | Destination scene + four AF coffers | `processEvent_NQ_Drg0j410` owns `Drg0j410` with Default fade before `processEvent_ALBERIC_Guidance`. All four item/location pairs and immediate fourth-item completion are recovered; the destination owner and five interaction actors/full transforms are not. |
| `Drg0j5` | Open-world NM | No scenario NQ surface; completion uses the legacy NPC link-shell handoff. |
| `Drg0j6` | Private battle | `processEvent010` owns `Drg0j610` with Default fade; `processEvent020`/`025` own `Drg0j620` with AfterWarp/Default exits. |

## Remaining combat work

For each `battle = {}` row, recover the battle actor/trigger, NM or director
targets, spawn/content area, post-fight return, and cleanup. Only then add
`battle.targets` and allow sequence `5` to advance. Several fights complete
inside the content event rather than at a reward NPC, so their completion mode
must be represented explicitly instead of assuming every kill returns to the
quest giver.
