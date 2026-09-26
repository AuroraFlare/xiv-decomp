# Black Mage, Paladin, Bard, and Dragoon: bytecode and transition review

Reviewed 2026-09-07. Scope: the 24 requested `0j1` through `0j6` quests, IDs 111261–111266, 111281–111286, 111301–111306, and 111321–111326. This is a client-evidence reconstruction, not a declaration that all corresponding server encounters are implemented.

## Evidence and interpretation

The primary executable evidence is `tools/outputs/lpb/decomp_more_20260617/luac/quest/scenario/<job>/<code>.luac`. Instruction PCs are zero-based; hexadecimal offsets are absolute byte offsets in those chunks. Recovered `.lua` files were used only as reading aids. In particular, their repeated `showQuestInfomation()` expressions and the flattened `Blm0j1` pre-question are decompiler artifacts; the raw `CALL`, registers, `EQ`, and `JMP` instructions are authoritative.

The focused reproduction script is [review_support.py](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/review_support.py). Its [method-signatures.json](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/method-signatures.json) records all **239 non-init methods**, signatures, byte extents, SHA-256 provenance, and the **36 comparison sites**. [branch-method-bytecode.txt](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/branch-method-bytecode.txt) retains every instruction in every branch-bearing method. [journal-evidence.json](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/journal-evidence.json) links all **89 relevant journal rows** through the actual `xtx_quest.csv` expressions, rather than assuming adjacent row numbers are chronological stages. The parent [bytecode directory](../outputs/job-gc-decomp-20260907/bytecode) and [quest path traces](../outputs/job-gc-decomp-20260907/quests) contain the complete per-method call and predicate inventory.

The first three ordinary scenario arguments are `quest`, `player`, and `eventOwner`. Below, `arg1` means the fourth Lua parameter, register R3. Two-parameter `onJobQuestComplete*` methods have only `quest` and `player`; they do not need a fabricated NPC argument. Numeric `1`, numeric `0`, boolean `true`, boolean `false`, and `nil` must remain distinct. An explicit `arg1 == true` is not a truthiness test and does not accept numeric 1.

The generated [method-path index](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/method-path-index.md) retains separate predicates, text sequences, exact significant API arguments, return values, and offsets for all **279 path templates** across every method. All **72 EQ branch edges** are covered, with zero uncovered edges. Its `arg4` spelling comes from the parent tracer's full Lua-parameter numbering and means this report's `arg1`. There are no loop templates in these 24 quest chunks; menu-loop conclusions elsewhere in the larger requested scope should not be transferred to these job quests.

`startNQCutScene(scene, 1)` supplies presentation. `startFadeInCutSceneAfterWarp(player)` is evidence of a different transition contract from the default fade; it does **not** encode a zone ID, position, return destination, kill condition, or server-content creation call in these scenario methods. A scene's actor dictionary and setup coordinates are local presentation evidence. Neither a PC setup pose nor a character class appearing in a scene proves a persistent battlefield spawn or combatant.

Journal wording establishes the order of player tasks and sometimes party limits. A method ending in `Follow`, `Hint`, or `_000_*` still needs its text checked: numbering and adjacency alone do not establish a route. The review also distinguishes a journal's maximum (“up to”) from a recommendation. Both statements count companions in addition to the player.

## Findings that change route interpretation

1. **Paladin 30's `pld0j110` is aftermath.** Journal Wil/514 says the free paladin approaches after the last monster dies and hands over the crystal. `processEvent010` and `015` both play that scene and announce item 11000558; they differ only in the fade wrapper. The reviewed runtime's `preEvent = "processEvent010"` is consequently in the wrong phase.
2. **Black Mage 40's Kazagg introduction is `processEvent005`, not `processEvent000`.** The latter is Lalai's reminder to find Kazagg. The former formats the player's race in text 14, introduces Kazagg, and assigns the Whitetalon trial. It contains an ordinary timed fade, not an NQ scene or an after-warp transition.
3. **Black Mage 30's pre-question can end the event without offering the quest.** The damaged source incorrectly makes the remaining offer look unconditional. Raw bytecode shows a single restricted-choice call, then a nil/numeric-2 refusal path that returns no value.
4. **The four independent AF item presentations do not contain an acquisition counter.** The client call is `showGetJobItemWidget(player, arg1, 0)` after running the event owner's coffer scheduler. The actor, item binding, state bits, and fourth-item completion are server-side responsibilities; they are not recoverable from that nine-instruction method alone.
5. **Several “implemented” combat rows are explicitly private adapters.** The bytecode/journal evidence does not recover all wave counts, server spawn coordinates, allied AI, public trigger ownership, or retries. Paladin 45 explicitly names Jenlyns **and his soldiers**; a single-Jenlyns adapter is only a subset of that encounter.

These are findings against the runtime snapshot read during the review. This report and its evidence builder make no runtime changes.

### Reward identity check

The exact installed-client names come from [xtx_command.csv](Dat%20Mining/xtx_command.csv) and [xtx_itemName.csv](Dat%20Mining/xtx_itemName.csv), keyed by the numeric IDs. These are the recovered 1.x names; current-game names should not be substituted. The [reward call ledger](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/reward-display-names.json) preserves the call offset and original arguments.

| Chain | 30 | 35 | 40 | 45 combat/interaction | 50 |
| --- | --- | --- | --- | --- | --- |
| Black Mage | 27305 Convert, mode 1 | 27319 Freeze, mode 2 | 27318 Flare, mode 2 | 27317 Sleepga, mode 2 (`0j4`) | 27316 Burst, mode 2 |
| Paladin | 27146 Cover, mode 1 | 27147 Divine Veil, mode 1 | 27149 Holy Succor, mode 2 | 27159 Spirits Within, mode 3 (`0j5`) | 27148 Hallowed Ground, mode 1 |
| Bard | 27237 Ballad of Magi, mode 2 | 27239 Minuet of Rigor, mode 2 | 27238 Paeon of War, mode 2 | 27232 Rain of Death, mode 3 (`0j4`) | 27227 Battle Voice, mode 1 |
| Dragoon | 27266 Jump, mode 1 | 27272 Disembowel, mode 3 | 27267 Elusive Jump, mode 1 | 27277 Ring of Talons, mode 3 (`0j5`) | 27268 Dragonfire Dive, mode 1 |

Here “mode” is a concise label for the final raw widget argument; the label does not infer an action rank, party size, or server grant type. The AF collection quests have no ability widget in their own scenario.

