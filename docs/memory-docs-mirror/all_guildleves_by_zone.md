# All Guildleves By Zone

This is a practical zone-by-zone extraction of guildleves from:

- [gamedata_guildleves.sql](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/sql/gamedata_guildleves.sql:1>)
- [xtx_guildleve.csv](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/docs/Dat Mining/xtx_guildleve.csv:1>)

Notes:

- `classType=1` is the main combat/battle guildleve bucket in this extraction.
- `classType=2` entries are non-combat regional/local leves such as mining, logging, or fishing.
- `classType=4` entries are additional mission-style leves present in the data.
- Obvious placeholder rows titled `x` or `dummy` are omitted from the main lists below.
- Some camps are still labeled as `unknown` because the aetheryte/camp mapping has not been fully normalized yet.

## Current ordinary regional battlecraft status

This extraction is a historical zone index, not the current implementation
status. In particular, the `marker: pending (no reconstructed seed)` text in
the lists below describes the state of this document's original extraction and
must not be read as a current claim that the supported level-30/40 regional
leves are missing.

The authoritative current scope is the 102-entry manifest in
[`regional_level30_40_individual.json`](</C:/Users/drime/source/repos/AuroraFlare/FF14-Memory/Data/guildleveplacements/regional_level30_40_individual.json:1>)
and its audit in
[`regional_guildleve_retail_audit_2026-09-25.md`](regional_guildleve_retail_audit_2026-09-25.md):

- level 30: 48 ordinary battlecraft leves in Cedarwood, Cassiopeia Hollow,
  Nophica's Wells, Nanawa Mines, Humblehearth, and the Mun-Tuy Cellars;
- level 40: 54 ordinary battlecraft leves in Bald Knoll, Iron Lake, Halatali,
  Broken Water, Nine Ivies, and Treespeak.

Level-50 faction, Company, fieldcraft, retired, and other non-regional rows
remain separate systems and are intentionally not reclassified by this index.

## Bearded Rock / Zone 128

- `1119` `classType=1` `level=50` `Wanted: Vengeance` -- marker: pending (no reconstructed seed)
- `3200` `classType=2` `level=1` `Meet the Flint Stones` -- marker: pending (no reconstructed seed)
- `3201` `classType=2` `level=1` `Mining Bearded Rock` -- marker: pending (no reconstructed seed)
- `3203` `classType=2` `level=1` `Heavy Medals` -- marker: pending (no reconstructed seed)
- `3400` `classType=2` `level=1` `A Taste of Honey` -- marker: pending (no reconstructed seed)
- `3401` `classType=2` `level=1` `Logging Bearded Rock` -- marker: pending (no reconstructed seed)
- `3403` `classType=2` `level=1` `Teak for Two` -- marker: pending (no reconstructed seed)
- `3600` `classType=2` `level=1` `Help with the Herring` -- marker: pending (no reconstructed seed)
- `3601` `classType=2` `level=1` `Fishing Bearded Rock` -- marker: pending (no reconstructed seed)
- `3603` `classType=2` `level=1` `Vim and Vigor` -- marker: pending (no reconstructed seed)
- `10801` `classType=1` `level=1` `My Very First Adventure` -- marker: pending (no reconstructed seed)
- `10802` `classType=1` `level=1` `My Very First Adventure` -- marker: pending (no reconstructed seed)
- `10821` `classType=1` `level=1` `Mole Patrol` -- marker: pending (no reconstructed seed)
- `10822` `classType=1` `level=1` `Unsavory Ramifications` -- marker: pending (no reconstructed seed)
- `10823` `classType=1` `level=1` `Missing Teeth` -- marker: pending (no reconstructed seed)
- `10824` `classType=1` `level=1` `A Clean Sale` -- marker: pending (no reconstructed seed)
- `10825` `classType=1` `level=1` `A Beardful of Rats` -- marker: pending (no reconstructed seed)
- `10826` `classType=1` `level=1` `Evil Weevils` -- marker: pending (no reconstructed seed)
- `10827` `classType=1` `level=1` `Annexing the Rock` -- marker: pending (no reconstructed seed)
- `10828` `classType=1` `level=1` `When Bats Cry` -- marker: pending (no reconstructed seed)

