# Cutter's Cry Guard healing: source review and scoped correction

The 1.x Myrmidon Guard heals the Myrmidon Princess. That recipient is supported
by a newly found contemporary first-person account. The precise action variant,
potency, cadence, affected area and cleansing recipient remain unresolved.

## Period evidence

In [Tanking Adjustments – PLD/WAR, page 4](https://forum.square-enix.com/ffxiv/threads/41830-Tanking-Adjustments-PLD-WAR?p=681847&viewfull=1),
Aceofspades's April 12, 2012, 07:09 post #33 describes testing party endurance by
deliberately prolonging the Princess encounter. The relevant clause
is “let the guard heal her each time it spawns.” Enfarious quotes that post in
#34 at 07:36. This directly identifies the Guard and Princess rather than merely
mentioning unspecified heals. The browser search index returned the original
post and quotation; direct page opens failed with cache/access errors. This is
textual testimony, not newly viewed footage or a combat-log measurement.

[Erwald's March 17 guide, edited April 4](https://forum.square-enix.com/ffxiv/threads/40090-Le-Gouffre-Hurlant-Soluce-Tips-attention-Spoil)
independently describes Guards arriving once a minute and using substantial
heals. Its Marshal paragraph describes a smaller self-heal and a cone. The
guide alone did not identify the Guard's recipient; the April account closes
that specific gap. Neither source names a command ID or establishes an ARR
Marshal tether. Those later mechanics were not used.

## Native and local binding audit

[The native-row record](../Data/raidroutes/evidence/cutters-guard-healing-20260926/native-command-review.json)
retains all raw columns of commands 23229 and 23560 and hashes the inspected
client extracts and binding files.

| Evidence | Finding and limit |
| --- | --- |
| `AI Scripts/command.csv` | Both rows are Formic Pheromones, Japanese フォーミックフェロモンズ. Both have range 12 at raw CSV index 65, MP 0 at 115 and TP 1000 at 116. The existing command importer identifies these columns. |
| Variant difference | Apart from ID, only raw index 85 differs: 28800 for 23229, 3600 for 23560. Its meaning is unresolved here; it is not treated as healing amount, target mask, radius or a role assignment. |
| Target metadata | The sparse `Data/command.csv` and `docs/Dat Mining/command.csv` do not recover recipient/shape semantics. The imported server's broad target masks and later self-target overlay are reconstruction, not an authoritative Guard target contract. |
| Actor classes | Guard is 2303002 / BNPC 3161; Princess is 2303003 / BNPC 3073. The main actor-class table binds Guard to `TermiteStandard`, Princess to `TermitePrincessStandard`; no raid skill list is present there. |
| Push commands | `gamedata_actor_pushcommand.sql` has no rows for actors 2303001–2303007 and no 23229/23560 binding. Push commands are not an enemy AI rotation. |
| Recovered raid Lua | `TermitePrinceRaidW0D5`, `TermitePrincessRaidW0D5`, `TermiteSoldierRaidW0D5`, `TermiteSoldierRaidW0D5B`, and `TermiteWarriorRaidW0D5` only require `TermiteBaseClass` and define the class. The base and director facades expose no Guard heal target or skill call. |
| Current skill lists | Kit 5004 was assembled from the Antling family archive. Both Formic variants are included. This does not prove either variant belongs specifically to Guard rather than Marshal or ordinary ants. |
| Existing self-target policy | `tools/build_elemen_move_mechanics.py` classifies the general phrase “restores hp” as a self effect. Its generated SQL changes both Formic rows to self-only, zero range. That generic rule caused the missing Princess recipient. |

The eLeMeN Antling family record describes HP recovery and ailment removal but
does not assign a Guard-specific recipient. It is corroboration of the family
move's effects, not a substitute for the contemporary raid account. No new
action ID, damage value, level, TP supply or repeated healing timer was inferred.

## Implemented scope

`CuttersCryGuardHealing` is bound only when the manager publishes a Princess
reinforcement with the Guard role. It captures that exact Princess, area and
instance. Both native identities, exact area-registry objects, exact instance
membership, living/active lifetimes, Princess-add membership and the current
Princess assignment must remain valid. Victory/failure cleanup, Princess defeat,
despawn, same-ID replacement, transfer or return-to-spawn invalidate the link.

When normal AI selects either existing Formic command, the target resolver uses
the captured Princess. Admission and execution each use an isolated command
copy with an allied single-target profile and the recovered 12-yalm range.
Ordinary range/height, TP, MP, recast and action-state checks still apply. A ready
support cast does not wait for melee reach of the Guard's hostile opponent.
Its threat target, other attacks and ordinary AI movement remain independent.

The shared command cache and main SQL are unchanged. The existing Lua handler
performs the actual heal on the resolved recipient. Existing caster cleansing
is retained because these sources do not identify the Princess as a cleansing
recipient. The supported change is healing direction; single-target selection
and preservation of both variants are explicitly bounded reconstruction choices.
Heal magnitude, cadence and area are not claimed as verified retail behavior.

Admission rejects a foreign Princess even if its actor class and BNPC match.
Cast startup rechecks the same ownership, and normal interruption plus the
completion boundary reject death/removal/replacement between those stages.
Surviving Guards retain offensive behavior after Princess death; no self-heal
fallback silently substitutes another recipient for the bound Formic action.
Ordinary unbound Guards, Princess, Marshal and other ants keep existing behavior.

## Verification

`CuttersGuardHealingChecks.cs` extends the real SQL-backed dungeon integration
fixture. It checks both actual Formic completions through normal AI, injury to
the Princess only, unchanged global profiles, ordinary Guard/self and offensive
targets, resource/recast/range/floor rejection, and lifecycle changes separately
between selection, startup and impact. The combined disposable-database pass
completed **2,976 checks**, all 36 main-SQL dungeon profile joins and 107 command
startup bindings. It observed exactly the two timer and six achievement failures
deliberately injected by the existing fixture, with no unexpected Error/Fatal
logs. The tested output is `.codex-build/cutters-guard-healing`; the disposable
database stopped normally and retained diagnostics under
`.codex-build/legacy-raid-db/0f45714a4ebf47ed8bfd4553dda61e84`.
No live client or game server was started by this change.

Because the hooks touch shared command admission and completion, final integration
also needs the existing legacy spawn, combat/aggro and Garuda geometry suites.
These checks do not establish natural TP cadence, a complete Princess fight,
client effect targeting or live-client acceptance.
