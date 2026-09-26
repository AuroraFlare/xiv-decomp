#!/usr/bin/env python3
"""Build focused Parley and NPC Linkpearl widget decomp notes.

This pass gathers the scattered client widget Lua, local command stubs,
server state flags, and quest text anchors for two related quest surfaces:

* Parley, which the recovered client calls Negotiation.
* The "call" note/menu icon used by Together We Stand, which is the NPC
  Linkpearl shortcut and list widget.
"""

from __future__ import annotations

import csv
import hashlib
import json
import re
import unicodedata
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


ROOT = Path(__file__).resolve().parents[1]
RUN_STAMP = "20260708"
DOC_STAMP = f"{RUN_STAMP[:4]}-{RUN_STAMP[4:6]}-{RUN_STAMP[6:]}"
OUT_DIR = ROOT / "outputs" / f"parley-call-widget-decomp-{RUN_STAMP}"
DOC_PATH = ROOT / "docs" / f"parley_call_widget_decomp_{DOC_STAMP}.md"

RECOVERED_FURTHER_LUA = ROOT / "tools/outputs/lpb/decomp_further_20260617/lua"
RECOVERED_MORE_LUA = ROOT / "tools/outputs/lpb/decomp_more_20260617/lua"


@dataclass(frozen=True)
class SourceSpec:
    surface: str
    path: Path
    role: str


PARLEY_WIDGET_SOURCES: tuple[SourceSpec, ...] = (
    SourceSpec("parley_judge", RECOVERED_FURTHER_LUA / "judge/negotiation/negotiationjudge.lua", "Event-mode wrapper for Ask/Negotiation* widgets."),
    SourceSpec("parley_command_client", RECOVERED_FURTHER_LUA / "command/game/negotiationcommand.lua", "Recovered client command validation contract."),
    SourceSpec("parley_widget", RECOVERED_FURTHER_LUA / "widget/ask/negotiationwidget.lua", "Main tile/minigame widget."),
    SourceSpec("parley_list_widget", RECOVERED_FURTHER_LUA / "widget/ask/negotiationlistwidget.lua", "Topic/list selector before Parley."),
    SourceSpec("parley_ask_widget", RECOVERED_FURTHER_LUA / "widget/ask/negotiationaskwidget.lua", "Parley or give-up ask surface."),
    SourceSpec("parley_ability_widget", RECOVERED_FURTHER_LUA / "widget/ask/negotiationabilitylistwidget.lua", "Five ability selector popup."),
    SourceSpec("parley_message_widget", RECOVERED_FURTHER_LUA / "widget/negotiationmessagewidget.lua", "Floating negotiation turn/message surface."),
    SourceSpec("desktop_widget", RECOVERED_FURTHER_LUA / "widget/desktopwidget_connector.lua", "Ready-command and shortcut bridge."),
    SourceSpec("main_menu_widget", RECOVERED_FURTHER_LUA / "widget/mainmenuwidget.lua", "Main-menu ready command icon/help bridge."),
    SourceSpec("console_icon_tray", RECOVERED_FURTHER_LUA / "widget/consoleicontraywidget.lua", "Console tray Parley and NPC Linkpearl buttons."),
)

CALL_WIDGET_SOURCES: tuple[SourceSpec, ...] = (
    SourceSpec("npc_linkshell_list_widget", RECOVERED_MORE_LUA / "widget/npclinkshelllistwidget.lua", "NPC Linkpearl list and per-linkpearl icon state."),
    SourceSpec("npc_linkshell_command_client", RECOVERED_MORE_LUA / "command/system/npclinkshellchatcommand.lua", "Recovered client canFire guard."),
    SourceSpec("desktop_widget", RECOVERED_FURTHER_LUA / "widget/desktopwidget_connector.lua", "Shortcut menu, status, and 24213 command bridge."),
    SourceSpec("main_menu_widget", RECOVERED_FURTHER_LUA / "widget/mainmenuwidget.lua", "Main-menu entry for NpcLinkshellListWidget."),
    SourceSpec("console_icon_tray", RECOVERED_FURTHER_LUA / "widget/consoleicontraywidget.lua", "Linkpearl tray icon state and click target."),
)

LOCAL_AND_DAT_SOURCES: tuple[SourceSpec, ...] = (
    SourceSpec("local_parley_command_stub", ROOT / "Data/scripts/commands/NegotiationCommand.lua", "Local probe script documenting widget calls and update codes."),
    SourceSpec("local_npc_linkshell_command", ROOT / "Data/scripts/commands/NpcLinkshellChatCommand.lua", "Local command delegates NPC LS handling to active quests."),
    SourceSpec("local_together_we_stand", ROOT / "Data/scripts/quests/man/man206.lua", "Together We Stand NPC Linkpearl sequence."),
    SourceSpec("local_player", ROOT / "Map Server/Actors/Chara/Player/Player.cs", "Ready-command, negotiation flag, and NPC LS state sync."),
    SourceSpec("local_battle_save", ROOT / "Map Server/Actors/Chara/BattleSave.cs", "Negotiation flag storage."),
    SourceSpec("local_quest_runtime", ROOT / "Map Server/Actors/Quest/Quest.cs", "NPC LS message lifecycle and sequence transition helper."),
    SourceSpec("ai_command_dat", ROOT / "AI Scripts/command.csv", "Recovered command labels/descriptions."),
    SourceSpec("local_command_dat", ROOT / "Data/command.csv", "Local command row flags."),
    SourceSpec("server_battle_commands_sql", ROOT / "Data/sql/server_battle_commands.sql", "Local battle command row for Parley."),
    SourceSpec("man300_dat_text", ROOT / "docs/Dat Mining/man300.csv", "Toll of the Warden dialogue and Parley references."),
    SourceSpec("man206_dat_text", ROOT / "docs/Dat Mining/man206.csv", "Together We Stand dialogue and linkpearl references."),
    SourceSpec("negotiation_table_text", ROOT / "docs/Dat Mining/xtx_negotiationTable.csv", "Parley titles and ask text."),
    SourceSpec("negotiation_item_text", ROOT / "docs/Dat Mining/xtx_negotiationItem.csv", "Parley topic/item display text."),
    SourceSpec("negotiation_item_data", ROOT / "docs/Dat Mining/negotiationItem.csv", "Parley topic/item data id bridge."),
    SourceSpec("patch_119_notes", ROOT / "docs/patches/Patch_1.19.md", "Patch note anchor for direct NPC Linkpearl display."),
)

