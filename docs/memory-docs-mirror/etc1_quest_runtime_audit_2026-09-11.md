# Etc1 quest dialogue and runtime audit — 2026-09-11

Scope: the 19 quests requested alongside the mob-placement pass. The production
Lua scripts were checked against the recovered client scenario Lua, the original
Lua 5.1 chunks, localized quest/journal sheets, and installed reward definitions.
No standalone cinematic launch was found in these 19 client scenario files.
Their presentation uses dialogue, talk turns, character/background schedulers,
and, in some quests, fades and waits. This is a source and script-execution audit;
it is not an in-game visual playback or collision verification.

## Corrections

- Journal callbacks return five objective fields. RequestQuestJournalCommand
  prepends the stage, making it argument 1 of the final `xtx_quest` expression.
  Objective totals belong in callback argument 5 (final text argument 6).
  Bridging the Gap was missing its callback; several others lacked the total.
  Held-item values occupy the actual final text slots: Assessing the Damage
  uses argument 3 for rings; The Ultimate Prank uses arguments 2 and 3 for ashes
  and the marionette; Say it with Wolf Tails exposes the bouquet only during
  delivery. The watcher/hearth quests report the held item rather than a count
  of already-used targets.
- Replaced invalid lowercase `quest:getSequence()` calls with the actual CLR
  `GetSequence()` API. Normalized NPC method calls to use the receiver.
- Aligned server delegate payloads with the original bytecode signatures,
  including explicit branch values and unused parameters. Removed the undefined
  objective arguments from Dressed to Be Killed. The Penultimate Prank's offer
  passes the Boolean expected by its client branch. Supported battle variants
  remain selected; several alternate client variants contain placeholder text.
- The Customer Comes First now consistently dispatches its supported pirate
  recovery dialogue. Its `005_2`, `005_2Follow` and `010_2` variants lead to
  placeholder English rows 26–27, 29–34 and 37, and are no longer selected by
  incoming event names. The supported route reaches Cahernaut, then Haldberk,
  the Stormcry pirates, and finally Haldberk again.
- Reward-screen EXP matches `gamedata_quest_rewards.sql` for every quest. Removed
  duplicate manual item/EXP grants from Assessing the Damage, Proceed with
  Caution, Playing with Fire, and The Customer Comes First. Player.CompleteQuest
  already grants their autoGrant rewards. Watcher/hearth quest items are removed
  by onFinish only after successful completion; an inventory-capacity failure
  keeps the objective item and reward stage.
- Revenge on the Reavers now counts kills only during its combat stage.
  Dressed to Be Killed now records its one-item objective with a defined counter
  and ignores kills outside its combat stage. Its incorrect header ID is fixed.
  The existing deterministic drop behavior is retained; the recovered client
  does not establish retail server drop probabilities.
- Watcher/hearth callbacks check the stage and target before retrieving quest
  data, so a late interaction does not access disposed completion data.

## Source contracts

### Second-pass integration finding

Playing with Fire used `1200127` for Maroile. That is her client display-name
ID; the actor-class catalog contains only an empty placeholder at that ID and
there is no corresponding public spawn. The actual public NPC is actor class
`1000512`, unique ID `maroile`, in zone 206. Its displayNameId is `1200127`, and
the existing `DftFst.lua` default-dialogue mapping also identifies it as Maroile.
The quest now uses `1000512` for its offer, progress and reward interactions.
All other required NPCs were checked against the public spawn and actor catalogs.
Proceed with Caution's real Sandre actor (`1001102`) is exercised in the main
test journey; its existing compatibility alias remains covered separately.

The second pass also added engine-style NPC registration/talk/push checks,
required talk/reward flags, client marker existence, rebuilding NPC state from
saved counters/flags after progress, failed reward completion followed by reload
and successful retry for every quest, and abandonment cleanup for both physical
quest items. All 19 expanded suites pass. Reload/inventory behavior remains a
test-double simulation, not a live database or server-restart test.

### Final packet-level correction