**3020410 is The Keeper's Hymn**, not a job soul. The job souls in this scope are key items 2000207 (Black Mage), 2000201 (Paladin), 2000205 (Bard), and 2000204 (Dragoon). Thus the reviewed Pld0j1 runtime comment calling 3020410 “Soul of the Paladin” is misleading even if both the item grant and separate key-item grant are correctly configured. Likewise, the runtime's labels “Flare 27316” and “Spirits Within 27148” are incorrect names: the numeric IDs resolve to Burst and Hallowed Ground. The finale body items are 8032707 Wizard's Coat, 8032701 Gallant Surcoat, 8032705 Choral Shirt, and 8032704 Drachen Mail.

## Exact scene and fade contracts

All entries below start with `quest:startFadeOutCutSceneDefault(player)` and call `quest:startNQCutScene(literal, 1)`, unless a row explicitly says otherwise. Preserve the literal spelling even though the installed Windows client path is case-insensitive.

| Quest | Event | Scene literal | Exit and placement ownership |
| --- | --- | --- | --- |
| Blm0j1 | `processEvent010` | `blm0j110` | Default fade; **post-kill** Gem of Shatotto presentation. |
| Blm0j1 | `processEvent020` | `blm0j120` | Default fade; return-to-Yayake narrative. |
| Blm0j3 | `processEvent005` | None | Ordinary `startFadeOut(player,1)`, wait 2, `startFadeIn(player,1)` inside Kazagg's briefing. |
| Blm0j6 | `processEventNQ01` | `blm0j610` | Default only if `arg1 == true`; otherwise after-warp. |
| Blm0j6 | `processEventNQ02` | `blm0j620` | After-warp aftermath variant. |
| Blm0j6 | `processEventNQ03` | `blm0j620` | Default aftermath variant. |
| Pld0j1 | `processEvent010` | `pld0j110` | After-warp **post-kill** crystal presentation. |
| Pld0j1 | `processEvent015` | `pld0j110` | Default **post-kill** crystal presentation. |
| Pld0j1 | `processEvent020` | None | Two ordinary one-second fades during Jenlyns's induction; talk remains open for Kokuti. |
| Pld0j2 | `processEventJENLYNSStart` | None | Accepted offer only: one-second fade, wait 3, one-second fade-in while Jenlyns carves the crystal. |
| Pld0j3 | `processEventJENLYNSStart` | None | Accepted offer only: one-second fade, wait 1, one-second fade-in while Jenlyns carves the crystal. |
| Pld0j5 | `processEvent_005NQ_1` | `pld0j510` | Default only if `arg1 == true`; otherwise after-warp. Pre-battle betrayal. |
| Pld0j5 | `processEvent_015NQ_2` | `pld0j520` | Default aftermath. |
| Pld0j6 | `processEventNQ01` | `pld0j610` | Default only if `arg1 == true`; otherwise after-warp. |
| Pld0j6 | `processEventNQ02` | `pld0j620` | After-warp aftermath variant. |
| Pld0j6 | `processEventNQ03` | `pld0j620` | Default aftermath variant. |
| Brd0j1 | None | None | Entire recovered scenario uses talk/schedulers; its SQB class does not imply an NQ scene. |
| Brd0j4 | `processEventNQ01` | `brd0j410` | Default only if `arg1 == true`; otherwise after-warp. |
| Brd0j4 | `processEventNQ02` | `brd0j410` | Unconditional default replay of the **entry** scene, not aftermath. |
| Brd0j4 | `processEventNQ03` | `brd0j420` | Default aftermath, then worldMaster says local text 30. |
| Brd0j5 | Offer event | None | An ordinary fade inside Jehantel's account of his lost attire; no destination warp is encoded. |
| Brd0j6 | `processEvent_010` | `brd0j610` | Default; journal Fst/454 places Jehantel's song **after victory**. |
| Drg0j1 | `processEventStart` | None | Ordinary 1.5-second fades around opening/closing Haurtefert's talk, including both accept and reject exits. |
| Drg0j1 | `processEventClear` | None | Ordinary 1.5-second fade/wait 1.5/fade-in at the later Alberic conversation. |
| Drg0j1 | `processEventNQ` | `drg0j110` | Default; Estinien confrontation during/after the culling, before returning to Alberic. |
| Drg0j4 | `processEvent_NQ_Drg0j410` | `Drg0j410` | Default; rendezvous southwest of Skyfire Locks before collecting armor. |
| Drg0j6 | `processEvent010` | `Drg0j610` | Default; entry to the Griffin Crossing confrontation. |
| Drg0j6 | `processEvent020` | `Drg0j620` | After-warp aftermath variant. |
| Drg0j6 | `processEvent025` | `Drg0j620` | Default aftermath variant, preceding the later Alberic reward talk. |

The four strict-boolean methods share an exact shape: scene `CALL` at pc6; `EQ R3,true` at pc7; default fade `CALL` at pc11; after-warp fade `CALL` at pc15. Comparison offsets are `Blm0j6 0x1A49`, `Pld0j5 0x5BD`, `Pld0j6 0xD9B`, and `Brd0j4 0x8B8`. Numeric 1 and every other non-true value reach pc13–15, not the default branch. These are choice-of-wrapper arguments, not evidence of the server's intended default for an absent parameter.

## Black Mage

### 111261 — Hearing Voices (`Blm0j1`)

**Ordered route.** Yayake's offer → guano gnats near Copperbell Mines, north of Nophica's Wells → Kazagg's appearance and Gem of Shatotto → return to Yayake/Arrzaneth Ossuary → black-mage item and ability presentation. Wil/472–474 explicitly establishes combat before Kazagg appears and “several” gnats without an exact count; three companions are permitted. Tribal `000Follow` and `010Follow` methods are contextual dialogue at the respective states, not additional ordered objectives.

**Offer branch.** `processEventYayakeStart(quest,player,eventOwner,arg1)` initializes R4 to numeric zero at pc4/0x44E. Only `arg1 == 0` (pc5/0x452) plays text 51 and performs one `worldMaster:askRestrictChoices(quest,quest,52,true,true)` at pc22/0x496. A nil response (pc23/0x49A) or numeric 2 response (pc25/0x4A2) plays text 55, sets R4 to 1, finishes the talk, and skips to the zero-value return at pc160. Every other response continues the ordinary offer; `arg1 != 0` bypasses the pre-question altogether. The ordinary offer calls `showQuestInfomation()` once and tests its stored result against numeric 1 at pc125/0x632, giving texts 13/15 on acceptance or 11/12 on rejection. The same stored result is returned. No implementation should redisplay the UI to obtain the return value.

**After combat.** `processEvent010` runs `blm0j110`, opens the public dialog with `(worldMaster,25117,11000556,1)`, notifies the same item tuple, waits 5, and uses default fade-in. `processEvent020` runs `blm0j120` with default fade. Neither method spawns gnats, counts kills, or chooses a world position. The scenes must not be collapsed into a generic kill→reward transition.

