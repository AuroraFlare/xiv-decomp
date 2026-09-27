# 111404 Engineering Victory — `Com0l4` (Maelstrom GC field battle + delivery)

- Story Lv22 | Prereq: 111403 Seals for the Whorl | Next: 111405
  An Officer and a Wise Man | Offer: Orn Guincum 1500199, Maelstrom
  Command zone 232 (168.9, 0.0, -175.7, rot -1.5; spawn id 2771)
- Lua: `Data/scripts/quests/com/com0l4.lua` (GC field-battle pattern:
  shared `gc_field_battles` + `gc_sqb_quest` launcher +
  `directors/Quest/gc_sqb_runtime` + `gc_reward_checkpoint` +
  `gc_quest_items` helpers). No template config.
- SQL registry: `(111404, 'Engineering Victory', 'Com0l4', 111403, 22)`
  in `gamedata_quests.sql`; prereq chain 111403 -> 111404 -> 111405.
- Client: `xtx_quest.csv` row 111404 (EN/DE/FR titles) maps journal
  indices 0..3 to `xtx/journalxtxSea` rows 235..238; offer text is
  row 234. All five rows read in full below.

## Sequence flow (VERIFIED: com0l4.lua + xtx rows 234-238 + wikis)

- ACCEPT Guincum `processEventGUINCUMStart` (result 1 accepts; anything
  else closes, retryable) -> 0 -> 10: push-triggered three-wave private
  ambush in Eastern La Noscea -> 20: report to Guincum (transceiver
  granted/re-granted here) -> 30: deliver transceiver to Ebrelnaux
  (consumed after save) -> 40: return to Guincum -> 500 Storm Seals +
  1,541 EXP -> CompleteQuest. Non-repeatable story quest.
- Journal 234 (offer/seq 0): "The Maelstrom is planning an attack on
  imperial soldiers dispatched to upper La Noscea with orders to seize
  kobold encampments. Officer Guincum seeks volunteers to set an ambush
  for any Garleans who attempt to escape via the canyon connecting the
  area to eastern La Noscea."
- Journal 235 (battle/seq 10): battalion variant of the above, plus
  "Up to two party members may accompany you." (client source of the
  max-party-3 rule).
- Journal 236 (report/seq 20): slew retreating soldiers, found the
  Magitek Transceiver on a body, return to Maelstrom Command.
- Journal 237 (deliver/seq 30): Guincum asks Garlond Ironworks to
  examine it; cryptographical expert Ebrelnaux is on assignment in the
  Coerthas eastern lowlands; deliver it to Millers' Glade.
- Journal 238 (return/seq 40): delivered; Ironworks engineers are
  taking undisclosed scientific readings across Eorzea; return to
  Maelstrom Command for compensation.
- GamerEscape `Engineering_Victory` (fetched 2026-09-27): deliver the
  transceiver to Ebrelnaux at Millers' Glade (50-35), Coerthas Eastern
  Lowlands. Fandom `Maelstrom_Quests_(version_1.0)` snippet: ambush
  Garleans escaping via the canyon to eastern La Noscea. YouTube
  search returned no quest-specific footage (generic 1.0 videos only).

## Delegate events (VERIFIED: com0l4.lua onTalk)

Wired: `processEventGUINCUMStart` (offer, arg 0),
`processEvent_000_1` (seq-10 Guincum reminder, arg 0),
`processEvent_010` (seq-20 report), `processEvent_015` (seq-30
handoff), `processEvent_020` (seq-40 closing, arg 0). No preEvent /
preScene on battle entry: field battles launch straight from the
push trigger. Every talk yield is guarded by
`CanContinueGrandCompanyQuestDialogue` before and after.

## Actors/markers (VERIFIED: spawn SQL + script + map guide)

- Orn Guincum 1500199 @ zone 232 Maelstrom Command
  (168.9 / 0.0 / -175.7). Marker 11150302 (seq 0/20/40).
- Ebrelnaux 1060011 @ zone 145 Coerthas Eastern Lowlands
  (1335.983643 / 227.415268 / 1336.344849, spawn id 3230).
  Coerthas base (3712/2144): continuous map (50.48, 34.80), i.e.
  the GamerEscape (50-35) Millers' Glade hint. Marker 11150303.
- Battle trigger `com0l4_battle_entry` 1099511 @ zone 130 Eastern La
  Noscea (983.919983 / 64.456551 / -1566.650024, spawn id 3237;
  exact native X/Z capture). La Noscea base (2528/3008):
  continuous map (35.12, 14.41) = cell (35,14), matching the
  Elemen ledger "three Eastern La Noscea waves at (35,14)".
  Marker 11150301 (seq 10). Push entry radius 14 yalms from the
  trigger; party-gather radius 30.
- Item 11000259 Magitek Transceiver (`Normal/DummyItem`).

## Instance layout/bounds (VERIFIED: gc_sqb_quest + content script)

- Private QuestBattle content area over zone 130
  (`PrivateAreaMasterSimpleContent` /
  `SimpleContentGrandCompanySquadBattle` /
  `Quest/QuestDirectorGcCom0l4`), named `gc_sqb_com0l4_<ownerId>`.
- Boundary circle radius 45 centered on the entry position;
  `DisableReentry` is set at allocation and re-asserted by the
  content script. Leaving the area fails the battle (see retry).
- Limits: timeout 1800s, max party 3 (journal-235 rule), minimum
  level 22, `requireAllTargets` (all 5 kills required).

## Mob roster with guide coordinates (VERIFIED: placements + floor review)