## Skull Valley / Zone 129

- `1001` `classType=1` `level=20` `Operation: Reave-quest` -- marker: pending (no reconstructed seed)
- `1101` `classType=1` `level=20` `Wanted: Xha Viqqoh the Nibbler` -- marker: pending (no reconstructed seed)
- `3216` `classType=2` `level=10` `Mining Skull Valley` -- marker: pending (no reconstructed seed)
- `3219` `classType=2` `level=10` `Making Muskets out of Molehills` -- marker: pending (no reconstructed seed)
- `3416` `classType=2` `level=10` `Logging Skull Valley` -- marker: pending (no reconstructed seed)
- `3419` `classType=2` `level=10` `Oak on a Boat` -- marker: pending (no reconstructed seed)
- `3616` `classType=2` `level=10` `Fishing Skull Valley` -- marker: pending (no reconstructed seed)
- `3619` `classType=2` `level=10` `Blowfish for the Blowhards` -- marker: pending (no reconstructed seed)
- `10881` `classType=1` `level=10` `Annexing the Valley` -- marker: pending (no reconstructed seed)
- `10882` `classType=1` `level=10` `Colonizing the Valley` -- marker: pending (no reconstructed seed)
- `10883` `classType=1` `level=10` `Claws and Wings` -- marker: pending (no reconstructed seed)
- `10884` `classType=1` `level=10` `Burning Down the Houses` -- marker: pending (no reconstructed seed)
- `10885` `classType=1` `level=10` `The Swarm` -- marker: pending (no reconstructed seed)
- `10886` `classType=1` `level=10` `Send Them Packing` -- marker: pending (no reconstructed seed)
- `10887` `classType=1` `level=10` `Herbicide` -- marker: pending (no reconstructed seed)
- `10888` `classType=1` `level=10` `Jellyfish in a Barrel` -- marker: pending (no reconstructed seed)

## Bald Knoll / Zone 129

- `1214` `classType=4` `level=50` `Intel Outside` -- marker: pending (no reconstructed seed)
- `10901` `classType=1` `level=40` `Annexing the Knoll` -- marker: pending (no reconstructed seed)
- `10902` `classType=1` `level=40` `Fearsome Foliage` -- marker: pending (no reconstructed seed)
- `10903` `classType=1` `level=40` `Slippery Skins` -- marker: pending (no reconstructed seed)
- `10904` `classType=1` `level=40` `Wyrston's Herd` -- marker: pending (no reconstructed seed)
- `10905` `classType=1` `level=40` `Escape from Cell E05` -- marker: pending (no reconstructed seed)
- `10906` `classType=1` `level=40` `Keeping the Peace` -- marker: pending (no reconstructed seed)
- `10907` `classType=1` `level=40` `Dropping Like Flies` -- marker: pending (no reconstructed seed)
- `10908` `classType=1` `level=40` `On the Beating Path` -- marker: pending (no reconstructed seed)
- `10909` `classType=1` `level=40` `Off With Their Heads` -- marker: pending (no reconstructed seed)
- `20901` `classType=1` `level=40` `An Eye for an Herb` -- marker: pending (no reconstructed seed)
- `20902` `classType=1` `level=40` `Missing in Action` -- marker: pending (no reconstructed seed)
- `20903` `classType=1` `level=40` `Caravan of Courage` -- marker: pending (no reconstructed seed)
- `20904` `classType=1` `level=40` `Holding Halfstone` -- marker: pending (no reconstructed seed)
- `20905` `classType=1` `level=40` `Tapping the Spine` -- marker: pending (no reconstructed seed)
- `20906` `classType=1` `level=40` `Red Eye` -- marker: pending (no reconstructed seed)

## Bloodshore / Zone 130