**Rewards.** `processEventClear` first says text 49, then shows caller-supplied `arg1` at pc9/0x1361, waits 6, shows local long text 79, waits 8, shows ability `(27305,1)` at pc25/0x13A1, and waits 6. `ClearAfter` is later Yayake dialogue (67, 68 and world text 69). Item 11000556 is the gem announcement, not the numeric ability or the completion item's argument.

**Boundary left open.** Guano Gnat class 2200610/profile 3050/list 94 is an existing server data binding; its exact retail copies, fight trigger, kill-to-scene callback, and cleanup are absent from the empty `QuestDirectorBlm0j101` subclass. A scene-staged Kazagg is not a persistent battle ally.

### 111262 — A Time to Kill (`Blm0j2`)

Wil/476–477 and Lalai's offer assign **Daddy Longlegs west of Nophica's Wells**, with three companions recommended. `processEventLALAIStart` has one stored quest-offer result tested at pc75/0x53B. `processEvent000_LALAI`, `_KAZAGGCHAH`, `_DOZOLMELOC`, and `_DAZA` contain reminders/ambient comments only: no inter-method dispatch, state advance, ordered sequence, or warp is present.

No NQ cutscene, fade, spawn, or content callback occurs in this quest chunk. Completion is three distinct hooks: First opens `(worldMaster,51121,3105515,1,2000207)` at 0xADA; Second displays ability `(27319,2)` at 0xB84; Third invokes `showEventBeforeNpsLS(player,1400197,78)` at 0xBF3. The latter is a linkpearl/event handoff, not a newly granted item or a quest route actor ID. These three methods contain no explicit waits.

The runtime uses source-backed Daddy Longlegs class 2105513/profile 3013 in a private shell. Field ownership and the complete world transform remain separate from marker 11223101 and from the ability presentation. The reviewed runtime total cap 3 differs from the journal's player-plus-three recommendation.

### 111263 — International Relations (`Blm0j3`)

Wil/479–482 establishes **Lalai → Kazagg in the cave west of Camp Horizon → Whitetalon south of Camp Bald Knoll → Kazagg**. Whitetalon sends minions first. “Two Ragged Hippocerfs” is corroborating existing server/source-note evidence, not a count decoded from this scenario chunk. The journal permits three companions.

The real Kazagg introduction is `processEvent005`. At pc11/0xAF5 R3 is copied into the formatted `say(quest,14,0,arg1)` call at pc12/0xAF9. English text 14 switches `$E8(1)` over Hyur/Elezen/Lalafell/Miqo'te/Roegadyn: the payload is a race selector. The original server encoder, not this client chunk, must establish its numeric convention. Texts 15–19 and 42 introduce Kazagg, identify Whitetalon, explain the minions-first condition, and instruct the player to return after victory. The fade is `startFadeOut(player,1)` at pc21/0xB1D, wait 2 at pc24/0xB29, and `startFadeIn(player,1)` at pc28/0xB39. It is a conversational passage of time; no NQ scene or after-warp call exists.

By contrast, `processEvent000` at 0x7E6–0x852 gives texts 11–13, repeating Lalai's instruction to find Kazagg. `processEvent005_1` repeats Kazagg's battle order after the introduction. Other suffixed methods are brief secondary-NPC reminders. Do not turn their numeric suffixes into extra mandatory talks.

`processEvent010` is Kazagg's successful-return dialogue, including deliberate finish/restart talk boundaries around texts 30–33. `processEventClear` waits 3, presents `(27318,2)` at pc7/0x138E, then waits 6. The empty `QuestDirectorBlm0j301` provides no battle callbacks, world coordinates, wave scheduler, or return warp. The reviewed runtime wrongly assigns `processEvent000` to Kazagg and queues `processEvent005` without its race argument as a generic prebattle hook; those are independent problems even though the target roster is materialized.

### 111264 — The Voidgate Breathes Gloomy (`Blm0j4`)

Wil/484–486 specifies **Dozol Meloc → moss-covered stela northwest of Turning Leaf**, then the next quest at Da Za. The offer includes two independent questions: NPC `ask(quest,29,2)` at pc16/0x474 changes text 3 versus 32 when its result equals numeric 1 (pc17/0x478). Later `showQuestInfomation()` has a separate result at pc111/0x5F0, changing text 15 versus 14 and supplying the return value. A single globally reused choice would miss the mixed-answer paths.

`processEvent000_SEKIHI` is only world text 33, describing the inactive mossy stela. `processEvent005` is the active interaction: world text 24, then `sayFreeDisplayName(4000257,quest,25)`. The 4000257 value supplies a display name; it is not an actor-class ID. `processEvent000_DOZOLMELOC`, `_LALAI`, `_KAZAGGCHAH`, and `_DAZA` do not enforce an NPC itinerary.

The reward hooks are local long text 40/wait 8, then ability `(27317,2)`/wait 6 (calls 0xCF4 and 0xD96). No NQ scene or fade appears. One English offer line 37 refers to a lurking beast, but the journal defines a stela task and the chunk has no battle transition. That line alone cannot supply an enemy class, a required kill, or a new instance.

Marker 11223301 fixes X/Z `(-1691.359985,124.540001)` in West Shroud only. Stela actor/unique ID, Y/rotation, interaction owner, and state persistence remain unrecovered. Display 4000257 cannot solve those gaps.

### 111265 — Gearing Up (`Blm0j5`)

Wil/487–489 names four destinations: Aurum Vale, Dusk Vigil, a cave west of Camp Brittlebark, and a cave south of Camp Broken Water. Da Za's offer (`processEvent_DAZA_Start`, offer EQ pc120/0x47C) describes the tablet; the other three NPC `Follow` methods are comments, not staged deliveries. There is no NQ scene.

`processEvent_getAF_info(quest,player,eventOwner,arg1)` is exactly an owner `_runCharaScheduler(67108910)` at pc2/0x92C and `showGetJobItemWidget(player,arg1,0)` at pc7/0x940, followed by return. The widget's item is caller supplied. No branch, counter, inventory write, warp, or completion check occurs here. The known item set is 8051407/8071407/8081807/8013507; ordered marker 11223401–04 does not itself map each item to a coffer. Exact coffer classes, unique IDs, Y/rotation, push ownership and the acquisition-completion state owner remain server-data gaps.

### 111266 — Always Bet on Black (`Blm0j6`)

Wil/490–495 establishes **Da Za → Dozol Meloc → Kazagg Chah → incoming linkpearl contact → Lalai at Milvaneth → Nald's Reflection**. The intermediate journal stage 493 explicitly requires contacting the linkpearl; stage 494 reveals Lalai and directs the physical return. That event is not implemented by merely renaming a tribal `Follow` method. The local scenario has no explicit `showEventBeforeNpsLS` call for this trigger, so the push originates elsewhere.

