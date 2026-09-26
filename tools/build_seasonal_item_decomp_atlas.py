#!/usr/bin/env python3
"""Build a seasonal/event item atlas from local data and recovered spl scripts."""

from __future__ import annotations

import argparse
import csv
import re
from collections import defaultdict
from datetime import datetime
from pathlib import Path


DEFAULT_OUTPUT = Path("outputs/seasonal-item-decomp-atlas-20260703")
DEFAULT_DOC = Path("docs/seasonal_item_decomp_atlas_2026-07-03.md")

ITEM_SQL = Path("Data/sql/gamedata_items.sql")
QUEST_SQL = Path("Data/sql/gamedata_quests.sql")
QUEST_REWARD_SQL = Path("Data/sql/gamedata_quest_rewards.sql")
PATCH_122 = Path("docs/patches/Patch_1.22.md")
ACHIEVEMENT_TEXT = Path("docs/Dat Mining/xtx_achievement.csv")

RECOVERED_SPL = Path("tools/outputs/lpb/decomp_more_20260617/lua/quest/scenario/spl")
LOCAL_SPL = Path("Data/scripts/quests/spl")
LOCAL_EVENT_SCRIPTS = [
    Path("Data/scripts/base/chara/npc/populace/PopulaceSpecialEventCryer.lua"),
    Path("Data/scripts/base/chara/npc/populace/PopulaceCompanyShop.lua"),
]

INSERT_VALUES_RE = re.compile(r"VALUES\s*\((.*)\);")
QUEST_RE = re.compile(r"\((\d+),\s*'((?:\\'|[^'])*)',\s*'([^']+)'")
QUEST_REWARD_RE = re.compile(
    r"\((\d+),\s*(\d+),\s*'([^']+)',\s*(\d+),\s*(\d+),\s*(\d+),\s*'([^']*)',\s*(\d+)\)"
)
INT_RE = re.compile(r"(?<![A-Za-z0-9_])(\d{6,8})(?![A-Za-z0-9_])")

PATCH_SEASONAL_PREFIX = "Seasonal events"

NAME_HINTS = (
    "Princess Pudding",
    "Starlight Log",
    "Pumpkin Cookie",
    "Over-aspected Cluster",
    "Over-aspected Crystal",
    "Storm Tracer",
    "Flame Tracer",
    "Serpent Tracer",
    "Lominsan Sparkler",
    "Gridanian Sparkler",
    "Ul'dahn Sparkler",
    "Magicked Prism (Harbor Herald)",
    "Magicked Prism (Mythril Eye)",
    "Magicked Prism (The Raven)",
    "Magicked Prism (Crimson Star)",
    "Magicked Prism (Emerald Star)",
    "Magicked Prism (Indigo Star)",
    "Bombard Bloom",
    "Magicked Prism (Maelstrom)",
    "Magicked Prism (Twin Adder)",
    "Magicked Prism (Immortal Flames)",
    "Black Usagi Kabuto",
    "Silver Usagi Kabuto",
    "Usagi Kabuto",
    "Dragon Kabuto",
    "Crimson Dragon Kabuto",
    "Golden Dragon Kabuto",
    "Black Dragon Kabuto",
    "Reindeer Antlers",
    "Reindeer Suit",
    "Patriot's Bracelet",
    "Patriot's Choker",
    "Deaspected Cluster",
    "Deaspected Crystal",
    "Odd Egg",
)

EVENT_BY_CODE = {
    "spl000": "Foundation Day / city-state static event",
    "spl0g1": "Hatching-tide / Dreamer's Gospel (Gridania)",
    "spl0g2": "Hatching-tide / Dreamer's Dilemma (Gridania)",
    "spl0l1": "Hatching-tide / Dreamer's Gospel (Limsa Lominsa)",
    "spl0l2": "Hatching-tide / Dreamer's Dilemma (Limsa Lominsa)",
    "spl0u1": "Hatching-tide / Dreamer's Gospel (Ul'dah)",
    "spl0u2": "Hatching-tide / Dreamer's Dilemma (Ul'dah)",
    "spl0i1": "Moonfire Faire / Bombard ash fireworks",
    "spl0i2": "All Saints' Wake / pumpkin exchange",
    "spl0i3": "Starlight Celebration / reindeer reward",
    "spl0i4": "Heavensturn / Gone with the Snow",
    "spl101": "Hatching-tide / Scrambled Eggs",
    "spl101_quest": "Hatching-tide / menu-only Scrambled Eggs companion",
    "spl102": "Moonfire Faire / Bombard Backlash",
    "spl103": "Seasonal placeholder",
}


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