- `1002` `classType=1` `level=20` `Operation: Kobold as Ice` -- marker: pending (no reconstructed seed)
- `1102` `classType=1` `level=20` `Wanted: Palemoon Parazuzu` -- marker: pending (no reconstructed seed)
- `1111` `classType=1` `level=50` `Wanted: Soft Evidence` -- marker: pending (no reconstructed seed)
- `1112` `classType=1` `level=50` `Wanted: Violent Verdure` -- marker: pending (no reconstructed seed)
- `1113` `classType=1` `level=50` `Wanted: Mammoth and Master` -- marker: pending (no reconstructed seed)
- `3232` `classType=2` `level=20` `Mining Bloodshore` -- marker: pending (no reconstructed seed)
- `3235` `classType=2` `level=20` `Make More, Cut Less` -- marker: pending (no reconstructed seed)
- `3432` `classType=2` `level=20` `Fighting the Wood Blight` -- marker: pending (no reconstructed seed)
- `3435` `classType=2` `level=20` `Going Against the Grain` -- marker: pending (no reconstructed seed)
- `3632` `classType=2` `level=20` `Fishing Bloodshore` -- marker: pending (no reconstructed seed)
- `3635` `classType=2` `level=20` `Dream a Little Bream` -- marker: pending (no reconstructed seed)
- `10861` `classType=1` `level=20` `Save the Lettuce, Save the World` -- marker: pending (no reconstructed seed)
- `10862` `classType=1` `level=20` `Annexing the Shore` -- marker: pending (no reconstructed seed)
- `10863` `classType=1` `level=20` `To Catch a Thief` -- marker: pending (no reconstructed seed)
- `10864` `classType=1` `level=20` `A Roseling by Any Other Name` -- marker: pending (no reconstructed seed)
- `10865` `classType=1` `level=20` `Sating the Simians` -- marker: pending (no reconstructed seed)
- `10866` `classType=1` `level=20` `An Imp in Sheep's Clothing` -- marker: pending (no reconstructed seed)
- `10867` `classType=1` `level=20` `Fiend in the Flock` -- marker: pending (no reconstructed seed)
- `10868` `classType=1` `level=20` `Escape from Cell B17` -- marker: pending (no reconstructed seed)

## Cedarwood / Zone 128

- `1004` `classType=1` `level=30` `Operation: Supplication Denied` -- marker: pending (no reconstructed seed)
- `1006` `classType=1` `level=30` `Operation: Reaving Home` -- marker: pending (no reconstructed seed)
- `1106` `classType=1` `level=30` `Wanted: Godwin Goodgoat` -- marker: pending (no reconstructed seed)
- `3248` `classType=2` `level=30` `Mining Cedarwood` -- marker: pending (no reconstructed seed)
- `3251` `classType=2` `level=30` `Of Muskets and Men` -- marker: pending (no reconstructed seed)
- `3448` `classType=2` `level=30` `Reforesting Cedarwood` -- marker: pending (no reconstructed seed)
- `3451` `classType=2` `level=30` `Outfitting the Fleet` -- marker: pending (no reconstructed seed)
- `3648` `classType=2` `level=30` `Fishing Cedarwood` -- marker: pending (no reconstructed seed)
- `3651` `classType=2` `level=30` `Pulmia's First Course` -- marker: pending (no reconstructed seed)
- `10841` `classType=1` `level=30` `Where the Goat Goes` -- marker: pending (no reconstructed seed)
- `10842` `classType=1` `level=30` `Yarz on Me` -- marker: pending (no reconstructed seed)
- `10843` `classType=1` `level=30` `Where's the Meat` -- marker: pending (no reconstructed seed)
- `10844` `classType=1` `level=30` `Bombs Away` -- marker: pending (no reconstructed seed)
- `10845` `classType=1` `level=30` `Escape Artist` -- marker: pending (no reconstructed seed)
- `10846` `classType=1` `level=30` `Necrologos: Lords of Skyey Realms` -- marker: pending (no reconstructed seed)
- `10847` `classType=1` `level=30` `Necrologos: Elemental Thralldom` -- marker: pending (no reconstructed seed)
- `10848` `classType=1` `level=30` `Necrologos: Lightsome Verdure` -- marker: pending (no reconstructed seed)

## Nophica's Wells / Zone 172

