# Level 1 / 10 / 20 battlecraft implementation audit

Checked on 2026-09-09 against the current encounter scripts, publisher packs,
SQL catalog, shared encounter engine and saved eLeMeN archive.

## Repair follow-up

The confirmed gaps below were subsequently repaired at the user's request.
**All 72 ordinary level-1/10/20 encounter configs now load.** 12468 implements
Firefly collection, paid Reveal and two Imp pairs. The five Skull Valley chases
and the second 11645 retreat are implemented. See the
[repair report](guildleve_low_level_repairs_2026-09-09.md) and
[seven encounter previews](maps/guildleve-low-level-fixes-20260909/index.html).

The remainder of this audit records the **pre-repair findings**. The three
Bentbranch/Emerald Moss differences remain capture-versus-archive observations;
their existing captured layouts were preserved, as were 12461–12467 and the
separate tutorial availability question.

## Scope and coverage

This audit covers the **72 ordinary regional battlecraft leves**, eight per
city at each of levels 1, 10 and 20. Tutorial variants, dummy catalog rows,
faction/company contracts, fieldcraft and local crafting leves are separate.
Presence of a script is not proof that every archived mechanic is implemented.

| Tier | Encounter scripts that load | Missing ordinary encounter |
| --- | ---: | --- |
| Level 1 | 24 / 24 | None |
| Level 10 | 24 / 24 | None, but chase mechanics have gaps below |
| Level 20 | 23 / 24 | 12468 — Leaders of the Pack, Camp Tranquil |

All 71 existing configs were loaded through MoonSharp and checked for nonempty
waves and a complete initial marker. This was a structural audit, not a complete
playthrough of all 71 encounters.

## Definite missing encounter: Camp Tranquil

**12468 — Leaders of the Pack** is present in the
[publisher's Tranquil offer pack](../Data/scripts/base/chara/npc/populace/PopulaceGuildlevePublisher.lua)
and [SQL catalog](../Data/sql/gamedata_guildleves.sql), but there is no
`Data/scripts/directors/Guildleve/Leves/12468.lua` and no explicit mob-spawn rows
for it in the checked guildleve spawn seeds.

The saved [Gridania archive](elemen-regional-guildleves/battlecraft-gridania.md)
describes firefly pairs supplying Evenfall Fireflies, use of **Reveal**, and
finding two correct disguised pteroc pairs that transform into imp pairs.
None of that encounter configuration is present. The generic C# mob fallback
can populate objective targets, but does not implement the collection,
disguise selection or Reveal transaction. Its old map-marker seed is also not
a reviewed encounter layout.

The other seven Tranquil leves, **12461–12467**, have captured configurations.
Their existing checks passed in this audit:

- 12461: two initial circles, isolated squirrels and marmot pairs.
- 12462: four doe pairs followed by a reinforcement pair.
- 12463 / 12464: circle progression, missed-drop repetition and completion.
- 12465: seven-kill chase, delayed reinforcements and ten-kill completion.
- 12466 / 12467: all ten disguise selections, either partner revealing the pair,
  double-hit handling, area progression, decoys and complete objective counts.

These tests preserve the user's captured layouts and earlier reviewed choices;
they do not prove every historical version used exactly those placements.

## Existing level-10 scripts with missing chase stages

The following are confirmed differences between the saved objective flow and
the configured runtime. The shared engine only runs a chase when the config
requests one; it does not infer these missing stages from the title or DAT type.

| Leve | Saved encounter flow | Current configuration |
| --- | --- | --- |
| [10884 — Burning Down the Houses](../Data/scripts/directors/Guildleve/Leves/10884.lua) | Imp flees during combat, then a wolf pair appears | Imp and both wolves spawn together; no flee course or trigger |
| [10885 — The Swarm](../Data/scripts/directors/Guildleve/Leves/10885.lua) | Two successive survivor retreats with reinforcement pairs | Three ordinary waves; no fleeing survivor |
| [10886 — Send Them Packing](../Data/scripts/directors/Guildleve/Leves/10886.lua) | After five rat defeats, the survivor flees and a puk pair appears | All six rats must clear before the puk wave; no retreat |
| [10887 — Herbicide](../Data/scripts/directors/Guildleve/Leves/10887.lua) | Final initial dodo flees during combat, then another appears | Six kills followed by one spawn; no retreat |
| [10888 — Jellyfish in a Barrel](../Data/scripts/directors/Guildleve/Leves/10888.lua) | After five defeats, the survivor flees before a reinforcement pair | Six kills followed by two spawns; no retreat |
| [11645 — Treasures of the Smallfolk](../Data/scripts/directors/Guildleve/Leves/11645.lua) | Two retreat/reinforcement stages | One retreat followed by all four additional spriggans; the second retreat is absent |

The first five are Skull Valley; 11645 is Drybone. The relevant sources are
[Limsa battlecraft](elemen-regional-guildleves/battlecraft-limsa-lominsa.md) and
[Ul'dah battlecraft](elemen-regional-guildleves/battlecraft-uldah.md).
10887 and 10888 also explicitly label their coordinates provisional.

The earlier shared fleeing rebuild improved configured chases. It did not add
these absent flee stages, so its 27-chase coverage must not be read as coverage
of every chase described in the archive.

## Additional Black Shroud differences to review

These are existing playable configurations with different staging/grouping,
not missing encounter files. Check prior user capture decisions before changing
them solely to match the archive:

- [12421 — Reforesting Bentbranch](../Data/scripts/directors/Guildleve/Leves/12421.lua),
  level 1: all six mobs spawn initially; the archive describes successive mixed pairs.
- [12422 — Crushing Chiglets](../Data/scripts/directors/Guildleve/Leves/12422.lua),
  level 1: four then two mobs; the archive describes three successive pairs.
- [12441 — Foresting Emerald Moss](../Data/scripts/directors/Guildleve/Leves/12441.lua),
  level 10: galagos then chiglets in separate waves; the archive describes mixed parties.

This is a set of observed examples, not an exhaustive list of every lower-level
grouping, drop-rate or historical-version difference.

## Tutorial distinction

[GuildleveTutorial.lua](../Data/scripts/directors/Guildleve/GuildleveTutorial.lua)
explicitly recognizes **10801, 11601 and 12401**. Their lack of numeric encounter
files is therefore not evidence of three missing regular leves. Tutorial ground
placements were not certified by this audit.

The archive also has **10802**, a second My Very First Adventure row. It is absent
from the current tutorial publisher list and explicit tutorial registry. Treat
its intended availability as a separate tutorial/catalog question; it is not one
of the 72 ordinary contracts above. Placeholder `x`/dummy rows likewise must not
inflate the missing-content count.

## Validation and limits

Ran the seven Tranquil encounter checks using
`validate_guildleve_12461.py`, `validate_guildleve_12462.py`,
`validate_guildleve_12463.ps1`, `validate_guildleve_12464.ps1`,
`validate_guildleve_12465.ps1`, and `validate_guildleves_12466_12467.ps1`.
All passed. The 71-config structural load also passed, with 12468 as the sole
missing ordinary config.

No encounter, capture, recording, offer pack or runtime code was changed by
this audit. No new videos or live gameplay were reviewed. Implementing 12468 is
the clearest first task; the six incomplete level-10 chases are a separate batch.