The substantive physical talks are `processEventDozol01` (14–21, 100), `processEventKazagg02` (25–31, 101), and `processEventLalai02` (38–49, 105). The numbered Da Za/Dozol/Kazagg/Lalai alternates are state-specific reminders. The offer result is tested once at pc53/0x698. No numeric quest-stage mutation occurs in these methods.

`NQ01/blm0j610` precedes combat and selects its fade with strict boolean R3; `NQ02` and `NQ03` are alternate exits from `blm0j620` after combat. Do not play both aftermath variants. `processEventAfget(arg1)` presents text 106/wait 8, ability `(27316,2)` at 0x1CDE/wait 6, then caller item at 0x1CFA/wait 6. Wizard's Coat 8032707 comes from reward data, not a constant in that last method.

The journal permits seven companions. Existing data identifies Barbatos 2203503 and candidate lantern subclasses 2209906–08, but three class resources are not a recovered lantern count. Profile 3002's incomplete combat fields, lantern copy/respawn lifecycle, kill/clear conditions, entry owner, physical return destination and reward cleanup are not encoded by the empty `QuestDirectorBlm0j601`. Scene PC/tribal placements must remain local staging.

## Paladin

### 111281 — Paladin's Pledge (`Pld0j1`)

Wil/511–514 establishes **Lulutsu → Jenlyns → undead south of the Coffer & Coffin → free paladin's crystal → Jenlyns**. `processEventLULUTSUStart(arg1)` uses `arg1 == numeric1` at pc4/0x2E1 for text 8 versus 9; this is independent of the offer result at pc56/0x3B1. Boolean true takes the non-1 branch. `processEvent055` repeats Lulutsu's lead; `processEvent082` is Jenlyns's introduction and task, especially texts 29/50; `083` is later Sultansworn exposition, not another battle unlock.

The crystal scene is unambiguously **after the last monster** (Wil/514). Both `processEvent010` and `015` play `pld0j110`, open/notify `(worldMaster,25117,11000558,1)`, wait 5, and then fade in. `010` uses after-warp; `015` uses default. The reviewed adapter runs 010 as `preEvent`, presenting the proof before the task has been completed. A proper adapter must choose one post-success wrapper appropriate to its actual area-transition owner.

`processEvent020` is the return-to-Jenlyns induction, with two ordinary one-second fade-out/fade-in sequences separated by waits and actor schedulers. It opens a mode 1 talk but does not close it at its end. `processEventKokuti(arg1)` shows the caller item (0x11BF), waits 6, text 51/wait 8, ability `(27146,1)` (0x11FF)/wait 6, and finally calls `eventOwner:finishCliantTalkTurn()`. That split talk lifetime is a reason to retain their ordering and NPC ownership.

The three quest-specific undead classes 2201807/2201808/2204318 and the recovered Specter shell support identities. The fourth adapter class 2206901 is explicitly a generic binding for an otherwise empty shell. They do not prove one of each, a four-copy formation, or a retail kill rule. The journal permits three companions; the empty `QuestDirectorPld0j101` supplies no missing roster or callback.

### 111282 — Honor Lost (`Pld0j2`)

Wil/516–518 and Jenlyns's accepted offer assign **Alux in Mun-Tuy Cellars**. The only acceptance comparison is pc84/0x4F9 against numeric 1; `processEvent000_JENLYNS` is a reminder. The accepted branch includes `startFadeOut(player,1)` at pc97/0x52D, wait 3, and `startFadeIn(player,1)` at pc104/0x549. Text 17 says Jenlyns will carve the lesson on the crystal; text 21 says it is done. This is the local training presentation, not a warp to the monster. There is no NQ scene, direct movement, content creation, or battle callback.

Completion First shows `(worldMaster,51127,2000201)` at 0x8DA; Second displays `(27147,1)` at 0x976; Third calls `showEventBeforeNpsLS(player,1000146,95)` at 0x9E5. No explicit waits are added by these methods. The class 2102609/profile 3000 binding is exact existing data, but marker 11224101 and the journal's three-companion recommendation do not supply a full field spawn transform or force a private instance. Reviewed adapter cap 3 is a separate server policy.

### 111283 — Power Struggles (`Pld0j3`)

Wil/519–521 assigns **Old Six-arms in lower La Noscea**, with three companions recommended. The offer EQ is pc66/0x390. `processEventJENLYNSStart_1` is the pre-level hint (texts 2/3); `processEvent000` is contextual follow-up (texts 17–20). The accepted branch carves the next lesson into the crystal, using `startFadeOut(player,1)` at pc84/0x3D8, wait 1, and `startFadeIn(player,1)` at pc91/0x3F4. As in Pld0j2, no NQ scene or warp occurs.

First is `(worldMaster,51127,2000201)` at 0x809; Second is ability `(27149,2)` at 0x8A5; Third is `showEventBeforeNpsLS(player,1000146,96)` at 0x914. The ability presentation's final 2 is preserved as an API argument, not inferred to mean rank 2 or two helpers. Existing class 2107614/profile 3078 and marker 11224201 identify the intended target/area; the public trigger and battlefield Y/rotation remain separate unknowns.

### 111284 — Poisoned Hearts (`Pld0j4`)

Wil/522–524 names four gallant-armor destinations: Aurum Vale, Natalan, north of Camp Brittlebark, and northeast of Camp Crimson Bark. The offer uses one numeric 1 acceptance comparison at pc65/0x44B. `processEvent_JENLYNS_Follow` restates the task; no sequential coffer order is encoded.

`processEvent_getAF_info(arg1)` runs owner scheduler 67108910 at 0x6F2 and `showGetJobItemWidget(player,arg1,0)` at 0x706. It is the same branch-free nine-instruction contract as the other AF collections. No actor/item binding, full transform, acquisition bitmask, or fourth-item completion owner is present. The set 8051401/8071401/8081801/8013501 is reward evidence; markers 11224301–04 are destination evidence only. No NQ scene is called.

### 111285 — Parley on High Ground (`Pld0j5`)

Wil/525–527 establishes **Jenlyns offer → high-ground parley → betrayal → fight Jenlyns and his soldiers** and permits seven companions. `processEventJENLYNSStart` tests its stored acceptance value at pc32/0x2DF; `_000_JENLYNSSFollow` repeats the meeting instruction.

`processEvent_005NQ_1(arg1)` runs `pld0j510`, selecting default only for boolean true (EQ 0x5BD) and after-warp for everything else. The existing explicit `{true}` pre-event choice is consistent with playing the scene while still in the public area; that is an adapter decision, not proof that the original content always passed true. `processEvent_015NQ_2` runs `pld0j520` with default fade after the fight. `processEventClear` says world text 29, presents local long text 31/wait 8, displays `(27159,3)` at 0x7A7, then waits 6.