- `1005` `classType=1` `level=30` `Operation: Bloody Side Up` -- marker: pending (no reconstructed seed)
- `1104` `classType=1` `level=30` `Wanted: B'khenna the Phoenixfire` -- marker: pending (no reconstructed seed)
- `4048` `classType=2` `level=30` `Mining Nophica's Wells` -- marker: pending (no reconstructed seed)
- `4051` `classType=2` `level=30` `Mythril for Merchants` -- marker: pending (no reconstructed seed)
- `4248` `classType=2` `level=30` `Battling the Blight` -- marker: pending (no reconstructed seed)
- `4251` `classType=2` `level=30` `Support Our Mines` -- marker: pending (no reconstructed seed)
- `4448` `classType=2` `level=30` `Fishing Nophica's Wells` -- marker: pending (no reconstructed seed)
- `4451` `classType=2` `level=30` `Piscean Poison` -- marker: pending (no reconstructed seed)
- `11681` `classType=1` `level=30` `Securing Nophica's Wells` -- marker: pending (no reconstructed seed)
- `11682` `classType=1` `level=30` `A Drop in the Pond` -- marker: pending (no reconstructed seed)
- `11683` `classType=1` `level=30` `Volatile Vitals` -- marker: pending (no reconstructed seed)
- `11684` `classType=1` `level=30` `Dodos and Popotoes` -- marker: pending (no reconstructed seed)
- `11685` `classType=1` `level=30` `Secret of the Sewers` -- marker: pending (no reconstructed seed)
- `11686` `classType=1` `level=30` `Necrologos: The Light's Corrivals` -- marker: pending (no reconstructed seed)
- `11687` `classType=1` `level=30` `Necrologos: Amongst Leaves Most Green` -- marker: pending (no reconstructed seed)
- `11688` `classType=1` `level=30` `Necrologos: Levinshower` -- marker: pending (no reconstructed seed)

## Camp Horizon / Zone 172

- `1212` `classType=4` `level=20` `Looting the Larder` -- marker: pending (no reconstructed seed)
- `4032` `classType=2` `level=20` `Assaying Horizon's Edge` -- marker: pending (no reconstructed seed)
- `4035` `classType=2` `level=20` `Desperately Seeking Sphenes` -- marker: pending (no reconstructed seed)
- `4232` `classType=2` `level=20` `Logging the Horizon` -- marker: pending (no reconstructed seed)
- `4235` `classType=2` `level=20` `Oak Pillars` -- marker: pending (no reconstructed seed)
- `4464` `classType=2` `level=20` `Fish Out of Water` -- marker: pending (no reconstructed seed)
- `4467` `classType=2` `level=20` `Fulgurating Fishes` -- marker: pending (no reconstructed seed)
- `11661` `classType=1` `level=20` `Securing Horizon's Edge` -- marker: pending (no reconstructed seed)
- `11662` `classType=1` `level=20` `Threading the Needles` -- marker: pending (no reconstructed seed)
- `11663` `classType=1` `level=20` `A Leg Up` -- marker: pending (no reconstructed seed)
- `11664` `classType=1` `level=20` `The Wights' Stuff` -- marker: pending (no reconstructed seed)
- `11665` `classType=1` `level=20` `Sweet Vengeance` -- marker: pending (no reconstructed seed)
- `11666` `classType=1` `level=20` `Just One of the Dodos` -- marker: pending (no reconstructed seed)
- `11667` `classType=1` `level=20` `The Lady's Bite` -- marker: pending (no reconstructed seed)
- `11668` `classType=1` `level=20` `The Devilet Inside` -- marker: pending (no reconstructed seed)

## Broken Water / Zone 174

