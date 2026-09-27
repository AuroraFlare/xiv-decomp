# FFXIV 1.x Opcode Catalog

This folder tracks the opcode names from the public 1.23b wiki list plus local
confirmations from the server source and the current investigation notes.

`ffxiv_1x_opcode_catalog.csv` is intentionally a data file, not a client DAT
patch. The 1.x client DAT sheets contain marker and UI rows, but the network
opcodes are packet handlers in the client/server code, so this catalog lives in
repo documentation rather than in the extracted DAT CSVs.

`opcode_shift_hunting.md` describes the packet-family matching workflow for
finding shifted, renamed, or unused handlers when an opcode number is not stable
between builds.

`game_trading_reverse.md` documents the recovered player trade state machine.
Trading is an event-RPC plus relation-group workflow whose item offers use the
existing inventory packet family; there is no separate player-trade opcode.

`arr_content_crosswalk.md` records the public 2.x/3.x-and-later content/event
packet families that are useful context for Hamlet Defense without pretending
they recover true ARR 2.0 Hamlet packet captures.

`hamlet_score_packet_reverse.md` records the local IDA findings for the
`0x01A8 HamletDefenseScore` client receiver and its compact score-row payload
shape.

## Map Marker Findings

Detailed behavior is documented in `docs/quest_full_map_markers.md`.

The full-map yellow area marker path verified for active guildleves is:

```text
0x012D EventStartPacket
  RequestInformationCommand "activegl"

0x0133 GenericDataPacket
  "requestedData", "activegl", activeLeveId, 0, 0, 0, 0, 0, 0, 0
  "requestedData", "qtmap", activeLeveId, markerId...
```

Quest marker ids are the first column in `docs/Dat Mining/quest_marker.csv`.
Rows with `MapMarkerQuestArea` and `m00029` are the likely yellow area circles.
The `qtmap` owner must be the active guildleve id. For example, guildleve
`10881` at Skull Valley shows the full-map yellow circle when the server sends
`"requestedData", "qtmap", 10881, 11500601` after the `activegl` response.
Useful retail-style guildleve area marker rows include:

```text
11500601 Skull Valley
11500602 Bloodshore
11500603 Drybone
11500604 Horizon's Edge
11500605 Emerald Moss
11500606 Tranquil Paths
11500607 The Fields of Glory
11500608 Riversmeet
```

Dynamic guildleve coordinate sync is separate:

```text
0x0137 SetActorPropetyPacket
  guildleveWork.markerX[n]
  guildleveWork.markerY[n]
  guildleveWork.markerZ[n]
```

That work-property path is the best current match for minimap/live objective
markers. The full map still appears to resolve marker ids through client data
rather than accepting arbitrary X/Y/Z coordinates in `qtmap`.

## Hamlet Defense Findings

The public 1.23b opcode list names two Hamlet-specific server-to-client game
packets:

```text
0x01A6 HamletSupplyRanking
0x01A8 HamletDefenseScore
```

These names line up with the remaining Hamlet Defense UI gaps:

- `0x01A6` is the likely supply/top-20 ranking and provisioner GUI packet.
- `0x01A8` is the likely post-duty score breakdown window packet.
- The local `Common Class Lib/SubPacket.cs` implementation already matches the
  public packet-header layout: type `0x03` game packets use a 0x10 subpacket
  header followed by a 0x10 game-message header.
- The live Hamlet HUD can continue to use `0x0137` work-value sync until the
  dedicated duty UI packet behavior is recovered.
- Text-sheet messages for Hamlet battle events should use the existing
  `0x0157` through `0x016A` `GameMessagePacket` builders when text owner ids and
  text ids are known.

Local DAT mining gives us the client-side score resources:

```text
sqwt/widget/HamletDefenseScoreWidget.form
sqwt/widget/HamletDefenseScoreWidget.tpl
sqwt/widget/HamletDefenseRankingWidget.form
sqwt/widget/HamletDefenseRankingWidget.tpl
sqwt/widget/HamletDefenseWidget.form
sqwt/widget/HamletDefenseWidget.tpl
sqwt/widget/HamletDefensePopupWidget.form
sqwt/widget/HamletDefensePopupWidget.tpl
docs/Dat Mining/hamletDefScore.csv
docs/Dat Mining/xtx_hamletDefScore.csv
```

`hamletDefScore.csv` stores score ids, point values, and a boolean flag for rows
that display a placeholder/count. `xtx_hamletDefScore.csv` stores the localized
labels used by `xtx__text_ui.csv` through the `xtx/hamletDefScore` sheet
expression.