ALL_SOURCES = PARLEY_WIDGET_SOURCES + CALL_WIDGET_SOURCES + LOCAL_AND_DAT_SOURCES

COMMAND_IDS = {22009, 22901, 24213, 29497}
QUEST_TEXT_ROWS = {
    "man300": {43, 67, 69, 70, 311, 322},
    "man206": {17, 283, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347},
}

TEXT_ID_RE = re.compile(
    r"\b(?:710[0-9]|711[0-9]|712[0-9]|74619|75732|7580[234]|25119|3482|2124|30232|29497|24213|22009|22901|29[123])\b"
)
CONTROL_RE = re.compile(
    r"\"((?:Button|TextBlock|ProgressBar|IconControl|Label|ListBox|TextBox|MainName|Help|NPC_LS|Gauge|Frame|Window)[^\"]{0,80})\""
)
CALL_RE = re.compile(
    r"\b(?:askEventModeWidgetYield|openEventModeWidgetYield|selectEventModeWidgetYield|updateEventModeWidget|"
    r"closeEventModeWidget|openChildWidget|executePlayerCommandLocal|executePlayerCommand|canTargetNegotiation|"
    r"executeNegotiationCommand|executePlayerNPCLinkshellChat|getLinkpearlStatus|updateQuestLinkPerlIcon|"
    r"isNpcLinkshellChatCalling|isNpcLinkshellChatExtra|hasNpcLinkshell|getNpcLinkshellChatLinkshellLength|"
    r"HandleNpcLs|SetNpcLs|NewNpcLsMsg|ReadNpcLsMsg|EndOfNpcLsMsgs|StartSequenceForNpcLs|_runCharaScheduler)\b"
)
FUNCTION_START_RE = re.compile(r"^\s*function\s+([A-Za-z_][A-Za-z0-9_:.]*)\s*\(([^)]*)\)")
PENDING_NAME_RE = re.compile(r"^\s*L\d+_\d+\s*=\s*\"([A-Za-z_][A-Za-z0-9_]*)\"")
ASSIGN_NAME_RE = re.compile(r"\.([A-Za-z_][A-Za-z0-9_]*)\s*=\s*L\d+_\d+")


def ascii_clean(value: object, limit: int | None = None) -> str:
    text = "" if value is None else str(value)
    replacements = {
        "\u2010": "-",
        "\u2011": "-",
        "\u2012": "-",
        "\u2013": "-",
        "\u2014": "-",
        "\u2015": "-",
        "\u2018": "'",
        "\u2019": "'",
        "\u201c": '"',
        "\u201d": '"',
        "\u2026": "...",
        "\u2500": "-",
    }
    for src, dst in replacements.items():
        text = text.replace(src, dst)
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")
    text = re.sub(r"\s+", " ", text).strip()
    if limit is not None and len(text) > limit:
        return text[: max(0, limit - 3)].rstrip() + "..."
    return text


def rel(path: Path) -> str:
    try:
        return path.relative_to(ROOT).as_posix()
    except ValueError:
        return path.as_posix()


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


def write_csv(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: ascii_clean(row.get(field, "")) for field in fields})


def write_json(path: Path, data: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=True) + "\n", encoding="utf-8")


def source_inventory() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    seen: set[Path] = set()
    for spec in ALL_SOURCES:
        if spec.path in seen:
            continue
        seen.add(spec.path)
        exists = spec.path.exists()
        text = read_text(spec.path) if exists and spec.path.is_file() else ""
        lines = text.splitlines()
        signals = sorted(set(CALL_RE.findall(text) + TEXT_ID_RE.findall(text)))[:20]
        rows.append(
            {
                "surface": spec.surface,
                "path": rel(spec.path),
                "exists": exists,
                "line_count": len(lines),
                "sha1_12": hashlib.sha1(text.encode("utf-8", "replace")).hexdigest()[:12] if text else "",
                "role": spec.role,
                "signals": "; ".join(signals),
            }
        )
    return rows


def get_cell(row: list[str], index: int) -> str:
    return row[index].strip() if index < len(row) else ""


def command_rows_from_csv(path: Path, source_name: str) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    if not path.exists():
        return rows
    for line_no, line in enumerate(read_text(path).splitlines(), start=1):
        if not re.match(r"^\d+,", line):
            continue
        for row in csv.reader([line]):
            if not row or not get_cell(row, 0).isdigit():
                continue
            command_id = int(get_cell(row, 0))
            if command_id not in COMMAND_IDS:
                continue
            rows.append(
                {
                    "source": source_name,
                    "path": rel(path),
                    "line": line_no,
                    "command_id": command_id,
                    "english_name": get_cell(row, 3),
                    "english_token": get_cell(row, 4),
                    "english_description": get_cell(row, 24),
                    "local_flag_slice_27_35": "|".join(get_cell(row, idx) for idx in range(27, min(len(row), 36))),
                    "raw_preview": ",".join(row[:36]),
                }
            )
    return rows