- `1007` `classType=1` `level=40` `Operation: Warm Welcome` -- marker=!pos 174 1249 263.54 -545 [validated:route_intercept]
- `1008` `classType=1` `level=40` `Operation: Broken Thunder` -- marker=!pos 174 1555 250 -233 [best-fit:route_intercept]
- `1011` `classType=1` `level=50` `Operation: Bloody Scales` -- marker=!pos 174 -635 282.36 -1797 [validated:broken_water_drake_base]
- `1012` `classType=1` `level=50` `Operation: Under Siege` -- marker=!pos 174 447 262.37 -2158 [best-fit:broken_water_drake_base]
- `1013` `classType=1` `level=50` `Operation: Pulling Fangs` -- marker=!pos 174 -710 282.02 -2212 [best-fit:broken_water_drake_base]
- `1107` `classType=1` `level=40` `Still Wanted: B'khenna the Phoenixfire` -- marker: pending (no reconstructed seed)
- `11721` `classType=1` `level=40` `A Terrible Thirst` -- marker: pending (no reconstructed seed)
- `11722` `classType=1` `level=40` `Hiding Under the Beds` -- marker: pending (no reconstructed seed)
- `11723` `classType=1` `level=40` `All Cracked Up` -- marker: pending (no reconstructed seed)
- `11724` `classType=1` `level=40` `Netting the Gnats` -- marker: pending (no reconstructed seed)
- `11725` `classType=1` `level=40` `A Devilet's Best Friend` -- marker: pending (no reconstructed seed)
- `11726` `classType=1` `level=40` `Necrologos: Ranine Reveries` -- marker: pending (no reconstructed seed)
- `11727` `classType=1` `level=40` `Whipping the Curs` -- marker: pending (no reconstructed seed)
- `11728` `classType=1` `level=40` `Thwack Ye Mole` -- marker: pending (no reconstructed seed)
- `11729` `classType=1` `level=40` `Dunesfolk for Dinner` -- marker: pending (no reconstructed seed)

## Burnt Lizard Creek / Zone 174

- `1018` `classType=1` `level=50` `Operation: Tailspin` -- marker=!pos 174 710 252.751 -493.724 [best-fit:route_intercept]

## Tranquil / Zone 154

- `1003` `classType=1` `level=20` `Operation: Sylph Stalkings` -- marker: pending (no reconstructed seed)
- `1103` `classType=1` `level=20` `Wanted: Rorogun the Tailtamer` -- marker: pending (no reconstructed seed)
- `1211` `classType=4` `level=20` `Unlike a Rolling Stone` -- marker: pending (no reconstructed seed)
- `4832` `classType=2` `level=20` `Mining Tranquil Paths` -- marker: pending (no reconstructed seed)
- `4835` `classType=2` `level=20` `Corpse Cupid` -- marker: pending (no reconstructed seed)
- `5032` `classType=2` `level=20` `Logging Tranquil Paths` -- marker: pending (no reconstructed seed)
- `5035` `classType=2` `level=20` `Waterlogged` -- marker: pending (no reconstructed seed)
- `5264` `classType=2` `level=20` `Fishing Tranquil Paths` -- marker: pending (no reconstructed seed)
- `5266` `classType=2` `level=20` `Only the Monke Onke` -- marker: pending (no reconstructed seed)
- `12461` `classType=1` `level=20` `Reforesting Tranquil` -- markers: captured with `!glbuild` (two simultaneous objective circles)
- `12462` `classType=1` `level=20` `An Enemy in the Orchards` -- marker: captured with `!glbuild`
- `12463` `classType=1` `level=20` `Forsaken Sacs` -- captured with `!glbuild` (four sequential circles; 85% tail drops; route repeats if needed)
- `12464` `classType=1` `level=20` `A Feast Fit for a Queen` -- captured with `!glbuild` (four sequential pairs; fourth circle uses pair midpoint; 85% drops; repeats until 32 Queen Bees)
- `12465` `classType=1` `level=20` `Migrating Crustaceans` -- captured with `!glbuild` (three combat circles; survivor flees after seven defeats; two reinforcements; chest captured)
- `12466` `classType=1` `level=20` `Impish Intentions` -- captured with `!glbuild` (four sequential search circles; two random real pairs; chest captured)
- `12467` `classType=1` `level=20` `Hidden Behind a Hide` -- captured with `!glbuild` (three sequential search circles; two random real pairs; chest captured)
- `12468` `classType=1` `level=20` `Leaders of the Pack` -- marker: pending (no reconstructed seed)

## Nine Ivies / Zone 153?

