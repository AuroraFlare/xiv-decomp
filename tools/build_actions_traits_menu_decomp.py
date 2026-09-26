#!/usr/bin/env python3
"""Build an action/trait/class/job/menu decomp atlas.

The repo has the pieces scattered across DAT CSV extracts, decompiled widget Lua,
server SQL, and local custom class overlays. This script joins the high-value
surfaces into a small output package so follow-up work has a stable map.
"""

from __future__ import annotations

import csv
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RUN_STAMP = "20260705"
OUT_DIR = ROOT / "outputs" / f"actions-traits-menu-decomp-{RUN_STAMP}"
DOC_PATH = ROOT / "docs" / f"actions_traits_classes_jobs_menu_decomp_{RUN_STAMP[:4]}-{RUN_STAMP[4:6]}-{RUN_STAMP[6:]}.md"


CLASS_JOBS = {
    1: ("Adventurer", "class"),
    2: ("Pugilist", "class"),
    3: ("Gladiator", "class"),
    4: ("Marauder", "class"),
    5: ("Fencer", "unreleased_class"),
    6: ("Enforcer", "unreleased_class"),
    7: ("Archer", "class"),
    8: ("Lancer", "class"),
    9: ("Musketeer", "unreleased_class"),
    10: ("Sentinel", "unreleased_class"),
    11: ("Samurai", "unreleased_class"),
    12: ("Stavesman", "unreleased_class"),
    13: ("Assassin", "unreleased_class"),
    14: ("Flayer", "unreleased_class"),
    15: ("Monk", "job"),
    16: ("Paladin", "job"),
    17: ("Warrior", "job"),
    18: ("Bard", "job"),
    19: ("Dragoon", "job"),
    21: ("Mystic", "unreleased_class"),
    22: ("Thaumaturge", "class"),
    23: ("Conjurer", "class"),
    24: ("Arcanist", "unreleased_class"),
    26: ("Black Mage", "job"),
    27: ("White Mage", "job"),
    29: ("Carpenter", "class"),
    30: ("Blacksmith", "class"),
    31: ("Armorer", "class"),
    32: ("Goldsmith", "class"),
    33: ("Leatherworker", "class"),
    34: ("Weaver", "class"),
    35: ("Alchemist", "class"),
    36: ("Culinarian", "class"),
    39: ("Miner", "class"),
    40: ("Botanist", "class"),
    41: ("Fisher", "class"),
    42: ("Shepherd", "unreleased_class"),
}

CLASS_EXP_COLUMNS = {
    2: "pug",
    3: "gla",
    4: "mrd",
    5: "fnc",
    6: "enf",
    7: "arc",
    8: "lnc",
    9: "msk",
    10: "snt",
    11: "sam",
    12: "stv",
    13: "asn",
    14: "fla",
    21: "mys",
    22: "thm",
    23: "cnj",
    24: "acn",
    29: "crp",
    30: "bsm",
    31: "arm",
    32: "gsm",
    33: "ltw",
    34: "wvr",
    35: "alc",
    36: "cul",
    39: "min",
    40: "btn",
    41: "fsh",
    42: "shp",
}

CLASS_TO_JOB = {
    2: 15,
    3: 16,
    4: 17,
    7: 18,
    8: 19,
    22: 26,
    23: 27,
}

UNRELEASED_CLASS_IDS = {5, 6, 9, 10, 11, 12, 13, 14, 21, 24, 42}
JOB_IDS = {15, 16, 17, 18, 19, 26, 27}
KNOWN_UNRELEASED_ANCHORS = {22106, 22107, 22110, 22111, 22112, 22308, 22309}

BATTLE_COMMAND_COLS = [
    "id",
    "name",
    "classJob",
    "lvl",
    "requirements",
    "mainTarget",
    "validTarget",
    "aoeType",
    "aoeRange",
    "aoeMinRange",
    "aoeConeAngle",
    "aoeRotateAngle",
    "aoeTarget",
    "basePotency",
    "numHits",
    "positionBonus",
    "procRequirement",
    "range",
    "minRange",
    "bestRange",
    "rangeHeight",
    "rangeWidth",
    "statusId",
    "statusDuration",
    "statusChance",
    "castType",
    "castTime",
    "recastTime",
    "mpCost",
    "tpCost",
    "animationType",
    "effectAnimation",
    "modelAnimation",
    "animationDuration",
    "battleAnimation",
    "validUser",
    "comboId1",
    "comboId2",
    "comboStep",
    "accuracyMod",
    "worldMasterTextId",
    "commandType",
    "actionType",
    "actionProperty",
    "damageSwing",
    "isRanged",
]

