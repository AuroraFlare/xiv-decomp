# Local guildleve catalog and offer audit — 2026-09-07

The commission catalog is complete against the recovered client and the dated
archive. The publisher's offer selection is reconstructed with two native-menu
fixes applied on 2026-09-25: stable eight-card slots are preserved while
filtering, and full inventories can reach the native return-one flow. Seeing
only A Mother's Booties at low leatherworker levels is still useful evidence of
the unresolved retail rotation/rank-band problem; it does not mean Gridania
only has one leatherworker commission.

The catalog and player-state SQL were not changed by the follow-up. The Lua
publisher and its audit fixture were changed; the running server was not
restarted.

## Catalog coverage

All eight public [eLeMeN class pages](http://elemen.sakura.ne.jp/ff14_dated_archives/guildleve/local/index.html)
were fetched again and joined to the SQL. Their SHA-256 hashes match the
[existing archive](elemen-local-guildleves/README.md): 152 commissions, four
variants each, and the same 21 documented individual-cell discrepancies.
The recovered `passiveGL_craft.csv` and SQL both contain the same 169 IDs;
17 have class 1 and are outside the published crafting catalog. They are not
17 additional missing crafting commissions.

The executable publisher arrays, rather than their descriptive comment, were
checked against every SQL commission, city, and crafting class. No missing,
duplicate, or misplaced IDs were found. The validator now enforces this.

| Craft | Limsa Lominsa | Gridania | Ul'dah | Total |
|---|---:|---:|---:|---:|
| Carpenter | 5 | 9 | 5 | 19 |
| Blacksmith | 9 | 5 | 5 | 19 |
| Armorer | 9 | 5 | 5 | 19 |
| Goldsmith | 5 | 5 | 9 | 19 |
| Leatherworker | 5 | 9 | 5 | 19 |
| Weaver | 5 | 5 | 9 | 19 |
| Alchemist | 5 | 5 | 9 | 19 |
| Culinarian | 9 | 5 | 5 | 19 |
| **Total** | **52** | **48** | **52** | **152** |

The running Map Server loaded 169 passive rows. A read-only query of its
database on port 3308 found all 169 rows identical to the checked-in SQL,
including every column. Missing imports do not explain the symptom.

## Gridania leatherworker

These are the four recommended levels stored on each commission. A single
commission name can request different products, amounts, and rewards depending
on its selected variant.

| ID | Commission | Variant levels |
|---:|---|---|
| 120204 | A Mother's Booties | 1 / 1 / 1 / 1 |
| 120214 | Strapped for Straps | 5 / 15 / 25 / 40 |
| 120215 | Fire and Hide | 10 / 15 / 30 / 45 |
| 120216 | Choke Hold | 15 / 25 / 35 / 45 |
| 120224 | Work of Friction | 20 / 30 / 45 / 50 |
| 120230 | Hungry Like the Wolves | 45 / 45 / 45 / 50 |
| 120238 | Back in the Harness | 10 / 10 / 40 / 45 |
| 120246 | Morbol Measures | 45 / 50 / 50 / 50 |
| 120248 | Harnessing Help | 40 / 45 / 50 / 50 |

The live character's leatherworker level was 3 during the final check. The
server's current acceptance policy permits offers up to that craft's level + 5,
so the level-5 Strapped for Straps variant passes that policy. Instead, the menu
puts this ID in card slot 2, which selects its level-15 variant; that variant
fails the gate until leatherworker level 10. This explains the single-offer
result. A repeat A Mother's Booties was active, and its previous completion at
`2026-09-07 13:37:54` remained in history.

## Publisher defects

1. **Rank bands use array length, not variant level.** A nine-entry craft list
   is sliced into groups of 4 / 3 / 2. For example, the Level 20 selection can
   contain the level-10 Back in the Harness, and the Level 1 selection can
   contain the level-45 Choke Hold. These are not functioning level bands.
2. **Stable card packing is now corrected.** Client bytecode confirms that
   slots 1–8 select variants `1,2,3,4,1,2,3,4`; zero IDs represent empty slots,
   and the returned selection is the original slot. The publisher now keeps
   zero placeholders, calculates difficulty from the original card slot, and
   passes all eight entries to the native widget. A full-slot offer remains
   visible so the native return-one dialog can run at acceptance time.
3. **No offer refresh/rotation is implemented here.** The selector still has only a
   static catalog and the current level/active-state filter. The official
   [patch 1.19 notes](https://forum.square-enix.com/ffxiv/threads/24910-patch1.19-Patch-1.19-Notes)
   describe offer-list updates after allowance grants, completion, and failure.
   The historical selection weights and seed are not recovered. Restoring
   selection needs to keep the native eight-slot variant mapping; compacting
   IDs or assigning the rank choice as the difficulty would be incorrect.

The new diagnostic executes the **production Lua selector** for all three
cities, all eight crafts, crafting levels 1–50, and all three rank choices:
3,600 menus. With no active commissions it observes all 152 names in a
deterministic slot snapshot, with the native slot/zero contract preserved. It
does not demonstrate all 608 variants because the retail offer refresh/rotation
seed is not recovered. A full-slot fixture now still exposes eligible offers,
and a focused fixture verifies that filtering slot 1 leaves a later offer in
slot 2 instead of compacting it.
The diagnostic stubs the player/UI services and uses the level + 5 policy read
from `Player.CanOfferPassiveGuildleveForLevel`; it does not run a game client.

## Other implementation checks

| Area | Evidence and conclusion |
|---|---|
| Supplies and contact NPCs | All 64 pickup and 88 acceptance-supplied commissions have hooked, spawned contacts. All 26 distinct clients are covered. |
| Synthesis data | All 608 variants resolve a recipe for the assigned craft with enough yield within the attempt limit. The 109 duplicate-output cases pass the recipe-selection audit. |
| Journal | All 152 destination markers and client dialogue references resolve. Shared journal progress/map handlers exist. |
| Craft state, retry, abandonment | The existing production-state/Lua harness passes 118 assertions, including Requested Items, attempt reservation, success/failure, retry, cancellation, and persistence behavior. |
| Delivery and persistence | The production-assembly database harness passes 54 assertions against a disposable MySQL schema, including rollback, stale state, concurrent delivery, inventory, EXP, and history handling. |
| Build | Isolated current-worktree integration build succeeds, with 0 errors and 5 existing warnings. Nothing was deployed. |
| Connected-client evidence | The user completed A Mother's Booties; persisted completion was reconfirmed. This does not verify all 152 quests individually, the second supply family, or every client interruption/reconnect scenario. |
| Historical rewards | Exact missing gil/completion-EXP values and the estimated performance-300 reward probability remain reconstruction work, as already tracked. |

The shared quest implementation supplies the behavior for the catalog; each
commission does not require a separate Lua quest script. The main newly
identified functional gap is offer selection, rather than missing commission
records. Passing data and state tests must not be described as proof that all
608 variants can currently be accepted from the publisher.

## Reproduce

```powershell
python -B tools/validate_local_and_fieldcraft_guildleves.py
dotnet run --project tools/local-guildleve-tests/LocalGuildleveTests.csproj --no-restore -p:UseSharedCompilation=false
dotnet run --project tools/local-guildleve-tests/LocalGuildleveTests.csproj --no-restore -p:UseSharedCompilation=false -- --audit-publisher
```

The last command emits JSON with observed variant counts and representative
Gridania menus, while failing on a broken eight-slot or filtered-card mapping.
It is still not a passing availability test for all 608 variants because the
retail offer refresh/rotation seed remains unrecovered. Database harness
instructions remain in
[its README](../tools/local-guildleve-integration-tests/README.md).