The initial audit incorrectly added the stage to the quest callbacks after
inspecting Quest.GetJournalInformation in isolation. The actual journal command
already prepends it. This would duplicate the stage and shift counts/totals.
That earlier change has been corrected in all 19 scripts; the shared journal
command is unchanged. The regression now executes the production
RequestQuestJournalCommand and checks the emitted `qtdata` packet, rather than
assuming that callback return values are the final client text arguments.
It reproduced the duplicated-stage failure in all 19 suites before the fix,
and all 19 pass after the correction.

The original DesktopWidget connector bytecode confirms that
processRecievedRequestedDataForWidget forwards the quest ID and all remaining
fields to processUpdateJournalDetailWidget, which forwards the fields unchanged
to setDetailData. JournalDetailWidget and UI rows 5004/4001 pass that stage and
objective data into the current-journal/held-item expressions. The original
widget chunks, UI expressions and production command are now pinned as evidence.

The final pass also checked reward widget slots 1 and 9 against
quest_new_reward.csv: they select the EXP entry and the same item/quantity as the
installed rewards. Fixed EXP entries match the installed amount; dynamic EXP
entries use the explicit amount passed to sqrwa. No additional quest-script
issues were found in the final dispatcher, packet, reward and regression checks.

`tools/etc1-quest-runtime-tests/source-contracts.json` pins all original bytecode,
recovered Lua and text-sheet evidence with SHA-256 hashes (text hashes normalize
CRLF). It contains bytecode-derived event arities, client method calls, English
text, journal expressions/bindings, and all selected autoGrant reward rows.
The extractor checks each decompiled signature against the original closure,
checks the decompiled method-call set against bytecode SELF instructions, and
checks journal selector/row bindings across all four localized expressions.
It also pins the public NPC/actor catalogs and the client marker sheet used by
the second-pass integration checks.

| Quest | Script | Active stage → source journal row | Reward EXP |
| --- | --- | --- | ---: |
| 110633 Assessing the Damage | etc1l0 | 0 → Sea/164, 1 → Sea/165 | 1,440 |
| 110634 Bridging the Gap | etc1l1 | 0 → Sea/166, 1 → Sea/167 | 300 |
| 110636 Revenge on the Reavers | etc1l3 | 0 → Sea/168, 1 → Sea/169 | 5,340 |
| 110638 Till Death Do Us Part | etc1l5 | 0 → Sea/156, 1 → Sea/157 | 1,440 |
| 110639 Beryl Overboard | etc1l6 | 0 → Sea/158, 1 → Sea/159 | 1,440 |
| 110640 Have You Seen My Son | etc1l7 | 0 → Sea/160, 1 → Sea/161, 2 → Sea/162, 3 → Sea/163 | 3,040 |
| 110654 Proceed with Caution | etc1g0 | 0 → Fst/213, 1 → Fst/214 | 300 |
| 110655 Playing with Fire | etc1g1 | 0 → Fst/215, 1 → Fst/216 | 500 |
| 110656 A Well-Balanced Diet | etc1g2 | 0 → Fst/217, 1 → Fst/218, 2 → Fst/219 | 1,891 |
| 110658 The Penultimate Prank | etc1g4 | 0 → Fst/202, 1 → Fst/203 | 2,661 |
| 110659 The Search for Sicksa | etc1g5 | 0 → Fst/204, 1 → Fst/205 | 300 |
| 110660 The Ultimate Prank | etc1g6 | 0 → Fst/206, 1 → Fst/207, 2 → Fst/208, 3 → Fst/209 | 3,360 |
| 110662 Say it with Wolf Tails | etc1g8 | 0 → Fst/210, 1 → Fst/211, 2 → Fst/212 | 3,040 |
| 110675 A Knock in the Night | etc1u0 | 0 → Wil/279, 1 → Wil/280 | 3,360 |
| 110676 Sleepless in Eorzea | etc1u1 | 0 → Wil/281, 1 → Wil/282 | 300 |
| 110677 Dressed to Be Killed | etc1u2 | 0 → Wil/283, 1 → Wil/284 | 5,340 |
| 110679 The Customer Comes First | etc1u4 | 0 → Wil/285, 1 → Wil/286, 2 → Wil/287 | 2,661 |
| 110680 An Inconvenient Dodo | etc1u5 | 0 → Wil/277, 1 → Wil/278 | 500 |
| 110681 Besmitten and Besmirched | etc1u6 | 0 → Wil/275, 1 → Wil/276 | 500 |