BATTLE_TRAIT_COLS = ["id", "name", "classJob", "lvl", "modifier", "bonus"]

CLIENT_KIND_LABELS = {
    0: "system_or_none",
    1: "unknown_1",
    2: "weaponskill_or_basic",
    3: "spell",
    4: "unknown_4",
    5: "ability",
    7: "trait",
    10: "main_menu_or_system",
    11: "system_command",
}

COMMAND_TYPE_LABELS = {
    "0": "unknown",
    "1": "auto_attack",
    "2": "weapon_skill",
    "3": "ability",
    "4": "spell",
}


def rel(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT)).replace("\\", "/")
    except ValueError:
        return str(path).replace("\\", "/")


def clean_text(value: object) -> str:
    if value is None:
        return ""
    text = str(value).replace("\r", " ").replace("\n", " ").strip()
    return text.encode("ascii", "replace").decode("ascii")


def to_int(value: object, default: int = 0) -> int:
    try:
        text = str(value).strip()
        if text == "":
            return default
        return int(float(text))
    except (TypeError, ValueError):
        return default


def class_name(class_id: int) -> str:
    return CLASS_JOBS.get(class_id, (f"unknown_{class_id}", "unknown"))[0]


def class_kind(class_id: int) -> str:
    return CLASS_JOBS.get(class_id, ("", "unknown"))[1]


def client_kind_label(kind: int) -> str:
    return CLIENT_KIND_LABELS.get(kind, f"unknown_{kind}")


def parse_client_commands() -> dict[int, dict[str, str]]:
    csv_path = ROOT / "AI Scripts" / "command.csv"
    commands: dict[int, dict[str, str]] = {}

    with csv_path.open("r", encoding="utf-8", errors="ignore", newline="") as handle:
        reader = csv.reader(handle)
        for row in reader:
            if not row or not row[0].strip().isdigit():
                continue

            command_id = int(row[0])
            kind = to_int(row[36] if len(row) > 36 else 0)
            display_class_job = to_int(row[39] if len(row) > 39 else 0)
            commands[command_id] = {
                "id": command_id,
                "name_en": clean_text(row[3] if len(row) > 3 else ""),
                "short_name_en": clean_text(row[4] if len(row) > 4 else ""),
                "description_en": clean_text(row[24] if len(row) > 24 else ""),
                "client_kind": kind,
                "client_kind_label": client_kind_label(kind),
                "icon_id": to_int(row[37] if len(row) > 37 else 0),
                "observed_col_38": clean_text(row[38] if len(row) > 38 else ""),
                "display_class_job": display_class_job,
                "display_class_job_name": class_name(display_class_job) if display_class_job else "",
                "display_level": to_int(row[40] if len(row) > 40 else 0),
                "observed_col_76": clean_text(row[76] if len(row) > 76 else ""),
                "observed_col_79": clean_text(row[79] if len(row) > 79 else ""),
                "observed_col_114": clean_text(row[114] if len(row) > 114 else ""),
                "observed_col_115": clean_text(row[115] if len(row) > 115 else ""),
                "observed_col_119": clean_text(row[119] if len(row) > 119 else ""),
                "source": rel(csv_path),
            }

    return commands


