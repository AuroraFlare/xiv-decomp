# Late 1.x crafting reconstruction

Updated 2026-09-10. Runtime: `Data/scripts/commands/CraftCommand.lua`.
Target: the existing 1.23b client, using the 1.21 foundation and 1.22 reforms.
This is a playable reconstruction, not a recovered server formula set.
Client decoding and timestamped footage observations are recorded in
[the follow-up evidence](crafting_client_video_evidence_2026-09-10.md).

## Evidence and precedence

1. [Official 1.21 notes](https://forum.square-enix.com/ffxiv/threads/39024-patch1.21-Patch-1.21-Notes):
   fixed initial durability, HQ assessment and Double Down, Standard/Careful
   durability symmetry, and successful Rapid's zero quality/durability cost.
2. [Official 1.22 notes](https://forum.square-enix.com/ffxiv/threads/43599-patch1.22-Patch-1.22-Notes):
   color logs, failure-triggered recipe-element instability, halved ordinary
   progress gains during instability, diminishing ordinary quality gains,
   independent direct-gain abilities, unaffected Wait, reduced Rapid progress,
   and a five-ability limit. The linked
   [ability list](https://forum.square-enix.com/ffxiv/threads/43599-patch1.22-Patch-1.22-Notes?p=660467&viewfull=1)
   distinguishes Aspect Balance from Elemental Appeal. Its Bold Endeavor
   description was a typo, superseded by the developer correction below.
   Great success is explicitly documented;
   its random probability is still unknown.
3. [Raldo's April 24, 2012 account, post 3](https://forum.square-enix.com/ffxiv/threads/43470):
   approximate action ranges, Careful gains on failure, escalating Wait,
   weighted starting quality, HQ anchors and quality-derived EXP. Its Standard
   failure-cost observation does not establish different outcome-specific costs.
   Direct late footage shows variation within each action's cost range. Its
   pre-1.22 Rapid maximum is not used unchanged.
4. [August 2012 orb discussion](https://forum.square-enix.com/ffxiv/threads/52763):
   archived official stability ordering and a player's proposed color quality
   multipliers. These are community evidence, not server constants.
5. User's pasted reconstruction: zero-durability terminal precedence and the
   distinction between orb color and elemental state. Its pseudocode's omission
   of Careful failure gains is superseded by the period account. Its suggestion
   that no great-success branch was documented is superseded by 1.22.
6. [Developer clarification of Bold Endeavor](https://forum.square-enix.com/ffxiv/threads/44999-Vortex-Totems-and-Headdresses?goto=nextnewest):
   one guaranteed successful step; the initial three-great-success description
   was incorrect. The later client tooltip agrees.
7. [Late crafting footage](https://www.youtube.com/watch?v=RvokR8yT-yg):
   variable costs, partial Standard failure progress, Manipulation +20 above
   100 durability, outcome text, HQ samples, and quality-derived EXP. See the
   timestamp table in the follow-up evidence.
8. [Heavy darksteel armor footage](https://www.youtube.com/watch?v=vnvVgchnqZA):
   unclipped +30 Piece by Piece/By the Book, more HQ samples, chaotic failures,
   and a complete quality/EXP observation supporting inferred recipe rank 55.
9. [Official 1.22b notes](https://forum.square-enix.com/ffxiv/threads/47128):
   increasing Control reduces both unstable and chaotic rates; no numeric
   coefficients are supplied. Hamlet battle music persists during synthesis.
10. [Steel hatchet footage, legacy segment only](https://www.youtube.com/watch?v=CEVOCgSoOAs):
    ordinary Standard +10 quality, more Careful outcomes, and quality/EXP totals
    supporting inferred rank 37 for the matching Steel Hatchet recipe.
11. [July 30, 2012 firsthand crafting accounts](https://www.ffxivpro.com/forum/topic/32239/tips-for-hq-crafting/):
    Master's Mend +30 durability; Byregot/Perfection sequencing preserves two
    Byregot turns after one synthesis action; Culmination with Rapid reportedly
    yields 25-40 progress depending on difficulty.

[1.23 notes](https://forum.square-enix.com/ffxiv/threads/50278-patch1.23-Patch-1.23-Notes)
were also checked; no replacement basic synthesis formula was recovered there.
This does not establish exhaustive coverage of every intermediate hotfix.

## Authored fallback values

The user authorized using reconstruction/estimates where source data is missing.
New uncertain values are grouped in `legacyCraftBalance` for calibration.

| Input | Current choice | Confidence |
| --- | --- | --- |
| Standard durability | Uniform 8-12 on either outcome, before reductions | Video observations, including an 8-point loss in May 2012 Boiled Egg footage; uniform distribution is authored |
| Careful durability | Uniform 7-10 on either outcome | Video/period range; uniform distribution is authored |
| Rapid failure durability | 20 | Approximate period observation |
| Ordinary Standard progress | Existing stat formula, clamped to 1-25 | Period upper bound; stat coefficients remain estimates |
| Standard failure progress | Half ordinary progress, rounded down, at least 1 | Partial gain observed; exact fraction remains authored |
| Rapid progress | Existing stat formula, clamped to 1-40 | July 2012 account reports 25-40 with Culmination; applying that ceiling to ordinary Rapid remains authored |
| Careful progress | Uniform 3-5, including failure | Video/period range; distribution authored |
| Careful failure quality | Half the computed base, at least 1 | Failure gains reported; fraction unknown |
| Careful base quality | `20 + floor(levelDelta * 0.2) + floor(control / 40)` | Authored calibration near footage's white-equivalent 20-25; stats unknown |
| Careful great quality | Twice ordinary quality | Footage-based magnitude estimate; exact multiplier unverified |
| Ordinary Standard quality | `8 + floor(control / 60)` before attribute/color/diminishing | Authored calibration near steel-hatchet video's +10; gear unknown |
| Standard great quality | `20 + floor(control / 60)` before color/diminishing | Authored calibration; no second generic great-success multiplier |
| Orb quality factors | White 1, yellow 1.1, red 1.3, prismatic 1.5 | Player-reported estimates |
| Orb success penalties | 0, 8, 18, 28 percentage points after baseline clamp | Authored; preserves stability ordering |
| Orb selection weights | 55, 25, 12, 8 | Authored independent rolls; no recovered transition matrix |
| Instability | `12 / (1 + control * 0.005)` percent after failure; three following synthesis/Wait steps | Control's direction is official 1.22b; probability and duration authored |
| Chaotic outcome | `25 / (1 + control * 0.005)` percent of failed actions while unstable; no progress/quality gain, ordinary failure durability cost, clears instability | Consequences observed on Careful; Control's direction official; rate and other-action generalization authored |
| Piece by Piece / By the Book | +30 progress, clipped at completion | Both observed unclipped in armor video |
| Brands | +100 quality on matching instability; +20 otherwise | Matching gain period-reported; 20 base +80 matching inferred from native command fields, without a decoded schema |
| Diminishing quality | `max(0.25, 1 - qualityGained / 1000)` | Official direction, authored curve |
| Tool quality attribute | Main/off-hand attribute from the official class table; multiplier `1 + stat * 0.001` | Mapping official; coefficient remains authored and was disputed in period testing |

Existing craftsmanship/control/level coefficients, natural great-success odds,
direct ability gain amounts, most durability restoration amounts, and equipment HQ
bonuses remain estimates or existing implementations. No ARR formula was imported.
Manipulation is now the observed +20; Master's Mend uses the period-reported +30.
Both may exceed 100 durability. Fifteen exact recipe identities use period-reported
ranks and two use video-derived inferred ranks; other recipes still expose level-band
anchors. Primary-stat/tool mapping is implemented; its exact scaling remains
unresolved. Current attributes include equipment/status contributions and affect
earned quality, then HQ and quality-derived EXP through their existing paths.

## Runtime behavior

Initial durability is always 100; material quality is clamped to 0-500.
HQ interpolation now passes through the observed HUD quality/HQ pairs; values
between samples remain reconstructed. Existing quality-derived EXP is retained,
with 351 quality gained correctly yielding the observed 280% bonus. Initial HQ
material quality does not earn that bonus. Failure at zero durability
takes precedence over simultaneous completion, following the pasted community
reconstruction rather than an independently verified late-retail capture.

Orb state and elemental instability are independent. White-glow abilities do not
cure an existing element; Brands do. Shards, crystals, and clusters map to their
actual element using archived item IDs. Both recipe elements are eligible. An
elementless recipe may choose any element. Chaotic failure preserves accumulated
quality, following 1.21, and uses WorldMaster 40108's fourth outcome and native
`gkra_fafa` selector. The footage establishes Careful's zero progress/quality and
element recovery; probability, guarantees and other-action interactions remain
reconstructed. Spark visuals are still unresolved.

Elemental Appeal prevents both new instability and chaotic worsening for its
three covered steps, as specified in 1.22 and the client tooltip. Aspect Balance
does not prevent chaos. High Return, Improvise and Magnum Opus use native message
40133 when activated without their required condition; the existing consumption
of such attempts is retained and remains unverified. Hasty Hand failure uses the
failed-attempt outcome message.

The up-to-five equipped commands returned by the player ability selector are frozen
for each synthesis. Each ability can be used once. Clean Slate resets crafting
state without making consumed abilities available again. The selector's existing
fallback to learned native abilities when fewer slots are equipped is removed,
following the official equipped-ability rule.
Buff durations count ordinary synthesis and Wait steps, including unmatched
actions; activating another ability does not consume those durations. These
activation semantics are corroborated by the July 2012 Byregot/Perfection
sequence. Unmatched-action duration rules and same-family buff overwrites
still need verification. Expired or replaced effects emit WorldMaster 40127
once per ability, including abilities represented by multiple internal buffs.

Wait costs 1, 2, 3, etc.; a valid non-Wait action resets the sequence. It ignores
durability and color abilities but advances their durations. White-glow expiry
allows a new color before the next action. Direct-gain abilities bypass the
ordinary diminishing/elemental modifiers. Comfort Zone prevents great success,
including when another active effect guarantees it; this overlap precedence is
an implementation choice consistent with its prohibition.

Grand Design now grants the fixed 20 progress reported in a July 2012 crafting
diary, replacing its level/stat-dependent estimate. Seven single-material leather
recipes and Iron Scale Mail now use additional period-reported ranks, scoped to
their complete recipe identities. Batch leather recipes, dated tanning recipes,
and component-recycling recipes retain their own unresolved ranks. Sources and
the exact supported recipes are listed in the client/video evidence document.
Single-log Elm, Walnut, Oak and Rosewood Lumber also use period-reported ranks
16, 23, 33 and 46 respectively; their batch recipes remain separate.

The client receives original worldMaster color messages 40141-40144, elemental
messages 40106/40107 with text_paramName IDs 7-12, and durability restoration
message 40140. These make the server-resolved condition visible in the log.
The native material/element state fields and normal/great/failure/chaotic result VFX
were recovered. Runtime publishes persistent state, step effects and completion
effects, uses class/tool motion banks, and clears the state on exit. The material
variant-to-color assignment now has packed-asset label support: `_md` contains
`cft_orange1`, `_lg` contains `cft_red1`, and `_ch` contains `cft_rainbow1` in both
resident banks. Base-white, the orange/yellow correspondence, and successful
rendered transitions still require an in-game check. The reproducible inventory
is `tools/inspect_crafting_resident_assets.py`; full provenance is in the client
evidence document.
Basic three-second action resolution and full-clip ability/completion waits are
authored timing choices. The May 2012 Culinarian footage's one-second samples
are consistent with three-second action resolution, but do not establish an
exact delay or validate every class/tool and completion animation.
The GM-only `!craftvisual <main|off> <mode> [element]` probe now makes these
checks reproducible without starting a synthesis. It exercises production orb
and outcome helpers, with class/tool motion requests checked against the runtime
by the Lua harness. See the client evidence document for modes and recording
instructions; its availability is not a passed visual check.

Normal ingredient consumption, inventory checks, local leve attempt tokens,
HQ/Double Down, and completion EXP stay on their existing paths. The existing
`HqGearChance` augment is custom project behavior, not a recovered retail
parameter; it adds percentage points only to equipment recipes. Native Double
Down Odds has an archived parameter label, but its additive application remains
an estimate. Failed Double
Down still awards no item or EXP; exact historical EXP treatment remains unknown.
Active Hamlet Defense retains its music on crafting entry and exit, matching
1.22b. The 19 high-difficulty component recipes introduced in 1.22/1.22a now
resolve HQ assessments to their separately named Flawless catalog items, with
inventory quality 1. Capacity checks and creation logs use the resolved item;
HQ outcome effects and EXP still use the original assessment. Ordinary recipes
retain their item ID and HQ quality flag. Other recipe-specific exceptions
beyond these components and the existing dye path remain unaudited.

## Verification

Run from the repository root:

```powershell
./tools/validate_crafting_retail.ps1
dotnet run --project tools/local-guildleve-tests/LocalGuildleveTests.csproj --no-restore
```

The focused MoonSharp harness runs actual production Lua, covering action
outcomes, colors, diminishing gains, Wait, ability reuse/expiry, elements,
terminal ordering, and ordinary item/EXP/Double Down awards. The existing
Lua/C# local-leve harness checks successful, failed, canceled, interrupted,
retried, and persisted commission paths. No live-server restart or deployment
was performed; client rendering and balance still need in-game verification.
