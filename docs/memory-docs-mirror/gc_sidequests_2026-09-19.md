# Grand Company 301/302 sidequest implementation

This pass implements the six requested level-25 Grand Company sidequests and
repairs the shared field-survey lifecycle. It does not enable any offer or
perform a live database update.

## Implemented routes

| Quest | Recovered route contract | Local implementation |
|---|---|---|
| 111417 Gcl301, The Cove | Clifton; six dart slugs; anti-venom item menu; 30-minute operation | Six exact owned slugs in a private battle. The single quest token is an authored reusable representation of the journal's uncounted several doses. Slug poison uses the existing Slug skill family. |
| 111418 Gcl302, Saving the Stead Instead | Hasthwab; four named pirates; kill all kobolds | Four named pirates use their native actor identities. Four Kobold/Gnole-path attackers and their compact formation are authored because the count, numeric variant and homes were not recovered. |
| 111617 Gcg301, Eternal Recurrence | Dyrstbrod; collect three leather scraps; put guarding dreadwolves to sleep | Three exact private scrap receipts and three exact Wolf-path guards. Three finite sleeping-agent charges are authored to match the authored three-guard formation. Killing guards never clears the objective. Each corresponding guard must have a saved sleep receipt before its nearby owned scrap can be collected. |
| 111618 Gcg302, The Pen Is Mightier Than the Spear | Dhemdaeg; one forest beast; Challinie sketch; return | One compatible Fly/Gnat-family target, then native Challinie dialogue and a saved sketch-delivery checkpoint before return. The lost exact monster binding and numeric tuning remain authored. |
| 111817 Gcu301, Prying Eyes | Lefchild; Omnomite lure; thirty coblyns; a surviving coblyn enrages and yields one Prismatic Eye | Omnomite use at the exact public marker is mandatory. Twenty-nine ordinary coblyns appear in five authored waves, followed by a lone enraged thirtieth carrier. The eye-earned and full-clear receipts precede delivery, so a full inventory retries without granting thirty Cobalt Eyes or accepting an early carrier kill. |
| 111818 Gcu302, Different Strokes | Galeren; Cotter; Hungry Dreadwolves; Westin and three Beastcleavers; return | Cotter moves sequence 0 to 5, four authored Hungry Dreadwolves form the private fight, and Westin moves sequence 15 to 20. The count and exact Hungry Dreadwolf numeric variant are unrecovered; actor 2201412 is the reviewed compatible Wolf variant. |

All battle callbacks reconcile the exact actors allocated to the owner-only
private area. Foreign same-class deaths, duplicate death callbacks, stale quest
data, replacement sessions and changed areas cannot advance the route. Every
yielding ordinary dialogue snapshots quest data, sequence, session and area.
Reward checkpoints save the 300-seal and 1,891-EXP grants independently, and
earned item receipts survive a refused inventory delivery.

## Placement and data scope

The native X/Z markers come from matching old quest families in
`docs/Dat Mining/quest_marker.csv`. Direct accepted standing captures provide
the Gcl301, Gcl302 and Gcu301 public trigger heights. Frozen walking recordings
support Gcg301, Gcg302 and Gcu302. The Rootslake consumer excludes rejected
nodes 3651-3668; the Cove consumer excludes node 3645; Western Thanalan excludes
node 8845. Every private target now has an explicit Y selected from the named
frozen recording. Formation X/Z, facing, missing counts and numeric combat
tuning remain authored and are not claimed as recovered retail actor XYZ.

`Data/quest_npcs/gc_sidequests_20260919.json` records the sources, reserved IDs,
public spawns, actor repairs and authored profiles. The paired
`tools/build_gc_sidequests.py` builder validates source hashes and reserved-ID
collisions, repairs the canonical blank native actor-class tuples, and writes
the four required main SQL blocks. It leaves availability disabled and never
writes a live database.

The three Gcg301 pickup actors reuse the existing invisible survey-objective
appearance with a `pushDefault` interaction circle. The native visible leather
scrap model was not recovered, so this is a functional presentation substitute.
Challinie retains her recovered actor class. Westin, Salpa Hazalpa, Goodwife and
Sailmet use their recovered actor and appearance rows; only Westin has native
field marker X/Z, while the other three use an authored formation on exact
frozen walking nodes.

## Survey lifecycle repair

The shared Gcl304/Gcg304/Gcu304 helper now verifies item ownership after the
void `Character.AddItem` call, saves every objective receipt before yielding,
and blocks the report transition until all earned evidence is actually
delivered. Re-entering an already flagged final object repairs a missing item.
Completion dialogue snapshots quest, sequence, session and area, and currency
and EXP use the existing one-time checkpoints. Gcl304 passes `(completed,total)`
to its progress method. Gcu304 retains Tears of Nymeia item 11000412 and its
rank-23 client dialogue behavior. The generic survey remains cross-company;
Gcg304 behavior is covered by the same regression cases.