def parse_sql_tuples(sql_text: str, table_name: str) -> list[list[str]]:
    pattern = re.compile(
        rf"\b(?:INSERT|REPLACE)\s+INTO\s+`?{re.escape(table_name)}`?\b.*?\bVALUES\b(.*?);",
        re.IGNORECASE | re.DOTALL,
    )
    tuples: list[list[str]] = []

    for match in pattern.finditer(sql_text):
        values = match.group(1)
        in_quote = False
        escape_next = False
        depth = 0
        current = []

        for char in values:
            if in_quote:
                current.append(char)
                if escape_next:
                    escape_next = False
                elif char == "\\":
                    escape_next = True
                elif char == "'":
                    in_quote = False
                continue

            if char == "'":
                in_quote = True
                current.append(char)
            elif char == "(":
                if depth == 0:
                    current = []
                else:
                    current.append(char)
                depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    tuples.append(split_sql_tuple("".join(current)))
                    current = []
                else:
                    current.append(char)
            else:
                if depth > 0:
                    current.append(char)

    return tuples


def split_sql_tuple(tuple_text: str) -> list[str]:
    values: list[str] = []
    current: list[str] = []
    in_quote = False
    escape_next = False
    i = 0
    while i < len(tuple_text):
        char = tuple_text[i]

        if in_quote:
            if escape_next:
                current.append(char)
                escape_next = False
            elif char == "\\":
                escape_next = True
            elif char == "'":
                if i + 1 < len(tuple_text) and tuple_text[i + 1] == "'":
                    current.append("'")
                    i += 1
                else:
                    in_quote = False
            else:
                current.append(char)
        else:
            if char == "'":
                in_quote = True
            elif char == ",":
                values.append("".join(current).strip())
                current = []
            else:
                current.append(char)
        i += 1

    values.append("".join(current).strip())
    return values


def iter_sql_files() -> list[Path]:
    files = sorted((ROOT / "Data" / "sql").rglob("*.sql"))
    base_first = [
        ROOT / "Data" / "sql" / "server_battle_commands.sql",
        ROOT / "Data" / "sql" / "server_battle_traits.sql",
    ]
    ordered: list[Path] = []
    for path in base_first:
        if path.exists():
            ordered.append(path)
    for path in files:
        if path not in ordered:
            ordered.append(path)
    return ordered


def parse_server_commands() -> dict[int, dict[str, str]]:
    commands: dict[int, dict[str, str]] = {}
    for path in iter_sql_files():
        text = path.read_text(encoding="utf-8", errors="ignore")
        for values in parse_sql_tuples(text, "server_battle_commands"):
            if len(values) < len(BATTLE_COMMAND_COLS):
                continue
            row = dict(zip(BATTLE_COMMAND_COLS, values))
            command_id = to_int(row["id"], -1)
            if command_id < 0:
                continue
            row["_source"] = rel(path)
            commands[command_id] = row
    return commands


def parse_server_traits() -> dict[int, dict[str, str]]:
    traits: dict[int, dict[str, str]] = {}
    for path in iter_sql_files():
        text = path.read_text(encoding="utf-8", errors="ignore")
        for values in parse_sql_tuples(text, "server_battle_traits"):
            if len(values) < len(BATTLE_TRAIT_COLS):
                continue
            row = dict(zip(BATTLE_TRAIT_COLS, values))
            trait_id = to_int(row["id"], -1)
            if trait_id < 0:
                continue
            row["_source"] = rel(path)
            traits[trait_id] = row
    return traits


def extract_schema_columns(table_name: str) -> set[str]:
    columns: set[str] = set()
    for path in iter_sql_files():
        text = path.read_text(encoding="utf-8", errors="ignore")
        create_match = re.search(
            rf"CREATE\s+TABLE\s+IF\s+NOT\s+EXISTS\s+`{re.escape(table_name)}`\s*\((.*?)\)\s*ENGINE",
            text,
            re.IGNORECASE | re.DOTALL,
        )
        if create_match:
            for col in re.findall(r"^\s*`([a-z0-9_]+)`\s+", create_match.group(1), flags=re.IGNORECASE | re.MULTILINE):
                if col != "characterId":
                    columns.add(col)

        for col in re.findall(
            rf"ALTER\s+TABLE\s+`{re.escape(table_name)}`\s+ADD\s+COLUMN\s+`([a-z0-9_]+)`",
            text,
            flags=re.IGNORECASE,
        ):
            columns.add(col)

    return columns