- `1010` `classType=1` `level=40` `Operation: Frame Work` -- marker: pending (no reconstructed seed)
- `1108` `classType=1` `level=40` `Wanted: Coiled Adder` -- marker: pending (no reconstructed seed)
- `1110` `classType=1` `level=40` `Wanted: Alvara Sourkiss` -- marker: pending (no reconstructed seed)
- `1207` `classType=4` `level=40` `Diamonds in the Rough` -- marker: pending (no reconstructed seed)
- `5232` `classType=2` `level=40` `Fishing Nine Ivies` -- marker: pending (no reconstructed seed)
- `5234` `classType=2` `level=40` `To Fry a Pike` -- marker: pending (no reconstructed seed)
- `12501` `classType=1` `level=40` `Reforesting Nine Ivies` -- marker: pending (no reconstructed seed)
- `12502` `classType=1` `level=40` `The All-seeing Eyes` -- marker: pending (no reconstructed seed)
- `12503` `classType=1` `level=40` `Tickling Whiskers` -- marker: pending (no reconstructed seed)
- `12504` `classType=1` `level=40` `Efts from Afar` -- marker: pending (no reconstructed seed)
- `12505` `classType=1` `level=40` `What the Devilet Dons` -- marker: pending (no reconstructed seed)
- `12506` `classType=1` `level=40` `Necrologos: The Fallen` -- marker: pending (no reconstructed seed)
- `12507` `classType=1` `level=40` `Fire Fighting` -- marker: pending (no reconstructed seed)
- `12508` `classType=1` `level=40` `All Nine Ivies is a Stage` -- marker: pending (no reconstructed seed)
- `12509` `classType=1` `level=40` `Slugging it Out` -- marker: pending (no reconstructed seed)

## Treespeak / Zone 153?

- `1014` `classType=1` `level=50` `Operation: Wolfsbane` -- marker: pending (no reconstructed seed)
- `1015` `classType=1` `level=50` `Operation: Up, Up, and Away` -- marker: pending (no reconstructed seed)
- `1016` `classType=1` `level=50` `Operation: Shuteye` -- marker: pending (no reconstructed seed)
- `4864` `classType=2` `level=40` `Mining Treespeak` -- marker: pending (no reconstructed seed)
- `4866` `classType=2` `level=40` `Obsidian for the Eye` -- marker: pending (no reconstructed seed)
- `5064` `classType=2` `level=40` `Smiting the Blight` -- marker: pending (no reconstructed seed)
- `5066` `classType=2` `level=40` `Cieldalaes Amenities` -- marker: pending (no reconstructed seed)
- `12521` `classType=1` `level=40` `A Toad's Taste` -- marker: pending (no reconstructed seed)
- `12522` `classType=1` `level=40` `Stealing Apples from a Lemur` -- marker: pending (no reconstructed seed)
- `12523` `classType=1` `level=40` `Blacksand in Hand` -- marker: pending (no reconstructed seed)
- `12524` `classType=1` `level=40` `Do Toads Dream` -- marker: pending (no reconstructed seed)
- `12525` `classType=1` `level=40` `Out of its Shell` -- marker: pending (no reconstructed seed)
- `12526` `classType=1` `level=40` `Necrologos: Rockbound Mists` -- marker: pending (no reconstructed seed)
- `12527` `classType=1` `level=40` `All Treespeak is a Stage` -- marker: pending (no reconstructed seed)
- `12528` `classType=1` `level=40` `Sweet Revenge` -- marker: pending (no reconstructed seed)
- `12529` `classType=1` `level=40` `Open Season` -- marker: pending (no reconstructed seed)
- `22521` `classType=1` `level=40` `Alone in the Dark` -- marker: pending (no reconstructed seed)
- `22522` `classType=1` `level=40` `Raiders of the Lost Archaeologist` -- marker: pending (no reconstructed seed)
- `22523` `classType=1` `level=40` `Invaders from Afar` -- marker: pending (no reconstructed seed)
- `22524` `classType=1` `level=40` `Sylph-inflicted Wounds` -- marker: pending (no reconstructed seed)
- `22525` `classType=1` `level=40` `A Fine Host` -- marker: pending (no reconstructed seed)
- `22526` `classType=1` `level=40` `Eyeopener` -- marker: pending (no reconstructed seed)

## Iron Lake / Zone 135

