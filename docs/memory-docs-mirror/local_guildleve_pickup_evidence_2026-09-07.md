# Local crafting leve pickup evidence — 2026-09-07

## Finding

The best-supported sequence for **A Mother's Booties (120204)** is:

**Accept at the guild → speak with Manine and receive leve supplies → craft through Requested Items → return to Manine.**

There is no evidence in the inspected records that the player must visit Ayled
between Manine and synthesis. Manine's English line about having Ayled prepare
materials is ambiguous by itself. The journal, other localizations, and shared
commission structure support treating that line as narrative context. This is an
evidence-based interpretation, not a claim that original retail footage has
verified every transition.

No gameplay, SQL, regional-leve, or faction-leve changes were made for this audit.

## Scope and coverage

The audit joined all **152 published local crafting commissions**, covering all
eight crafting classes (19 commissions each), all **608 variants**, and all
**26 named contacts**. The 17 class-1 dummy rows in the 169-row passive table are
outside the published crafting catalog.

| Current family | Commissions | Contacts | Best-supported material flow |
|---|---:|---:|---|
| `PgConv`, plate 20033 | 64 | 11 | Collect from the commission's named client, then return finished work to that client. |
| `PgAeth`, plate 20034 | 88 | 15 | Supplies at acceptance; craft and deliver to the named camp contact. |

These groupings describe the current reconstruction. The dialogue and journal
support the client-pickup versus delivery distinction; they do not themselves
execute the original server's material grants. In particular, an original
post-1.22 acceptance-to-synthesis recording would strengthen the evidence for
the precise grant moment of `PgAeth` commissions.

The full inventory below lists every commission individually. The four recipe
variants share their commission's contact and dialogue fields; no separate
variant-specific pickup contact was found in the recovered table.

## Manine and Ayled

The original English journal text in `docs/Dat Mining/xtx_quest.csv`, row 120204,
CSV field 7 (zero-based including the row ID), says:

> Speak with Gatewarden Manine to receive the supplies, and present her with the goods upon completion.

The Japanese and French journal descriptions also name Manine as the source of
the materials. The German description sends the player to Manine to ask about
the leather remnants, although its final delivery wording differs. This is one
reason not to infer extra gameplay stages from a single localized sentence.

All **eight** Manine commissions, IDs **120201–120208**, use `pgConv.csv` dialogue
rows **365 / 366 / 367 / 368**. Their English journals all direct material
collection to Manine. This covers Metallurgy, Frippery, Carpentry, Booties,
Foundry, Jewelry, Delicacies, and Muselix.

For the questioned line, `pgConv.csv` row **366**:

| Language | Meaning relevant to the handoff |
|---|---|
| English | Manine will have Quartermaster Ayled prepare materials; bring the completed order to Manine. |
| Japanese | Bring the requested goods to Manine when finished. No mention of Ayled. |
| German | Report back to Manine when finished. No mention of Ayled. |
| French | Manine is the person to receive the requested articles when ready. No mention of Ayled. |

The non-English entries are paraphrased here. None introduces a second pickup
conversation. The subsequent English reminder, row 367, concerns Manine
inspecting and forwarding the finished work to Mother Miounne; it does not send
the player to Ayled.

Ayled is already the named recipient of **eight different commissions**, IDs
**120221–120228**, in the delivery family. They use `pgAeth.csv` rows
**181 / 183 / 184 / 182**. Her opening line asks whether the player has brought
the ordered goods, and her incomplete line tells the player to craft them.
Those lines do not establish an Ayled pickup stage for Manine's commissions.

## Pattern across the other contacts

- **Didiwai's eight beginner commissions:** their journals identify Didiwai as
  the material source. His shared reminder (`pgConv.csv` 363) explicitly says
  the materials have already been given. His other dialogue mentions a
  quartermaster storing the finished product, without adding a player visit.
- **Ludovraint's eight beginner commissions:** the journals place supplies at
  Black Brush under Ludovraint and direct the player to him. Shared dialogue
  369–372 tells the player to submit the work to him for inspection.
- **The remaining 40 pickup commissions:** eight clients share eight dialogue
  sets. Bango Zango, H'rhanbolo, Leveridge, Maisenta, Pukiki, and Roarich
  explicitly discuss handing over materials in their dialogue. Claroise and
  Uwilsyng emphasize the job and its completion; their journal descriptions
  identify the client and the materials. No additional pickup NPC was
  established by those texts.
- **The 88 delivery commissions:** all 15 shared contact dialogue sets discuss
  delivering goods, finishing incomplete work, or using camp facilities. Camp
  facilities are not, by themselves, evidence of a separate supply collection
  conversation.

