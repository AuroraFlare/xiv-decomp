"""Bytecode-backed MSQ contracts and companion payload regressions."""
import re
import unittest

from build_msq_30_46_bytecode_decomp import (
    ROOT, RECOVERED, QUESTS, methods_for, trace_event, SCENE_APIS,
)
from build_gc_mission_decomp import read_chunk
from disassemble_lua51 import direct_method_map, OPNAMES


class MsqBytecodeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.methods = {code: methods_for(code) for code in QUESTS}

    def event(self, code, method, args=("Companion", 123, 1, 456, 3), choice=1, scene_result=1):
        return trace_event(self.methods[code][method], args, choice, scene_result)

    def scenes(self, result):
        return [c for c in result["calls"] if c["method"] in SCENE_APIS]

    def test_lord_errant_finale_requires_preconverted_class(self):
        proto = self.methods["man308"]["pE90"]
        self.assertEqual(proto.numparams, 8)
        self.assertNotIn("getSnpcActorClassID", proto.constants)
        for actor_value in (123, 1070123):
            result = self.event("man308", "pE90", ("Companion", actor_value, 1, 456, 3))
            self.assertEqual(self.scenes(result)[0]["args"],
                             ["man30900", 1, "Companion", actor_value, 1, 456, 3])
        server = (ROOT / "Data/scripts/quests/man/man308.lua").read_text(encoding="utf-8")
        self.assertIn('scenarioHelpers.delegateSnpcCutsceneEvent(player, quest, "pE90")', server)
        self.assertNotIn('scenarioHelpers.delegateSnpcEvent(player, quest, "pE90")', server)
        helper = (ROOT / "Data/scripts/scenario_decomp_helpers.lua").read_text(encoding="utf-8")
        body = helper.split("function helpers.delegateSnpcCutsceneEvent(", 1)[1].split("\nend", 1)[0]
        self.assertIn("getSnpcCutsceneArgListWithExtras", body)
        self.assertIn("return 1070000 + skinId;", helper)

    def test_client_actor_class_conversion_constant(self):
        methods = direct_method_map(read_chunk(RECOVERED / "luac/quest/questbaseclass_common.luac"))
        proto = methods["getSnpcActorClassID"]
        self.assertEqual(proto.constants, [1070000])
        self.assertEqual([OPNAMES[i.op] for i in proto.instructions], ["ADD", "RETURN", "RETURN"])
        self.assertEqual((proto.instructions[0].a, proto.instructions[0].b), (2, 1))

    def test_forever_taken_scene_precedes_fade_in_and_returns_saved_result(self):
        for result_value in (0, 1):
            result = self.event("man304", "pES", scene_result=result_value)
            self.assertEqual([c["method"] for c in result["calls"]], [
                "getSnpcActorClassID", "startFadeOutCutSceneDefault", "startFadeOutCutSceneDefault",
                "startSnpcNQCutScene", "startFadeInCutSceneDefault"])
            self.assertEqual(result["returns"], [result_value])

    def test_forever_taken_personality_bucket_and_fixed_arguments(self):
        for personality, bucket in enumerate((1, 1, 2, 2, 3, 3, 4, 5, 1), 1):
            result = self.event("man304", "pES", ("Companion", 123, personality, 456, 3))
            self.assertEqual(self.scenes(result)[0]["args"][-3:], [bucket, 5, 10])

    def test_man402_accept_uses_scene_result_and_decline_does_not_play_scene(self):
        for choice in (0, 1):
            for scene_result in (0, 1):
                result = self.event("man402", "pES", choice=choice, scene_result=scene_result)
                self.assertEqual(len(self.scenes(result)), choice)
                self.assertEqual(result["returns"], [scene_result if choice else 0])
                self.assertEqual(sum(c["method"] == "showQuestInfomation" for c in result["calls"]), 1)
                # Both bytecode branches RETURN before the trailing finish.
                self.assertFalse(any(c["method"] == "finishCliantTalkTurn" for c in result["calls"]))
                self.assertEqual(result["calls"][-1]["method"],
                                 "startFadeInCutSceneDefault" if choice else "say")

    def test_futures_perfect_accept_plays_once_with_result_specific_fade(self):
        for value in (0, 1):
            result = self.event("man406", "pES", scene_result=value)
            self.assertEqual(len(self.scenes(result)), 1)
            self.assertEqual(result["returns"], [value])
            self.assertEqual(result["calls"][-1]["method"],
                             "startFadeInCutSceneAfterWarp" if value else "startFadeInCutSceneDefault")

    def test_hq_scene_chains_keep_their_order(self):
        for code, method, args, expected in (
            ("man308", "pE50", ("Companion", 123, 1, 456, 3, True),
             [("startSnpcHQCutScene", "man40640"), ("startSnpcNQCutScene", "man30850")]),
            ("man406", "pE30", ("Companion", 123, 1, 456, 3),
             [("startSnpcNQCutScene", "man40630"), ("startSnpcHQCutScene", "man40635"),
              ("startNQCutScene", "man40645")]),
        ):
            result = self.event(code, method, args)
            self.assertEqual([(c["method"], c["args"][0]) for c in self.scenes(result)], expected)

    def test_duplicate_scene_arguments_are_real(self):
        result = self.event("man402", "pE10", ("Companion", 123, 1, 456, 3, 47))
        self.assertEqual(self.scenes(result)[0]["args"][-2:], [47, 47])
        result = self.event("man406", "pE50")
        self.assertEqual(self.scenes(result)[0]["args"][-2:], [3, 3])

    def test_toll_of_warden_after_warp_methods_are_included(self):
        actual = {name for name, proto in self.methods["man300"].items()
                  if "startFadeInCutSceneAfterWarp" in proto.constants}
        self.assertEqual(actual, {"processEvent000", "processEvent010", "pE20", "pE30", "pE50", "pE60"})
        for value in (None, False, 0, 1, True):
            result = self.event("man300", "pE30", ("Companion", 123, 1, 456, 3, value))
            self.assertEqual(result["calls"][-1]["method"], "startFadeInCutSceneDefault" if value is True
                             else "startFadeInCutSceneAfterWarp")
        result = self.event("man300", "pE50", ("Companion", 123, 1, 456, 3, 10))
        self.assertEqual(self.scenes(result)[0]["args"][-1], 10)

    def test_personality_rows_match_the_server_tables(self):
        helper = (ROOT / "Data/scripts/scenario_decomp_helpers.lua").read_text(encoding="utf-8")
        contracts = (("MAN304_PE30_PERSONALITY_ROWS", "man304", "pE30"),
                     ("MAN308_PES_OPENING_ROWS", "man308", "pES"),
                     ("MAN308_ACCEPTED_ROWS", "man308", "pE00"),
                     ("MAN308_PE20_PERSONALITY_ROWS", "man308", "pE20"),
                     ("MAN406_PE01_PERSONALITY_ROWS", "man406", "pE01"),
                     ("MAN406_PE52_PERSONALITY_ROWS", "man406", "pE52"))
        for table, code, method in contracts:
            block = helper.split("local " + table + " = {", 1)[1].split("\n};", 1)[0]
            rows = {int(m[1]): [int(v) for v in re.findall(r"\d+", m[2])]
                    for m in re.finditer(r"\[(\d+)\]\s*=\s*([^\n]+)", block)}
            for personality in range(1, 10):
                result = self.event(code, method, ("Companion", 123, personality, 456, 3), choice=0)
                spoken = [int(c["args"][1]) for c in result["calls"] if c["method"] == "say"]
                self.assertEqual(spoken, rows[personality], (table, personality))


if __name__ == "__main__":
    unittest.main()
