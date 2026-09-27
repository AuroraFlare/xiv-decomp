# Guildleve evaluation state repair

The user reported blank, unusable guildleves and unexpected completion marks on
another server, initially in Gridania, and subsequently identified Evaluate as
the likely trigger. That server's build, database and client state were not
available for inspection. The report is not a confirmed live reproduction here.

Two shared regional journal defects were repaired in `Player.cs`:

- Ordinary and history-evaluation acceptance now explicitly reset both slot
  flags and publish the ID, done flag and checked flag together. Previously only
  the ID was published on acceptance, leaving client-side slot flags untouched.
- Evaluation now explicitly saves the remaining regional slots after removing
  evaluated plates. Previously persistence depended on compaction moving or
  changing something after the removals. Removing trailing plates or clearing
  every plate could leave the deleted entries in the database, available to
  return on the next login.

These changes apply to Gridania, Limsa Lominsa and Ul'dah through their shared
player code. Local crafting slots remain separate. Existing genuine completion
history is not reset. This is a runtime fix; no canonical SQL data changes or
live migration are required.

Validation:

- Isolated build succeeded with zero warnings/errors on the final build.
- `tools/local-guildleve-integration-tests`: 505 assertions passed against a
  disposable MySQL schema. Added production-code checks cover all-cleared and
  trailing-cleared evaluation persistence; ordinary/evaluated acceptance in all
  eight regional slots using IDs from all three cities; exact outgoing property
  hashes, widths and values; and preservation of local crafting slots.
- `validate_regional_guildleve_offers.ps1`,
  `validate_regional_guildleve_catalog.ps1`,
  `validate_regional_guildleve_gates.ps1`,
  `validate_faction_leve_rules.ps1`, and
  `validate_local_and_fieldcraft_guildleves.py` passed. The faction suite includes
  6,669 compiled rule assertions.
- All 328 IDs in the publisher's regional, tutorial, faction and fieldcraft
  card lists have nonblank English titles in the pinned native
  `docs/Dat Mining/xtx_guildleve.csv` export. Crafting catalog checks separately
  cover 152 commissions and 608 variants.

The title check does not explain the other server's blank entries or establish
that it has the same data/build. Do not claim that symptom is confirmed fixed.
The affected server must rebuild and deploy the updated Map Server code. No
running server or live character data was changed during this investigation.
Retest Evaluate, accept new plates, inspect the journal and log out/in. If blank
entries remain, capture `!guildlevestate` on the affected character or inspect its
`characters_quest_guildleve_regional` rows before choosing a targeted repair.
Do not blanket-clear players' completion history.