def write_csv(path: Path, rows: list[dict[str, object]], fieldnames: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="ascii", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({key: clean_text(row.get(key, "")) for key in fieldnames})


def classify_joined_row(client: dict[str, str] | None, server: dict[str, str] | None, trait: dict[str, str] | None) -> str:
    ids = []
    if client:
        ids.append(to_int(client.get("display_class_job", 0)))
    if server:
        ids.append(to_int(server.get("classJob", 0)))
    if trait:
        ids.append(to_int(trait.get("classJob", 0)))

    if trait or (client and to_int(client.get("client_kind", 0)) == 7):
        return "trait"
    if any(class_id in UNRELEASED_CLASS_IDS for class_id in ids):
        return "unreleased_class_action"
    if any(class_id in JOB_IDS for class_id in ids):
        return "job_action"
    if server:
        command_type = clean_text(server.get("commandType", ""))
        return COMMAND_TYPE_LABELS.get(command_type, f"server_command_type_{command_type}")
    if client:
        return client_kind_label(to_int(client.get("client_kind", 0)))
    return "unknown"


def build_join_rows(
    client_commands: dict[int, dict[str, str]],
    server_commands: dict[int, dict[str, str]],
    server_traits: dict[int, dict[str, str]],
) -> list[dict[str, object]]:
    ids = sorted(set(client_commands) | set(server_commands) | set(server_traits))
    rows: list[dict[str, object]] = []
    for command_id in ids:
        client = client_commands.get(command_id)
        server = server_commands.get(command_id)
        trait = server_traits.get(command_id)
        server_class_id = to_int(server.get("classJob", 0) if server else 0)
        trait_class_id = to_int(trait.get("classJob", 0) if trait else 0)

        rows.append(
            {
                "id": command_id,
                "classification": classify_joined_row(client, server, trait),
                "client_name_en": client.get("name_en", "") if client else "",
                "client_short_name_en": client.get("short_name_en", "") if client else "",
                "client_kind": client.get("client_kind", "") if client else "",
                "client_kind_label": client.get("client_kind_label", "") if client else "",
                "icon_id": client.get("icon_id", "") if client else "",
                "display_class_job": client.get("display_class_job", "") if client else "",
                "display_class_job_name": client.get("display_class_job_name", "") if client else "",
                "display_level": client.get("display_level", "") if client else "",
                "server_present": 1 if server else 0,
                "server_name": server.get("name", "") if server else "",
                "server_class_job": server_class_id if server else "",
                "server_class_job_name": class_name(server_class_id) if server_class_id else "",
                "server_level": server.get("lvl", "") if server else "",
                "server_command_type": server.get("commandType", "") if server else "",
                "server_command_type_label": COMMAND_TYPE_LABELS.get(clean_text(server.get("commandType", "")), "") if server else "",
                "server_action_type": server.get("actionType", "") if server else "",
                "server_action_property": server.get("actionProperty", "") if server else "",
                "server_status_id": server.get("statusId", "") if server else "",
                "server_cast_time": server.get("castTime", "") if server else "",
                "server_recast_time": server.get("recastTime", "") if server else "",
                "server_source": server.get("_source", "") if server else "",
                "trait_present": 1 if trait else 0,
                "trait_name": trait.get("name", "") if trait else "",
                "trait_class_job": trait_class_id if trait else "",
                "trait_class_job_name": class_name(trait_class_id) if trait_class_id else "",
                "trait_level": trait.get("lvl", "") if trait else "",
                "trait_modifier": trait.get("modifier", "") if trait else "",
                "trait_bonus": trait.get("bonus", "") if trait else "",
                "trait_source": trait.get("_source", "") if trait else "",
            }
        )
    return rows


def build_class_job_rows(level_cols: set[str], exp_cols: set[str], server_commands: dict[int, dict[str, str]], server_traits: dict[int, dict[str, str]]) -> list[dict[str, object]]:
    command_count: dict[int, int] = {}
    trait_count: dict[int, int] = {}
    for row in server_commands.values():
        class_id = to_int(row.get("classJob", 0))
        command_count[class_id] = command_count.get(class_id, 0) + 1
    for row in server_traits.values():
        class_id = to_int(row.get("classJob", 0))
        trait_count[class_id] = trait_count.get(class_id, 0) + 1

    rows: list[dict[str, object]] = []
    for class_id, (name, kind) in sorted(CLASS_JOBS.items()):
        col = CLASS_EXP_COLUMNS.get(class_id, "")
        base_job = CLASS_TO_JOB.get(class_id, "")
        rows.append(
            {
                "id": class_id,
                "name": name,
                "kind": kind,
                "level_exp_column": col,
                "level_column_present": 1 if col in level_cols else 0,
                "exp_column_present": 1 if col in exp_cols else 0,
                "base_class_id": next((base for base, job in CLASS_TO_JOB.items() if job == class_id), ""),
                "base_class_name": class_name(next((base for base, job in CLASS_TO_JOB.items() if job == class_id), 0)) if class_id in CLASS_TO_JOB.values() else "",
                "job_id_for_class": base_job,
                "job_name_for_class": class_name(base_job) if base_job else "",
                "server_command_rows": command_count.get(class_id, 0),
                "server_trait_rows": trait_count.get(class_id, 0),
            }
        )
    return rows


def build_unreleased_anchor_rows(join_rows: list[dict[str, object]]) -> list[dict[str, object]]:
    rows = []
    for row in join_rows:
        command_id = to_int(row["id"])
        display_class = to_int(row.get("display_class_job", 0))
        server_class = to_int(row.get("server_class_job", 0))
        if command_id not in KNOWN_UNRELEASED_ANCHORS and display_class not in UNRELEASED_CLASS_IDS and server_class not in UNRELEASED_CLASS_IDS:
            continue
        rows.append(row)
    return rows


def build_menu_widget_rows() -> list[dict[str, object]]:
    rows = [
        {
            "surface": "Actions & Traits assignment menu",
            "file": "tools/outputs/lpb/decomp_further_20260617/lua/widget/actionsettingwidget.lua",
            "line_or_function": "ActionSettingWidget.init / setClassAction / setJobAction / setGodsend / equipAction",
            "role": "Lists learned actions, traits/godsends, class buttons, job actions, and calls desktopWidget:executePlayerEquipAction.",
        },
        {
            "surface": "Live action bar",
            "file": "tools/outputs/lpb/decomp_further_20260617/lua/widget/actionmenuwidget.lua",
            "line_or_function": "ActionMenuWidget.updateMainSlot / executeGameCommand / processSubTargetDecided",
            "role": "Renders equipped commands, handles shortcut execution, target selection, recast state, combo effects, and user macros.",
        },
        {
            "surface": "Cast gauge",
            "file": "tools/outputs/lpb/decomp_further_20260617/lua/widget/actiongaugewidget.lua",
            "line_or_function": "ActionGaugeWidget.startCastGauge",
            "role": "Displays the current command icon/name from desktopWidget command data and animates remaining cast time.",
        },
        {
            "surface": "Main menu entry",
            "file": "tools/outputs/lpb/decomp_further_20260617/lua/widget/mainmenuwidget.lua",
            "line_or_function": "opens ActionSettingWidget",
            "role": "System/menu entry for the Actions & Traits assignment screen.",
        },
        {
            "surface": "Desktop connector",
            "file": "tools/outputs/lpb/decomp_further_20260617/lua/widget/desktopwidget_connector.lua",
            "line_or_function": "createStaticWidget(7, ActionMenuWidget), updateActionMenuWidget, executePlayerEquipAction",
            "role": "Owns widget creation/update bridge and forwards equip/execute commands to the player command lane.",
        },
        {
            "surface": "Job quest reward popup",
            "file": "tools/outputs/lpb/decomp_more_20260617/lua/widget/jobquestinformationwidget.lua",
            "line_or_function": "JobQuestInformationWidget.init",
            "role": "Shows learned job ability or item icon for roughly five seconds after quest scripts call showGetJobAbilityWidget.",
        },
        {
            "surface": "Job change command",
            "file": "Data/scripts/commands/ChangeJobCommand.lua",
            "line_or_function": "classToJob / setPlayerJob / setPlayerClass",
            "role": "Server-side command 12017 handler: validates soul key item, toggles currentJob, runs class-change animation/message.",
        },
        {
            "surface": "Equip action command",
            "file": "Data/scripts/commands/EquipAbilityCommand.lua",
            "line_or_function": "onEventStarted",
            "role": "Server-side equip/unequip path from the menu, including additional-action slot limits and class/job gating.",
        },
    ]
    return rows


def build_ui_text_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    terms = ("Actions & Traits", "Ability", "Trait", "Job Change")
    for path in [ROOT / "docs" / "Dat Mining" / "xtx__text_ui.csv", ROOT / "docs" / "Dat Mining" / "xtx__text_ui(2).csv", ROOT / "docs" / "Dat Mining" / "xtx__fixedPhrase.csv"]:
        if not path.exists():
            continue
        with path.open("r", encoding="utf-8", errors="ignore", newline="") as handle:
            reader = csv.reader(handle)
            for row in reader:
                if len(row) < 3 or not row[0].strip().isdigit():
                    continue
                joined = " ".join(row)
                if not any(term in joined for term in terms):
                    continue
                rows.append(
                    {
                        "id": row[0],
                        "english": clean_text(row[2] if len(row) > 2 else ""),
                        "raw_match": clean_text(joined),
                        "source": rel(path),
                    }
                )
    return rows


def build_job_widget_rows(client_commands: dict[int, dict[str, str]]) -> list[dict[str, object]]:
    path = ROOT / "tools" / "outputs" / "lpb" / "decomp_further_20260617" / "full_high_signal_calls.csv"
    rows: list[dict[str, object]] = []
    if not path.exists():
        return rows

    with path.open("r", encoding="utf-8", errors="ignore", newline="") as handle:
        reader = csv.DictReader(handle)
        for row in reader:
            if row.get("method") != "showGetJobAbilityWidget":
                continue
            args = row.get("args_preview", "")
            nums = [int(value) for value in re.findall(r"\b\d{5}\b", args)]
            command_id = nums[0] if nums else 0
            client = client_commands.get(command_id, {})
            rows.append(
                {
                    "logical_path": row.get("logical_path", ""),
                    "line": row.get("line", ""),
                    "command_id": command_id,
                    "command_name": client.get("name_en", ""),
                    "display_class_job": client.get("display_class_job", ""),
                    "display_class_job_name": client.get("display_class_job_name", ""),
                    "line_text": row.get("line_text", ""),
                    "source": rel(path),
                }
            )
    return rows


def write_readme(counts: dict[str, int]) -> None:
    text = f"""# Actions, Traits, Classes, Jobs, and Menus Decomp Atlas

Generated: 2026-07-05

This output joins the client command DAT extract, server battle command/trait SQL,
local custom class overlays, and recovered UI/widget Lua for the action and trait
menu surfaces.

## Files

- `command_client_server_join.csv` - client command rows joined to server command and trait rows.
- `class_job_matrix.csv` - class/job ids, storage columns, class-to-job pairs, and row counts.
- `unreleased_class_anchors.csv` - known unreleased/custom class action anchors and custom server rows.
- `menu_widget_hooks.csv` - the main menu/widget/runtime surfaces for action setting, hotbar use, casts, rewards, job change, and equip action.
- `client_ui_text_rows.csv` - DAT UI text rows that name Actions & Traits, Ability, Trait, and Job Change.
- `job_ability_widget_calls.csv` - recovered job quest scripts that call `showGetJobAbilityWidget`.

## Counts

- Client command rows: {counts['client_commands']}
- Server battle command rows after overlays: {counts['server_commands']}
- Server battle trait rows: {counts['server_traits']}
- Joined rows: {counts['join_rows']}
- Unreleased/custom anchor rows: {counts['unreleased_rows']}
- Job ability popup calls: {counts['job_widget_rows']}
"""
    (OUT_DIR / "README.md").write_text(text, encoding="ascii")


def write_doc(counts: dict[str, int]) -> None:
    text = f"""# Actions, Traits, Classes, Jobs, and Menu Decomp

Date: 2026-07-05

## Short Map

The client action catalog is the command DAT sheet, represented locally by
`AI Scripts/command.csv`. The useful observed columns are:

- `0`: command id, the client/server handshake id.
- `3` and `4`: English display name and short name.
- `24`: English tooltip/body text.
- `36`: client command kind. Observed values include `2` weapon skill/basic,
  `3` spell, `5` ability, `7` trait, and `10`/`11` menu or system command.
- `37`: action icon id.
- `39`: displayed class/job id.
- `40`: displayed level.

The server runtime catalog is `Data/sql/server_battle_commands.sql`, plus custom
overlays under `Data/sql/custom content/`. The command id must match the DAT row.
The server row controls class/job gate, level gate, target rules, potency, status,
cost, cast/recast, animation, command type, and the Lua command script folder.

Traits are separate server rows in `Data/sql/server_battle_traits.sql`. Runtime
trait ownership is simpler than actions: `Character.HasTrait` checks that the
trait `classJob` equals `GetClass()` and that the trait level is <= current class
level. Modifier traits are applied during battle-trait stat recalculation; rows
with modifier `0` are present as feature hooks/placeholders.

## Classes And Jobs

Class/job ids are shared numeric ids. The current base class lives in
`state_mainSkill[0]`; `currentJob` is a separate overlay. `GetClass()` returns the
base class, while `GetCurrentClassOrJobId()` returns `currentJob` when nonzero.

Retail jobs are not independent leveling tracks here. `ChangeJobCommand.lua`
maps base class -> job id with key-item checks and animation ids:

- Pugilist 2 -> Monk 15
- Gladiator 3 -> Paladin 16
- Marauder 4 -> Warrior 17
- Archer 7 -> Bard 18
- Lancer 8 -> Dragoon 19
- Thaumaturge 22 -> Black Mage 26
- Conjurer 23 -> White Mage 27

Action acquisition is level driven: `Database.LoadGlobalBattleCommandList` keys
commands by `(classJob, lvl)`, and `RefreshCommandAcquiredFromClassLevels` marks
command ids acquired for every class level the character has. Hotbar storage is
per class/job id in `characters_hotbar`; visible hotbar commands are stored in
`charaWork.command[32..61]` as `0xA0F00000 | commandId`.

## Menus

The recovered menu layer is mostly in these client Lua widgets:

- `ActionSettingWidget`: the Actions & Traits assignment screen. It reads command
  sheet data, shows class/action/godsend/job-action lists, and calls
  `desktopWidget:executePlayerEquipAction`.
- `ActionMenuWidget`: the live action bar. It reads equipped custom commands from
  `desktopWidget`, handles shortcut execution, targeting, recasts, combo effects,
  and macro pages.
- `ActionGaugeWidget`: cast bar icon/name/progress for the current command.
- `MainMenuWidget`: opens `ActionSettingWidget`.
- `JobQuestInformationWidget`: the learned ability/item popup used by job quest
  scripts through `showGetJobAbilityWidget`.

On the server, `EquipAbilityCommand.lua` is the main menu-to-hotbar handler. It
handles equip, unequip, swapping, current-class action protection, additional
action limits, and class/job gating. Jobs cap additional actions at 5.

## Unreleased Classes

The local server enum and character level/EXP schemas already include unreleased
or custom class ids: Fencer 5, Enforcer 6, Musketeer 9, Sentinel 10, Samurai 11,
Stavesman 12, Assassin 13, Flayer 14, Mystic 21, Arcanist 24, and Shepherd 42.

Direct DAT anchors exist for only some of them. Confirmed anchors include:

- Fencer: `22106` rapier basic attack shell.
- Enforcer: `22107` Bludgeon.
- Musketeer: `22110` Discharge.
- Sentinel: `22111` Guard and `22112` Block, plus shield-discipline rows.
- Arcanist: `22308` Create Distaff and `22309` Animate Distaff.

The custom SQL overlay `11_unreleased_custom_classes_playable.sql` makes a subset
playable by adding or remapping server command rows. For classes with no native
DAT action rows, the practical path is to clone donor command DAT rows and add
matching server rows. The command id is the handshake: a DAT-only action can show
in menus, but it will not execute unless the server knows that id.

## Generated Atlas

See `outputs/actions-traits-menu-decomp-20260705/`:

- joined command rows: {counts['join_rows']}
- server command rows after overlays: {counts['server_commands']}
- server trait rows: {counts['server_traits']}
- unreleased/custom anchor rows: {counts['unreleased_rows']}
- recovered job ability popup calls: {counts['job_widget_rows']}

## Next Targets

1. Recover/label the remaining ActionSettingWidget command-sheet columns used by
   `setCommandInfo`: observed columns `38`, `76`, `79`, `114`, `115`, and `119`.
2. Trace `desktopWidget:executePlayerEquipAction` through native packet/event
   boundaries to fully document the menu packet shape.
3. For unreleased classes, decide per action whether to reuse an existing id or
   clone a DAT row. Clones require both DAT and `server_battle_commands` rows.
4. Add explicit trait/menu tests for custom classes, because the current trait
   check is base-class-only and jobs get separate soul-stone stat modifiers.
"""
    DOC_PATH.write_text(text, encoding="ascii")


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    client_commands = parse_client_commands()
    server_commands = parse_server_commands()
    server_traits = parse_server_traits()
    join_rows = build_join_rows(client_commands, server_commands, server_traits)
    level_cols = extract_schema_columns("characters_class_levels")
    exp_cols = extract_schema_columns("characters_class_exp")
    class_job_rows = build_class_job_rows(level_cols, exp_cols, server_commands, server_traits)
    unreleased_rows = build_unreleased_anchor_rows(join_rows)
    menu_rows = build_menu_widget_rows()
    ui_text_rows = build_ui_text_rows()
    job_widget_rows = build_job_widget_rows(client_commands)

    write_csv(
        OUT_DIR / "command_client_server_join.csv",
        join_rows,
        [
            "id",
            "classification",
            "client_name_en",
            "client_short_name_en",
            "client_kind",
            "client_kind_label",
            "icon_id",
            "display_class_job",
            "display_class_job_name",
            "display_level",
            "server_present",
            "server_name",
            "server_class_job",
            "server_class_job_name",
            "server_level",
            "server_command_type",
            "server_command_type_label",
            "server_action_type",
            "server_action_property",
            "server_status_id",
            "server_cast_time",
            "server_recast_time",
            "server_source",
            "trait_present",
            "trait_name",
            "trait_class_job",
            "trait_class_job_name",
            "trait_level",
            "trait_modifier",
            "trait_bonus",
            "trait_source",
        ],
    )

    write_csv(
        OUT_DIR / "class_job_matrix.csv",
        class_job_rows,
        [
            "id",
            "name",
            "kind",
            "level_exp_column",
            "level_column_present",
            "exp_column_present",
            "base_class_id",
            "base_class_name",
            "job_id_for_class",
            "job_name_for_class",
            "server_command_rows",
            "server_trait_rows",
        ],
    )

    write_csv(
        OUT_DIR / "unreleased_class_anchors.csv",
        unreleased_rows,
        [
            "id",
            "classification",
            "client_name_en",
            "client_kind_label",
            "icon_id",
            "display_class_job",
            "display_class_job_name",
            "display_level",
            "server_present",
            "server_name",
            "server_class_job",
            "server_class_job_name",
            "server_level",
            "server_command_type_label",
            "server_source",
        ],
    )

    write_csv(OUT_DIR / "menu_widget_hooks.csv", menu_rows, ["surface", "file", "line_or_function", "role"])
    write_csv(OUT_DIR / "client_ui_text_rows.csv", ui_text_rows, ["id", "english", "raw_match", "source"])
    write_csv(
        OUT_DIR / "job_ability_widget_calls.csv",
        job_widget_rows,
        ["logical_path", "line", "command_id", "command_name", "display_class_job", "display_class_job_name", "line_text", "source"],
    )

    counts = {
        "client_commands": len(client_commands),
        "server_commands": len(server_commands),
        "server_traits": len(server_traits),
        "join_rows": len(join_rows),
        "unreleased_rows": len(unreleased_rows),
        "job_widget_rows": len(job_widget_rows),
    }
    write_readme(counts)
    write_doc(counts)

    print(f"Wrote {rel(OUT_DIR)}")
    print(f"Wrote {rel(DOC_PATH)}")


if __name__ == "__main__":
    main()