Gcl304 and Gcu304 still depend on the unrequested Gcl303 and Gcu303 scaffolds in
the main quest table. Tests stage those surveys directly. This pass does not
bypass their natural prerequisites.

## Client staging reference

Apply the matching main SQL and Lua on a disposable test character before using
these commands. `!questcomplete ID 0` force-adds the disabled quest at its first
post-acceptance step; it does not validate offer eligibility or the original
accept response. Remove or finish one staged route before starting another.

| Route | Stage | First contact | Objective marker |
|---|---|---|---|
| Gcl301 | `!questcomplete 111417 0` | Clifton: `!pos 230 -618.030000 4.550000 353.030000` | `!pos 129 -1653.540039 4.748240 -896.000000` |
| Gcl302 | `!questcomplete 111418 0` | Hasthwab: `!pos 230 -778.320000 16.350000 383.490000` | `!pos 130 1578.199951 26.221149 -1169.000000` |
| Gcg301 | `!questcomplete 111617 0` | Dyrstbrod: `!pos 206 106.660000 22.000000 -1483.730000` | `!pos 152 -1348.000000 31.745052 -2112.000000` |
| Gcg302 | `!questcomplete 111618 0` | Dhemdaeg: `!pos 206 183.880000 27.500000 -1577.740000` | `!pos 154 1637.339966 0.005210 1217.260010` |
| Gcu301 | `!questcomplete 111817 0` | Lefchild: `!pos 209 -127.240000 200.200000 267.510000` | `!pos 172 -1118.000000 59.283302 -99.000000` |
| Gcu302 | `!questcomplete 111818 0` | Galeren, then Cotter: `!pos 209 -195.890000 194.500000 193.410000`; `!pos 175 -1.050000 196.000000 125.874000` | `!pos 171 1850.000000 263.950230 -897.000000` |

At a battle marker, walk outside and back through the trigger after staging.
Use the quest items from the normal staged state: anti-venom on poisoned slugs,
one sleeping-agent charge on each exact Gcg301 guard before its nearby pickup,
and the Omnomite lure at the Gcu301 marker. After Gcg302, talk to Challinie at
`!pos 154 1657.750000 -0.661125 1236.609985`. After Gcu302, talk to Westin at
`!pos 171 1866.000000 264.933170 -897.000000`. `!quest info ID` records the
saved sequence; `!quest ID remove` clears an unfinished staged route.

For survey retry checks, force-stage sequence 0 and talk to the field sergeant:

| Survey | Stage | Briefing contact | Three objective positions |
|---|---|---|---|
| Gcl304 | `!questcomplete 111420 0` | Kurtz Nolan: `!pos 135 -298.500000 77.560000 -2271.470000` | `!pos 137 -316.076000 -2.174000 195.373000`; `!pos 137 -383.500000 -2.250000 63.500000`; `!pos 137 -255.500000 -2.312000 126.500000` |
| Gcg304 preservation check | `!questcomplete 111620 0` | Liflin: `!pos 143 214.897000 301.481000 -234.593000` | `!pos 143 512.760000 310.000000 -155.430000`; `!pos 143 588.180000 310.990000 -126.310000`; `!pos 143 656.180000 294.590000 36.390000` |
| Gcu304 | `!questcomplete 111820 0` | Fouillel: `!pos 174 1703.790000 296.000000 999.421000` | `!pos 174 2134.850000 296.510000 1025.590000`; `!pos 174 2180.350000 298.720000 1006.150000`; `!pos 174 2225.210000 301.820000 982.970000` |

The force-stage survey path bypasses Gcl303/Gcg303/Gcu303 and ordinary rank and
company admission. Use it only for lifecycle, inventory-retry and presentation
checks; natural reachability remains unverified for the unrequested scaffolds.

## Validation

Run the focused and existing runtime suite after the coordinated single call to
`RunGcSidequestTests()` in `Program.Run()`:

```powershell
dotnet run --project tools/grand-company-runtime-tests/GrandCompanyRuntimeTests.csproj
```

Validate the reproducible main-SQL layer with:

```powershell
python tools/build_gc_sidequests.py check
```

The focused fixture covers all six recovered offer methods and target counts,
and drives the shared Lua battle runtime through thirty allocated mock coblyns:
no early win through twenty-nine kills, a lone wave-six carrier at kill thirty,
and a saved full-clear receipt before inventory retry. It also covers finite
sleep charges, stale/far wolf rejection, near owned scrap collection, Gcg302
sketch delivery, both Gcu302 handoffs, foreign session/area continuation
rejection, and briefing/evidence/completion retries across all three survey
variants. This does not exercise live C# actors or establish client rendering,
combat balance, item animations or full quest playthrough acceptance.
