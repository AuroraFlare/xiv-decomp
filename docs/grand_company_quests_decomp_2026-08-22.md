# Grand Company Quest Decomp and Seamless-Client Contract

Date: 2026-08-22
Scope: the complete Grand Company quest block in this repository: Maelstrom, Order of the Twin Adder, and Immortal Flames.

> **2026-09-04 bytecode follow-up:** The [18-mission branch and scene pass](grand_company_missions_bytecode_decomp_2026-09-04.md) verifies saved-choice behavior, recovers nine scene setups, identifies omitted familiar post-fight payloads in the indirect dispatcher, and corrects the three Imperial Devices duration arguments. Earlier “client-facing complete” and literal-arity claims do not cover those remaining payload/variant gaps. All offers remain disabled.

> **2026-08-31 update:** The offer-state labels and “currently active” table below are a snapshot of the 2026-08-22 pass. All 69 named routes are now disabled behind the audit gate. Their current event, cutscene, transition, implementation, and blocker status is recorded in [`grand_company_quests_cutscene_transition_audit_2026-08-31.md`](grand_company_quests_cutscene_transition_audit_2026-08-31.md).
>
> **2026-09-01 third pass:** Scenario signatures, emote ownership, and generic-scaffold safety were re-audited. The promotion helpers now require the client-authored `emoteDefault1` company-salute event for both `G*701` and `G*702`; no officer talk can award either rank. All 47 literal server dispatches match the recovered method arity, and the unresolved generic route sequencer has its own hard audit gate. The zero-offer policy remains unchanged.

> **2026-09-01 fourth pass:** The normal quest-offer lifecycle was traced through `QuestStateManager` and `Quest.OnAccept`. Twenty-four bespoke routes had only sequence-zero resume logic, so they could not enter the journal through the ordinary `SEQ_ACCEPT` NPC interaction. The twelve direct opening routes plus the Toto-Rak, Dzemael, and campaign helper families now publish their starting NPC at `SEQ_ACCEPT` and call `AcceptQuest` only after the recovered client event agrees. Together with the previously correct enlistment, field, and rank families, all 36 bespoke owners now have a validated offer contract. The 33 generic wrappers remain deliberately non-accepting/non-executable, and all 69 availability entries remain disabled.

## Executive result

The repository contains 102 Grand Company quest rows:

- 69 named, offerable quest definitions: 23 for each city/company.
- 33 `[en]` rows with no name, prerequisite, or level. These are preserved as evidence-blocked internal rows; no content is invented for them.

The client-facing decomp is complete below. The server implementation is deliberately staged; as of the 2026-09-01 audit no named route is offerable. Unresolved instance, NM, escort, party, and cutscene routes remain gated, while the newly wired salute transitions still require a live 1.23 client pass. This prevents a client from entering a route whose battle actor, content director, reward transaction, or return cutscene is still only a placeholder.

This pass also adds the missing company-seal transaction guard to the safe handwritten routes and to the generic template. A quest now leaves its evidence/items and remains retryable when the character is at the company-seal cap. The unknown Charledore actor path in `Com0u6` / quest `111806` is intentionally unchanged and remains blocked.

## Source of truth

| Surface | Repository source | Use |
| --- | --- | --- |
| Quest IDs, names, codes, prerequisites, levels | [`Data/sql/gamedata_quests.sql`](../Data/sql/gamedata_quests.sql) | Authoritative quest inventory |
| Elemen Grand Company archive | [archived eLeMeN Grand Companies archive](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/TheGrandCompanies/index.html) and its archived quest pages | Preferred source for legacy quest order, NPC names, coordinates, encounter names, party/content flow, and rewards whenever the page has the data |
| Offer gating and active rows | [`Data/scripts/quests/quest_availability.lua`](../Data/scripts/quests/quest_availability.lua) | What the client can currently receive |
| Generic route owner | [`Data/scripts/quests/com/gc_quest_template.lua`](../Data/scripts/quests/com/gc_quest_template.lua) | Shared state, journals, hooks, and still-disabled battle placeholders |
| Rank/promotion route owner | [`Data/scripts/quests/com/gc_rank_quest.lua`](../Data/scripts/quests/com/gc_rank_quest.lua) | War Merit and final promotion state machines |
| Stronghold field route owner | [`Data/scripts/quests/com/gc_field_interaction_quest.lua`](../Data/scripts/quests/com/gc_field_interaction_quest.lua) | The three bespoke, currently disabled 304 field-survey variants |
| Toto-Rak route owner | [`Data/scripts/quests/com/totorak_gc_quest.lua`](../Data/scripts/quests/com/totorak_gc_quest.lua) | The three Imperial Devices variants |
| Fight prerequisites and blockers | [`docs/quest_fight_implementation_backlog_2026-06-30.md`](quest_fight_implementation_backlog_2026-06-30.md) | Actor, spawn, kill, loot, and reward gates |
| Custom Grand Company client surfaces | [`docs/grand_company_custom_surface_contract_2026-06-21.md`](grand_company_custom_surface_contract_2026-06-21.md) | Shop, supply, warp, officer, and content-information contracts |
| Raw reward evidence | [`docs/Dat Mining/quest_new_reward.csv`](Dat%20Mining/quest_new_reward.csv) | Exact company-seal quantities |
| Full Elemen route ledger | [`grand_company_quests_elemen_ledger_2026-08-22.md`](grand_company_quests_elemen_ledger_2026-08-22.md) | Source-first NPC, coordinate, encounter, item, time-limit, reward, and gate inventory for all named branches |