def unescape_sql(value: str) -> str:
    return value.replace("\\'", "'").replace("\\\\", "\\")


def parse_sql_values(payload: str) -> list[str]:
    reader = csv.reader([payload], delimiter=",", quotechar="'", escapechar="\\")
    return next(reader)


def read_items() -> dict[int, dict[str, object]]:
    items: dict[int, dict[str, object]] = {}
    for line in read_text(ITEM_SQL).splitlines():
        if "INSERT INTO `gamedata_items` VALUES" not in line:
            continue
        match = INSERT_VALUES_RE.search(line)
        if not match:
            continue
        values = parse_sql_values(match.group(1))
        item_id = int(values[0])
        items[item_id] = {
            "item_id": item_id,
            "name": unescape_sql(values[1]),
            "category": values[2],
            "max_stack": int(values[3]),
            "is_rare": int(values[4]),
            "is_exclusive": int(values[5]),
            "sell_price": int(values[7]),
            "icon": int(values[8]),
            "kind": int(values[9]),
            "rarity": int(values[10]),
            "is_usable": int(values[11]),
            "level": int(values[15]),
            "compatibility": int(values[16]),
        }
    return items


def read_spl_quests() -> dict[int, dict[str, str]]:
    quests: dict[int, dict[str, str]] = {}
    for line in read_text(QUEST_SQL).splitlines():
        match = QUEST_RE.search(line)
        if not match:
            continue
        quest_id = int(match.group(1))
        title = unescape_sql(match.group(2))
        code = match.group(3)
        if code.lower().startswith("spl"):
            quests[quest_id] = {"quest_id": str(quest_id), "title": title, "code": code}
    return quests


def read_quest_rewards(spl_quests: dict[int, dict[str, str]]) -> dict[int, list[str]]:
    rewards: dict[int, list[str]] = defaultdict(list)
    for match in QUEST_REWARD_RE.finditer(read_text(QUEST_REWARD_SQL)):
        quest_id = int(match.group(1))
        if quest_id not in spl_quests:
            continue
        reward_type = match.group(3)
        reward_id = int(match.group(4))
        quantity = int(match.group(5))
        source = match.group(7)
        code = spl_quests[quest_id]["code"]
        title = spl_quests[quest_id]["title"]
        rewards[reward_id].append(f"{code}/{quest_id} {title} {reward_type} x{quantity} source={source}")
    return rewards


def item_ids_in_file(path: Path, known_items: set[int]) -> set[int]:
    body = read_text(path)
    return {int(match.group(1)) for match in INT_RE.finditer(body) if int(match.group(1)) in known_items}


def collect_file_refs(known_items: set[int]) -> dict[int, list[str]]:
    refs: dict[int, list[str]] = defaultdict(list)
    for base, source_label in ((RECOVERED_SPL, "recovered-spl"), (LOCAL_SPL, "local-spl")):
        if not base.exists():
            continue
        for path in sorted(base.glob("*.lua")):
            code = path.stem.lower()
            event = EVENT_BY_CODE.get(code, "seasonal")
            for item_id in sorted(item_ids_in_file(path, known_items)):
                refs[item_id].append(f"{source_label}:{path.as_posix()}:{event}")

    for path in LOCAL_EVENT_SCRIPTS:
        for item_id in sorted(item_ids_in_file(path, known_items)):
            refs[item_id].append(f"local-event:{path.as_posix()}")
    return refs


def patch_seasonal_names() -> list[str]:
    names: list[str] = []
    for line in read_text(PATCH_122).splitlines():
        if PATCH_SEASONAL_PREFIX not in line:
            continue
        payload = line.split(PATCH_SEASONAL_PREFIX, 1)[1]
        names.extend(name.strip() for name in payload.split("/") if name.strip())
    return names


def names_to_ids(items: dict[int, dict[str, object]], names: list[str]) -> dict[str, int]:
    by_name = {str(row["name"]).lower(): item_id for item_id, row in items.items()}
    resolved: dict[str, int] = {}
    for name in names:
        item_id = by_name.get(name.lower())
        if item_id is not None:
            resolved[name] = item_id
    return resolved


