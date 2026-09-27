# Seasonal reward services — implementation and evidence

This pass replaces the remaining read-only seasonal exchange scaffolds with
server-owned item recipes and explicit event profiles. It does not establish
live-client acceptance or recover every original server rule. The population
manifest and coverage limits are in [seasonal profiles](seasonal_profiles_2026-09-26.md).

## Implemented services

| Service | Implemented behavior | Evidence boundary |
|---|---|---|
| Hatching-tide 2011 | One active city Gospel; recurring Dreamer eggs; real egg requirements for Gospel completion; four cap recipes and all-twelve Chocobo cap exchange in Dilemma | Native Spl0g1/g2, Spl0l1/l2, Spl0u1/u2; initial distribution weights and ten-Eorzea-day cadence are reconstructed |
| Hatching-tide 2012 | Native six-egg selector; four ring recipes; four cap recipes; one Motley Egg substitution; an owned cap becomes one Odd Egg | Native Spl101 selector/text plus contemporary player reports; unknown daily secret sets are retained rather than consumed |
| Moonfire 2011/2012 | Exact server-side ash recipes, gendered uniforms, durable per-piece starter flags and repeat exchanges | Native reward-widget data; readable server menus replace damaged decompiler selector branches |
| Heavensturn 2011 | Bell gifts: Usagi Kabuto, Raw Urushi, Fish Stock | Historical gift identities; equal weights and single-unit material lots remain authored |
| Valentione 2011 | Powdered Sugar from bells | Historical eight-hour accrual, maximum six held gifts |
| Little Ladies' Day 2011 | Peach Branch/Powdered Sugar from bells | Gift identities supported by historical records; weighting and lot size remain authored |
| Foundation 2011 | Recruitment speeches, company tracer/choker shop and one 1,000-seal HQ gift per eligible company | Native company shop rows and contemporary event guide |
| Foundation 2012 | Speeches, ten company prisms per UTC day, one 5,000-seal HQ gift, four crystals→1,000 seals or one cluster→3,000 seals | Native Spl000/Cryer/Officer plus contemporary guide; current membership and rank cap enforced |

Valentione 2012, Little Ladies' Day 2012 and Heavensturn 2012 have separate
production-backed handlers documented in
[the event services report](valentione_2012_runtime_2026-09-26.md).
Moonfire encounter and mortar details are in
[the Moonfire report](moonfire_quest_runtime_2026-09-25.md).

The new database files are main SQL:

- `Data/sql/characters_seasonal_gifts.sql`: shared/per-source distribution clocks
  and one-time Foundation gifts. Import never drops existing character state.
- `Data/sql/characters_seasonal_bell_gifts.sql`: separate character/event bell
  stock, initially one gift, accruing every eight real hours up to six.

The runtime can create these same tables if absent. This convenience does not
replace the main SQL updater. No live database was updated by this pass.

## Transaction and interaction rules

`SeasonalRewardCatalog` contains item IDs, quantities and costs; a client-returned
price, item count, gender, company or event mode is never accepted as authority.
The native Hatching selector's patterned ID, all five color counts and Motley
selection are independently checked. Cancelled, fractional, negative, malformed
or unknown selections cannot consume items.

`SeasonalExchange` validates all costs and reward capacity before any debit,
verifies each debit, and compensates earlier debits if a later step fails.
Unique ownership and normal inventory capacity are respected. An owned 2012
cap deliberately resolves to an Odd Egg before capacity validation; owned rings
do not. Starter uniforms persist each delivered piece before marking the bundle
complete, so discarding one piece cannot farm copies during a partial retry.

Player methods additionally require a connected, non-superseded session, a live
NPC that owns the current event in the same area, an eight-yalm horizontal and
five-yalm vertical interaction envelope, the named event flag, and the relevant
accepted/completed quest. These distance gates are server policy, not recovered
retail distances. Foundation crystal and HQ claims also check company eligibility
and the existing rank-based seal ceilings.

Distribution reservations are serialized in MySQL and survive logout/restart.
Normal failed inventory grants refund their reservation. **Inventory mutation
and reservation are separate database operations:** process termination between
them is not an atomic transaction and can lose a pending gift. Do not describe
this layer as crash-atomic delivery. SQL failures are logged and do not silently
pretend a grant succeeded.

## Source reconciliation

The native `Spl101` text distinguishes fixed ring recipes from daily secret sets.
A [March 2012 player report](https://forum.square-enix.com/ffxiv/threads/41246-Secret-Egg-Combos-%21-%28Hatching-Tide-Event%29)
records the ring combinations, the owned-cap→Odd-Egg replacement, three Odd Eggs
for the Chocobo ring, and the shared outdoor Motley claim. It also identifies
the nightly firework colors as the daily combination hint. That report does not
recover the entire consumable reward table or the client's seeded RNG.

The [2012 Foundation guide](https://wikiwiki.jp/ff14n/イベント/2012グランドカンパニー決起祭)
specifies company-only prism/exchange booths, ten prisms at a 09:00 Japan reset,
and the 5,000-seal HQ gift, including provisional membership in all three
companies. These details refine the generic native text's daily wording.
The [2011 guide](https://wikiwiki.jp/ff14n/イベント/グランドカンパニー復古祭)
records the earlier 1,000-seal gift and the tracer bundles. The choker price here
follows the surviving native company shop row (1,000), not that guide's ambiguous
table entry.

Historical bell sources include the Heavensturn footage linked by
[XIV Legacy](https://www.tumgik.com/xivlegacy),
[Valentione 2011](https://ffxiv.consolegameswiki.com/wiki/Valentione%27s_Day_%282011%29),
and [Little Ladies' Day history](https://www.the-memorists-path.com/little-ladies-day).
Crafted Black/Silver Usagi Kabuto are not inserted into the bell gift pool.

## Verification and open client work

`tools/seasonal-reward-tests` links the production recipe, exchange, company shop
and bell-clock rules. It tests every recovered offer, every missing ingredient,
full/unique/error admission, later-debit compensation, failed-grant refunds,
Motley substitution, duplicate caps, malformed selectors, stock cap/boundaries,
clock rollback, reload continuity, company/rank/mode rejection, native-shop
cancellation, and Gospel progression. It also parses the affected Lua files.

Run:

```powershell
dotnet run --project tools/seasonal-reward-tests --no-restore
dotnet build 'Map Server/Map Server.csproj' --no-restore -m:1 -p:OutputPath=.codex-build/seasonal-20260926/
python -B tools/mobspawns/seasonal_event_placements.py check
python -B tools/validate_quest_availability.py
python -B tools/validate_seasonal_event_runtime.py
```

Client acceptance must cover native dialogue/menu returns, all city roles,
inventory-full retries, unique items, logout/reentry, waiting gifts, daily reset,
party/target ownership where applicable, field encounter presentation and
recorded-floor contact. A successful build or simulated inventory test is not
a live reward or presentation result.

The egg-pot actor/state binding and daily secret-set schedule were still being
recovered when this report was written. The Chocobo ring recipe exists in the
catalog but is not evidence that the native pot objective is wired. Unknown
selectors remain non-consuming. Broader Seventh Umbral story/invasion content
is distinct from the annual seasonal reward services; its mode-20 compatibility
switch alone does not implement those encounters.
