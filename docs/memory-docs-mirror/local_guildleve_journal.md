# Local guildleve journal

The 1.23b client already has a local guildleve page in `JournalDetailWidget`
(`journalType == 2`). It displays the commission title, crafting class and level,
requested item and quantity, reward item, location, delivery contact, completed
item count, remaining materials, and an Open Map button. The progress section is
hidden until materials have been received. A separate server-created UI is not
required.

## Recovered request and response

The original client sources are under
`tools/outputs/lpb/decomp_further_20260617/`:

- `widget/desktopwidget_connector`: `executeCommandJournalDetailInfo` sends
  command 24211 with the quest ID and optional map code for local leves.
  `processRecievedRequestedDataForWidget` and `processUpdateJournalDetailWidget`
  forward the detail arguments to `JournalDetailWidget.setDetailData`.
- `widget/ask/journaldetailwidget`: the local branch of `setDetailData` expects
  the argument positions below. Its Lua decompilation has malformed control
  flow; the assignments were checked against the `.luac` bytecode, instructions
  218–223, with `tools/disassemble_lua51.py`.
- `widget/mapnavigationwidget`: Open Map requests map code 2. The desktop
  response handler treats every argument after the quest ID as a marker ID.

`RequestQuestJournalCommand.lua` now routes active local commissions separately
from scenario quests. The response is `requestedData, qtdata, questId`, followed
by:

| Argument | Value |
|---|---|
| 1 | Recipe variant, 1–4 |
| 2 | 0, unused by the local branch |
| 3 | Completed item quantity |
| 4 | Remaining synthesis attempts |
| 5 | 1 if supplies have been received, otherwise 0 |
| 6 | 0, unused by the local branch |
| 7 | Current leve allowances |

The client text sheet confirms that the control internally named
`NumberOfSuccesses` is labelled **Items Complete** (text 4217), so batch recipes
must report product quantity rather than the number of successful syntheses.
Text 4229 resolves the requested item and quantity from the selected variant;
4230 resolves the delivery contact. These are original client sheet lookups.

The ordinary quest sequence must not precede this tuple. The previous handler
sent that sequence and attempted missing `PgConv`/`PgAeth` scenario-journal Lua
callbacks, leaving the local page without the expected progress data.

## Destination map

The map response is `requestedData, qtmap, questId, questId * 100`. Each of the
152 published commissions has that exact row in
`docs/Dat Mining/quest_marker.csv`, and its display-name field matches the
commission's delivery contact. The client owns the coordinates and map page.
The destination remains available before material pickup and when the player is
in another zone.

Examples: 12000700 is Didiwai for Baderon's New Counter; 12003900 is E'ptolmi for
Building Bridges.

## Verification and remaining work

`tools/local-guildleve-tests` executes the production request Lua with production
commission state through MoonSharp. It checks all four variant indexes, both
material-supply families, pickup, success and failure, batch output, exhausted
supplies, saved/reloaded progress, allowances, raw and signed actor IDs,
destination packets, and removed commissions. Database, world, and packet
transport services are stubbed. The Python guildleve audit checks all 152
marker/contact pairs.

These checks verify server responses; rendering and map navigation still need a
connected 1.23b client walkthrough.

The Release build and repository scripts are active on the local server as of
2026-09-07. Startup and runtime commission-data checks passed; see the
[deployment record](local_guildleve_handoffs.md#verification-and-deployment).
The user has since completed A Mother's Booties in the connected client, with
material pickup and completion/reward persistence confirmed. Map rendering and
the remaining client scenarios are still unverified.

## Retry, abandonment and synthesis lifetime

The original `player_work` uses work slots 1–8 for regional leves and 9–16 for
local IDs minus 120000. The server now fills the local slots on load, acceptance,
craft progress, retry and removal. `guildleveDone` marks an exhausted commission
that has not met its quota; `guildleveChecked` marks a completed quota. An
unfinished last synthesis is allowed to finish before failure is marked.

Journal action 5 retries a failed local commission for one allowance; action 3
abandons it. Unsupported actions leave it alone. Retry retains the recipe
variant, clears products and performance, and replenishes the previously
collected supplies. It creates a new commission instance, so old craft results
cannot change the retry. The original retry prompts are also connected at the
publisher and after synthesis failure. This follows the retry entry points
described in Square Enix's [guildleve revisions](https://forum.square-enix.com/ffxiv/threads/23365-dev1134-Guildleve-Revisions?mode=linear&p=329351).

Each synthesis reserves and saves one attempt before opening the progress
widget. Its completion token is transient: cancellation, event replacement,
class/job change, death and disconnect invalidate it without refunding supplies.
Reloading a saved commission preserves spent attempts and cannot restore the
old completion token. Success requires the matching class, equipped tool and
current attempt; duplicate or late results cannot award products or experience.
Failed material/result saves are rejected. Acceptance and retry persist the
commission and allowance debit in one transaction; a failed transaction retains
the previous balance and commission. Abandonment removes the journal entry only
after its database removal succeeds.

Requested Items now uses the commission's exact resolved recipe, independent of
the ordinary inventory and ingredient-based recipe chooser. The test harness
executes the production Lua flow through Requested Items, recipe confirmation,
synthesis, Continue, cancellation, failure and retry, with UI and inventory
services stubbed. It also checks both journal action codes through production
retry state and verifies no EXP is awarded when a result cannot be saved.

The local table requires its existing `questData` column. The table's SQL now
includes an idempotent upgrade for older installations lacking that column; the
server rejects unsavable local state rather than accepting progress that would
be lost on reconnect.

The separate [database harness](../tools/local-guildleve-integration-tests/README.md)
executes production persistence and inventory code against a disposable MySQL
schema. Its 54 assertions cover migration, progress saves, allowance transactions,
delivery rollback, duplicate/concurrent submission, inventory planning,
completion EXP and merits, and completion-history reload. The focused C#/Lua
harness passes 118 assertions. These checks do not exercise a networked client.

Delivery commits reward stacks, durability, configured gil/EXP/merits, completion
history and commission removal together. Random reward selection is saved before
delivery so failed inventory checks and reconnects cannot reroll it. Completion
flags now load from real history; regional history exchanges preserve them.

The connected client walkthrough and exact historical currency/completion-EXP
values remain outstanding. Reward support does not imply that missing historical
values have been recovered or seeded. The current performance-300 bonus chance
remains an explicitly documented estimate.