def achievement_refs(items: dict[int, dict[str, object]], candidate_ids: set[int]) -> dict[int, list[str]]:
    body = read_text(ACHIEVEMENT_TEXT)
    refs: dict[int, list[str]] = defaultdict(list)
    for item_id in candidate_ids:
        name = str(items[item_id]["name"])
        if name and name in body:
            refs[item_id].append("achievement-text")
    return refs


def infer_event(item_id: int, name: str, refs: list[str]) -> str:
    lowered = name.lower()
    joined_refs = " ".join(refs).lower()
    if "valentione" in joined_refs or "paramour" in lowered or "eternal passion" in lowered:
        return "Valentione's Day"
    if "princess" in lowered or "peach blossom" in lowered:
        return "Princess Day / Little Ladies' Day"
    if "dreamer" in joined_refs or "hatching" in joined_refs or "archon egg" in lowered or "egg cap" in lowered or "egg ring" in lowered or lowered in {"motley egg", "odd egg"}:
        return "Hatching-tide / Dreamer"
    if "bombard" in joined_refs or "moonfire" in joined_refs or "summer " in lowered or "bombard" in lowered or "sparkler" in lowered:
        return "Moonfire Faire / Bombard"
    if "pumpkin" in lowered or "all saints" in joined_refs:
        return "All Saints' Wake"
    if "reindeer" in lowered or "starlight" in lowered or "starlight" in joined_refs or "winter is not coming" in joined_refs:
        return "Starlight Celebration"
    if "kabuto" in lowered or "heavensturn" in joined_refs or "gone with the snow" in joined_refs:
        return "Heavensturn"
    if "foundation" in joined_refs or "tracer" in lowered or "maelstrom" in lowered or "twin adder" in lowered or "immortal flames" in lowered:
        return "Foundation Day / city-state"
    if "over-aspected" in lowered or "deaspected" in lowered:
        return "Seventh Umbral / Atomos-adjacent event"
    if "patriot" in lowered or "moonlet" in lowered:
        return "seasonal armoire / event-adjacent"
    if "magicked prism" in lowered:
        return "celebration prism / event-adjacent"
    return "seasonal/event candidate"


def infer_unlock_state(sources: set[str], refs: list[str], quest_rewards: list[str], name: str) -> str:
    joined_refs = " ".join(refs).lower()
    lowered = name.lower()
    if quest_rewards and "spl0i4" in " ".join(quest_rewards).lower():
        return "implemented_but_duplicate_reward_risk"
    if quest_rewards and "spl0i3" in " ".join(quest_rewards).lower():
        return "auto_reward_present_keep_ask_only"
    if "local-event" in sources:
        return "city_state_event_or_shop_present_gated"
    if "local-spl" in sources and ("archon egg" in lowered or "egg cap" in lowered):
        return "implemented_gated_by_seasonal_flag"
    if "local-spl" in sources and ("recovered-spl" in sources or quest_rewards):
        if "dreamer" in joined_refs:
            return "implemented_gated_by_seasonal_flag"
        return "bridge_present_gated_by_seasonal_flag"
    if "recovered-spl" in sources and any(code in joined_refs for code in ("spl0i1", "spl0i2", "spl102")):
        return "recovered_widget_needs_probe"
    if "recovered-spl" in sources and "rewardselectwidget" not in joined_refs:
        return "recovered_dialogue_or_display_only"
    if "recovered-spl" in sources:
        return "recovered_widget_needs_probe"
    if "patch-armoire" in sources:
        return "item_data_present_storage_confirmed_no_flow"
    if any(term in lowered for term in ("over-aspected", "deaspected")):
        return "event_exchange_item_present_cost_logic_unproven"
    return "item_data_only"


def source_tags(refs: list[str], quest_rewards: list[str], patch_ids: set[int], achievement_ids: set[int], item_id: int) -> set[str]:
    tags: set[str] = set()
    for ref in refs:
        if ref.startswith("recovered-spl:"):
            tags.add("recovered-spl")
        elif ref.startswith("local-spl:"):
            tags.add("local-spl")
        elif ref.startswith("local-event:"):
            tags.add("local-event")
    if quest_rewards:
        tags.add("quest-reward")
    if item_id in patch_ids:
        tags.add("patch-armoire")
    if item_id in achievement_ids:
        tags.add("achievement-text")
    return tags