- `1019` `classType=1` `level=50` `Operation: Deepground` -- marker: pending (no reconstructed seed)
- `1020` `classType=1` `level=50` `Operation: Crosseye` -- marker: pending (no reconstructed seed)
- `1203` `classType=4` `level=40` `Old Money` -- marker: pending (no reconstructed seed)
- `3264` `classType=2` `level=40` `Assaying Iron Lake` -- marker: pending (no reconstructed seed)
- `3266` `classType=2` `level=40` `An Officer and a Firing Pin` -- marker: pending (no reconstructed seed)
- `3464` `classType=2` `level=40` `Logging Iron Lake` -- marker: pending (no reconstructed seed)
- `3466` `classType=2` `level=40` `Sprucing up Ships` -- marker: pending (no reconstructed seed)
- `3664` `classType=2` `level=40` `Swimming in the Iron` -- marker: pending (no reconstructed seed)
- `3666` `classType=2` `level=40` `Soup for the Troops` -- marker: pending (no reconstructed seed)
- `10921` `classType=1` `level=40` `Soft Targets` -- marker: pending (no reconstructed seed)
- `10922` `classType=1` `level=40` `Annexing the Lake` -- marker: pending (no reconstructed seed)
- `10923` `classType=1` `level=40` `Meating Demand` -- marker: pending (no reconstructed seed)
- `10924` `classType=1` `level=40` `Mutton over Mongrels` -- marker: pending (no reconstructed seed)
- `10925` `classType=1` `level=40` `Unholy Moley` -- marker: pending (no reconstructed seed)
- `10926` `classType=1` `level=40` `Necrologos: The Abased` -- marker: pending (no reconstructed seed)
- `10927` `classType=1` `level=40` `Sharing the Load` -- marker: pending (no reconstructed seed)
- `10928` `classType=1` `level=40` `Cliff Haranguers` -- marker: pending (no reconstructed seed)
- `10929` `classType=1` `level=40` `Great Hoary Toads` -- marker: pending (no reconstructed seed)

## Dragonhead / Zone 155?

- `1009` `classType=1` `level=40` `Operation: Scar and Defeather` -- marker: pending (no reconstructed seed)
- `1109` `classType=1` `level=40` `Wanted: Toadsquatter Femomo` -- marker: pending (no reconstructed seed)

## Limsa / Zone 230

- `1201` `classType=4` `level=20` `Collecting Sea Shells` -- marker: pending (no reconstructed seed)

## Unknown La Noscea Camp

- `1105` `classType=1` `level=30` `Wanted: Ser Aucheforne of the High Tide` -- marker: pending (no reconstructed seed)
- `1202` `classType=4` `level=30` `Spoiled Soil` -- marker: pending (no reconstructed seed)
- `11421` `classType=1` `level=30` `Protecting the Pilgrims` -- marker: pending (no reconstructed seed)
- `11422` `classType=1` `level=30` `Awful Offal` -- marker: pending (no reconstructed seed)
- `11423` `classType=1` `level=30` `Orbs for the Ossuary` -- marker: pending (no reconstructed seed)
- `11424` `classType=1` `level=30` `Spooring Spores` -- marker: pending (no reconstructed seed)
- `11425` `classType=1` `level=30` `Crabs in a Barrel` -- marker: pending (no reconstructed seed)
- `11426` `classType=1` `level=30` `Escape from Cell D72` -- marker: pending (no reconstructed seed)
- `11427` `classType=1` `level=30` `Necrologos: The Boughs Above` -- marker: pending (no reconstructed seed)
- `11428` `classType=1` `level=30` `Necrologos: Inferno` -- marker: pending (no reconstructed seed)
- `21421` `classType=1` `level=30` `Between a Rock and a Hard Place` -- marker: pending (no reconstructed seed)
- `21422` `classType=1` `level=30` `Bloody Hollow` -- marker: pending (no reconstructed seed)
- `21423` `classType=1` `level=30` `Ale to the Chief` -- marker: pending (no reconstructed seed)
- `21424` `classType=1` `level=30` `The Walking Undead` -- marker: pending (no reconstructed seed)

## Unknown Shroud Camp