Formation X/Z is authored; Y is nearest eligible frozen walking
support at the retained X/Z (support node + distance quoted); rot
is authored (pi = facing the trigger approach). All five project
to La Noscea cell (35,14) via (world+base)/100; see
`gc_field_battle_floor_review_2026-09-19` and
`docs/mob_map_coordinates.md` (La Noscea base 2528/3008).

- Wave 1 left: Imperial Funditor, actor 2280018 / mob type 40101,
  (980.919983 / 64.617250 / -1561.650024), node 3940 d=2.147.
- Wave 1 right: Imperial Bestiarius, actor 2280017 / mob type 40102,
  (986.919983 / 64.442100 / -1561.650024), node 3943 d=1.745.
- Wave 2 left: Imperial Triarius, actor 2280019 / mob type 40103,
  same XYZ as Funditor, node 3940 d=2.147.
- Wave 2 right: Imperial Speculator, actor 2280021 / mob type 40104,
  same XYZ as Bestiarius, node 3943 d=1.745.
- Wave 3 center: Imperial Veles, actor 2280022 / mob type 40105,
  (983.919983 / 64.250015 / -1560.650024), node 4002 d=0.907.
- Elemen order (Funditor/Bestiarius, Speculator/Triarius, Veles)
  matches waves 1/2/3; left/right assignment is the authored
  formation, not a retail claim.

## Spawn waves/triggers (VERIFIED: gc_sqb_runtime.lua, full body read)

- Wave 1 spawns at allocation (launcher); waves 2/3 spawn from the
  director when the previous wave is complete. Spawn failure of any
  wave fails the battle to the retry sequence.
- Kill credit reconciles the exact spawned actors of the ACTIVE wave
  only: duplicate callbacks and foreign same-class kills are
  rejected; each uniqueId credits once. `onKillBNpc` in com0l4.lua
  is an explicit no-op guard so ambient public-zone kills of the
  same classes can never advance seq 10.
- All 5 credited kills (`requireAllTargets`) -> `onSuccess`: quest
  to seq 20 + `Save()` + `UpdateENPCs()` + transceiver grant, then
  the party returns to the public point.

## Abilities/aggro/leash (VERIFIED: runtime + content script)

- Combat AI, stats and ability kits come from the engine-driven
  `server_battlenpc_mob_types` bindings 40101-40105; there is no
  quest-layer ability script. Targets get
  `ConfigureScriptedOneShotLifecycle` (despawned at finish; never
  persist, never double-spawn thanks to DisableReentry).
- Aggro is standard battle aggro inside the private area; leash is
  the r45 boundary circle. No enmity wipes, no tethers, no
  quest-specific mechanics beyond the wave gate.

## Rewards (VERIFIED: com0l4.lua + gcseals + Elemen ledger)

- 500 Storm Seals (company 1) via `GrantGCQuestSealsOnce` (flag 22
  pay-once; seal-cap refusal leaves the quest retryable with
  nothing consumed) + 1,541 EXP via `CompleteGCQuestOnce` (flag 23
  pay-once). No gil. Elemen's archived Maelstrom row is the
  authority cited in-script. No `gamedata_quest_rewards.sql` row:
  rewards are script-paid.
- Transceiver lifecycle: granted on battle clear (director
  `onSuccess`) AND re-granted at the seq-20 report (`EnsureGCQuest
  Item`: full-inventory refusal keeps seq 20 retryable); seq-30
  handoff saves the sequence BEFORE consuming the item; a leftover
  duplicate is purged at seq 40 before the closing scene.

## Fail/retry/re-entry rules (VERIFIED: runtime + launcher + script)

- Death, 1800s timeout, disconnect, area exit, failed entry,
  quest-changed (abandon/reaccept/replacement session), or wave
  spawn failure -> finish(false) -> retrySequence 10: the player
  returns to the public point and retries at the trigger with no
  reward loss (transceiver is only granted on success).
- Abandon mid-battle tears the area down without rewriting the new
  journal; re-accept needs prereq 111403 + Lv22 via the registry.
- Re-entry is disabled: one target set per attempt; a second
  zone-in cannot duplicate mobs or rewards. Stale/cancelled shells
  are detected by live-content-area name, not director membership.
- Party: leader-only start, at most 3, every entrant online,
  same-area, alive, combat class/job, Lv22+, unmounted, within 30
  yalms, event-free; re-validated after the (absent-here) movie.
  A late helper failure never destroys the owner's queued transfer.
- Level sync: none (retail 1.0 had none for these fights); the
  minimum-22 gate for owner AND helpers, checked before and after
  staging, is the complete level surface.
- Mounts: entry refused with "Dismount your chocobo before
  entering the private encounter." Chocobo companion: no companion
  system exists anywhere in this 1.0 codebase (verified: no
  companion APIs in the Lua quest-battle path or the C# Map
  Server), so there is nothing to dismiss; the dismount gate is
  the complete mount/companion surface.
- Delivery edges: seq-20 report requires the grant to succeed;
  seq-30 Ebrelnaux without the item refuses with the standard
  evidence message and stays seq 30; Guincum re-issues a lost
  transceiver at seq 30 without replaying combat (recovery talk,
  no scene), and the journal marker then points at both Ebrelnaux
  (primary) and Guincum (recovery). Seq-40 completion needs no
  item (evidence was retired at the saved handoff).

## Open gaps

- Live-client acceptance of the trigger/enemy floor heights (floor
  review notes playthrough acceptance remains pending).
- Native scene payload shapes for `processEvent_010/015/020`
  (no arg-shape capture found in-repo).
- Retail ability kits for mob types 40101-40105 beyond the
  actor-class/mob-type bindings.
- No quest-specific video footage located to cross-check the
  ambush staging against retail.
