# System command DAT id bridge (2026-06-19)

## Executive findings

- `AI Scripts/command.csv` recovers English names/descriptions for the 242xx/243xx command rows that are blank in the local `Data/command.csv` snapshot.
- The DAT names line up with recovered class hypotheses: `24228` is `WidgetOpenCommand`, `24229` is `MacroCommand`, `24239` is `NetStatUserSwitchCommand`, `24243` is `RepairOrderCommand`, and `24244` is `RepairEquipmentsCommand`.
- Recovered DesktopWidget semantics resolve the stripped `24301`-`24306` DAT rows as place/touch (`24301`), director content (`24302`), group confirm (`24303`), warp confirm (`24304`), trade confirm (`24305`), and raise confirm (`24306`).
- DesktopWidget direct calls remain the strongest runtime evidence for `24204`, `24221`, `24224`, and the party/item/linkshell/bazaar ranges.
- This bridge substitutes for names/descriptions; the configured static actor binary `Map Server/bin/Debug/staticactors.bin` is used separately to prove actual owner id to `/Command/System/<Class>` rows when present.

## Direct missing DesktopWidget calls

- `24204` `Respond to Invite` -> `PartyJoinCommand` via `executePlayerPartyJoin`
- `24221` `Pack` -> `ItemStuffCommand` via `executePlayerItemStuff`
- `24224` `Split` -> `ItemSplitCommand` via `executePlayerItemSplit`

## High-priority id resolutions

- P1 `24101` `Talk` -> `TalkCommand` (quest_npc_talk)
- P2 `24204` `Respond to Invite` -> `PartyJoinCommand` (party_social)
- P2 `24209` `Accept` -> `PartyAcceptCommand` (party_social)
- P2 `24221` `Pack` -> `ItemStuffCommand` (inventory_item)
- P2 `24224` `Split` -> `ItemSplitCommand` (inventory_item)
- P2 `24243` `Request Repairs` -> `RepairOrderCommand` (repair)
- P2 `24244` `Repair` -> `RepairEquipmentsCommand` (repair)
- P1 `24302` `-` -> `ContentCommand` (director_content_command)
- P3 `24304` `-` -> `ConfirmWarpCommand` (confirm_recovery)
- P3 `24306` `-` -> `ConfirmRaiseCommand` (confirm_recovery)


## 2026-06-20 Producer-Side Command Evidence

- `PlayerBaseClass._onLoginEvent` calls command `24105`; `PlayerBaseClass._onCommandEvent` gives `24105` a local `fire` chance before server dispatch.
- `12014` has recovered ride-state follow-up behavior that can execute `12015` after row `26005`; capture both while validating chocobo restricted-call rows, but keep behavior in `ChocoboRideCommand` until the owner/static path is proven.
- `24304` and `24306` are now confirmed as pending-work confirm commands: warp expects variation `20000..29999`, raise expects `40000..49999`, and both require the sent argument to equal the pending work value.
- `24312` is a sit/emote-system path from `_onMoveAtSit`, not replay authority. It remains useful as a replay-adjacent probe only because journal/replay UI can exercise nearby desktop/system command refresh paths.

## Probe-only id additions

- `12014` / `12015` -> `ChocoboRideCommand`: game/prog chocobo mount/dismount owners; local script exists, but capture the static owner path while validating the `26002`/`26020` restricted row split.
- `24102` -> `EmoteStandardCommand`: general emote command; add as logging-only beside `24312` sit so emote/system routing can be compared.
- `24104` -> static actor `ContinueCommand`, while DAT naming says Home Point/Teleport; capture this conflict before routing docs or scripts treat it as teleport.
- `24105` -> `LoginEventCommand`: present in local CSV/static actors but absent from the DAT bridge matrix; relevant to inn/dream/cutscene-adjacent plumbing.
- `24211` -> `RequestQuestJournalCommand`: useful for quest journal/detail/map and cutscene replay book validation; local script exists, but runtime payloads still need capture.
- `24212` -> `RequestInformationCommand`: useful for guildleve/detail/history and replay-adjacent journal flows; local script exists, but capture is still logging-only.
- `24241` -> `JournalCommand`: journal action lane; local script can mutate abandon/retry state, so capture before behavior changes.
- `24304` -> `ConfirmWarpCommand` and `24306` -> `ConfirmRaiseCommand`: recovered confirm/menu commands with missing local scripts; capture confirm payloads before adding behavior.
- `24312` -> `EmoteSitCommand`: lower-confidence replay-adjacent probe candidate from DesktopWidget/replay flow notes; logging-only until a real replay path proves it matters.

## 2026-06-20 Static/Probe Caveats

- The focused probe set maps as follows: `12014/12015` -> `ChocoboRideCommand`; `24101` -> missing `TalkCommand`; `24102` -> `EmoteStandardCommand`; `24104` -> missing static `ContinueCommand` despite DAT Home Point/Teleport wording; `24105` -> `LoginEventCommand`; `24211`/`24212` -> quest journal/information; `24228` -> reject-only `WidgetOpenCommand`; `24241` -> `JournalCommand`; `24243/24244` -> missing repair commands; `24301` -> `PlaceDrivenCommand`; `24302` -> missing `ContentCommand`; `24304/24306` -> missing confirm commands; `24312` -> `EmoteSitCommand`.
- EventRouteProbe currently covers only the originally focused command set. The secondary direct DesktopWidget calls `24204` `PartyJoinCommand`, `24209` `PartyAcceptCommand`, `24221` `ItemStuffCommand`, and `24224` `ItemSplitCommand` are outside that focused owner list. Add them before probing party-join or inventory split/stuff behavior.
- Treat `24304/24306` as server-owned pending-state confirmation lanes. They are not authority to warp or raise without the corresponding pending variation and server-side validation.

## 2026-06-21 Materia/Repair/Place Notes

- Repair ids `24243` and `24244` are bridged to recovered `RepairOrderCommand` and `RepairEquipmentsCommand`, but local command scripts and safe player-to-player fulfillment/payment/clear semantics are still missing.
- Item command ids split into absent and unsafe-local groups: `24221` `ItemStuffCommand` and `24224` `ItemSplitCommand` are missing scripts, while `24223` `ItemMovePackageCommand`, `24225` `ItemTransferCommand`, and `24226` `ItemWasteCommand` exist locally but need no-dispatch route logging plus scoped package validators before any claim/pass/drop or split/stuff behavior work.
- Materia command actors are locally special-cased for `22014`, `22015`, and `22016`: attach/fulfill use `MateriaMeldCommand`, while rate preview uses `MateriaMeldRateCommand`. `24240` is the recovered/local `ItemMaterializeCommand` path; keep it distinct from materia removal.
- `24301` `PlaceDrivenCommand` and local `30003/30004` fields are context-sensitive. Recovered client scripts use them for place/touch payloads, while local C# also uses `30003/30004` as content-group constants. Keep this capture-only until owner, target, variation, and cleanup ordering are proven.

## Generated artifacts
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/dat_command_id_matrix.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/ai_vs_local_command_csv_delta.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/missing_id_resolution.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/static_actor_substitute_queue.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/source_term_hits.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/source_inventory.csv`
- `tools/outputs/lpb/system_command_dat_id_bridge_20260619/contract_summary.json`

## Summary counts

- Sources present: 11 / 11
- Source term hits: 179
- DAT matrix rows: 52
- AI/local delta rows: 52
- Missing id resolution rows: 17
- Static actor substitute rows: 42