## Validation

```powershell
python -B tools/etc1-quest-runtime-tests/extract_contracts.py --check
dotnet run --project tools/etc1-quest-runtime-tests
python -B tools/mobspawns/etc1_quest_mobs.py check
python -B -m unittest discover -s tools/mobspawns -p test_etc1_quest_mobs.py
```

Passed: 19 runtime quest suites, all source contracts, nine frozen-ground layouts
with 52 placements, seven placement regressions, and existing objective
actor-class/spawn checks. `git diff --check` also passed.

The MoonSharp harness executes the production server Lua and dispatches into the
actual recovered client functions. It exercises offer acceptance/refusal, every
active stage/NPC pairing, ordinary/Conjurer/Botanist dialogue, menu alternatives,
all required kills, unrelated and late kills, repeated interactions, every
supported delegate, journal packets/selectors/counts, completion and reward ownership.
It rejects missing/placeholder English text, incorrect payload arities, invalid
counter references, and a dialogue returning with the screen faded out. It also
checks item retention on failed completion and repeated-completion behavior.
Three obsolete Customer Comes First delegates are deliberately excluded.

Engine inventory/reward calls, actor/UI methods, and waits are strict test
doubles. The reward ownership model follows Player.CompleteQuest and
GrantQuestRewards in `Map Server/Actors/Chara/Player/Player.cs`; this suite does
not launch the map server or connect to MySQL. The recovered Lua sometimes repeats
an original cached menu response in its decompiled control flow. Tests supply
stable answers (and explicit repeated answers for menu alternatives), rather
than treating that artifact as proof of exact client timing.

The legacy objective validator's watcher rule was updated from MAPONLY to
TALK to match the actual GetTalkQuestsForNpc dispatcher. Its quest-script check
passes when scoped to etc1g0/etc1g1, and its actor/spawn checks also pass. The
full legacy suite covers unrelated quests that remain intentionally disabled,
so it is not used as this batch's availability gate.

## Availability update

The 14 quests with complete script and placement coverage are now enabled and
labeled Implemented in `Data/scripts/quests/quest_availability.lua`:
110634, 110638, 110639, 110640, 110654, 110655, 110656, 110659, 110660,
110662, 110675, 110676, 110680 and 110681. The annotation generator's explicit
implemented-ID set was updated too, so regeneration preserves those labels.

110633, 110636, 110658, 110677 and 110679 remain disabled and labeled Partially
implemented, with notes identifying their unresolved mob-ground coverage.
The Penultimate Prank's older Implemented label was corrected to reflect that
placement gap. No prerequisite was bypassed: Beryl Overboard requires Till
Death Do Us Part, Say it with Wolf Tails requires Have You Seen My Son, and The
Ultimate Prank still requires The Penultimate Prank. The latter is only
normally offerable to players who already completed its currently disabled
predecessor. The configured sidequest gate is enabled.

Validation after the availability edit: 524 unique catalog rows, 48 enabled
(including the 14 newly enabled here), 476 disabled; all implementation labels
match the generator. The actual Lua table parses successfully, all 19 runtime
suites pass, and nine layouts/52 placements still match their frozen evidence.
The additional pass found a stale watcher validator rule, not a new quest-script
issue. New offers require a Map Server restart. Databases still need the existing
additive mob migration where those catalog changes have not yet been imported.

## Remaining in-game work

The scripts have not been visually played through in the game. Animation assets,
camera/talk-turn appearance, fade timing, and NPC placement interactions still
need that check. Fourteen offer entries are now enabled in the repository; no
live SQL was imported and no Map Server restart was performed during this audit.

The prior placement pass remains at 52 recorded-ground placements for nine
quests. Five objective areas still lack usable ground recordings: Assessing the
Damage, Revenge on the Reavers, The Penultimate Prank, Dressed to Be Killed, and
The Customer Comes First. Their capture instructions and exact marker evidence
are in [the placement report](etc1_quest_mob_placements_2026-09-11.md).