## Recovered data and implementation limits

The following read-only joins and inspections were completed:

1. Published IDs were matched against the real publisher arrays, SQL passive
   rows, original journal rows, and original `passiveGL_craft.csv` rows.
2. The original table's **column 7** contains the named contact. Columns 8–11
   contain the four dialogue IDs. Those fields match the server SQL for all
   152 commissions. Its unused exported columns are blank for all 152; there
   is no recovered second-pickup-NPC field in this table.
3. For every published ID, all `quest_marker.csv` rows whose ID divided by 100
   yields that commission were checked. Each commission has exactly **one**
   such marker, at `leveId * 100`, pointing to the same named contact. No
   separate phase marker naming another pickup contact was found in this set.
4. All **26 distinct four-line dialogue sets** and the English journal
   descriptions were reviewed. Manine's set is the only selected set naming
   Ayled as a material preparer.
5. Recovered `PgConv.initText` and `PgAeth.initText` load their dialogue tables.
   `PassiveGuildleveBaseClass.welcomeTalk`, `processPgEvent`, and
   `finishTalkTurn` handle conversation presentation. They do **not** recover
   the original server's supply-grant logic. The camp-master presentation
   scripts likewise do not establish this proposed extra grant stage.

Table column numbers above exclude the row ID, unless stated otherwise. The
marker association is evidence about these recovered markers, not proof that
the original server could never have contained additional logic elsewhere.

The current server authorizes pickup and completion against
`deliveryDisplayName` and grants supplies during the named client's
conversation. The connected-client Booties test therefore verifies that
implementation, not historical fidelity independently of it.

Primary repository sources:

- [Original journal text](Dat%20Mining/xtx_quest.csv)
- [Original pickup dialogue](Dat%20Mining/pgConv.csv)
- [Original delivery dialogue](Dat%20Mining/pgAeth.csv)
- [Original passive craft table](Dat%20Mining/passiveGL_craft.csv)
- [Original quest markers](Dat%20Mining/quest_marker.csv)
- [Recovered passive-leve presentation class](../tools/outputs/lpb/decomp_more_20260617/lua/quest/passiveguildleve/passiveguildlevebaseclass.lua)
- [Current NPC handler](../Data/scripts/local_guildleve_npcs.lua)
- [Current passive commission SQL](../Data/sql/gamedata_passivegl_craft.sql)

## Historical sources and video search

