# Darkhold AF coffer eligibility review, 2026-09-19

The user requests AF armor only while its quest is active, with an ordinary
item otherwise. Identify the intended physical chest before applying that
policy: the personal Enchiridion coffer is a separate relic-quest mechanism,
and its recovered native ineligible result is empty, not ordinary loot.

## Recovered job armor routes

| Quest | Recovered Darkhold evidence | Armor set item IDs | Runtime state |
| --- | --- | --- | --- |
| `111225`, `Mnk0j5`, Five Easy Pieces | Marker `11221401`, map region/area `102/201`, X/Z `-74.510002/392.070007` | Temple Gloves `8071402`, Gaskins `8051402`, Circlet `8013502`, Boots `8081802` | Disabled; exact coffer identities and item-to-marker mapping unresolved |
| `111245`, `Whm0j5`, In Search of Succor | Native Fst journal `428` lists Darkhold among four destinations; marker set `11222401..04` | Healer's Culottes `8051406`, Gloves `8071406`, Boots `8081806`, Circlet `8013506` | Disabled; exact coffer identities, full transforms and item-to-marker mapping unresolved |

The set order does **not** establish which Darkhold chest gives which item.
The Monk marker's X/Z identifies a quest destination, not a recovered coffer
home; do not attach it to an existing regular chest merely by proximity.

Saved source review: `docs/job_war_mnk_whm_decomp_2026-09-07.md`, sections for
`111225` and `111245`, with native call/bytecode exports under
`outputs/job-gc-decomp-20260907/reviews/war-mnk-whm/`. The client
`processEvent_getAF_info` receives the server-selected item ID and runs the event
owner's scheduler `67108910`. It presents acquisition but does not supply the
server-side loot selection, quest predicate or generic fallback table.

`Data/scripts/quests/job_quest_template.lua` requires an eligible player and
sequence `6` in its AF `onPush` handler, resolves an exact objective actor class,
rejects an already-recorded acquisition flag, grants an item before persisting
its flag, and permits retry on inventory failure. Eligibility includes quest
offerability, prerequisite completion, class/job and levels. These two rows
have no runnable `objectives` mapping, so the handler currently grants neither
set through a Darkhold chest. Their availability entries are commented out in
`Data/scripts/quests/quest_availability.lua`.

## Existing dungeon chests

`DzemaelManager.OpenTreasureCoffer` routes ordinary unique IDs by
`DZEMAEL_ROUTE`, `DZEMAEL_OBJECTIVE` or `DZEMAEL_REWARD`. The six regular pools
contain Warlock's Pattens `8080349`, Bladedancer's Jackboots `8080818`,
Revolutionary's Bliaud `8032302`, Alpine War Jacket `8030918`, Solid Scale Mail
`8031608`, and Warlock's Buckler `4100508`. The five completion pools likewise
contain no item from the two AF sets above. Ordinary rolls can already select
the existing common-item pool; their authored probabilities are outside this
eligibility review. No unconditional AF drop was found in those runtime pools.

The distinct `DZEMAEL_RELIC|enchiridion` coffer grants item `10011244` for
quest `110868`. `DzemaelRelicCoffer` captures eligible clear-time participants
and requires its authored all-five-reward/15-minute conditions; the current
scaffold mapping accepts sequences `4..6`. Opening rechecks quest stage and
existing item ownership. An ineligible or already-claimed player receives
empty message `60027`, while a failed inventory add is retryable. It does not
consume another player's personal claim or enter the normal party loot pool.

The saved native `RaidDungeonTreasureBox.processOpenDzemaelEpicQuestType`
requires offering quest `110868`, `isDropDzemael`, and no already-held book;
otherwise it prints `60027`. See
`Data/raidroutes/dzemael_relic_coffer_review.json` and its pinned native resolver.
That evidence does not support silently changing the relic coffer to award an
ordinary item to an ineligible player.

## Open decision

No loot, quest availability, SQL or coffer placements changed in this review.
The user's intended AF item/physical chest and the ordinary fallback must be
identified before wiring a quest-dependent overlay. Preserve the separate
personal relic resolver and existing roll/retry behavior. If new persistent
database bindings are needed, update the main SQL as well as any optional
migration. Do not invent probabilities, enable unfinished AF quests, or assign
the documented armor set to destinations by list order.