The current one-Jenlyns class 2289035/profile 3064 shell omits the soldiers explicitly named by the journal. A recovered `FighterEnemyGladiatorPld0j5` resource supports a soldier identity but not its copies, positioning, or waves. The empty `QuestDirectorPld0j501` gives no count/kill callbacks. The reviewed cap 3 is not the journal cap 8. Scene guards and their local poses can help identify presentation actors but cannot automatically become battle targets.

### 111286 — Keeping the Oath (`Pld0j6`)

Wil/529–532 establishes **Jenlyns → southeast of Camp Bluefog → help Jenlyns and Solkzagyl against the monster cohort → aftermath → return to Jenlyns in Ul'dah**. Here the journal positively identifies both men participating in the fight, unlike a mere scene-dictionary sighting. It still gives no ally AI, HP, command set, or coordinates. Seven companions are permitted.

The offer tests acceptance at pc113/0x645. `processEventNQ01/pld0j610` branches on strict boolean arg1 at 0xD9B; NQ02/NQ03 run the same `pld0j620` with after-warp/default respectively. `processEventClear` is the later Jenlyns reward conversation. Although it declares a fourth parameter, it does not read it. It also does not finish the talk at its end. `processEventKokuti(arg1)` presents text 55/wait 8, `(27148,1)` at 0xC7F/wait 6, then the caller item at 0xC9B/wait 6. `processEvent001`, despite its fourth parameter, only finishes the talk; it is a plausible conversation closure surface, not an extra objective.

The item presentation needs Gallant Surcoat 8032701 from server reward data. Existing Manipulated Eye 2201706/profile 3069 and Ogre 2202503/profile 3070 bindings do not establish their copy count, encounter waves, ally placement, or success condition. No such callbacks appear in `QuestDirectorPld0j601`. Ordinary return dialogue must occur after the battlefield scene and the actual return-area transition.

## Bard

### 111301 — A Song of Bards and Bowmen (`Brd0j1`)

Fst/433–438 establishes **Georjeaux → Jehantel north of Camp Tranquil → Pukno Poki in the eastern cave → stolen charm/Qiqirn encounter → Jehantel**. The exact substantive events are `processEvent000` for Jehantel and `processEvent005` for Pukno Poki. `000_GEORJEAUX`, `005_JEHANTEL`, and `010_PUKNOPOKI` are reminders, not extra steps. The offer's `arg1 == numeric1` at pc4/0x303 chooses text 2 versus 3; the independent acceptance comparison is pc83/0x43F.

There is **no NQ cutscene call anywhere in this scenario**. Its elaborate sequences are event-owner/player scheduler calls inside talks. In particular, Jehantel scheduler 69521408 is repeatedly paired with a 1.5-second wait and player scheduler 67111909; these are presentation choreography, not locomotion targets.

The journal says the charm is reclaimed from the Qiqirn before delivery. `processEvent015` is Jehantel's return dialogue and `processEventJob(arg1)` shows the caller item at 0x1235, waits 6, local text 71/wait 8, then `(27237,2)` at 0x1275/wait 6. The journal permits three companions; the precise four-Qiqirn roster in prior server notes has a separate source basis, not a number decoded from `QuestDirectorBrd0j101`, which has no own methods. Missing exact combat profiles and public NPC spawns remain real blockers.

### 111302 — The Archer's Anthem (`Brd0j2`)

Fst/439–441 assigns the **lone jackal Bardi in Nanawa Mines**; three companions are recommended. Jehantel's offer uses one acceptance EQ at pc149/0x4DE. The long account of bardic history and the later follow-up do not encode a second travel objective. There is no NQ scene or warp.

First opens `(worldMaster,51122,3101415)` at 0x9ED; Second shows `(27239,2)` at 0xA89; Third calls `showEventBeforeNpsLS(player,1200133,82)` at 0xAF8. Existing class 2101413/profile 3003/list 6002 identifies Bardi. A private copy with guarded kill ownership is adapter machinery, while marker 11225101 describes the public objective area. The runtime cap 4 matches the companion recommendation as a total party size.

### 111303 — Bard's-Eye View (`Brd0j3`)

Fst/442–444 assigns **Phaia in Central Shroud** to prove readiness before the promised ballad lesson. Offer EQ pc110/0x442 compares the single stored result to numeric 1. This chunk contains no NQ scene, no battle-start API, and no field movement.

Completion First opens `(worldMaster,51138,3101511)` at 0x936, not the row 51122 used by Bardi. Second shows `(27238,2)` at 0x9D2; Third uses linkpearl tuple `(player,1200133,83)` at 0xA41. Existing class 2101509/profile 3080/list 6025 must remain distinct from a generic boar. Marker 11225201 and the three-companion recommendation do not determine a private formation or public trigger.

### 111304 — Doing It the Bard Way (`Brd0j4`)

Fst/445–448 establishes **Jehantel's ballad → escort north of Hyrstmill → Ixali van encountered en route → fight without Jehantel's aid**. The journal explicitly says he cannot bring himself to fire; an allied attacking Jehantel would contradict that evidence. It permits seven companions.

The offer includes a deliberate finish/restart talk sequence and repeated actor/player music reactions, then one acceptance EQ at pc107/0x585. `processEventJehantel` is a reminder. `processEventNQ01(arg1)` and `NQ02` both run **entry** scene `brd0j410`; NQ01 selects the wrapper using strict boolean true at 0x8B8, while NQ02 is always default. `NQ03` is the distinct aftermath `brd0j420`, default fade, then world text 30. Numeric method order does not mean NQ02 is a post-battle scene.

`processEventClear01` and `Clear02` have identical effects: text 36/wait 8, `(27232,3)`/wait 6. The ability calls occur at 0xB8F and 0xC89 respectively. They are alternate presentation entrypoints, not two independent grants. The empty SQB subclass supplies no escort path, boundary, count, waves, or retry callbacks. Existing Ixali Scout 2206412 and Scout Wolf 2201428 identities do not complete those missing server contracts.

### 111305 — Pieces of the Past (`Brd0j5`)

Fst/449–451 identifies Cutter's Cry, Zahar'ak, Turning Leaf, and the cave south of Camp Iron Lake as the four choral-attire destinations. Jehantel's offer contains a normal one-second fade-out/wait/fade-in while recounting the past. No NQ scene or warp destination is encoded. The acceptance comparison is pc139/0x445; `_JEHANTEL_Follow` reiterates the places.

`processEvent_getAF_info(arg1)` runs owner scheduler 67108910 at 0x890 and displays `(player,arg1,0)` at 0x8A4. Known set 8051405/8071405/8081805/8013505 and markers 11225401–04 do not recover coffer actor IDs, full transforms, ordinal item bindings, or completion/persistence ownership. There is no item-selection branch in the scenario method.