### Source-priority passthrough

The user-specified Elemen archive is the first source checked for legacy Grand Company facts. Its current live URL resolves to the Sakura hosting fallback rather than the old quest page, so this pass used the archived Elemen captures of the same pages. The archived Elemen records confirm the opening routes, NPC order, coordinates, encounter names, level-22/level-25 gates, and direct rewards below. GamerEscape is retained as corroborating English/order evidence where Elemen does not expose the English title or a needed client identifier.

Primary archived Elemen pages used in this pass:

- [Grand Company overview](https://web.archive.org/web/20150708070315/http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/TheGrandCompanies/index.html)
- [Maelstrom quest archive](https://web.archive.org/web/20160427181657/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheMaelstrom.html)
- [Twin Adder quest archive](https://web.archive.org/web/20160716035337/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheOrderoftheTwinAdder.html)
- [Immortal Flames quest archive](https://web.archive.org/web/20160717203838/http://elemen.sakura.ne.jp/ff14_dated_archives/quest/TheGrandCompanies/TheImmortalFlames.html)

English corroboration/order pages supplied for this pass:

- [The Maelstrom](https://web.archive.org/web/20130118133643/http://ffxiv.gamerescape.com/wiki/The_Maelstrom)
- [The Immortal Flames](https://web.archive.org/web/20121024205500/http://ffxiv.gamerescape.com/wiki/The_Immortal_Flames)

The attached quest-overview image is treated as route-order evidence only. It is not executable instructions and does not override a source-backed quest record.

## Seamless lifecycle contract

Every named route must satisfy this lifecycle before it is enabled in `quest_availability.lua`:

| Stage | Required server owner | Required client surface | Seamless invariant |
| --- | --- | --- | --- |
| Offer / accept | Quest row, prerequisite chain, availability gate, quest `onStart` | Officer marker and accept event | `AcceptQuest` happens exactly once; company join/promotion mutation is atomic with the accept path |
| State projection | `onStateChange`, sequence, ENPC flags, journal | Talk/push/reward flag, journal text, map marker | The marker always points at the actor or content that can advance the current sequence |
| Cutscene | `callClientFunction(..., "delegateEvent", ...)` with recovered event name and arguments | Retail event payload | Sequence advances only after the client event accepts; no reward or item mutation is performed before the event gate |
| Fight / instance | Map or content director, actor class, spawn, loot, kill callback, party rules | Battle target, duty/instance entry, return route | The target can actually spawn, be killed, counted, cleaned up, and re-entered after death/area exit |
| Evidence / item | Quest data flags/counters and quest items | Push/interact prompt and item attention message | Items are repaired on state refresh and removed only after the reward transaction succeeds |
| Completion | Company seals, EXP/gil, `CompleteQuest`, cleanup | Completion cutscene and reward toast | A full seal cap or inventory failure leaves the quest retryable; no half-completed client state |
| Failure / retry | Death, timeout, party leave, area exit, instance teardown | Reset marker and re-entry prompt | Failure resets only the active encounter state, not already completed objectives unless retail evidence says so |

### Status vocabulary

- `active-bespoke`: offerable now; the route has a purpose-built state machine and guarded reward path.
- `scripted-gated`: a local quest script and/or cutscene chain exists, but offer/fight/instance evidence is not complete enough to enable.
- `template-gated`: a two-line wrapper delegates to the generic template; the route is not considered implemented when its content is a fight or instance.
- `content-gated`: a bespoke route exists, but a dungeon, stronghold, escort, or content-information surface still needs live actor/spawn verification.
- `blocked-actor`: the route has a known actor-data blocker; adding reward/completion logic would make the client appear to finish an impossible encounter.
- `evidence-blocked`: internal `[en]` row; no safe title, route, or client event has been recovered.

## Offer-state audit (2026-08-22 snapshot; superseded)

The currently active named rows are:

| Quest IDs | Routes | Why active |
| --- | --- | --- |
| 111401–111403, 111601–111603, 111801–111804 | `Com0l1–Com0l3`, `Com0g1–Com0g3`, `Com0u1–Com0u4` | First-wave level-22 routes are source-backed. The three familiar fights and Immortal Flames' Hellhound fight use private SQB directors; the following dialogue/contract routes use exact event/reward guards and no fabricated combat |
| 111420, 111620, 111820 | `Gcl304`, `Gcg304`, `Gcu304` | Bespoke stronghold field interactions, objective flags/counters, quest-item repair, and guarded 700-seal completion |
| 111428, 111628, 111828 | `Gcl701`, `Gcg701`, `Gcu701` | Bespoke War Merit state machines, target BNPCs, rank promotion, and content-information director support |

The remaining named rows stay commented out in `quest_availability.lua` until their row-specific gates below are satisfied. Having a Lua file is not sufficient: a route that only advances through officer dialogue is still a scaffold when the retail quest requires a fight or duty.

## Implemented opening familiar fights

The first quest in each company branch is now a real private squad-battle route rather than a marker-only `onKillBNpc` placeholder. The source identity and server identity are deliberately kept side by side:

| Quest | Elemen encounter name | Client actor class | Server mob type | Completion path |
| --- | --- | ---: | ---: | --- |
| `111401` / `Com0l1` | Peiste Familiar (`ペイストファミリアー`) | `2200708` | `1359` | Kill → Walcher → signed agreement → Guincum; `1,760 EXP` |
| `111601` / `Com0g1` | Drake Familiar (`ドレイクファミリアー`) | `2202206` | `1358` | Kill → Ailith → oath → Fulke; `1,541 EXP` |
| `111801` / `Com0u1` | Anole Familiar (`アノールファミリアー`) | `2200205` | `1360` | Kill → Taylor → letter → Aubrey; `1,760 EXP` |
| `111804` / `Com0u4` | Hellhound (`ヘルハウンド`) | `2109801` | `1361` | Aubrey → private Hellhound fight → Aubrey → three Limsa contracts → Aubrey; `500 Flame Seals + 1,760 EXP` |

The fight lifecycle is intentionally commented in [`gc_sqb_quest.lua`](../Data/scripts/quests/com/gc_sqb_quest.lua), [`gc_sqb_runtime.lua`](../Data/scripts/directors/Quest/gc_sqb_runtime.lua), and the four `QuestDirectorGcCom0*.lua` wrappers:

1. The Urianger conversation advances the quest to sequence `30` and starts the private content shell. If the shell cannot be created, the quest is restored to sequence `20`, so the player can retry from Urianger instead of being stranded at a dead marker.
2. The launcher validates a small party before creating anything. A party leader may bring at most three total online combat-ready members in the same public area; a non-leader starts the source route solo. This is the server-side interpretation of the archived “up to two other players” allowance and prevents half-filled content groups.
3. The private area director is rebound to the actual content-area object before its first packet. The quest owner, helpers, director, and exact target are added to the content group before the per-player `DoZoneChangeContent` calls register return points.
4. The target is materialized with both identifiers: the client actor class controls kill identity, while the server mob type supplies the level-19 combat profile and skills. A per-copy unique ID prevents an ambient field mob from satisfying the quest.
5. `onZoneIn` only prepares the boundary. It does not advance the quest or grant anything. The runtime allows the asynchronous zone change to settle, then watches for the exact actor class, death, area exit, or timeout.
6. A valid kill moves only the quest owner from `30` to `40`; an assisting player without that quest cannot receive an accidental completion. Failure returns the owner to `20`. In either case the target is despawned, the content members are returned to their registered public return points, and the director/content area is torn down.
7. The final public NPC conversation owns the evidence-item removal, company-seal transaction where applicable, EXP grant, and `CompleteQuest`. That boundary keeps a disconnect, full seal cap, or inventory failure retryable and prevents a director callback from double-paying a reward.

The legacy client can therefore see the same narrative seams as the archived route—briefing event, private familiar fight, post-fight NPC, and final reward event—without exposing a public-world kill race. Static validators cover the ID/sequence/availability contract; a live server smoke test should still exercise solo entry, a three-player leader entry, wrong-mob kills, death, timeout, reconnect, and final reward completion before release.

## Exact reward contract

The raw client reward table uses company currency items `1000201` (Storm), `1000202` (Serpent), and `1000203` (Flame). The quantities in the matrices below are exact. `—` means the raw row has no direct company-seal reward; it does not mean that a reward should be guessed.

The shared helper [`Data/scripts/gcseals.lua`](../Data/scripts/gcseals.lua) now provides `GrantGCQuestSeals`. Handwritten completion paths that have a known direct seal reward use it before removing evidence or calling `CompleteQuest`; the generic template uses the same map. The already-bespoke field and Toto-Rak helpers retain their equivalent guarded transaction logic.

## Maelstrom / Limsa Lominsa matrix

| ID | Code / title | Route decomp | Cutscene / fight seam | Seals | Server status and next gate |
| ---: | --- | --- | --- | ---: | --- |
| 111401 | `Com0l1` — The Price of Integrity | Guincum → Walcher → Urianger; private SQB fight; Walcher's signed agreement → Guincum | Elemen: La Noscea `(40,17)`, 30-minute content, Peiste Familiar. Server target `2200708` + mob type `1359`; success `30→40`, failure `30→20` | — | `active-bespoke`; private SQB lifecycle, exact kill ownership, party entry, timeout/death retry, cleanup, and `1,760 EXP` completion are wired |
| 111402 | `Com0l2` — Testing the Waters | Guincum dialogue-only report | Elemen: immediate completion; no fight | 250 | `active-bespoke`; guarded `250` Storm Seals + `1,100 EXP` completion |
| 111403 | `Com0l3` — Seals for the Whorl | Grizzly Gnat dialogue-only report | Elemen: non-combat route; no direct seal reward | — | `active-bespoke`; guarded dialogue completion with `1,100 EXP`; no guessed seal payout |
| 111404 | `Com0l4` — Engineering Victory | Guincum → Eastern La Noscea battle → Magitek transceiver → Ebrelnaux at Millers' Glade → Guincum | Elemen: three waves at `(35,14)` — Funditor/Bestiarius, Speculator/Triarius, then Veles; current shell has no verified wave director | 500 + `1,541 EXP` | `content-gated`; source correction recorded; do not enable the current dialogue-only shell until all waves, transceiver, Ebrelnaux instance, and retry path are real |
| 111405 | `Com0l5` — An Officer and a Wise Man | Guincum → pirates at Eastern La Noscea `(31,24)` → Merlwyb/Urianger → Zanthael ceremony → Y'shtola | Elemen: 30-minute content against the rough pirates; the old Toto-Rak fallback was removed on 2026-08-31 | 300 + `1,891 EXP` | `content-gated`; source-backed accept/journals are audit-gated until the pirate fight and ceremony chain exist |
| 111406 | `Com0l6` — Ceruleum Shock | Guincum → ferry-dock Imperial fight → Aisborgsyn → Central Thanalan `(24,23)` → Cid | Elemen: Speardancer, Bladedancer, Shadowspinner, Lightspinner; the old Toto-Rak shell was removed on 2026-08-31 | 300 + `1,891 EXP` | `content-gated`; source-backed accept/journals are audit-gated pending the four-target fight, aftermath, and return |
| 111407 | `Com0l7` — Till Sea Swallows All | Guincum accept → pledge to the Maelstrom → completion | `processEventGuincamStart` / `processEventGuincamEnd`; `TryJoinGrandCompany(1, 111407)` | 1000 + `1,080 EXP` | `scripted-gated`; guarded seal completion added; enlistment/cutscene smoke test required |
| 111410 | `Com5l0` — Imperial Devices (Limsa Lominsa) | Guincum → Zerig → Bloisirant → Toto-Rak moogle/objective route → Bloisirant → Guincum | Toto-Rak entry, moogle actor set, items `11000260–11000268`, completion event | 1000 | `content-gated`; bespoke shared route with guarded transaction; verify all Toto-Rak actors, entry, re-entry, and cleanup |
| 111411 | `Com5l1` — Into the Dark (Limsa Lominsa) | Guincum → Hasthwab → Quiliane → Dyrstweitz → Captain’s Quarters objective → Quiliane → Guincum | Imperial Primus Ordinarius `2307001` awards Magitek Dowsing Rod `11000270` and advances the quest; Batraal `2303501` remains the full dungeon-clear owner | 4000 | `content-gated`; dedicated route wired, keep disabled pending live verification |
| 111416 | `Gcl101` — It Kills with Fire (Limsa Lominsa) | Officer dialogue → Bowl of Embers clear → report | Ifrit placeholder `2207301`; duty entry/clear/return missing | 1000 | `template-gated`; keep disabled until Ifrit content is real |
| 111417 | `Gcl301` — The Cove | Officer → coastal objective/dialogue → report | Dialogue route is represented only by the generic template; objective actors and event payload need proof | 300 | `template-gated`; recover route actors and cutscene arguments |
| 111418 | `Gcl302` — Saving the Stead Instead | Officer → objective/dialogue → report | Generic completion hook `processEventClear`; route actors/markers need proof | 300 | `template-gated`; recover objective and completion payload |
| 111419 | `Gcl303` — It’s a Piece of Cake to Bake a Poison Cake | Officer → poison-cake objective → hostile encounter → report | Qiqirn placeholder `2206305`; spawn, kill, loot, and cleanup missing | 1000 | `template-gated`; implement the real encounter before enabling |
| 111420 | `Gcl304` — Kobold and the Beautiful | Lilina → field sergeant Kurtz Nolan → three push/interact objectives → report | Objective actors `1090206–1090208`, item `11000408`, events `processEventLilinaStart`, `processEvent_005`, `processEvent_010`, `processEvent_015` | 700 | `active-bespoke`; active and guarded; stronghold markers intentionally use ENPC flags until reliable map coordinates are recovered |
| 111426 | `Gcl305` — Oil Crisis | Officer → Cutter’s Cry / hostile objective → report | Myrmidon Princess placeholder `2303003`; instance/encounter contract missing | 700 | `template-gated`; implement the real encounter and return route |
| 111427 | `Gcl102` — Alive | Officer → objective/encounter → report | Generic event hooks exist, but no verified fight/content owner | 1000 | `template-gated`; recover objective actor and kill/return contract |
| 111428 | `Gcl701` — The Weakest Link | Officer → War Merit targets → commander report → Guincum → player Storm Salute → promotion | Targets `2206606–2206608`, merit `125/150/175`, rank `17→21`, 1000-merit requirement, content profile `gcl70101`; `emoteDefault1` is the only promotion trigger | — | `scripted-gated`; timed duty/reset/salute-only rank route is wired and disabled pending live verification |
| 111429 | `Gcl103` — Deus ex Machina | Officer → objective/encounter → report | Accept event hook exists; no verified encounter owner | 1500 | `template-gated`; recover objective and fight/return surface |
| 111430 | `Gcl104` — In for Garuda Wakening (Limsa Lominsa) | Officer → Howling Eye clear → report | Garuda placeholder `2209501`; duty director/entry/clear/return missing | 2000 | `template-gated`; implement real duty contract |
| 111431 | `Gcl105` — Don’t Hate the Messenger (Limsa Lominsa) | Officer → messenger objectives → report | Limsa accept hook exists; objective chain and party/encounter contract need proof | 2000 | `template-gated`; recover the route before enabling |
| 111432 | `Gcl106` — United We Stand (Limsa Lominsa) | Officer → party battle → report | Patch evidence identifies a party battle; generic template has no party director or encounter | 5000 | `template-gated`; implement party membership, wipe, clear, and return |
| 111433 | `Gcl107` — To Kill a Raven (Limsa Lominsa) | Officer → Rivenroad / Nael clear → report | Nael placeholder `2210902`; data row points to prerequisite `111434`, so the retail prerequisite graph must be confirmed before enabling | 6000 | `template-gated`; resolve prerequisite plus encounter contract |
| 111434 | `Gcl702` — Patrol, Interrupted | Great Buffalo → officer report → company salute → promotion | Rank-31 target `2100801`; the final officer is emote-enabled and only `emoteDefault1` can invoke `processEvent010(27)` and the guarded `27→31` transaction | 5000 | `content-gated`; source route is represented, disabled pending live NM and salute verification |

## Order of the Twin Adder / Gridania matrix

| ID | Code / title | Route decomp | Cutscene / fight seam | Seals | Server status and next gate |
| ---: | --- | --- | --- | ---: | --- |
| 111601 | `Com0g1` — Breaking the Seals | Fulke → Ailith at Quarrymill → Urianger; private SQB fight; Ailith's oath → Fulke | Elemen: Black Shroud `(42,48)`, 30-minute content, Drake Familiar. Server target `2202206` + mob type `1358`; success `30→40`, failure `30→20` | — | `active-bespoke`; private SQB lifecycle, exact kill ownership, party entry, timeout/death retry, cleanup, and `1,541 EXP` completion are wired |
| 111602 | `Com0g2` — Why Did It Have to Be Snakes | Fulke dialogue-only report | Elemen: immediate completion; no fight | 250 | `active-bespoke`; guarded `250` Serpent Seals + `1,100 EXP` completion |
| 111603 | `Com0g3` — Adder’s Nest Egg | Haurtelle dialogue-only report | Elemen: non-combat route; no Clay Golem here. The Clay Golem belongs to `111605` / Their Finest Hour | — | `active-bespoke`; guarded dialogue completion with `1,100 EXP`; no guessed seal payout |
| 111604 | `Com0g4` — The Mail Must Get Through | Fulke → Irmin Hedge protection battle → encrypted letter to Radulf at Little Ala Mhigo → Fulke | Elemen/GamerEscape: 30-minute Imperial-soldier content near `(24,17)`; current script has no escort/fight director | 500 + `1,541 EXP` | `content-gated`; source correction recorded; implement protection/fight failure, encrypted-letter handoff, and return |
| 111605 | `Com0g5` — Their Finest Hour | Fulke → Mih Khetto ceremony/Papalymo → Rootslake `(47,50)` → Earthbreaker → Clay Golem → Urianger | Elemen: 30-minute `Clay Golem` content; the old Toto-Rak fallback was removed on 2026-08-31 | 300 + `1,891 EXP` | `content-gated`; accept/journals are audit-gated pending ceremony, Earthbreaker, Clay Golem, and return owners |
| 111606 | `Com0g6` — Appetite for Destruction | Fulke → Bowlord Lewin at Stillglade → clearing west of Nine Ivies → Arthur/Cid attack → Cid at Stillglade | Recovered journals 340–342 and `processEventNq` / `COM0G510`; this is not Toto-Rak content | 300 + `1,891 EXP` | `content-gated`; false Toto-Rak/reward path removed, source-backed front half gated pending Nine Ivies battle/return ownership |
| 111607 | `Com0g7` — Serenity, Purity, Sanctity | Syro accept → pledge to the Twin Adder → completion | `processEventFulkeStart` / `processEventFulkeEnd`; `TryJoinGrandCompany(2, 111607)` | 1000 + `1,080 EXP` | `scripted-gated`; guarded seal completion added; enlistment/cutscene smoke test required |
| 111610 | `Com5g0` — Imperial Devices (Gridania) | Syro → Bloisirant → A-Ruhn Senna → Toto-Rak moogles → report → Syro | Toto-Rak entry, moogle actor set, recording plate `11000260`, completion event | 1000 | `content-gated`; bespoke shared route with guarded transaction; verify entry, actors, re-entry, and cleanup |
| 111611 | `Com5g1` — Into the Dark (Gridania) | Fulke → Yuhelmeric → Dyrstweitz → Captain’s Quarters objective → Yuhelmeric → Fulke | Imperial Primus Ordinarius `2307001` awards Draconian Rosary `11000264` and advances the quest; Batraal `2303501` remains the full dungeon-clear owner | 4000 | `content-gated`; dedicated route wired, keep disabled pending live verification |
| 111616 | `Gcg101` — It Kills with Fire (Gridania) | Officer dialogue → Bowl of Embers clear → report | Ifrit placeholder `2207301`; duty entry/clear/return missing | 1000 | `template-gated`; keep disabled until Ifrit content is real |
| 111617 | `Gcg301` — Eternal Recurrence | Officer → objective/dialogue → report | Generic template only; objective actors and event payload need proof | 300 | `template-gated`; recover route actors and cutscene arguments |
| 111618 | `Gcg302` — The Pen Is Mightier Than the Spear | Officer → objective/dialogue → report | Generic completion hook `processEventClear`; route actors/markers need proof | 300 | `template-gated`; recover objective and completion payload |
| 111619 | `Gcg303` — Woes of the Botanist | Officer → botanist objective → hostile encounter → report | No verified encounter owner in the server; objective/fight/loot contract missing | 1000 | `template-gated`; recover the real encounter before enabling |
| 111620 | `Gcg304` — Gone with the Wind | Alaire → field sergeant Liflin → three push/interact objectives → report | Objective actors `1090209–1090211`, evidence items `11000409–11000411`, events `processEventALAIREStart`, `processEvent_005`, `processEvent_010`, `processEvent_015` | 700 | `active-bespoke`; active and guarded; stronghold markers intentionally use ENPC flags |
| 111626 | `Gcg305` — A Taste for Death | Officer → Cutter’s Cry / hostile objective → report | Myrmidon Princess placeholder `2303003`; instance/encounter contract missing | 700 | `template-gated`; implement the real encounter and return route |
| 111627 | `Gcg102` — Two Vans are Better than One | Officer → caravan/escort objective → report | Retail evidence and validator classify this as an escort/instance route; generic template cannot model it | 1000 | `template-gated`; implement two-van movement, escort failure, and return |
| 111628 | `Gcg701` — You Don’t Have the Rite | Officer → War Merit targets → commander report → Fulke → player Serpent Salute → promotion | Targets `2206409–2206411`, merit `125/150/175`, rank `17→21`, 1000-merit requirement, profile `gcg70101`; `emoteDefault1` is the only promotion trigger | — | `scripted-gated`; timed duty/reset/salute-only rank route is wired and disabled pending live verification |
| 111629 | `Gcg103` — Shadow of the Raven | Officer → objective/encounter → report | Generic accept hook exists; no verified encounter owner | 1500 | `template-gated`; recover objective and fight/return surface |
| 111630 | `Gcg104` — In for Garuda Wakening (Gridania) | Officer → Howling Eye clear → report | Garuda placeholder `2209501`; duty director/entry/clear/return missing | 2000 | `template-gated`; implement real duty contract |
| 111631 | `Gcg105` — Don’t Hate the Messenger (Gridania) | Officer → messenger objectives → report | Gridania accept hook exists; objective chain and party/encounter contract need proof | 2000 | `template-gated`; recover the route before enabling |
| 111632 | `Gcg106` — United We Stand (Gridania) | Officer → party battle → report | Patch evidence identifies a party battle; generic template has no party director or encounter | 5000 | `template-gated`; implement party membership, wipe, clear, and return |
| 111633 | `Gcg107` — To Kill a Raven (Gridania) | Officer → Rivenroad / Nael clear → report | Nael placeholder `2210902`; data row points to prerequisite `111634`, so the retail prerequisite graph must be confirmed before enabling | 6000 | `template-gated`; resolve prerequisite plus encounter contract |
| 111634 | `Gcg702` — Cure for the Common Pox | Big-hearted Hot Pox → officer report → company salute → promotion | Rank-31 target `2110312`; `emoteDefault1` is the sole completion event and invokes `processEvent010(27)` after the guarded rank transaction | 5000 | `content-gated`; disabled pending live NM and salute verification |

## Immortal Flames / Ul’dah matrix

| ID | Code / title | Route decomp | Cutscene / fight seam | Seals | Server status and next gate |
| ---: | --- | --- | --- | ---: | --- |
| 111801 | `Com0u1` — Career Opportunities | Aubrey → Taylor at Camp Horizon/ferry docks → Urianger; private SQB fight; Taylor's letter → Aubrey | Elemen: Western Thanalan `(9,31)`, 30-minute content, Anole Familiar. Server target `2200205` + mob type `1360`; success `30→40`, failure `30→20` | — | `active-bespoke`; private SQB lifecycle, exact kill ownership, party entry, timeout/death retry, cleanup, and `1,760 EXP` completion are wired |
| 111802 | `Com0u2` — Kindling a Flame | Aubrey dialogue-only report | Elemen: immediate completion; no fight | 250 | `active-bespoke`; guarded `250` Flame Seals + `1,100 EXP` completion |
| 111803 | `Com0u3` — Burning a Hole in One’s Pocket | Rahz dialogue-only report | Elemen: non-combat route; no direct seal reward | — | `active-bespoke`; guarded dialogue completion with `1,100 EXP`; no guessed seal payout |
| 111804 | `Com0u4` — Arms Race | Aubrey → private Hellhound fight near Gold Bazaar → Aubrey → C'ndanya, Raaka Maaka, and Bamponcet contracts → Aubrey | Elemen-first correction: Hellhound actor `2109801`, server mob type `1361`, then three contract items `11000256`, `11000255`, and `11000253`; the private director owns exact kill credit and returns the owner to sequence `20` | 500 + `1,760 EXP` | `active-bespoke`; private fight has the same party/death/timeout/cleanup contract as the familiar routes; public contract collection and guarded reward remain in `com0u4.lua` |
| 111805 | `Com0u5` — Burning Man | Aubrey → ferry-dock pirates west of Camp Horizon → Thancred/Urianger → Raubahn ceremony → Thancred | Elemen/GamerEscape: pirate content and Royal Promenade aftermath; the old Toto-Rak fallback was removed on 2026-08-31 | 300 + `1,891 EXP` | `content-gated`; accept/journals are audit-gated pending the pirate fight and ceremony chain |
| 111806 | `Com0u6` — Know Your Enemy | Aubrey → Cid / Ironworks → Charledore pursuit → hostile confrontation → Cid → Aubrey | BNPC `2289025` is a known blank/property-zero actor blocker; no spawn, SQL, loot, reward, or completion path may be added until actor evidence is repaired | 300 in raw client data, intentionally not granted by the blocked route | `blocked-actor`; remains disabled and intentionally lacks the new seal helper |
| 111807 | `Com0u7` — By Fire Reborn | Aubrey accept → pledge to the Immortal Flames → completion | `processEventAubreyStart` / `processEventAubreyEnd`; `TryJoinGrandCompany(3, 111807)` | 1000 + `1,080 EXP` | `scripted-gated`; guarded seal completion added; enlistment/cutscene smoke test required |
| 111810 | `Com5u0` — Imperial Devices (Ul’dah) | Aubrey → Nuala → Bloisirant → Toto-Rak moogles → report → Aubrey | Toto-Rak entry, moogle actor set, gauntlet/cooling-plate items, completion event | 1000 | `content-gated`; bespoke shared route with guarded transaction; verify entry, actors, re-entry, and cleanup |
| 111811 | `Com5u1` — Into the Dark (Ul’dah) | Aubrey → Vairemont → Dyrstweitz → Captain’s Quarters objective → Vairemont → Aubrey | Imperial Primus Ordinarius `2307001` awards Silver-winged Kabuto `11000266` and advances the quest; Batraal `2303501` remains the full dungeon-clear owner | 4000 | `content-gated`; dedicated route wired, keep disabled pending live verification |
| 111816 | `Gcu101` — It Kills with Fire (Ul’dah) | Officer dialogue → Bowl of Embers clear → report | Ifrit placeholder `2207301`; duty entry/clear/return missing | 1000 | `template-gated`; keep disabled until Ifrit content is real |
| 111817 | `Gcu301` — Prying Eyes | Officer → objective/dialogue → report | Generic template only; objective actors and event payload need proof | 300 | `template-gated`; recover route actors and cutscene arguments |
| 111818 | `Gcu302` — Different Strokes | Officer → objective/dialogue → report | Generic completion hook `processEventClear`; route actors/markers need proof | 300 | `template-gated`; recover objective and completion payload |
| 111819 | `Gcu303` — A Weaver and a Mummer | Officer → weaver/mummer objective → hostile encounter → report | No verified encounter owner in the server; objective/fight/loot contract missing | 1000 | `template-gated`; recover the real encounter before enabling |
| 111820 | `Gcu304` — When Alchemists Cry | Berthar → field sergeant Jandonaut Fouillel → three push/interact objectives → report | Objective actors `1090212–1090214`, item `11000412`, events `processEventBERTHARStart`, `processEvent_005`, `processEvent_010`, `processEvent_015` | 700 + `4,450 EXP` | `active-bespoke`; active and guarded; stronghold markers intentionally use ENPC flags |
| 111826 | `Gcu305` — Challenge Accepted | Officer → Cutter’s Cry / hostile objective → report | Myrmidon Princess placeholder `2303003`; instance/encounter contract missing | 700 | `template-gated`; implement the real encounter and return route |
| 111827 | `Gcu102` — Like Father, Like Son | Officer → escort/instance objective → report | Classified as an instance route; generic template has no content director or escort owner | 1000 | `template-gated`; recover instance/escort actors and failure contract |
| 111828 | `Gcu701` — Gore a Lizard, Hurry | Officer → War Merit targets → commander report → Aubrey → player Flame Salute → promotion | Targets `2206525–2206527`, merit `125/150/175`, rank `17→21`, 1000-merit requirement, profile `gcu70101`; `emoteDefault1` is the only promotion trigger | — | `scripted-gated`; timed duty/reset/salute-only rank route is wired and disabled pending live verification |
| 111829 | `Gcu103` — Careless Whispers | Officer → objective/encounter → report | Generic accept hook exists; no verified encounter owner | 1500 | `template-gated`; recover objective and fight/return surface |
| 111830 | `Gcu104` — In for Garuda Wakening (Ul’dah) | Officer → Howling Eye clear → report | Garuda placeholder `2209501`; duty director/entry/clear/return missing | 2000 | `template-gated`; implement real duty contract |
| 111831 | `Gcu105` — Don’t Hate the Messenger (Ul’dah) | Officer → messenger objectives → report | Ul’dah accept hook exists; objective chain and party/encounter contract need proof | 2000 | `template-gated`; recover the route before enabling |
| 111832 | `Gcu106` — United We Stand (Ul’dah) | Officer → party battle → report | Patch evidence identifies a party battle; generic template has no party director or encounter | 5000 | `template-gated`; implement party membership, wipe, clear, and return |
| 111833 | `Gcu107` — To Kill a Raven (Ul’dah) | Officer → Rivenroad / Nael clear → report | Nael placeholder `2210902`; data row points to prerequisite `111834`, so the retail prerequisite graph must be confirmed before enabling | 6000 | `template-gated`; resolve prerequisite plus encounter contract |
| 111834 | `Gcu702` — Mess with the Goat, Get the Horns | Elder Mosshorn → officer report → company salute → promotion | Rank-31 target `2102311`; `emoteDefault1` is the sole completion event and invokes `processEvent010(27)` after the guarded rank transaction | 5000 | `content-gated`; disabled pending live NM and salute verification |

## Internal / unknown rows: 33 evidence blockers

These rows are present in the quest table but have title `[en]`, prerequisite `0`, and level `0`. Their wrappers may exist as generic scaffolds, but that is not evidence of a client route. They remain listed so the inventory is complete and future decomp work has a stable target list.

| Company block | IDs / codes |
| --- | --- |
| Limsa / Maelstrom | `111408 Com0l8`, `111409 Com0l9`, `111412 Com5l2`, `111413 Com5l3`, `111414 Com5l4`, `111415 Com5l5`, `111421 Gcl501`, `111422 Gcl502`, `111423 Gcl601`, `111424 Gcl602`, `111425 Gcl603` |
| Gridania / Twin Adder | `111608 Com0g8`, `111609 Com0g9`, `111612 Com5g2`, `111613 Com5g3`, `111614 Com5g4`, `111615 Com5g5`, `111621 Gcg501`, `111622 Gcg502`, `111623 Gcg601`, `111624 Gcg602`, `111625 Gcg603` |
| Ul’dah / Immortal Flames | `111808 Com0u8`, `111809 Com0u9`, `111812 Com5u2`, `111813 Com5u3`, `111814 Com5u4`, `111815 Com5u5`, `111821 Gcu501`, `111822 Gcu502`, `111823 Gcu601`, `111824 Gcu602`, `111825 Gcu603` |

Do not expose these rows, synthesize titles, or attach generic dialogue until the client data, event name, actor list, prerequisite, and reward row are recovered.

The shared template also refuses to pay an implicit `45,000 EXP` / `15,000 gil`
fallback. A generic route must declare its exact source-backed EXP and gil
before it can be enabled; unresolved rows may still retain their seal table
entry as decomp evidence without being offerable.

## Shared fight / instance backlog

The generic template currently contains recognizable target IDs as placeholders. They are useful decomp anchors, not permission to enable the routes:

| Content family | Quests | Current placeholder | Required before enable |
| --- | --- | --- | --- |
| Dzemael Darkhold | `Com5l1`, `Com5g1`, `Com5u1` | Captain’s Quarters Imperial Primus Ordinarius `2307001` (quest objective); Batraal `2303501` (dungeon clear) | Dedicated city routes, entry/instance ownership, objective callback, timer, scenes, and return are wired; live-client verification remains |
| Bowl of Embers | `Gcl101`, `Gcg101`, `Gcu101` | Ifrit `2207301` | Duty entry and clear contract, party/solo rules, reset, reward and return |
| Poison-cake / level-50 hostile objective | `Gcl303` | Qiqirn `2206305` | Correct map, spawn/loot, kill attribution, cleanup, and event payload |
| Cutter’s Cry family | `Gcl305`, `Gcg305`, `Gcu305` | Myrmidon Princess `2303003` | Instance entry, clear, death/exit reset, and report route |
| Howling Eye | `Gcl104`, `Gcg104`, `Gcu104` | Garuda `2209501` | Duty entry, boss clear, party state, cleanup, and return event |
| Rivenroad | `Gcl107`, `Gcg107`, `Gcu107` | Nael `2210902` | Prerequisite correction, instance entry, clear, wipe/reset, and return event |
| Escort / caravan | `Com0g4`, `Gcg102`, `Gcu102` | No valid generic target | Escort actor paths, fail conditions, party/area rules, and completion events. `Com0u4` is no longer in this bucket: its Hellhound target is verified and isolated in a private SQB copy. |
| Party battle | `Gcl106`, `Gcg106`, `Gcu106` | No valid generic target | Party director, readiness/leave behavior, wipe, clear, and report route |
| Charledore | `Com0u6` | `2289025` | Actor-data repair first; only then spawn/loot/reward/completion work |

## Implementation changes made by this decomp

1. Added `GrantGCQuestSeals` to [`Data/scripts/gcseals.lua`](../Data/scripts/gcseals.lua). It validates the company/cap transaction, shows the correct company-currency toast, and fails without consuming quest evidence.
2. Added exact seal quantities to [`gc_quest_template.lua`](../Data/scripts/quests/com/gc_quest_template.lua). Generic routes cannot silently complete without their raw client reward.
3. Added guarded direct-route rewards to the known handwritten routes for `111402`, `111404–111407`, `111602`, `111604–111607`, and `111802`, `111804–111805`, `111807`. The blocked `111806` route was not changed.
4. Added the shared private SQB launcher/content/director runtime plus four source-specific wrappers for `111401`, `111601`, `111801`, and `111804`. The implementation comments document actor-vs-mob identity, content-group membership, asynchronous entry, exact kill ownership, retry, cleanup, and reward boundaries.
5. Enabled the ten source-backed opening rows (`111401–111403`, `111601–111603`, `111801–111804`) alongside the six existing field/rank rows. The remaining named rows stay gated; no Toto-Rak fallback is treated as a substitute for the Elemen-confirmed pirate, Imperial, escort, Clay Golem, or ceremony routes.
6. Recorded Elemen as the preferred legacy source and corrected the matrix where the earlier shell had assigned the wrong route/reward: `111404`, `111405`, `111406`, `111604`, `111605`, and `111805` remain gated until their source-backed encounter chains are implemented; `111804` now has the verified Hellhound SQB path.
7. Corrected active field route `111820` to Elemen's `4,450 EXP`; the previous `3,100` value was an inherited placeholder and is now rejected by the source-backed implementation review.
8. Corrected formal Flames enlistment `111807` to Elemen's `1,080 EXP`; the old `5,000 EXP` value was a copied placeholder. The route remains gated behind the still-blocked `111806` prerequisite.

## Safe enablement order

When more evidence is available, enable in this order:

1. Live-smoke the source-backed opening rows `111401–111403`, `111601–111603`, and `111801–111804`, including the SQB solo/party/failure matrix and seal-cap retry behavior; they remain disabled during this audit.
2. Implement and smoke the source-corrected handwritten routes `111405–111407`, `111604–111607`, and `111805–111807`; keep `111806` blocked until its actor data is repaired.
3. Known Toto-Rak, field/objective, item, and escort routes after their Elemen/client actor and instance checks.
4. Duty, NM, party, escort, and final-promotion routes only after the shared fight/instance contract and the `emoteDefault1` salute path are live-client verified.
5. Internal `[en]` rows only after their names and client data are recovered.

The validators [`tools/validate_grand_company_quests.py`](../tools/validate_grand_company_quests.py) and [`tools/validate_quest_availability.py`](../tools/validate_quest_availability.py) check the 102-row inventory, 69/33 split, wrapper coverage, exact seal quantities, all 69 recovered scenario files/literal cutscene keys, 685 recovered methods, 223 server declarations, all 47 literal dispatch arities, all 36 bespoke `SEQ_ACCEPT`/`AcceptQuest` contracts, the zero-offer and generic-route audit gates, SQB actor/mob/director bindings, both salute-only promotion hooks, the six campaign audit gates, and the `111806` blocker.