def server_battle_command_rows(path: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    if not path.exists():
        return rows
    value_re = re.compile(r"VALUES\s*\((\d+),\s*'([^']+)'\s*,(?P<body>.*?)\);\s*--\s*(?P<comment>.*)$")
    for line_no, line in enumerate(read_text(path).splitlines(), start=1):
        match = value_re.search(line)
        if not match:
            continue
        command_id = int(match.group(1))
        if command_id not in COMMAND_IDS:
            continue
        fields = [field.strip() for field in match.group("body").split(",")]
        rows.append(
            {
                "source": "server_battle_commands_sql",
                "path": rel(path),
                "line": line_no,
                "command_id": command_id,
                "english_name": match.group(2),
                "english_token": match.group(2),
                "english_description": match.group("comment"),
                "local_flag_slice_27_35": "|".join(fields[26:35]),
                "raw_preview": ascii_clean(line, 300),
            }
        )
    return rows


def build_command_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    rows.extend(command_rows_from_csv(ROOT / "AI Scripts/command.csv", "ai_command_dat"))
    rows.extend(command_rows_from_csv(ROOT / "Data/command.csv", "local_command_dat"))
    rows.extend(server_battle_command_rows(ROOT / "Data/sql/server_battle_commands.sql"))
    return rows


def iter_lua_functions(path: Path, logical_surface: str) -> Iterable[dict[str, object]]:
    if not path.exists():
        return
    lines = read_text(path).splitlines()
    starts: list[tuple[int, str, str, str]] = []
    pending_name = ""
    for index, line in enumerate(lines):
        pending_match = PENDING_NAME_RE.match(line)
        if pending_match:
            pending_name = pending_match.group(1)
            continue
        function_match = FUNCTION_START_RE.match(line)
        if not function_match:
            continue
        raw_name = function_match.group(1)
        name = raw_name
        if raw_name.startswith("L") and pending_name:
            name = pending_name
        starts.append((index, name, function_match.group(2), raw_name))
        pending_name = ""

    for idx, (start, name, args, raw_name) in enumerate(starts):
        end = starts[idx + 1][0] if idx + 1 < len(starts) else len(lines)
        block_end = end
        while block_end > start and PENDING_NAME_RE.match(lines[block_end - 1]):
            block_end -= 1
        block_lines = lines[start:block_end]
        block = "\n".join(block_lines)
        if raw_name.startswith("L"):
            assignment = ASSIGN_NAME_RE.search(block)
            if assignment and name == raw_name:
                name = assignment.group(1)
        interesting_terms = (
            "Negotiation",
            "negotiation",
            "Parley",
            "NpcLinkshell",
            "Linkpearl",
            "29497",
            "24213",
            "22009",
            "22901",
            "30232",
            "74619",
            "7580",
            "75732",
        )
        if not any(term in block or term in name for term in interesting_terms):
            continue
        yield summarize_function(path, logical_surface, name, args, start + 1, block_end, block)


def summarize_function(
    path: Path,
    logical_surface: str,
    name: str,
    args: str,
    start_line: int,
    end_line: int,
    block: str,
) -> dict[str, object]:
    text_ids = sorted(set(TEXT_ID_RE.findall(block)), key=lambda value: (len(value), value))
    controls = sorted(set(CONTROL_RE.findall(block)))[:30]
    calls = sorted(set(CALL_RE.findall(block)))
    result_values = sorted(set(re.findall(r"setBaseAskResult\s*\(([^)]{0,80})\)", block)))
    notes = notes_for_function(name, block)
    return {
        "source": rel(path),
        "logical_surface": logical_surface,
        "function": name,
        "args": args,
        "start_line": start_line,
        "end_line": end_line,
        "line_count": end_line - start_line,
        "text_ids_or_constants": "; ".join(text_ids),
        "controls": "; ".join(controls),
        "event_or_bridge_calls": "; ".join(calls),
        "result_values": "; ".join(result_values),
        "notes": notes,
    }


def notes_for_function(name: str, block: str) -> str:
    lowered = (name + " " + block).lower()
    if "openlistwidget" in lowered:
        return "Opens Ask/NegotiationListWidget with origin id and ten boolean topic visibility flags."
    if "openaskwidget" in lowered:
        return "Opens Ask/NegotiationAskWidget with title, difficulty, desired item, and required item."
    if "opennegotiationwidget" in lowered:
        return "Opens the main Ask/NegotiationWidget with title, item id, turn/time limits, and five ability ids."
    if "inputnegotiationwidget" in lowered:
        return "Yields for Ask/NegotiationWidget selection; returns tile id, cancel, time-up, or ability result."
    if "updatenegotiationwidget" in lowered:
        return "Forwards update codes into Ask/NegotiationWidget; see parley_update_codes.csv."
    if "close" in lowered and "negotiationwidget" in lowered:
        return "Closes the active Parley widget."
    if "ability" in lowered and "setbaseaskresult" in lowered:
        return "Ability popup returns ability index plus 14, giving result ids 15-19."
    if "processaskresult" in lowered:
        return "Cancel confirmation maps the ask result back into the event-mode result."
    if "playerselect" in lowered:
        return "Tile selection writes the selected tile id and stops player input/timer."
    if "cantargetnegotiation" in lowered:
        return "Requires ready command slot 16, player negotiation enabled, a non-player target, and target isNegotiatable()."
    if "executenegotiationcommand" in lowered:
        return "Executes the ready command from slot 16 when Parley is targetable."
    if "executenpclinkshellchat" in lowered:
        return "Bridges NPC Linkpearl selection to local system command 24213 with the linkpearl id."
    if "getlinkpearlstatus" in lowered:
        return "Aggregates owned NPC Linkpearls into hidden/idle/extra/calling icon status; duplicate calling test is probably a decompiler wart."
    if "questlinkpearl" in lowered:
        return "Tray button opens the NPC Linkpearl shortcut and updates icons 293/292/291."
    if "npclinkshelllistwidget" in lowered and "executeplayernpclinkshellchat" in lowered:
        return "List selection reads IntData.Value0 and starts NPC Linkpearl chat through DesktopWidget."
    if "isnpclinkshellchatcalling" in lowered:
        return "Client guard requires the selected NPC Linkpearl id to be in calling state."
    return ""


def build_function_contract_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for spec in PARLEY_WIDGET_SOURCES + CALL_WIDGET_SOURCES:
        rows.extend(iter_lua_functions(spec.path, spec.surface) or [])
    for spec in (
        SourceSpec("local_parley_command_stub", ROOT / "Data/scripts/commands/NegotiationCommand.lua", ""),
        SourceSpec("local_npc_linkshell_command", ROOT / "Data/scripts/commands/NpcLinkshellChatCommand.lua", ""),
        SourceSpec("local_together_we_stand", ROOT / "Data/scripts/quests/man/man206.lua", ""),
    ):
        rows.extend(iter_lua_functions(spec.path, spec.surface) or [])
    return rows


def build_update_code_rows() -> list[dict[str, object]]:
    return [
        {"code": "1-12", "name": "topic slot update", "args": "slot, key, itemIconId, pointValue, selectedFlag, disabledFlag", "effect": "Populates one of twelve grid tiles and increments visible topic count.", "evidence": "Ask/NegotiationWidget.updateAskParameter branch for low slot ids; local command stub comment.", "confidence": "high"},
        {"code": "13", "name": "operation result/history", "args": "selection, opponentOrPlayerFlag, iconId, value, isEnemy, showHistory", "effect": "Displays a selected operation, plays player/enemy operation SFX, and can write a history icon.", "evidence": "Ask/NegotiationWidget.updateAskParameter SFX and selected-icon branch.", "confidence": "medium"},
        {"code": "14", "name": "negotiation gauge", "args": "max, value", "effect": "Sets the negotiation progress gauge maximum and current value.", "evidence": "Local stub plus ProgressBar branch.", "confidence": "high"},
        {"code": "15", "name": "achievement gauge", "args": "max, value", "effect": "Sets the achievement/result progress gauge maximum and current value.", "evidence": "Local stub plus ProgressBar branch.", "confidence": "high"},
        {"code": "16", "name": "additional item 1", "args": "visible/available flag", "effect": "Toggles first additional reward/item indicator and can play add-item SFX.", "evidence": "Ask/NegotiationWidget update branch 16.", "confidence": "medium"},
        {"code": "17", "name": "additional item 2", "args": "visible/available flag", "effect": "Toggles second additional reward/item indicator and can play add-item SFX.", "evidence": "Ask/NegotiationWidget update branch 17.", "confidence": "medium"},
        {"code": "18", "name": "additional item 3", "args": "visible/available flag", "effect": "Toggles third additional reward/item indicator and can play add-item SFX.", "evidence": "Ask/NegotiationWidget update branch 18.", "confidence": "medium"},
        {"code": "19", "name": "selected/history icon", "args": "historyIndex, iconId", "effect": "Writes one of the six last-selected item icons.", "evidence": "Local stub and update branch indexing selected icons.", "confidence": "high"},
        {"code": "20", "name": "ability availability", "args": "five booleans or ids", "effect": "Updates which ability buttons are usable in the child ability list.", "evidence": "Ask/NegotiationAbilityListWidget wiring and update branch.", "confidence": "medium"},
        {"code": "21", "name": "phase/result visibility", "args": "unknown", "effect": "Toggles a result/phase visibility group; exact meaning still needs a runtime probe.", "evidence": "Recovered branch exists but local comment left blank.", "confidence": "low"},
        {"code": "22", "name": "clear timer", "args": "none or ignored", "effect": "Clears/resets the time gauge.", "evidence": "Local stub and time-gauge branch.", "confidence": "high"},
        {"code": "23", "name": "player move SFX", "args": "none or ignored", "effect": "Plays the player-side move sound.", "evidence": "Local stub and SFX branch.", "confidence": "high"},
        {"code": "24", "name": "opponent move SFX", "args": "none or ignored", "effect": "Plays the opponent-side move sound.", "evidence": "Local stub and SFX branch.", "confidence": "high"},
        {"code": "25", "name": "time-up SFX", "args": "none or ignored", "effect": "Plays time-up sound and closes ability selector if it is open.", "evidence": "Local stub and update branch.", "confidence": "high"},
        {"code": "26", "name": "move or merge topic tile", "args": "fromSlot, toSlot, newKey, newIcon, newValue", "effect": "Moves/merges a topic from one grid tile to another, hides old slot, and updates count.", "evidence": "Ask/NegotiationWidget icon/value copy branch.", "confidence": "medium"},
        {"code": "27", "name": "double or halve values", "args": "slot or all, bool/direction", "effect": "Doubles or halves topic point values based on the supplied flag.", "evidence": "Ask/NegotiationWidget value transform branch.", "confidence": "medium"},
        {"code": "28", "name": "pause timer", "args": "none or ignored", "effect": "Pauses the Parley input timer.", "evidence": "Local stub and timer branch.", "confidence": "high"},
        {"code": "29", "name": "resume timer", "args": "none or ignored", "effect": "Resumes the Parley input timer.", "evidence": "Local stub and timer branch.", "confidence": "high"},
    ]


def build_bridge_rows() -> list[dict[str, object]]:
    return [
        {
            "surface": "Parley",
            "entry": "DAT command",
            "id_or_constant": "29497",
            "client_path": "AI Scripts/command.csv names this Parley; Data/command.csv carries local flags; SQL registers battle command 'parley'.",
            "server_or_local_path": "Data/sql/server_battle_commands.sql: player_ability row.",
            "icon_or_text": "MainMenu uses command text 1104, icon 30232, help 74619.",
            "gate": "DesktopWidget.canTargetNegotiation.",
            "implementation_note": "This is the command the menu/tray exposes when a target is negotiatable.",
        },
        {
            "surface": "Parley",
            "entry": "ready command gate",
            "id_or_constant": "getReadyCommand(16)",
            "client_path": "DesktopWidget.canTargetNegotiation and executeNegotiationCommand.",
            "server_or_local_path": "Player.cs seeds command[14] with 0xA0F00000 | 29497 and sets negotiationFlag[0].",
            "icon_or_text": "Visible as a ready command, similar to synthesis command wiring.",
            "gate": "Player enableNegotiation, target exists, target is not player, target isNegotiatable.",
            "implementation_note": "Toll of the Warden likely needs actors/director state that makes shamans negotiatable rather than direct widget calls from man300.",
        },
        {
            "surface": "Parley",
            "entry": "widget judge",
            "id_or_constant": "NegotiationJudge",
            "client_path": "judge/negotiation/negotiationjudge.lua.",
            "server_or_local_path": "Data/scripts/commands/NegotiationCommand.lua is only a probe/stub.",
            "icon_or_text": "Ask/NegotiationListWidget, Ask/NegotiationAskWidget, Ask/NegotiationWidget.",
            "gate": "Event-mode widget yield/select/update calls.",
            "implementation_note": "The local command shows call shape but immediately closes the widget; it is not the full minigame.",
        },
        {
            "surface": "Parley",
            "entry": "tile minigame",
            "id_or_constant": "Ask/NegotiationWidget",
            "client_path": "widget/ask/negotiationwidget.lua.",
            "server_or_local_path": "Needs a server-side turn/state model if implemented locally.",
            "icon_or_text": "12 topic buttons, six selected/history icons, negotiation gauge, achievement gauge, time gauge, five abilities.",
            "gate": "inputNegotiationWidget returns tile ids 1-12, time-up 13, or ability ids 15-19.",
            "implementation_note": "Use parley_update_codes.csv for the recovered update contract.",
        },
        {
            "surface": "Call / NPC Linkpearl",
            "entry": "tray shortcut",
            "id_or_constant": "Button_QuestLinkPearl",
            "client_path": "ConsoleIconTrayWidget sends UILuaCommands.ShortCutActionQuestLSMenu.",
            "server_or_local_path": "DesktopWidget opens NpcLinkshellListWidget.",
            "icon_or_text": "Icons 293 idle/hidden, 292 extra, 291 calling/animated.",
            "gate": "DesktopWidget.getLinkpearlStatus.",
            "implementation_note": "This is the visible 'call' note/menu icon path.",
        },
        {
            "surface": "Call / NPC Linkpearl",
            "entry": "main menu",
            "id_or_constant": "index 13",
            "client_path": "MainMenuWidget opens NpcLinkshellListWidget.",
            "server_or_local_path": "No direct quest call here; selecting an entry executes system command 24213.",
            "icon_or_text": "MainName text id 2124, help id 75732.",
            "gate": "Owned NPC Linkpearl entries from player work.",
            "implementation_note": "Comparable to synthesis/aetheryte menu icon wiring, but this goes through NPC LS state.",
        },
        {
            "surface": "Call / NPC Linkpearl",
            "entry": "list selection",
            "id_or_constant": "24213",
            "client_path": "NpcLinkshellListWidget selection -> desktopWidget:executePlayerNPCLinkshellChat(id).",
            "server_or_local_path": "Data/scripts/commands/NpcLinkshellChatCommand.lua -> player:HandleNpcLs(id).",
            "icon_or_text": "List item names use text id 3482 with NPC LS id; help ids 75802/75803/75804.",
            "gate": "Recovered canFire requires player:isNpcLinkshellChatCalling(id).",
            "implementation_note": "Quest code must set calling/extra state before the entry is usable.",
        },
        {
            "surface": "Call / NPC Linkpearl",
            "entry": "quest state",
            "id_or_constant": "NPC LS id 6",
            "client_path": "man206 SEQ_005 asks the player to contact the Path companion.",
            "server_or_local_path": "Quest.NewNpcLsMsg(6) -> player.SetNpcLs -> HandleNpcLs -> onNpcLS -> StartSequenceForNpcLs(SEQ_010).",
            "icon_or_text": "Game message 25119: glow emanates from the NPC Linkpearl.",
            "gate": "Quest.HasNpcLsMsgs(id) and active message step.",
            "implementation_note": "Together We Stand already has the right local sequence shape; the UI surface is the NPC Linkpearl list.",
        },
    ]


def extract_quest_text_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for quest, ids in QUEST_TEXT_ROWS.items():
        path = ROOT / "docs/Dat Mining" / f"{quest}.csv"
        if not path.exists():
            continue
        with path.open("r", encoding="utf-8", errors="replace", newline="") as fh:
            for line_no, row in enumerate(csv.reader(fh), start=1):
                if not row or not get_cell(row, 0).isdigit():
                    continue
                row_id = int(get_cell(row, 0))
                if row_id not in ids:
                    continue
                rows.append(
                    {
                        "quest": quest,
                        "path": rel(path),
                        "line": line_no,
                        "row_id": row_id,
                        "english_text": get_cell(row, 2),
                        "surface": "Parley" if quest == "man300" else "Call / NPC Linkpearl",
                        "note": quest_row_note(quest, row_id, get_cell(row, 2)),
                    }
                )
    return rows


def quest_row_note(quest: str, row_id: int, english_text: str) -> str:
    text = english_text.lower()
    if quest == "man300":
        if "parley" in text or "tiles" in text:
            return "Direct Toll of the Warden text proving the Parley/tile objective."
        return "Follow-up evidence that the negotiation attempt affects the quest narrative."
    if row_id == 17 or row_id == 283:
        return "Minfilia directs the player to contact the Path companion using the linkpearl."
    if 330 <= row_id <= 347:
        return "NPC Linkpearl message pack row used by man206 NPCLS_MSGS."
    return "Together We Stand NPC Linkpearl text."


def build_negotiation_sheet_rows() -> list[dict[str, object]]:
    specs = [
        ("xtx_negotiationTable", ROOT / "docs/Dat Mining/xtx_negotiationTable.csv", {1, 1101, 1201, 1301, 1302, 1303}),
        ("xtx_negotiationItem", ROOT / "docs/Dat Mining/xtx_negotiationItem.csv", {1, 2, 3, 4, 5, 6, 7}),
        ("negotiationItem", ROOT / "docs/Dat Mining/negotiationItem.csv", {0, 1, 2, 3, 4, 5, 6, 7}),
    ]
    rows: list[dict[str, object]] = []
    for sheet, path, sample_ids in specs:
        if not path.exists():
            continue
        data_rows = []
        with path.open("r", encoding="utf-8", errors="replace", newline="") as fh:
            for line_no, row in enumerate(csv.reader(fh), start=1):
                if not row or not get_cell(row, 0).isdigit():
                    continue
                row_id = int(get_cell(row, 0))
                data_rows.append((line_no, row_id, row))
        for line_no, row_id, row in data_rows:
            if row_id not in sample_ids:
                continue
            nonempty = [cell for cell in row[1:] if cell.strip()]
            rows.append(
                {
                    "sheet": sheet,
                    "path": rel(path),
                    "line": line_no,
                    "row_id": row_id,
                    "data_row_count": len(data_rows),
                    "nonempty_preview": " | ".join(nonempty[:12]),
                    "note": negotiation_sheet_note(sheet, row_id),
                }
            )
    return rows


def negotiation_sheet_note(sheet: str, row_id: int) -> str:
    if sheet == "xtx_negotiationTable" and row_id == 1302:
        return "Same title id used by the local NegotiationCommand probe."
    if sheet == "xtx_negotiationItem":
        return "Localized topic text used by Parley tile/topic rows."
    if sheet == "negotiationItem":
        return "Data bridge from topic index to item/icon ids."
    return "Sample row for Parley text/data surface."


def build_probe_rows() -> list[dict[str, object]]:
    return [
        {
            "priority": "P1",
            "surface": "Toll of the Warden / Parley",
            "probe": "Target-gate capture",
            "steps": "Log canTargetNegotiation inputs around the Ixal/Amalj'aa shaman targets: ready slot 16, player enableNegotiation, target id, isPlayer, isNegotiatable.",
            "success": "Parley icon 29497 appears only on intended shaman targets.",
            "risk": "Low if logging-only.",
        },
        {
            "priority": "P1",
            "surface": "Toll of the Warden / Parley",
            "probe": "EventStart payload capture",
            "steps": "Click Parley on a negotiatable test target and capture owner/command/params before writing gameplay state.",
            "success": "Server sees command 29497 with target context and can route to a controlled NegotiationJudge flow.",
            "risk": "Medium; do not mutate quest outcome until command params are proven.",
        },
        {
            "priority": "P2",
            "surface": "Parley widget",
            "probe": "Update-code sandbox",
            "steps": "Use the local stub with one test actor to send update codes 14, 15, 19, 20, 22, 28, 29 in isolation.",
            "success": "Gauge, selected-icon, ability, and timer behavior match parley_update_codes.csv without client errors.",
            "risk": "Low in an isolated test command.",
        },
        {
            "priority": "P1",
            "surface": "Together We Stand / call",
            "probe": "NPC Linkpearl status sync",
            "steps": "At man206 SEQ_005, verify playerWork npcLinkshellChatCalling[6]/Extra[6] and console icon 291/292/293 state.",
            "success": "Clicking the tray icon opens NpcLinkshellListWidget with id 6 focused/callable.",
            "risk": "Low; mostly state sync and UI visibility.",
        },
        {
            "priority": "P1",
            "surface": "Together We Stand / call",
            "probe": "24213 selection path",
            "steps": "Select NPC LS id 6 and capture local command 24213 -> HandleNpcLs -> man206 onNpcLS.",
            "success": "Message rows 330-347 advance and completion calls StartSequenceForNpcLs(SEQ_010).",
            "risk": "Low if the quest remains in disposable test state.",
        },
    ]


def render_doc(
    command_rows: list[dict[str, object]],
    function_rows: list[dict[str, object]],
    source_rows: list[dict[str, object]],
    quest_rows: list[dict[str, object]],
    negotiation_sheet_rows: list[dict[str, object]],
) -> str:
    command_count = len(command_rows)
    function_count = len(function_rows)
    source_count = len(source_rows)
    quest_count = len(quest_rows)
    sheet_count = len(negotiation_sheet_rows)
    parley_functions = sum(1 for row in function_rows if "parley" in str(row["logical_surface"]).lower() or "negotiation" in str(row["logical_surface"]).lower())
    call_functions = function_count - parley_functions

    man300_rows = [row for row in quest_rows if row["quest"] == "man300"]
    man206_rows = [row for row in quest_rows if row["quest"] == "man206"]
    parley_text = next((row["english_text"] for row in man300_rows if row["row_id"] == 67), "")
    call_text = next((row["english_text"] for row in man206_rows if row["row_id"] == 283), "")

    lines: list[str] = [
        f"# Parley and NPC Linkpearl widget decomp ({DOC_STAMP})",
        "",
        "## Short version",
        "",
        "- Parley is the recovered client Negotiation surface. The visible command is `29497` (`Parley`), MainMenu presents it with text `1104`, icon `30232`, and help `74619`, and DesktopWidget only exposes it when `canTargetNegotiation()` passes.",
        "- Toll of the Warden text explicitly tells the player to play the tiles and best the shamans at parley, but the recovered/local Man300 quest script does not directly call `NegotiationJudge`. The likely missing piece is quest/director or actor state that makes the shaman targets negotiatable.",
        "- The user-facing `call` note/menu icon in Together We Stand is the NPC Linkpearl path: tray `Button_QuestLinkPearl` or main menu opens `NpcLinkshellListWidget`, selection executes system command `24213`, and Man206 uses NPC LS id `6` to advance from `SEQ_005` to `SEQ_010`.",
        "",
        "## Generated evidence",
        "",
        f"- Output README: `{rel(OUT_DIR / 'README.md')}`.",
        f"- Source inventory: `{rel(OUT_DIR / 'source_inventory.csv')}` ({source_count} files).",
        f"- Command rows: `{rel(OUT_DIR / 'parley_command_rows.csv')}` ({command_count} rows).",
        f"- Function contracts: `{rel(OUT_DIR / 'widget_function_contracts.csv')}` ({function_count} rows: {parley_functions} Parley/Negotiation, {call_functions} NPC Linkpearl/quest-linked).",
        f"- Parley update-code map: `{rel(OUT_DIR / 'parley_update_codes.csv')}`.",
        f"- Menu and runtime bridge map: `{rel(OUT_DIR / 'menu_bridge_contract.csv')}`.",
        f"- Quest text anchors: `{rel(OUT_DIR / 'quest_surface_notes.csv')}` ({quest_count} rows).",
        f"- Negotiation data-sheet samples: `{rel(OUT_DIR / 'negotiation_data_sheet_samples.csv')}` ({sheet_count} rows).",
        f"- Probe checklist: `{rel(OUT_DIR / 'runtime_probe_checklist.csv')}`.",
        f"- JSON summary: `{rel(OUT_DIR / 'contract_summary.json')}`.",
        "",
        "## Parley / Negotiation surface",
        "",
        "| Surface | Recovered contract | Local/server anchor |",
        "| --- | --- | --- |",
        "| Command | `29497` is labelled `Parley`; `22009` is the lower-level/open negotiation command and `22901` is quit/cease negotiations. | `server_battle_commands.sql` has `29497, 'parley'` as `player_ability`; `Player.cs` seeds the command and enables `battleSave.negotiationFlag[0]`. |",
        "| Menu icon | `MainMenuWidget.updateReadyCommand` checks `29497` and `desktopWidget:canTargetNegotiation()`, then calls `addReadyCommand(29497, 1104, 30232, slot)`. | Help id `74619` is selected for command `29497`. |",
        "| Target gate | `DesktopWidget.canTargetNegotiation()` requires ready slot `16`, player `enableNegotiation()`, current target, non-player target, and target `isNegotiatable()`. | This points implementation toward actor/director state, not a raw quest text branch. |",
        "| Minigame widgets | `NegotiationJudge` opens/selects/updates/closes `Ask/NegotiationListWidget`, `Ask/NegotiationAskWidget`, and `Ask/NegotiationWidget`. | Local `Data/scripts/commands/NegotiationCommand.lua` is a probe that shows call shape and sample update code use, then closes immediately. |",
        "| Returns | Tile picks return `1-12`; time-up path selects `13`; ability list returns `15-19`; cancel paths return `-1`. | A real server implementation needs to own turns, score/gauge state, and outcome before changing quest state. |",
        "",
        "Key Man300 text anchor:",
        "",
        f"> {ascii_clean(parley_text, 500)}",
        "",
        "That line is the strongest quest binding: the player can fight or speak with the shamans and convince them to play tiles. Since no recovered Man300 direct `openNegotiationWidget` call was found, the conservative implementation path is to make those shaman actors negotiatable during the relevant mesa objective and route command `29497` to the Parley state machine.",
        "",
        "## Parley update codes",
        "",
        "| Code | Meaning | Confidence |",
        "| --- | --- | --- |",
    ]
    for row in build_update_code_rows():
        lines.append(f"| `{row['code']}` | {row['name']}: {row['effect']} | {row['confidence']} |")

    lines.extend(
        [
            "",
            "## Call / NPC Linkpearl surface",
            "",
            "| Surface | Recovered contract | Local/server anchor |",
            "| --- | --- | --- |",
            "| Tray icon | `ConsoleIconTrayWidget` uses `Button_QuestLinkPearl`; clicking it sends `UILuaCommands.ShortCutActionQuestLSMenu`. | `DesktopWidget` opens `NpcLinkshellListWidget`. |",
            "| Status icons | `getLinkpearlStatus()` maps no linkpearl to hidden/idle and active states to icons `293`, `292`, and animated `291`. | The recovered Lua duplicates `isNpcLinkshellChatCalling` in one branch; server flags show the intended split is calling plus extra. |",
            "| Main menu | `MainMenuWidget` opens `NpcLinkshellListWidget`, with main text id `2124` and help id `75732`. | Patch 1.19 notes say clicking the linkpearl icon can directly bring up the NPC Linkpearl display. |",
            "| List selection | `NpcLinkshellListWidget` stores NPC LS id in `IntData.Value0`, names rows through text id `3482`, and selection calls `executePlayerNPCLinkshellChat(id)`. | `DesktopWidget.executePlayerNPCLinkshellChat(id)` executes local command `24213`. |",
            "| Command guard | Recovered `NpcLinkshellChatCommand.canFire(player, id)` returns `player:isNpcLinkshellChatCalling(id)`. | Local `NpcLinkshellChatCommand.lua` calls `player:HandleNpcLs(id)` and ends the event if no quest handles it. |",
            "| Quest route | Man206 `SEQ_005` calls `quest:NewNpcLsMsg(6)`. `onNpcLS` sends rows `330-347` by companion personality and calls `StartSequenceForNpcLs(SEQ_010)` when complete. | Server `Quest.NewNpcLsMsg`, `ReadNpcLsMsg`, `EndOfNpcLsMsgs`, and `Player.SetNpcLs` drive the calling/extra flags. |",
            "",
            "Key Man206 text anchor:",
            "",
            f"> {ascii_clean(call_text, 500)}",
            "",
            "This makes the `call` note a quest-linkpearl UI problem, not a separate notepad widget. For Together We Stand, the important runtime proof is that NPC LS id `6` becomes callable at `SEQ_005`, appears in `NpcLinkshellListWidget`, executes `24213`, and drains the Man206 `NPCLS_MSGS` pack into `SEQ_010`.",
            "",
            "## Implementation notes",
            "",
            "- Do not wire Man300 by directly opening `Ask/NegotiationWidget` from the quest script unless a capture proves that retail did so. The menu and target gate strongly suggest the Parley command is target-driven.",
            "- Treat the local `NegotiationCommand.lua` as a call-shape probe. It is useful for arguments and update codes, but it is not gameplay complete.",
            "- For Man300, first add logging or disposable target setup around the shaman targets: ready command slot, `enableNegotiation`, `isNegotiatable`, command `29497` payload, and the chosen negotiation table id.",
            "- For Man206, keep using the existing NPC Linkpearl lifecycle. The user-facing missing piece is usually status visibility or command route, not a new widget family.",
            "- When interpreting NPC Linkpearl icon state, prefer the server `SetNpcLs` mapping over the duplicated recovered `isNpcLinkshellChatCalling` branch: inactive is extra-only, active is calling-only, alert is calling plus extra.",
            "",
            "## Highest-value next probes",
            "",
            "1. Capture command `29497` on a manually negotiatable test NPC and confirm target/owner params before adding quest outcome logic.",
            "2. Validate `Ask/NegotiationWidget` update codes `14`, `15`, `19`, `20`, `22`, `28`, and `29` in the local probe command.",
            "3. At Man206 `SEQ_005`, verify NPC LS id `6` appears with the correct `291/292/293` icon and executes command `24213` into `onNpcLS`.",
        ]
    )
    return "\n".join(lines) + "\n"


def render_output_readme(summary: dict[str, object]) -> str:
    lines = [
        f"# Parley and NPC Linkpearl widget decomp evidence ({DOC_STAMP})",
        "",
        "This directory is generated by `tools/build_parley_call_widget_decomp.py`.",
        "",
        "## Key ids",
        "",
        "- Parley command: `29497`.",
        "- Open negotiation command: `22009`.",
        "- Quit negotiation command: `22901`.",
        "- NPC Linkpearl system command: `24213`.",
        "- Together We Stand NPC Linkpearl id: `6`.",
        "",
        "## Files",
        "",
        "- `source_inventory.csv`: recovered/local files used as evidence.",
        "- `parley_command_rows.csv`: command DAT and SQL rows for Parley/Negotiation ids.",
        "- `widget_function_contracts.csv`: recovered function-level contracts for Parley and NPC Linkpearl widgets.",
        "- `parley_update_codes.csv`: recovered `Ask/NegotiationWidget` update-code map.",
        "- `menu_bridge_contract.csv`: menu/tray/DesktopWidget/server bridge summary.",
        "- `quest_surface_notes.csv`: Man300 and Man206 text rows anchoring the quest behavior.",
        "- `negotiation_data_sheet_samples.csv`: Parley negotiation text/data sheet samples.",
        "- `runtime_probe_checklist.csv`: next capture/probe checklist.",
        "- `contract_summary.json`: machine-readable counts and key ids.",
        "",
        f"Human-facing doc: `{summary['doc']}`.",
    ]
    return "\n".join(lines) + "\n"


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)

    source_rows = source_inventory()
    command_rows = build_command_rows()
    function_rows = build_function_contract_rows()
    update_rows = build_update_code_rows()
    bridge_rows = build_bridge_rows()
    quest_rows = extract_quest_text_rows()
    negotiation_sheet_rows = build_negotiation_sheet_rows()
    probe_rows = build_probe_rows()

    write_csv(
        OUT_DIR / "source_inventory.csv",
        source_rows,
        ["surface", "path", "exists", "line_count", "sha1_12", "role", "signals"],
    )
    write_csv(
        OUT_DIR / "parley_command_rows.csv",
        command_rows,
        ["source", "path", "line", "command_id", "english_name", "english_token", "english_description", "local_flag_slice_27_35", "raw_preview"],
    )
    write_csv(
        OUT_DIR / "widget_function_contracts.csv",
        function_rows,
        ["source", "logical_surface", "function", "args", "start_line", "end_line", "line_count", "text_ids_or_constants", "controls", "event_or_bridge_calls", "result_values", "notes"],
    )
    write_csv(
        OUT_DIR / "parley_update_codes.csv",
        update_rows,
        ["code", "name", "args", "effect", "evidence", "confidence"],
    )
    write_csv(
        OUT_DIR / "menu_bridge_contract.csv",
        bridge_rows,
        ["surface", "entry", "id_or_constant", "client_path", "server_or_local_path", "icon_or_text", "gate", "implementation_note"],
    )
    write_csv(
        OUT_DIR / "quest_surface_notes.csv",
        quest_rows,
        ["quest", "path", "line", "row_id", "surface", "english_text", "note"],
    )
    write_csv(
        OUT_DIR / "negotiation_data_sheet_samples.csv",
        negotiation_sheet_rows,
        ["sheet", "path", "line", "row_id", "data_row_count", "nonempty_preview", "note"],
    )
    write_csv(
        OUT_DIR / "runtime_probe_checklist.csv",
        probe_rows,
        ["priority", "surface", "probe", "steps", "success", "risk"],
    )

    summary = {
        "run_stamp": RUN_STAMP,
        "doc": rel(DOC_PATH),
        "readme": rel(OUT_DIR / "README.md"),
        "output_dir": rel(OUT_DIR),
        "sources": len(source_rows),
        "command_rows": len(command_rows),
        "function_contract_rows": len(function_rows),
        "parley_update_codes": len(update_rows),
        "bridge_rows": len(bridge_rows),
        "quest_text_rows": len(quest_rows),
        "negotiation_sheet_sample_rows": len(negotiation_sheet_rows),
        "probe_rows": len(probe_rows),
        "key_ids": {
            "parley_command": 29497,
            "open_negotiation_command": 22009,
            "quit_negotiation_command": 22901,
            "npc_linkshell_command": 24213,
            "together_we_stand_npc_ls_id": 6,
        },
    }
    write_json(OUT_DIR / "contract_summary.json", summary)
    (OUT_DIR / "README.md").write_text(render_output_readme(summary), encoding="utf-8")

    DOC_PATH.write_text(
        render_doc(command_rows, function_rows, source_rows, quest_rows, negotiation_sheet_rows),
        encoding="utf-8",
    )

    print(f"Wrote {rel(DOC_PATH)}")
    print(f"Wrote {rel(OUT_DIR)}")


if __name__ == "__main__":
    main()