### 111306 — Requiem for the Fallen (`Brd0j6`)

Fst/452–454 establishes **Jehantel → Griffin Crossing/central highlands boundary → war-band fight → Jehantel's song in the now-secure area**. The song follows victory. `processEvent_010` plays `brd0j610` with default fade and belongs to this aftermath, not an assumed prebattle cinematic. This scenario has no second NQ scene. The two `JEHANTELS_*_Follow` methods are phase-specific remarks.

Offer EQ pc166/0x682 handles one stored quest choice. `processEventClear(arg1)` presents local text 47/wait 8, ability `(27227,1)` at 0xC7B/wait 6, then caller-supplied item at 0xC97/wait 6. Choral Shirt 8032705 is a server reward binding. The dictionary's Jehantel can substantiate presence in the song but cannot establish him as a functioning battlefield ally.

Seven companions are permitted. Yotoli Hueloc 2206413 and the additional sabreur/strongbeak/bravewing/fogcaller classes 2206414–17 identify intended enemy families; class resources are not wave counts. The empty `QuestDirectorBrd0j601` gives no objective kills, spawn transforms, ally behavior, return warp, or cleanup.

## Dragoon

### 111321 — Eye of the Dragon (`Drg0j1`)

Fst/455–459 establishes **Haurtefert → Alberic at the Gates of Judgement → cull creatures around Camp Nine Ivies → encounter black-clad Estinien and the light → return to Alberic**. The journal does not ask the player to defeat Estinien. It permits three companions.

`processEventStart(arg1)` has an independent numeric 1 introduction flag at pc24/0x31E and a stored offer comparison at pc80/0x3FE. Its ordinary 1.5-second opening fades are at pc3/0x2CA and pc17/0x302, with a mode 1 talk opening while faded out. Both acceptance and rejection close the talk during another ordinary 1.5-second fade pair (accept:0x432/0x462; reject:0x4A6/0x4D6), then return the stored offer result. These are balanced presentation branches, not travel to Alberic. `processEventAlberic` and `AlbericAfter` declare fourth parameters but never read R3. They are, respectively, the initial Alberic briefing and its reminder; no race/job/branch meaning should be invented for their unused arguments.

`processEventNQ` plays `drg0j110` with default fade during the field culling transition. The player's later return uses `processEventClear`, which includes `startFadeOut(player,1.5)` at 0xAC1, wait 1.5, and `startFadeIn(player,1.5)` at 0xADD. Those are ordinary conversational fades at Alberic, not an encoded return-zone warp. `processEventKokuti(arg1)` shows the item at 0xED8/wait 6, global long row 51126 with key 2000204 at 0xEFC/wait 8, then `(27266,1)` at 0xF1C/wait 6.

Crabfishers 2204511 and Ironshell 2207612 are established quest identities; the three-plus-one roster and levels come from prior external/source notes, not the empty SQB client director. Scene Estinien is a cinematic actor, not evidence for adding a boss to this quest. Exact profiles, wave timing, field trigger and full transforms remain unresolved.

### 111322 — Lance of Fury (`Drg0j2`)

Roc/20–22 assigns **Bomb Baron in Cassiopeia Hollow**; three companions are recommended. The accepted briefing already gives that objective. `processEvent000_ALBERICS` repeats it and is not intrinsically a second mandatory stage, even if an adapter uses a second talk to launch private combat. Offer EQ pc105/0x589 compares the stored result to numeric 1. No scene or warp occurs.

First is global long `(worldMaster,51126,2000204)` at 0x891; Second is ability `(27272,3)` at 0x92D; Third is `showEventBeforeNpsLS(player,1000275,85)` at 0x99C. Existing Bomb Baron identity/profile and marker 11226101 can support a guarded private adapter without proving its original public placement owner or requiring the reminder as an objective.

### 111323 — Unfading Scars (`Drg0j3`)

Roc/23–25 assigns **Spitfire near Millers' Glade** after the dragoon's death. Alberic's offer contains the full assignment and has a numeric 1 EQ at pc137/0x5BA. `processEvent000_ALBERICS` is the repeated instruction, not independent evidence for another briefing step. There is no NQ scene or movement.

First displays `(worldMaster,51126,2000204)` at 0x90C; Second `(27267,1)` at 0x9A8; Third `(player,1000275,86)` via `showEventBeforeNpsLS` at 0xA17. The journal recommends three companions. Existing Spitfire identity/profile and marker 11226201 leave field-trigger ownership and full placement separate from the private adapter implementation.

### 111324 — Double Dragoon (`Drg0j4`)

Roc/26–29 establishes a **real pre-coffer rendezvous southwest of Skyfire Locks**. Estinien's dialogue there precedes the four armor locations. The offer EQ is pc28/0x436. `processEvent_NQ_Drg0j410` runs literal `Drg0j410` with default fade. `processEvent_ALBERIC_Guidance` supplies the subsequent armor guidance; it cannot be conflated with the offer reminder.

The four later destinations are Aurum Vale, north of Camp Brittlebark, U'Ghamaro Mines, and north of Camp Bluefog. The order of this journal list differs from some marker lists, so ordinal zip logic is particularly unsafe. Prior Dragoon-specific source notes independently corroborate the set's location/item pairs; that still does not recover a coffer actor.

`processEvent_getAF_info(arg1)` runs owner scheduler 67108910 at 0x934 and `showGetJobItemWidget(player,arg1,0)` at 0x948. No local state checks appear. Marker 11226301 is the rendezvous X/Z, while 11226302–05 are the item destinations. The exact actors, Y/rotation, public push ownership, state persistence and completion trigger remain absent. Scene-local Alberic/Estinien/PC poses must not be used as their persistent world spawn coordinates without a proven scene root transform.

### 111325 — Fatal Seduction (`Drg0j5`)

Roc/30–32 assigns **Stollenwurm south of Camp Riversmeet** and recommends **seven** companions. The offer already explains Alberic's past and gives the actual kill task; its choice EQ is pc173/0x519. `processEvent000_ALBERICS` repeats that instruction. A second-talk private launch can be a deliberate adapter control, but it is not a recovered ordered objective in the journal.

First presents `(worldMaster,51135,3102224,1,2000204)` at 0x88C; Second `(27277,3)` at 0x93A; Third `showEventBeforeNpsLS(player,1000275,88)` at 0x9A9. No NQ scene or movement occurs. The exact class 2102219/display 3102224 identifies Stollenwurm, while mob 32729 is migration-owned adapter data, not recovered retail BNPC data. Current party cap 3, balancing, public spawn transform and field trigger are consequently adapter policy/open work.

### 111326 — Into the Dragon's Maw (`Drg0j6`)

