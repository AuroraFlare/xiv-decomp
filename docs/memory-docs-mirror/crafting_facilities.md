# Crafting facilities: recovered presentation and support

The NPC facility options now confirm a price, charge gil, and grant the native
Synthesis Support status for one hour. The crafting start window receives the
facility ID appropriate to the player's current class. Purchasing support does
not collect leve materials; that remains a separate, explicitly selected leve
interaction with the journal's named contact.

## Enabled providers and behavior

| Providers | Support | Price |
|---|---|---|
| Nahctahr, Ayled, Mimina at the three starter camps | Common, all eight crafts | 200 gil |
| City repairers, actor classes 1500114–1500116 | Common, all eight crafts | 200 gil |
| Eight crafting guild shopkeepers | Common / guild / master, for that guild's craft | 200 / 400 / 1,000 gil |

Guild actors are 1600017 (CRP), 1001458 (BSM), 1000163 (ARM), 1600040 (GSM),
1600018 (LTW), 1600041 (WVR), 1600039 (ALC), and 1000159 (CUL). Other camp fee
schedules have not been recovered and remain unavailable. The guild prices
retain the repository's pre-existing menu values; these values and the city
200-gil fee are reconstruction defaults, not newly established 1.23b prices.

One support status is active at a time. An explicit new purchase replaces it
and refreshes its timer. Guild support is displayed only for its craft; common
support follows the currently equipped crafting class. Expired support returns
no facility even before the next status update. Persistence uses the server's
existing remaining-duration status system, including its pause while logged out.
Zoning and changing classes do not discard the stored support.

The city repairer's native second main-menu branch now purchases facilities.
It previously called `RepairAllNpcItems`. Repair-all remains available inside
the repair submenu and continues to use its existing confirmation dialogue.

The server quotes the price before confirmation and consumes each quote once.
Purchase rechecks the current nearby NPC, provider, tier, available gil and
status capacity. Payment and support persistence commit in one MySQL transaction;
a failed save preserves the old support and balance. No material items or leve
allowances are involved.

## Evidence and limits

- `docs/Dat Mining/xtx_facility.csv` names facilities 10001–10024, three tiers
  for each of classes 29–36.
- `docs/Dat Mining/status.csv`, row 230001, contains the 3600 duration;
  `xtx_status.csv` identifies Synthesis Support. Client status work uses 30001.
- Recovered `PopulaceShopSalesman`, `PopulaceCampSubMaster`, and
  `PopulaceItemRepairer` functions provide facility selection and gil
  confirmation. Native `CraftJudge.start` accepts the active facility; existing
  -1/-2 menu sentinels remain intact.
- The [2010 guide](https://doczz.net/doc/3554771/1-final-fantasy-14-mastery-guide)
  also distinguishes immediate and pickup materials, identifies starter-camp
  support, and permits spare leve synthesis attempts after meeting the quota.
  The commission system already supports those spare attempts. Its old reset,
  rank, reward and synthesis advice should not be copied as 1.23b balance.
- Square Enix's [1.19 recipe-revision announcement](https://forum.square-enix.com/ffxiv/threads/276)
  removes facility requirements from new recipes while temporarily retaining
  old recipes. It does not supply a universal 1.23b facility bonus formula.

At the user's request, this restores purchases, timed support and the active
facility display without adding a speculative success/quality bonus or recipe
penalty. The sparse recovered `facility.csv` does not establish those formulas.
The recipe confirmation's recommended-facility field remains unimplemented.
This is therefore a restoration of the service and presentation, not a claim
that all historical facility mechanics or every provider are complete.

## Verification and installation

Run from the repository root:

```powershell
dotnet run --project tools/crafting-facility-tests/CraftingFacilityTests.csproj
dotnet run --project tools/local-guildleve-tests/LocalGuildleveTests.csproj
python -B tools/validate_local_and_fieldcraft_guildleves.py
dotnet build tools/local-guildleve-integration-tests/LocalGuildleveIntegrationTests.csproj --no-restore -m:1 -o .codex-build/crafting-facilities
dotnet .codex-build/crafting-facilities/LocalGuildleveIntegrationTests.dll
```

The facility harness links the production provider policy and Player purchase
code with world/status/database fixtures and executes the three real Lua NPC
entry points. The integration harness uses actual production SQL methods in a
disposable local MySQL schema. It never uses the configured live schema.

For an existing installation, the incremental status definition is
`Data/sql/server_statuseffects_synthesis_support.sql`. The ordinary status seed
includes the same row. A built-in fallback also allows the status to load on
older databases without running the full status seed. No new player table or
column is required.

Builds and automated tests are isolated from the running server. No live
database migration or server restart was performed. Client verification remains:
select Manine's leve before supplies, cancel to reach ordinary services, buy
support from Ayled, inspect the status and crafting facility name, test a guild
tier and declined purchase, then check expiry and reconnect behavior.