def build_rows() -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    items = read_items()
    known_items = set(items)
    spl_quests = read_spl_quests()
    quest_rewards = read_quest_rewards(spl_quests)
    refs = collect_file_refs(known_items)

    patch_names = patch_seasonal_names()
    patch_name_ids = names_to_ids(items, patch_names)
    patch_ids = set(patch_name_ids.values())

    hint_name_ids = names_to_ids(items, list(NAME_HINTS))
    spl_ref_ids = {
        item_id
        for item_id, item_refs in refs.items()
        if any(ref.startswith(("recovered-spl:", "local-spl:")) for ref in item_refs)
    }
    candidate_ids = spl_ref_ids | set(quest_rewards) | patch_ids | set(hint_name_ids.values())
    achievement = achievement_refs(items, candidate_ids)
    achievement_ids = set(achievement)

    # Include whole known seasonal clusters once any member is proven by recovered scripts or patch notes.
    for item_id, row in items.items():
        name = str(row["name"])
        if item_id in candidate_ids:
            continue
        if 10012001 <= item_id <= 10012028:
            candidate_ids.add(item_id)
        elif 3020601 <= item_id <= 3020616:
            candidate_ids.add(item_id)
        elif 8012601 <= item_id <= 8012607:
            candidate_ids.add(item_id)
        elif 8032401 <= item_id <= 8032410:
            candidate_ids.add(item_id)
        elif 8051301 <= item_id <= 8051310:
            candidate_ids.add(item_id)
        elif 9050058 <= item_id <= 9050062:
            candidate_ids.add(item_id)
        elif name in {"Patriot's Bracelet", "Patriot's Choker"}:
            candidate_ids.add(item_id)

    rows: list[dict[str, object]] = []
    for item_id in sorted(candidate_ids):
        if item_id not in items:
            continue
        item = items[item_id]
        item_refs = refs.get(item_id, [])
        reward_refs = quest_rewards.get(item_id, [])
        achievement_refs_for_item = achievement.get(item_id, [])
        tags = source_tags(item_refs, reward_refs, patch_ids, achievement_ids, item_id)
        if not tags:
            tags.add("name-or-cluster")
        evidence = []
        if item_id in patch_ids:
            evidence.append("Patch_1.22 seasonal armoire list")
        evidence.extend(reward_refs)
        evidence.extend(achievement_refs_for_item)
        evidence.extend(item_refs)
        row = {
            "item_id": item_id,
            "name": item["name"],
            "event_bucket": infer_event(item_id, str(item["name"]), evidence),
            "unlock_state": infer_unlock_state(tags, item_refs, reward_refs, str(item["name"])),
            "source_tags": ";".join(sorted(tags)),
            "category": item["category"],
            "max_stack": item["max_stack"],
            "is_rare": item["is_rare"],
            "is_exclusive": item["is_exclusive"],
            "is_usable": item["is_usable"],
            "level": item["level"],
            "kind": item["kind"],
            "icon": item["icon"],
            "evidence": " | ".join(evidence),
        }
        rows.append(row)

    quest_rows: list[dict[str, object]] = []
    for quest_id, quest in sorted(spl_quests.items()):
        code = quest["code"]
        recovered_path = RECOVERED_SPL / f"{code.lower()}.lua"
        local_path = LOCAL_SPL / f"{code.lower()}.lua"
        related_items = [
            row["item_id"]
            for row in rows
            if code.lower() in str(row["evidence"]).lower() or str(quest_id) in str(row["evidence"])
        ]
        quest_rows.append(
            {
                "quest_id": quest_id,
                "code": code,
                "title": quest["title"],
                "event_bucket": EVENT_BY_CODE.get(code.lower(), "seasonal"),
                "recovered_script": str(recovered_path) if recovered_path.exists() else "",
                "local_script": str(local_path) if local_path.exists() else "",
                "related_item_ids": ";".join(str(item_id) for item_id in sorted(set(related_items))),
            }
        )
    return rows, quest_rows


def write_csv(path: Path, rows: list[dict[str, object]], fieldnames: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fieldnames})


