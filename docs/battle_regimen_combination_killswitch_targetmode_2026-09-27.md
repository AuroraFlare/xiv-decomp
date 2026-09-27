# Battle Regimen ("Combination") kill-switch + targetMode map — follow-up decomp

Date: 2026-09-27. Follow-up to
`job_system_soulstone_actionbar_battle_regimen_2026-09-27.md`, closing three of
its unresolved items from recovered client Lua. All paths below are under
`tools/outputs/lpb/decomp_further_20260617/lua/`.

## 1. Soul-stone IDs: all seven resolved

From `FF14-Memory/Data/sql/gamedata_items.sql:146-152`
(icon path `Important/ImportantItemStandard` for all):

| Key item | Soul | Icon id |
|---:|---|---:|
| 2000201 | Soul of the Paladin | 61680 |
| 2000202 | Soul of the Monk | 61681 |
| 2000203 | Soul of the Warrior | 61682 |
| 2000204 | Soul of the Dragoon | 61683 |
| 2000205 | Soul of the Bard | 61684 |
| 2000206 | Soul of the White Mage | 61685 |
| 2000207 | Soul of the Black Mage | 61686 |

## 2. Regimen = "Combination": full client chain found

A tree-wide search for `egimen` (case-insensitive) over every recovered `.lua`
file returns exactly one hit, and the `Combination*` family completes the chain:

Control (start permission + stack counts) — all hardcoded stubs, no overrides
anywhere in the recovered tree:

- `chara/battle/charabaseclass_battle.lua:696` — `canStartCombination` returns
  `false`.
- `charabaseclass_battle.lua:583` — `getStackedCombinationNum` returns `0`.
- `charabaseclass_battle.lua:588` — `getStackedCombinationTimer` returns `0`.
- `chara/parameter/charabaseclass_parameter.lua:104` —
  `getMyCombinationStackedNum` returns `0`.

Starter command constants (`command/game/combinationstartcommand.lua`):

- `getCommandRangeCode` → 2; `getCommandTargettingMode` → 1
  (note the double-t spelling, verbatim from the client).
- `canAimForRelation` / `canFireForRelation` → `(false, false, true)`.
- `useWeaponRangeInformation` → `(true, true)`; `isUseActionGauge` → false.
- `CombinationManagementCommand.isActionMenu` → false (regimen starter is not a
  normal action-menu entry); `CombinationStatus` is an empty subclass.

Display (fully plumbed, works if counts were nonzero):

- `desktopwidget_connector.lua:8753` —
  `getStackedCombinationCountByPartyMember(member)` returns
  `getPartyMemberActor(member):getMyCombinationStackedNum()`; call site at
  `:2541` feeds `updateStackedCombination`.
- `widget/partyparameterwidget.lua:193` — `setStackedCombination` shows the icon
  when count > 0, hides otherwise.
- `partyparameterwidget.lua:309` — `setCombination(member, visible)` toggles
  visibility; `:492` builds the control name
  `ListBoxItem_N:IconControl_BattleRegimenDisplay` — the per-party-member
  queued-action icon, matching the retail "red icon" behavior.

Turn-on verdict (definitive for this build): the client display path is intact
but the feature is hard-disabled at the Lua layer — start permission is false
and every stack count is zero. Revival needs a client DAT/Lua mod restoring
these four functions (or their native backing, if the stubs shadow native
state — verify with a live memory watch before assuming Lua-only) PLUS the
server-side queue/stack/launch/execute implementation, which does not exist in
`Map Server`/`World Server` today. The companion reg doc in FF14-Memory keeps
the server-side capture plan and state sketch.

## 3. targetMode system mapped (AoE-button context)

No `AoE`/`_aoe` token exists anywhere in the recovered Lua (case-sensitive,
whole tree). Target selection runs through `work.targetMode` (integer8) in
`widget/desktopwidget_connector.lua`:

- Default (`:558`): 1, or 2 when `getConfigWork(13) == 1`.
- Cycle (`changeTargetMode`, `:2283`): modes 1-4, wraparound both directions,
  skipping modes where `isValidTargetMode` is false.
- Validity (`:2304`): mode 4 always valid; mode 1 valid unless configWork(13)
  is 1; mode 3 valid only while `isJoinedPartyMyPlayer()`; mode 2 has an empty
  branch — never selectable via cycling (yet reachable as the configWork(13)==1
  default, so it is a real state, not dead).
- `setTargetMode` (`:2349`): writes `work.targetMode`, calls static widget 18
  `setMode`, restores per-mode `oldTarget[]`; mode 2/3 seed from MyPlayer, mode
  4 from `oldTarget[4]` with an enmity-target check, then
  `setTargetCharacter(1, …)` or `RaptureCommands.ChangeTargetNext`.
- Shortcut entry (`targetModeShortCut`, `:2332`) is blocked unless
  configWork(13) is 0, sub-target select is off, and no lock-on target exists.
- Mode 3 is force-reset to default at `:2994` (leaving-party path — read the
  surrounding function before reusing this claim).

What this means for the "AoE button" ask: there is no separate AoE toggle
control in recovered Lua. Area targeting is most plausibly a targetMode value
or a per-command targeting mode (`getCommandTargettingMode`-style constant per
action, as the regimen starter shows with its own `1`). The semantic labels of
modes 1-4 (single/enemy/party/self/all?) are still unresolved — confirm by
watching `work.targetMode` while selecting a known AoE spell (Curaga, Protect)
versus Cure, then diffing the target-select packet.

## Reproduction

```powershell
$lua = 'tools/outputs/lpb/decomp_further_20260617/lua'
Get-ChildItem $lua -Filter '*.lua' -Recurse | Select-String 'egimen' -CaseSensitive:$false
Get-ChildItem $lua -Filter '*.lua' -Recurse | Select-String 'canStartCombination|getStackedCombinationNum|getMyCombinationStackedNum|getStackedCombinationTimer'
Get-ChildItem $lua -Filter '*.lua' -Recurse | Select-String 'AoE|_aoe' -CaseSensitive
```

## Remaining unresolved (parent doc items 4-6, plus one new)

1. `setCommandInfo` columns 38/76/79/114/115/119 labels.
2. `executePlayerEquipAction` native packet shape.
3. Unified cross-job motion-ID index.
4. NEW: targetMode 1-4 semantic labels; configWork(13) meaning.