Roc/33–35 establishes **Alberic/urgent Estinien message → Griffin Crossing → fight/confrontation → dark-being aftermath → return to the Gates of Judgement** and permits seven companions. `processEvent000` is Alberic's reminder (texts 6/24). The journal itself does not require a second Alberic talk before departure; the adapter's use of it as a launch stage is explicit policy.

`processEvent010` plays literal `Drg0j610` with default fade. `processEvent020` and 025 both play `Drg0j620`;020 uses after-warp, 025 uses default. The first scene belongs to the confrontation; the second is the post-fight resolution before Alberic's later return talk. `processEvent015` only starts and immediately finishes a talk; it cannot establish an additional objective or spawn point.

`processEvent030` is the actual reward conversation. It says text 26 before opening the mode 2 talk, then gives texts 27/28, local long text 43 at 0x96B/wait 8, ability `(27268,1)` at 0x98B/wait 6, and **literal item 8032704** at 0x9A7/wait 6. Unlike other finale item methods, this one requires no extra item argument. The remaining dialogue intentionally finishes/restarts talk and includes an unusual `finishCliantTalkTurn(2,player)` call; preserve the exact recovered call rather than normalizing it away.

Existing Estinien 2289038/profile 3028 and Greywine 2202208/profile 3049 bindings support the adapter's enemy identities. Their skill families do not recover original thresholds, timing, spawn positions, phase relationships or the completion owner. The empty `QuestDirectorDrg0j601` supplies none of those callbacks. The currently reviewed adapter defers 025 to reward talk after returning to Alberic; a scene-preserving content owner should associate aftermath with success/exit, then keep 030 as the return conversation. The default wrapper alone does not locate 025 at Alberic.

## Typed scene placement and actor provenance

The [scene placement appendix](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/scene-placement-review.md) reviews all **16 referenced scene resources**, **146 actor-class-bound proxy dictionary entries**, **348 authored blocks**, and **6, 547 typed clips** in this scope. It joins **974 actor-class-bound SetPos clips**, including **270 PC SetPos records**, by CACT index to the proxy dictionary. Every PC record is retained in [scene-pc-tracks.json](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/scene-pc-tracks.json), including block label, raw start units, track, flags, record offset, and full float precision. This includes all authored blocks as well as the initial `setup` block.

### Why size-only placement decoding was rejected

The earlier setup helper treats every 0x40-byte record as a position. Two local counterexamples are decisive: `pld0j620`0x1D2A4 is an **IfClip** bound to PC, and `pld0j520`0x6C588 is a **LocalCameraClip**. Reading their integer/control bytes as floats creates plausible-looking near-zero values, including denormals. They are now listed in the parent's [rejected-size-only-placements.csv](../outputs/job-gc-decomp-20260907/rejected-size-only-placements.csv); neither is a PC/world position. The clip-class index also varies by scene: numeric opcode 2 cannot be globally equated with SetPosClip. The actual per-scene class registry is necessary.

CACT actor-kind indices likewise vary between resources and must be resolved through each resource's CATT registry. For example, Pld0j110's CATT order is `ProxyActor`, `CommonActor`, `CharacterActor`: its PC 0x3C record has kind index 0, and the stage/background 0x20 record has kind index 1. The 0x3C PC/NPC entries are serialized **ProxyActor** bindings; the serialized name **CharacterActor** can instead describe a stage/background slot and does not itself imply an actor-class binding. The parent [native registry audit](../outputs/job-gc-decomp-20260907/reviews/gc/actor-clip-registry-native.md) corroborates this mapping in `FUN_00a271b0` and `FUN_00a27210`. The review joins the proven 0x3C proxy dictionary to clips by CACT index. Duplicate labels, including the four `FIGHTER_GLADIAT` entries in Pld0j510, retain their distinct indices and dictionary offsets.

### Representative PC positions, with explicit scope

The following are initial poses when one exists, otherwise the first nonzero PC SetPos encountered in stored block order. All are **authored scene-local positions**. They are not asserted to be the beginning or end of the executed scene, and none is promoted to a persistent return warp. A `setup` zero pose is specifically distinguished from an absent PC setup record.

| Scene | Initial PC evidence | Representative block / offset | Position X, Y, Z | Rotation radians |
| --- | --- | --- | --- | --- |
| [blm0j110](../outputs/job-gc-decomp-20260907/scenes/blm0j110.json) | No PC SetPos in setup | `c01` /0x8BDC | -835.469971, 120.000000,-62.540001 | 3.054326 |
| [blm0j120](../outputs/job-gc-decomp-20260907/scenes/blm0j120.json) | Zero pose at 0x15B04 | `Sce01` /0x15FB0 | -197.497040, 18.001755, 62.249279 | 2.821225 |
| [blm0j610](../outputs/job-gc-decomp-20260907/scenes/blm0j610.json) | Zero pose at 0x9CAAC | `Scene02` /0x9DB60 | 908.099854, 311.585693, 656.087830 | -1.570796 |
| [blm0j620](../outputs/job-gc-decomp-20260907/scenes/blm0j620.json) | No PC SetPos in setup | `c19` /0x26934 | 863.421021, 309.007996, 654.697021 | -0.558505 |
| [pld0j110](../outputs/job-gc-decomp-20260907/scenes/pld0j110.json) | Nonzero setup | `setup` /0x5BC | -1804.979126, 72.171021, 0.695450 | 2.676123 |
| [pld0j510](../outputs/job-gc-decomp-20260907/scenes/pld0j510.json) | Nonzero setup | `setup` /0x129F0 | 317.601501, 247.994629,-894.070679 | -0.093047 |
| [pld0j520](../outputs/job-gc-decomp-20260907/scenes/pld0j520.json) | Nonzero setup | `setup` /0x6C774 | 319.550476, 247.994629,-892.526001 | 3.116747 |
| [pld0j610](../outputs/job-gc-decomp-20260907/scenes/pld0j610.json) | Nonzero setup | `setup` /0xAC96C | 128.070007, 248.304001,-1561.972046 | -2.981995 |
| [pld0j620](../outputs/job-gc-decomp-20260907/scenes/pld0j620.json) | No valid PC SetPos in setup | `c01` /0x1D6CC | 111.782127, 250.327225,-1583.047363 | 1.570796 |
| [brd0j410](../outputs/job-gc-decomp-20260907/scenes/brd0j410.json) | Zero pose at 0x586D4 | `Scene01` /0x58EAC | -460.741638, 19.899841,-2623.136719 | 2.233217 |
| [brd0j420](../outputs/job-gc-decomp-20260907/scenes/brd0j420.json) | Zero pose at 0x5CAC8 | `Scene_01` /0x5D554 | -450.114258, 19.402859,-2627.417969 | -0.942580 |
| [brd0j610](../outputs/job-gc-decomp-20260907/scenes/brd0j610.json) | No PC SetPos in setup | `c01x` /0x7D38C | 537.393982, 213.729996, 579.377014 | -2.374887 |
| [drg0j110](../outputs/job-gc-decomp-20260907/scenes/drg0j110.json) | Nonzero setup | `setup` /0x2BD44 | 1470.845947, 15.583244,-889.637878 | -2.967060 |
| [drg0j410](../outputs/job-gc-decomp-20260907/scenes/drg0j410.json) | Nonzero setup | `setup` /0x3A04 | 159.229996, 237.080002, 477.869995 | -1.570796 |
| [drg0j610](../outputs/job-gc-decomp-20260907/scenes/drg0j610.json) | Nonzero setup | `setup` /0x11CFC | 663.478821, 230.276871, 567.809753 | -2.967060 |
| [drg0j620](../outputs/job-gc-decomp-20260907/scenes/drg0j620.json) | Nonzero setup | `setup` /0x10EADC | 663.478821, 230.276871, 567.809753 | -2.967060 |