- `1205` `classType=4` `level=30` `It's the Smell` -- marker: pending (no reconstructed seed)
- `1213` `classType=4` `level=30` `Hook, Line, and Sinker` -- marker: pending (no reconstructed seed)
- `13021` `classType=1` `level=30` `Wizening Up` -- marker: pending (no reconstructed seed)
- `13022` `classType=1` `level=30` `Undercutting the Competition` -- marker: pending (no reconstructed seed)
- `13023` `classType=1` `level=30` `Orbs for the Ceremony` -- marker: pending (no reconstructed seed)
- `13024` `classType=1` `level=30` `Tracking the Pack` -- marker: pending (no reconstructed seed)
- `13025` `classType=1` `level=30` `Crabs in the Cellar` -- marker: pending (no reconstructed seed)
- `13026` `classType=1` `level=30` `My Fey Lady` -- marker: pending (no reconstructed seed)
- `13027` `classType=1` `level=30` `Necrologos: The Ever-reaching Claw` -- marker: pending (no reconstructed seed)
- `13028` `classType=1` `level=30` `Necrologos: The Moons' Mistress` -- marker: pending (no reconstructed seed)
- `23021` `classType=1` `level=30` `The Missed Zymurgist` -- marker: pending (no reconstructed seed)
- `23022` `classType=1` `level=30` `Best Cellars` -- marker: pending (no reconstructed seed)
- `23023` `classType=1` `level=30` `Swimming in Suds` -- marker: pending (no reconstructed seed)
- `23024` `classType=1` `level=30` `Sly Spirits` -- marker: pending (no reconstructed seed)

## Unknown Coerthas Camp

- `1017` `classType=1` `level=50` `Operation: Leaving the Nest` -- marker: pending (no reconstructed seed)
- `1206` `classType=4` `level=30` `A Weighty Problem` -- marker: pending (no reconstructed seed)
- `1208` `classType=4` `level=40` `Golden Opportunity` -- marker: pending (no reconstructed seed)
- `1209` `classType=4` `level=40` `While They're Young` -- marker: pending (no reconstructed seed)
- `1210` `classType=4` `level=30` `Heat of the Moment` -- marker: pending (no reconstructed seed)
- `12221` `classType=1` `level=30` `Overtime in the Mines` -- marker: pending (no reconstructed seed)
- `12222` `classType=1` `level=30` `Tuning In` -- marker: pending (no reconstructed seed)
- `12223` `classType=1` `level=30` `The Potter's Price` -- marker: pending (no reconstructed seed)
- `12224` `classType=1` `level=30` `Spirited Below` -- marker: pending (no reconstructed seed)
- `12225` `classType=1` `level=30` `Antling Invasion` -- marker: pending (no reconstructed seed)
- `12226` `classType=1` `level=30` `Corpus Adamance` -- marker: pending (no reconstructed seed)
- `12227` `classType=1` `level=30` `Necrologos: Torn Asunder` -- marker: pending (no reconstructed seed)
- `12228` `classType=1` `level=30` `Necrologos: Adamantine Wills` -- marker: pending (no reconstructed seed)
- `22221` `classType=1` `level=30` `The Mine Matters` -- marker: pending (no reconstructed seed)
- `22222` `classType=1` `level=30` `A Beautiful Mine` -- marker: pending (no reconstructed seed)
- `22223` `classType=1` `level=30` `Minesweeper` -- marker: pending (no reconstructed seed)
- `22224` `classType=1` `level=30` `Terror in the Pits` -- marker: pending (no reconstructed seed)

## Unknown Thanalan Camp

- `1204` `classType=4` `level=30` `Something in the Air` -- marker: pending (no reconstructed seed)

## Unknown Upper La Noscea Camp

- `1117` `classType=1` `level=50` `Wanted: Porus` -- marker: pending (no reconstructed seed)

## Additional Partially Mapped Camps

These still need cleaner camp-name normalization, but the data does have titled guildleves under them:

- `Woad Whisper / zone 129`
  - `1118` `Wanted: The Maskmaker`
  - `11004` `The Skull Valley Chronicles`

- `Tigerhelm / zone 130`
  - `1114` `Wanted: Ursulien the Unseen`
  - `1116` `Wanted: Striped Lightning`