def write_doc(path: Path, rows: list[dict[str, object]], quest_rows: list[dict[str, object]], output: Path) -> None:
    by_state = defaultdict(int)
    by_bucket = defaultdict(int)
    for row in rows:
        by_state[str(row["unlock_state"])] += 1
        by_bucket[str(row["event_bucket"])] += 1

    def names_for(state: str, limit: int = 16) -> str:
        names = [f"{row['item_id']} {row['name']}" for row in rows if row["unlock_state"] == state]
        return ", ".join(names[:limit]) + (" ..." if len(names) > limit else "")

    lines = [
        "# Seasonal Item Decomp Atlas - 2026-07-03",
        "",
        f"Generated: {datetime.utcnow().isoformat(timespec='seconds')}Z",
        "",
        "## Inputs",
        "",
        f"- Item SQL: `{ITEM_SQL}`",
        f"- Seasonal quest SQL: `{QUEST_SQL}` / `{QUEST_REWARD_SQL}`",
        f"- Recovered spl scripts: `{RECOVERED_SPL}`",
        f"- Local seasonal scripts: `{LOCAL_SPL}`",
        f"- Patch storage list: `{PATCH_122}`",
        "",
        "## Summary",
        "",
        f"- Seasonal/event item candidates inventoried: {len(rows)}",
        f"- Seasonal quest rows inventoried: {len(quest_rows)}",
        "- Unlock-state counts: "
        + ", ".join(f"{state}={count}" for state, count in sorted(by_state.items())),
        "- Event bucket counts: "
        + ", ".join(f"{bucket}={count}" for bucket, count in sorted(by_bucket.items())),
        "",
        "## Readout",
        "",
        "- The city-state feeling is mostly Foundation Day: `Spl000`, `PopulaceSpecialEventCryer`, `PopulaceCompanyShop`, and city default scripts carry the GC/static-event surface.",
        "- The normal seasonal quest lane is still the `spl` bucket: Dreamer/Hatching-tide, Moonfire/Bombard, All Saints, Starlight, Heavensturn, and Scrambled Eggs.",
        "- A lot of the gear is already in `gamedata_items`; visibility and mutation safety are separate. Broadly enabling `seasonal_quests_enabled` will expose only actors/scripts that also have spawn/bind rows.",
        "- Reward widgets for `spl0i1`, `spl0i2`, and `spl102` are still selector-probe work. Do not grant/remove items from those until return codes, costs, inventory-full, uniqueness, and cancel paths are logged.",
        "- `spl0i3` and `spl0i4` are completion-risky: local quest completion/reward paths can auto-grant Reindeer/Dragon Kabuto items.",
        "",
        "## Safer / Riskier Buckets",
        "",
        f"- Implemented and gated: {names_for('implemented_gated_by_seasonal_flag')}",
        f"- Bridge/display only or needs probe: {names_for('recovered_widget_needs_probe')} {names_for('recovered_dialogue_or_display_only')}",
        f"- Storage/data confirmed but no local flow: {names_for('item_data_present_storage_confirmed_no_flow')}",
        f"- City-state event/shop present: {names_for('city_state_event_or_shop_present_gated')}",
        "",
        "## Output Files",
        "",
        f"- `{output / 'seasonal_item_atlas.csv'}`",
        f"- `{output / 'seasonal_quest_item_surface.csv'}`",
        "",
        "## Notes",
        "",
        "- `source_tags` tells why a row is included: recovered script, local script, local event/shop script, quest reward, patch armoire list, achievement text, or name/cluster evidence.",
        "- `unlock_state` is an implementation-safety label, not a retail availability claim.",
        "- Items included only by name/cluster are useful leads, but they need spawn/script/shop evidence before being treated as active event rewards.",
    ]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    rows, quest_rows = build_rows()
    item_fields = [
        "item_id",
        "name",
        "event_bucket",
        "unlock_state",
        "source_tags",
        "category",
        "max_stack",
        "is_rare",
        "is_exclusive",
        "is_usable",
        "level",
        "kind",
        "icon",
        "evidence",
    ]
    quest_fields = [
        "quest_id",
        "code",
        "title",
        "event_bucket",
        "recovered_script",
        "local_script",
        "related_item_ids",
    ]
    write_csv(args.output / "seasonal_item_atlas.csv", rows, item_fields)
    write_csv(args.output / "seasonal_quest_item_surface.csv", quest_rows, quest_fields)
    write_doc(args.doc, rows, quest_rows, args.output)
    print(f"Wrote {len(rows)} item rows and {len(quest_rows)} quest rows.")
    print(args.output / "seasonal_item_atlas.csv")
    print(args.doc)


if __name__ == "__main__":
    main()
