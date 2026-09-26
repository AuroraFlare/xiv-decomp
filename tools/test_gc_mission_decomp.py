"""Regression checks against retail chunks, not regenerated decompiler text."""
import re
import unittest

from build_gc_mission_decomp import ROOT, RECOVERED, QUESTS, read_chunk, trace, lua_equal
from disassemble_lua51 import direct_method_map


class MissionBytecodeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.methods = {code: direct_method_map(read_chunk(
            RECOVERED / f"luac/quest/scenario/com/{code}.luac")) for code in QUESTS}

    def run_method(self, code, method, args=(), choice=1):
        return trace(self.methods[code][method], args, choice=choice)

    def test_lua_equality_does_not_coerce_booleans(self):
        self.assertFalse(lua_equal(True, 1))
        self.assertFalse(lua_equal(False, 0))
        self.assertTrue(lua_equal(1, 1.0))

    def test_prefight_fade_requires_boolean_true(self):
        for code, method in (("com0l1", "processEvent_020"), ("com0g1", "processEventUrianger"),
                             ("com0u1", "processEvent_020")):
            for flag in (None, 0, 1, False, True):
                with self.subTest(code=code, flag=repr(flag)):
                    result = self.run_method(code, method, (flag,))
                    fades = [c["method"] for c in result["calls"] if c["method"].startswith("startFadeIn")]
                    self.assertEqual(fades, ["startFadeInCutSceneDefault" if flag is True
                                              else "startFadeInCutSceneAfterWarp"])

    def test_postfight_payload_is_forwarded_verbatim(self):
        for code, method, scene in (("com0l1", "processEvent_030", "COM0l110"),
                                     ("com0g1", "processEventUriangerMore", "COM0G110"),
                                     ("com0u1", "processEvent_030", "COM0U110")):
            result = self.run_method(code, method, (731,))
            scenes = [c["args"] for c in result["calls"] if c["method"] == "startNQCutScene"]
            self.assertEqual(scenes, [[scene, 1, 0, 731]])

    def test_finale_numeric_flags(self):
        for code, method in (("com0l4", "processEvent_020"), ("com0u4", "processEvent_050")):
            for flag in (None, 0, 1, False, True):
                result = self.run_method(code, method, (flag,))
                self.assertEqual(any(c["method"] == "startNQCutScene" for c in result["calls"]),
                                 not lua_equal(flag, 1))
        for args in ((0, 0), (0, 1), (1, 0), (1, 1), (False, False), (None, None)):
            result = self.run_method("com0g4", "processEventClear", args)
            self.assertEqual(any(c["method"] == "startNQCutScene" for c in result["calls"]),
                             all(lua_equal(a, 0) for a in args))

    def test_dungeon_prompt_once_and_returns_original_choice(self):
        entries = (("com5l0", "processEvent_010_01", 43), ("com5g0", "processEvent_010_1", 28),
                   ("com5u0", "processEvent_010_01", 35), ("com5l1", "processEvent_030_1", 39),
                   ("com5g1", "processEvent_020_1", 38), ("com5u1", "processEvent_020_1", 37))
        for code, method, text_id in entries:
            for choice in (0, 1):
                with self.subTest(code=code, choice=choice):
                    result = self.run_method(code, method, choice=choice)
                    asks = [c for c in result["calls"] if c["method"] == "ask"]
                    self.assertEqual(len(asks), 1)
                    self.assertEqual(asks[0]["args"][1:], [text_id, 2])
                    self.assertEqual(result["returns"], [choice])
                    finished = any(c["method"] == "finishCliantTalkTurn" for c in result["calls"])
                    self.assertEqual(finished, choice != 1)

    def test_accept_widgets_are_not_duplicated_by_decompiler_return(self):
        for code, methods in self.methods.items():
            for name, proto in methods.items():
                if name.startswith("processEvent") and "showQuestInfomation" in proto.constants:
                    for choice in (0, 1):
                        result = trace(proto, (0,) * (proto.numparams - 3), choice=choice)
                        self.assertEqual(sum(c["method"] == "showQuestInfomation" for c in result["calls"]), 1)
                        self.assertEqual(result["returns"], [choice])

    def test_totorak_minutes_reach_the_correct_text_slot(self):
        entry = (ROOT / "Data/scripts/totorak_entry.lua").read_text(encoding="utf-8")
        minutes = int(re.search(r"TOTORAK_ENTRY_DURATION_MINUTES\s*=\s*(\d+)", entry)[1])
        self.assertEqual(minutes, 60)
        helper = (ROOT / "Data/scripts/quests/com/totorak_gc_quest.lua").read_text(encoding="utf-8")
        self.assertIn("config.entryEvent, TOTORAK_ENTRY_DURATION_MINUTES)", helper)
        self.assertIn("config.entryEvent, 0, TOTORAK_ENTRY_DURATION_MINUTES)", helper)
        for code, args, row in (("com5l0", (0, minutes), 37), ("com5g0", (minutes,), 22),
                                ("com5u0", (minutes,), 29)):
            result = self.run_method(code, "processEvent_010", args)
            calls = [c for c in result["calls"] if c["owner"] == "worldMaster"
                     and c["method"] == "say" and c["args"][1] == row]
            self.assertEqual(len(calls), 1)
            self.assertEqual(calls[0]["args"][3:], [minutes])

    def test_battle_directors_have_no_hidden_closures(self):
        for city in "lgu":
            for number in (1, 4):
                root = read_chunk(RECOVERED / (
                    f"luac/director/quest/simplequestbattle/questdirectorcom0{city}{number}01.luac"))
                self.assertEqual(root.children, [])
                self.assertEqual(direct_method_map(root), {})


if __name__ == "__main__":
    unittest.main()
