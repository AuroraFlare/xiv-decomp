#!/usr/bin/env python3
"""Semantic regression checks for bytecode branches and typed scene decoding."""
import copy
import csv
import json
import unittest

from build_job_gc_decomp import (
    CLIENT, OUTPUT, QUESTS, RECOVERED, compare, read_chunk, trace_method,
)
from decompile_job_gc_scene_timeline import parse_timeline
from disassemble_lua51 import direct_method_map, Instruction, OPNAMES


def method(code, name):
    return direct_method_map(read_chunk(RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"))[name]


def matching_paths(record, values):
    result = []
    for path in record["variants"]:
        def value(item):
            if isinstance(item, dict) and "symbol" in item:
                return values[item["symbol"]]
            return item
        try:
            matches = all(compare(c["op"], value(c["left"]), value(c["right"])) == c["result"]
                          for c in path["conditions"])
        except (KeyError, TypeError):
            continue
        if matches:
            result.append(path)
    return result


class ScenarioContracts(unittest.TestCase):
    def test_lua_boolean_number_and_nil_identity(self):
        self.assertFalse(compare("EQ", True, 1))
        self.assertFalse(compare("EQ", False, 0))
        self.assertFalse(compare("EQ", None, False))
        self.assertTrue(compare("EQ", 1, 1.0))

    def test_monk_finale_boolean_selects_default_fade(self):
        record = trace_method(method("mnk0j6", "processEvent005"))
        for value in (True, False, 1, 0, None):
            paths = matching_paths(record, {"arg4": value})
            self.assertEqual(1, len(paths))
            fades = [c["method"] for c in paths[0]["calls"] if c["method"].startswith("startFadeIn")]
            expected = "startFadeInCutSceneDefault" if value is True else "startFadeInCutSceneAfterWarp"
            self.assertEqual([expected], fades)

    def test_warrior_scene_keeps_passthrough_argument(self):
        record = trace_method(method("war0j3", "processEvent005"))
        scene = next(c for c in record["variants"][0]["calls"] if c["method"] == "startNQCutScene")
        self.assertEqual(["war0j310", 1.0, 0.0, {"symbol": "arg4"}], scene["args"])

    def test_two_black_mage_decisions_are_independent(self):
        record = trace_method(method("blm0j4", "processEventDOZOLMELOCStart"))
        self.assertEqual(4, len(record["variants"]))
        for path in record["variants"]:
            decisions = [c for c in path["calls"] if c["method"] in ("ask", "showQuestInfomation")]
            self.assertEqual(["ask", "showQuestInfomation"], [c["method"] for c in decisions])
            self.assertNotEqual(decisions[0]["returns"], decisions[1]["returns"])

    def test_gc_join_widget_is_one_call_with_two_results(self):
        record = trace_method(method("com0l7", "processEventGuincamStart"))
        calls = [c for p in record["variants"] for c in p["calls"] if c["method"] == "askEventModeWidgetYield"]
        self.assertTrue(calls)
        self.assertTrue(all(len(c["returns"]) == 2 for c in calls))
        for path in record["variants"]:
            self.assertLessEqual(sum(c["method"] == "askEventModeWidgetYield" for c in path["calls"]), 1)
        self.assertGreater(record["loop_templates"], 0)
        self.assertFalse(record["uncovered_branch_edges"])

    def test_gc_ordering_threshold_is_numeric_and_inclusive(self):
        record = trace_method(method("gcl101", "processEvent_070"))
        for level, expected in ((44, False), (45, True), (46, True)):
            paths = matching_paths(record, {"arg4": 1, "arg5": level})
            self.assertEqual(1, len(paths))
            rows = [c["args"][1] for c in paths[0]["calls"] if c["method"] == "say"]
            self.assertEqual(expected, 94 in rows)
            self.assertEqual(not expected, 92 in rows)
        self.assertFalse(matching_paths(record, {"arg4": 1, "arg5": None}))

    def test_empty_city_scenarios_do_not_inherit_limsa_methods(self):
        for code in ("gcg101", "gcu101"):
            methods = direct_method_map(read_chunk(RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"))
            self.assertEqual(["initText"], list(methods))

    def test_unknown_opcode_stops_instead_of_fabricating_calls(self):
        proto = copy.deepcopy(method("war0j3", "processEvent005"))
        first = proto.instructions[0]
        proto.instructions[0] = Instruction((first.raw & ~63) | OPNAMES.index("ADD"), first.offset)
        with self.assertRaisesRegex(ValueError, "Unsupported ADD"):
            trace_method(proto)

    def test_requested_scope_and_all_reachable_instructions(self):
        self.assertEqual(87, len(QUESTS))
        with (OUTPUT / "method-inventory.csv").open(encoding="utf-8") as stream:
            inventory = list(csv.DictReader(stream))
        self.assertEqual(880, len(inventory))
        self.assertEqual(646, sum(int(r["branch_edges"]) for r in inventory))
        self.assertEqual(0, sum(int(r["uncovered_branch_edges"]) for r in inventory))
        self.assertEqual(0, sum(int(r["uncovered_reachable_instructions"]) for r in inventory))
        self.assertEqual(221, sum(int(r["structurally_unreachable_instructions"]) for r in inventory))


@unittest.skipUnless(CLIENT.is_dir(), "Installed client required for scene-source regression")
class SceneContracts(unittest.TestCase):
    @staticmethod
    def scene(name):
        return parse_timeline((CLIENT / "client/cut" / name / name).read_bytes())

    def test_same_size_control_records_are_not_positions(self):
        for scene, offset in (("pld0j620", 0x1D2A4), ("pld0j520", 0x6C588)):
            clip = next(c for c in self.scene(scene)["clips"] if c["offset"] == offset)
            self.assertEqual(0x40, clip["size"])
            self.assertNotEqual("SetPosClip", clip["clip_class"])
            self.assertIsNone(clip["position"])
            self.assertIsNone(clip["rotation"])

    def test_header_named_initial_block_decodes(self):
        scene = self.scene("com0g610")
        header = next(b for b in scene["blocks"] if b["label"] == "header")
        self.assertEqual(0xA6F70, header["offset"])
        clips = [c for c in scene["clips"] if c["block_ordinal"] == header["ordinal"]]
        self.assertEqual(header["entry_count"], len(clips))
        self.assertEqual(50, sum(c["clip_class"] == "SetPosClip" for c in clips))
        self.assertEqual(60, len(scene["actors"]))

    def test_duplicate_character_labels_survive_by_slot(self):
        scene = self.scene("com0g510")
        labels = [a for a in scene["actors"] if a["label"] == "SPIDER_CHILD_RA"]
        self.assertGreater(len(labels), 1)
        self.assertEqual(len(labels), len({a["index"] for a in labels}))

    def test_character_type_and_id_survive_scene_specific_registry(self):
        for name in ("pld0j110", "pld0j510", "blm0j620"):
            scene = self.scene(name)
            pc = next(a for a in scene["actors"] if a["label"] == "PC")
            self.assertEqual("ProxyActor", pc["kind_name"])
            self.assertEqual(0, pc["actor_class_id"])

    def test_all_scenes_parse_declared_blocks_and_clips(self):
        summary = json.loads((OUTPUT / "summary.json").read_text(encoding="utf-8"))
        self.assertEqual({"decoded": 51}, summary["scene_status"])
        self.assertEqual(967, summary["scene_blocks"])
        self.assertEqual(18517, summary["scene_clips"])
        self.assertEqual(768, summary["scene_actor_slots"])


if __name__ == "__main__":
    unittest.main()