The opcode names are useful, but they do not include payload layouts. Local IDA
work has now recovered a strong candidate shape for `0x01A8`; see
`hamlet_score_packet_reverse.md`. A later pass recovered the native `0x01A6`
supply-ranking layout as `20 * 0x4C = 0x5F0` bytes; see
`hamlet_supply_ranking_packet_reverse.md`. Non-empty `0x01A6` sends should still
stay gated until a one-row probe validates the recovered field labels. The
current `0x01A8` builder keeps the old
debug-only guessed shape for `current`/`single`/`full`, and also exposes a new
opt-in compact parser-shape probe:
`!testhamlet scoremenu [empty|current|single|full|native]`. Plain
`!testhamlet uiprobe score` proved that `widgetCreate` plus
`requestedData hamletDefScore`/`hamletDefScoreAll` and a single-row `0x01A8`
does not open the retail score UI by itself; `!testhamlet uiprobe
scorebootstrap` adds the normal `commandRequest`/`widgetCreate`/`macroRequest`
UI bootstrap sequence before the same score data. `scoreplayer`,
`scoredirector`, `scorebootstrapplayer`, and `scorebootstrapdirector` reuse the
safe single-row payload while varying the `0x01A8` source actor id.
`!testhamlet uiprobe widgetindex` is a targeted widget-table probe: it sends
the normal bootstrap, then sends `widgetCreate` with number `0x1B` / `27`, the
client table index calculated for `Window_HamletDefenseWidget`, followed by the
same native compact score data. `scorealldirector` and `scoreallworld` keep the
same safe payload but also
source the `0x0132` bootstrap and `0x0133` data-request packets from the same
actor, closing the gap where only `0x01A8` varied. Both same-source probes were
accepted without crashing but produced no fresh client Hamlet UI
request/response, so packet source actor is not the primary blocker. `scorewait`
and `scorenative` use locally mined client function names
`_waitForHamletDefenseScore`, `_countHamletDefenseScore`,
`_getHamletDefenseScore`, and `_getHamletDefenseScoreAll` before sending the same
score data, to isolate whether the missing step is a client-side Hamlet score
receiver bootstrap. They send cleanly but do not open the score UI, which makes
`0x0132` look like registration/bootstrap rather than a direct call path.
`titleindex` and `titlecontainer` are title-gate probes added after the
2026-05-29 tutorial-director test rendered the `Spore Spoor` guildleve HUD.
`titleindex` uses the per-Hamlet `titleWidgetIndex` (`1/2/3`) as the
`widgetCreate` number; `titlecontainer` tries the widget-container helper with
`HamletDefenseTitleWidgetN` and `Window_HamletDefenseTitleWidgetN`. Live testing
kept the `Official Behest` HUD; `titlecontainer` produced only the already-known
empty no-param `0x012E` EventUpdate replies. `dutytitle` and `titleform` are the
remaining safe title-name probes: `dutytitle` uses `DutyCommencedWidgetN`, while
`titleform` calls `_loadForm` with Hamlet title, Duty Commenced, and live Hamlet
widget form-name candidates. These remain safe probes, not KickEvent/delegate
opener paths.
`scorerun` and `scoredelegate` test the same native score names through `0x0130`
RunEventFunction, first directly and then through `delegateCommand`. `scoreopen`
adds the usual delegate command actor argument and likely score widget opener
names (`operateUI`, `openHamletDefenseWidget`, and
`openHamletDefenseScoreWidget`) before sending the same score data. `scorekickopen`
prepends a normal `0x012F` KickEvent for the active Hamlet director, then sends
the same opener sequence to test whether the client requires a live director
event before those calls can create a widget. Hamlet UI
debug now also whitelists incoming `0x012F` and
`0x0133`, so the next bootstrap probe can catch client work-sync or generic-data
requests that the earlier filter would have hidden; routine
`charaWork/battleParameter` polls and `/_init` group confirms are suppressed to
keep the probe readable. The old guessed non-empty
`0x01A6` builder payload crashed the stock client because it used the wrong
buffer shape. The recovered parser expects a full `0x5F0` payload with 20 fixed
`0x4C` rows. The dormant sample builder has been reshaped, but ranking probes
should remain empty-only until the gated native-shape one-row probe is validated.
Use `!testhamlet uidebug on` and
`!testhamlet uiraw on` to log outgoing Hamlet UI packet metadata and payload
hex. `tools/mine_hamlet_ui_widgets.py` writes local widget metadata to
`tools/outputs/hamlet_ui/` for offline reverse engineering.

## Sources

- Public opcode baseline: `https://wiki.ffxivrp.org/pages/Game_Opcodes`
- Public packet header layout: `https://wiki.ffxivrp.org/pages/Packet_Headers`
- Local packet classes under `Map Server/Packets`, `World Server/Packets`, and
  `Lobby Server/Packets`
- Journal map scripts:
  `Data/scripts/commands/RequestQuestJournalCommand.lua`
- Active guildleve journal script:
  `Data/scripts/commands/RequestInformationCommand.lua`
- Guildleve marker work sync:
  `Map Server/Actors/Director/GuildleveDirector.cs`