Drg0j410 is a useful corroboration: marker 11226301 has X/Z 159.229996/477.869995, matching the PC setup at 0x3A04. The scene supplies an authored Y 237.080002 and rotation−π/2 for that shot. It still does not supply a persistent ENPC spawn or the server's post-scene warp instruction. The [marker ledger](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/marker-evidence.json) preserves the original marker rows and does not manufacture missing Y/rotation fields.

### Actor roles and placements that should not become battle spawns

| Scene evidence | What it establishes | What it does not establish |
| --- | --- | --- |
| Blm0j110: PC index 1/dictionary 0x82F0; Kazagg index 2/class 1060036/0x832C; gem props indices 7–8/class 6500003 | Kazagg and the gem presentation accompany the post-kill narrative. PC and Kazagg receive later SetPos tracks even though setup contains only the gem poses. | Gnat count, Kazagg as an ally, or a persistent PC arrival coordinate. |
| Blm0j610: `GARGOYLE`/`FreezeGARGOYLE` both class 1001973; WISP_A class 6500044 plus nine other WISP slots class 1001974 | Multiple authored gargoyle/wisp presentation forms, with distinct indices and tracks. | Two Barbatos bosses, exactly ten combat lanterns, or a binding to the three 2209906–08 combat subclasses. |
| Blm0j620: old/young Ququruka, three tribal NPCs, gargoyle, many books/letters, four additional PC-labeled slots | Flashback and character-variant presentation assets are mixed in one resource. | Additional party members, required item deliveries, or enemy waves. |
| Pld0j110: Solkzagyl 1060041 at setup 0x528=(-1804.005859, 72.171021, 0.695450), rotation−2.307134 | Source-backed cinematic meeting with the free paladin after the undead. | A combat ally or the battle-entry transform. |
| Pld0j510: four identically labeled `FIGHTER_GLADIAT` slots 7–10/class 1001984 at dictionary 0x12498/0x124D4/0x12510/0x1254C | Four separate soldiers are staged in the betrayal scene, supplementing the journal's plural soldiers. Their shared initial pose is later moved by scene tracks. | A final four-copy battle roster, actual BNPC class/profile, or a sensible persistent formation copied from their overlapping setup poses. |
| Pld0j610: three OGRE slots/class 1001975 and three AHRIMAN slots/class 1001976; Jenlyns 1060042 and Solkzagyl 1060041, including a Solkzagyl duplicate | The cinematic portrays the monster cohort and both allies. Dictionary copies are countable without conflating labels. | Three-plus-three is the exact combat count, the duplicate is a second ally, or cinematic classes 1001975/76 should replace battle classes 2202503/2201706. |
| Brd0j410/420: Jehantel, his bow/arrow assets, younger Jehantel and past comrades, cinematic Ixal 1001961 and wolves 1001962 | Flashback/storytelling and battlefield images coexist in one scene. | Every `Friend_*` is a present-day party member or enemy; Jehantel can attack despite the journal's explicit inability to fire. |
| Brd0j610: PC slot 4, Jehantel 1060039 slot 5, bow/arrow/prop slots; 77 PC SetPos clips | Numerous authored shot/model variants need per-block tracking. | Seventy-seven players, a single final transform from the last stored block, or required ally combat AI. |
| Drg0j110: Estinien 1060040 index 5/0x2B9A8 and anonymous 1000935 index 7/0x2BA08 share an initial pose | Named/anonymous staging participates in the revelation before returning to Alberic. | An extra Estinien fight or a duplicated enemy. |
| Drg0j610/620: PC/Alberic/Estinien share the initial 663.478821, 230.276871, 567.809753 pose;620 adds `Haldras`1001983 | Later authored tracks and motion clips place the actors for the confrontation/resolution. | Three actors should persist overlapped in the instance; Haldras is an additional combat target; the shared setup is the final return location. |

The last PC SetPos in stored Drg0j620 block `c33` is 659.074524, 229.300034, 563.050110 at 0x112F4C. That is useful **shot evidence**, not a proven exit warp. MotionClip/MovePosClip, conditional blocks, and after-warp ownership still need to be followed before asserting an executed final world transform. The same restriction applies to every “last” record in the appendix.

## Content-shell evidence and remaining reconstruction work

The recovered quest-specific client director classes in this scope are only `_defineClass`/`require` shells: SQB children `Blm0j101`, `Pld0j101`, `Pld0j501`, `Brd0j101`, `Brd0j401`, `Drg0j101`, `Drg0j601`; ordinary children `Blm0j301`, `Blm0j601`, `Pld0j601`, `Brd0j601`. Their base class identifies an ownership family, not combat scripts. No child supplies a wave table, position, event-result tuple, retry rule, ally control, or kill callback. The parent review traces inherited lifecycle methods separately.

For a playable reconstruction the missing server owner must define, explicitly and separately: public trigger/interaction ownership; full persistent transforms; instance creation; success/failure/give-up; post-success scene variant and its event argument; actual return placement; scene completion/skip acknowledgement; one authoritative reward grant and cleanup. Journal and client presentation evidence constrain those decisions but do not substitute for them.

Reproduce this supplement from the repository root with:

```powershell
python -X utf8 outputs\job-gc-decomp-20260907\reviews\blm-pld-brd-drg\review_support.py
```

The generated source ledger is read-only and can be rebuilt without running the game or changing runtime data. The [path-coverage result](../outputs/job-gc-decomp-20260907/reviews/blm-pld-brd-drg/review-path-coverage.json) records 239 methods, 279 path templates, 72 covered comparison edges, zero uncovered comparison edges, and no loop templates. The scene appendix retains every dictionary entry and PC SetPos evidence rather than hiding absent or zero setup poses.