The user-supplied [2010 Chrono Guide](https://doczz.net/doc/3554771/1-final-fantasy-14-mastery-guide),
printed pages 67–71, describes selecting a leve at the named client to collect
materials and returning finished work to that client. Visiting another NPC is
described separately as optional synthesis support. This supports adding explicit
leve selection; it does not establish an Ayled material-pickup stage for Manine.

The updated NPC handler uses the client's existing `switchEvent` quest selector
before either pickup or delivery, including for one actionable leve. Automated
tests verify selection and transaction behavior; the exact appearance and
passive-quest title rendering still require a connected-client check.

A [September 2010 player explanation](https://forums.mmorpg.com/discussion/290544/how-do-you-start-local-levequests)
describes receiving materials from the journal's named NPC, crafting through
the requested-materials option, and returning to that NPC. The questioner
reported that this helped. This is contemporary player testimony supporting
the general pattern, not official documentation or proof of every 1.23b leve.

The original [2012 Crafting 101 recording by sambonz](https://www.youtube.com/watch?v=Jd9wViVfnho)
was located and its watch-page date verified as **August 13, 2012**. Its
auto-generated transcript was inspected: approximately 18:58–22:21 covers
ordinary synthesis using gathered moko grass, and later sections cover gear
and the economy. This is **not evidence for the Manine/Ayled leve handoff**.
No original recording showing that complete handoff was verified in this audit.

Early guides may use different commission names or items. Square Enix's
[patch 1.22 notes](https://forum.square-enix.com/ffxiv/threads/43599-patch1.22-Patch-1.22-Notes)
explicitly announce changes to local-leve items and some names/descriptions.
The inventory below uses the recovered journal titles, not older wiki titles
or approximate Lua comments.

## What more evidence would settle the remaining question

The useful missing evidence is an original retail event sequence, rather than
more recipe or item rows. A recording or packet capture should identify the
leve and patch era and show:

1. Acceptance and the journal/material state before contacting Manine.
2. Manine's complete first conversation, including any supply notification.
3. Requested Items immediately afterward, before speaking to Ayled.
4. An Ayled conversation only if supplies are still unavailable, followed by
   another Requested Items check.
5. The final hand-in to establish the completion contact.

Equivalent evidence for one Didiwai starter, one Ludovraint starter, one city
pickup client, and one delivery-family leve would cover the main behavioral
patterns. Shared data supports extending a verified pattern to sibling leves;
it does not justify calling all 608 variants independently video-tested.

If a separate pickup stage is demonstrated, implementation would need a
source-backed pickup contact and prerequisite state, plus matching dialogue
and journal behavior for the affected commissions. Adding Ayled globally, or
guessing corresponding quartermasters for every camp, is not supported by
the evidence found here.

## Full published inventory

`Pickup` means the current `PgConv` classification; `Delivery` means `PgAeth`.
Every row below has four variants and exactly one recovered marker pointing to
its listed contact. The inventory is data coverage, not an in-game test log.

| ID | Original journal title | Craft | Contact | Family |
|---|---|---|---|---|
| 120005 | Baderon's New Sword | Blacksmith | Didiwai | Pickup |
| 120006 | Baderon's New Clothes | Weaver | Didiwai | Pickup |
| 120007 | Baderon's New Counter | Carpenter | Didiwai | Pickup |
| 120008 | Baderon's New Shoes | Leatherworker | Didiwai | Pickup |
| 120009 | Baderon's New Barbuts | Armorer | Didiwai | Pickup |
| 120010 | Baderon's New Bands | Goldsmith | Didiwai | Pickup |
| 120011 | Baderon's New Soles | Alchemist | Didiwai | Pickup |
| 120012 | Baderon's New Breakfast | Culinarian | Didiwai | Pickup |
| 120013 | Got Ingots | Blacksmith | Bango Zango | Pickup |
| 120014 | Ship Shape | Blacksmith | H'rhanbolo | Pickup |
| 120015 | A Want of Weapons | Blacksmith | Leveridge | Pickup |
| 120016 | The Mad Hatter | Weaver | Bango Zango | Pickup |
| 120017 | The Mad Fisher | Carpenter | Bango Zango | Pickup |
| 120018 | The Mad Tanner | Leatherworker | Bango Zango | Pickup |
| 120019 | Seeing Sallets to the See | Armorer | Bango Zango | Pickup |
| 120020 | A Step Ahead | Armorer | H'rhanbolo | Pickup |
| 120021 | Mailed Sailors | Armorer | Leveridge | Pickup |
| 120022 | 2 ｘ 2 Eyes | Goldsmith | Bango Zango | Pickup |
| 120023 | A Sticky Situation | Alchemist | Bango Zango | Pickup |
| 120024 | Tall, Cool One | Culinarian | H'rhanbolo | Pickup |
| 120025 | The Captain's Cravings | Culinarian | H'rhanbolo | Pickup |
| 120026 | A Feast Fit for an Admiral | Culinarian | Bango Zango | Pickup |
| 120035 | Skull Valley Delivery | Blacksmith | E'ptolmi | Delivery |
| 120036 | Running Rings | Armorer | E'ptolmi | Delivery |
| 120037 | Supper at the Skull | Culinarian | E'ptolmi | Delivery |
| 120038 | Wear and Tear | Weaver | E'ptolmi | Delivery |
| 120039 | Building Bridges | Carpenter | E'ptolmi | Delivery |
| 120040 | Under Foot | Leatherworker | E'ptolmi | Delivery |
| 120041 | Going Brandanas | Goldsmith | E'ptolmi | Delivery |
| 120042 | Feeding the Trainees | Alchemist | E'ptolmi | Delivery |
| 120043 | Fruits of a Vintner's Whinings | Blacksmith | Kokomui | Delivery |
| 120044 | Watching the Shore | Armorer | Kokomui | Delivery |
| 120045 | The Last Supper | Culinarian | Kokomui | Delivery |
| 120046 | Outfitting the Shore | Weaver | Kokomui | Delivery |
| 120047 | High Stakes | Carpenter | Kokomui | Delivery |
| 120048 | Shoeing the Shore | Leatherworker | Kokomui | Delivery |
| 120049 | Brand New Brands | Goldsmith | Kokomui | Delivery |
| 120050 | Suffering Soldiers | Alchemist | Kokomui | Delivery |
| 120051 | Premiums Paid | Blacksmith | Zabinie | Delivery |
| 120052 | Watching the Knoll | Armorer | Zabinie | Delivery |
| 120053 | A Meal to Remember | Culinarian | Zabinie | Delivery |
| 120059 | Training and Trading | Blacksmith | Nahctahr | Delivery |
| 120060 | Training and Tailoring | Weaver | Nahctahr | Delivery |
| 120061 | Training and Trees | Carpenter | Nahctahr | Delivery |
| 120062 | Training and Tanning | Leatherworker | Nahctahr | Delivery |
| 120063 | Rings Around the Rock | Armorer | Nahctahr | Delivery |
| 120064 | Staves to Fashion | Goldsmith | Nahctahr | Delivery |
| 120065 | Training and Eating | Alchemist | Nahctahr | Delivery |
| 120066 | Just Desserts | Culinarian | Nahctahr | Delivery |
| 120067 | Waiting on Weapons | Blacksmith | Wymar | Delivery |
| 120068 | Dead Ringers | Armorer | Wymar | Delivery |
| 120069 | A Job Well Done | Culinarian | Wymar | Delivery |
| 120201 | A Mother's Metallurgy | Blacksmith | Manine | Pickup |
| 120202 | A Mother's Frippery | Weaver | Manine | Pickup |
| 120203 | A Mother's Carpentry | Carpenter | Manine | Pickup |
| 120204 | A Mother's Booties | Leatherworker | Manine | Pickup |
| 120205 | A Mother's Foundry | Armorer | Manine | Pickup |
| 120206 | A Mother's Jewelry | Goldsmith | Manine | Pickup |
| 120207 | A Mother's Delicacies | Alchemist | Manine | Pickup |
| 120208 | A Mother's Muselix | Culinarian | Manine | Pickup |
| 120209 | It's All in the File | Blacksmith | Maisenta | Pickup |
| 120210 | Quelling Bloody Rumors | Weaver | Maisenta | Pickup |
| 120211 | Shields for the Masses | Carpenter | Maisenta | Pickup |
| 120212 | Canes for the Citizens | Carpenter | Maisenta | Pickup |
| 120213 | High Tension | Carpenter | Maisenta | Pickup |
| 120214 | Strapped for Straps | Leatherworker | Maisenta | Pickup |
| 120215 | Fire and Hide | Leatherworker | Maisenta | Pickup |
| 120216 | Choke Hold | Leatherworker | Maisenta | Pickup |
| 120217 | Tending to Tendons | Armorer | Maisenta | Pickup |
| 120218 | The Band's Bands | Goldsmith | Maisenta | Pickup |
| 120219 | Mixing It Up | Alchemist | Maisenta | Pickup |
| 120220 | Better Baker's Bounty | Culinarian | Pukiki | Pickup |
| 120221 | Training in Bentbranch | Blacksmith | Ayled | Delivery |
| 120222 | Clearing Bentbranch | Weaver | Ayled | Delivery |
| 120223 | Bowing to Pressure | Carpenter | Ayled | Delivery |
| 120224 | Work of Friction | Leatherworker | Ayled | Delivery |
| 120225 | A Little Rusty | Armorer | Ayled | Delivery |
| 120226 | Dusting the Knuckles | Goldsmith | Ayled | Delivery |
| 120227 | Keeping It Green | Alchemist | Ayled | Delivery |
| 120228 | On a Full Belly | Culinarian | Ayled | Delivery |
| 120229 | Pole Positioning | Carpenter | Troegmoer | Delivery |
| 120230 | Hungry Like the Wolves | Leatherworker | Troegmoer | Delivery |
| 120231 | Re-crating the Scene | Blacksmith | Troegmoer | Delivery |
| 120232 | Clearing Nine Ivies | Weaver | Troegmoer | Delivery |
| 120233 | Springripple Rising | Armorer | Juliembert | Delivery |
| 120234 | In Arm's Reach | Goldsmith | Troegmoer | Delivery |
| 120235 | Arboreal Alchemy | Alchemist | Juliembert | Delivery |
| 120236 | A Well-Deserved Dinner | Culinarian | Troegmoer | Delivery |
| 120237 | Driving up the Wall | Carpenter | Bubunakka | Delivery |
| 120238 | Back in the Harness | Leatherworker | Bubunakka | Delivery |
| 120239 | Training in Emerald Moss | Blacksmith | Bubunakka | Delivery |
| 120240 | Clearing Emerald Moss | Weaver | Bubunakka | Delivery |
| 120241 | In Sod We Rust | Armorer | Bubunakka | Delivery |
| 120242 | Knuckling Down | Goldsmith | Bubunakka | Delivery |
| 120243 | Growing Strains | Alchemist | Bubunakka | Delivery |
| 120244 | Seafood Smorgasbord | Culinarian | Bubunakka | Delivery |
| 120245 | Restocking the Stockade | Carpenter | V'olhmyn | Delivery |
| 120246 | Morbol Measures | Leatherworker | V'olhmyn | Delivery |
| 120247 | Plinks Aplenty | Carpenter | Juliembert | Delivery |
| 120248 | Harnessing Help | Leatherworker | Juliembert | Delivery |
| 120401 | Momodi's Dancing Daggers | Blacksmith | Ludovraint | Pickup |
| 120402 | Momodi's Budget Breeches | Weaver | Ludovraint | Pickup |
| 120403 | Momodi's Sturdy Supports | Carpenter | Ludovraint | Pickup |
| 120404 | Momodi's Slashed Shoes | Leatherworker | Ludovraint | Pickup |
| 120405 | Momodi's Sturdy Suits | Armorer | Ludovraint | Pickup |
| 120406 | Momodi's Radiant Rings | Goldsmith | Ludovraint | Pickup |
| 120407 | Momodi's Condiment Conundrum | Alchemist | Ludovraint | Pickup |
| 120408 | Momodi's Breakfast Bread | Culinarian | Ludovraint | Pickup |
| 120409 | Pointy Props | Blacksmith | Uwilsyng | Pickup |
| 120410 | Just for Kecks | Weaver | Uwilsyng | Pickup |
| 120411 | Pants Make the Man | Weaver | Uwilsyng | Pickup |
| 120412 | Holes in Their Defense | Weaver | Uwilsyng | Pickup |
| 120413 | The Walk of Death | Carpenter | Claroise | Pickup |
| 120414 | Showing Some Leg | Leatherworker | Uwilsyng | Pickup |
| 120415 | Battered and Bent | Armorer | Uwilsyng | Pickup |
| 120416 | A Scarcity of Scepters | Goldsmith | Roarich | Pickup |
| 120417 | Pleasure and Pain | Goldsmith | Roarich | Pickup |
| 120418 | In the Sultana's Wake | Goldsmith | Roarich | Pickup |
| 120419 | Exports of Import | Alchemist | Claroise | Pickup |
| 120420 | Fertile Lies | Alchemist | Claroise | Pickup |
| 120421 | A Blind Fool | Alchemist | Claroise | Pickup |
| 120422 | Finger Food | Culinarian | Roarich | Pickup |
| 120423 | Hammering the Point | Blacksmith | Mimina | Delivery |
| 120424 | Hanging by a Thread | Weaver | Mimina | Delivery |
| 120425 | Pointed Ambitions | Carpenter | Mimina | Delivery |
| 120426 | World-weary Souls | Leatherworker | Mimina | Delivery |
| 120427 | Arming the Unarmed | Armorer | Mimina | Delivery |
| 120428 | A Shining Example | Goldsmith | Mimina | Delivery |
| 120429 | Saint Allene's Fire | Alchemist | Mimina | Delivery |
| 120430 | Irrational Behavior | Culinarian | Mimina | Delivery |
| 120431 | Treating Steel | Alchemist | Frediswitha | Delivery |
| 120432 | A Drybone Induction | Goldsmith | Frediswitha | Delivery |
| 120433 | Exposed to the Elements | Weaver | Frediswitha | Delivery |
| 120434 | Molten Metal | Blacksmith | Frediswitha | Delivery |
| 120435 | Off With Their Heads | Carpenter | Frediswitha | Delivery |
| 120436 | Camp Drybone Cares | Leatherworker | Frediswitha | Delivery |
| 120437 | Provisioning Drybone | Armorer | Frediswitha | Delivery |
| 120438 | Tender Victuals | Culinarian | Frediswitha | Delivery |
| 120439 | Blue in the Eye | Alchemist | Aistrach | Delivery |
| 120440 | A Horizon Promotion | Goldsmith | Aistrach | Delivery |
| 120441 | Busier Than the Blades | Weaver | Aistrach | Delivery |
| 120442 | Looking to the Horizon | Blacksmith | Aistrach | Delivery |
| 120443 | Act of Pure Weevil | Carpenter | Aistrach | Delivery |
| 120444 | I Would Walk 500 Malms | Leatherworker | Aistrach | Delivery |
| 120445 | Buckling Under | Armorer | Aistrach | Delivery |
| 120446 | Some Like It Wet | Culinarian | Aistrach | Delivery |
| 120447 | Preserving the Region | Alchemist | Gerlac | Delivery |
| 120448 | A Bluefog Induction | Goldsmith | Gerlac | Delivery |
| 120449 | A Spot in the Shade | Weaver | Gerlac | Delivery |
| 120450 | Provisioning Broken Water | Alchemist | Vanicie | Delivery |
| 120451 | A Broken Water Promotion | Goldsmith | Vanicie | Delivery |
| 120452 | Fire on the Water | Weaver | Vanicie | Delivery |
