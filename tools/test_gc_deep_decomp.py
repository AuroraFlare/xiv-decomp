"""Semantic regressions for the expanded GC recovery, never game execution."""
import copy
import json
import unittest

from build_gc_deep_decomp import OUTPUT, RECOVERED, quest_rows, pure_helper_returns, read_chunk, dialogue_reference
from build_job_gc_decomp import compare, trace_method as historical_trace
from disassemble_lua51 import direct_method_map, Instruction, OPNAMES
from gc_deep_symbolic import trace_method, lua_truth, TypeOf, Symbol, constrain


def method(code, name):
    return direct_method_map(read_chunk(RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"))[name]


def matches(variant, bindings):
    def value(v):
        if isinstance(v, dict) and "symbol" in v:
            return bindings.get(v["symbol"], 1)
        return v
    for condition in variant["conditions"]:
        actual = (lua_truth(value(condition["left"])) if condition["op"] == "TRUTHY"
                  else compare(condition["op"], value(condition["left"]), value(condition["right"])))
        if actual != condition["result"]:
            return False
    return True


class ExpandedGCRecovery(unittest.TestCase):
    def test_dialogue_owner_and_row_follow_api_signature(self):
        cases = [("com5g0", "processEvent_020", "sayFreeDisplayName", "com5g0", {33, 40}),
                 ("com0l5", "processEventExit", "ask", "worldMaster", {51036}),
                 ("gcg102", "processEventPfrymloefNQF", "ask", "worldMaster", {51030}),
                 ("noc001", "eventQuestAskExArea", "askMultipleTextMacro", "noc001", {41})]
        for code, name, api, sheet, expected in cases:
            record = trace_method(method(code, name))
            references = {dialogue_reference(c, code) for v in record["variants"] for c in v["calls"] if c["method"] == api}
            self.assertEqual({(sheet, row) for row in expected}, references)

    def test_scope_includes_internal_and_adjacent_quest_without_mixing_counts(self):
        rows = quest_rows()
        core = [r for r in rows if r["scope"] == "core"]
        self.assertEqual(102, len(core))
        self.assertEqual(69, sum(r["title"] != "[en]" for r in core))
        self.assertEqual(["noc001"], [r["code"] for r in rows if r["scope"] == "auxiliary"])

    def test_truthiness_keeps_zero_and_empty_string_true(self):
        for value in (0, 1, "", "false", True):
            self.assertTrue(lua_truth(value))
        self.assertFalse(lua_truth(False))
        self.assertFalse(lua_truth(None))

    def test_scalar_helper_recovers_all_nine_remaps_only_for_literal_true(self):
        proto = method("gcl107", "getTextIdStewart")
        mapping = {164: 321, 165: 322, 169: 326, 170: 327, 171: 328,
                   172: 329, 175: 330, 178: 332, 179: 333}
        for original, replacement in mapping.items():
            for flag in (True, False, None, 0, 1):
                self.assertEqual([replacement if flag is True else original], pure_helper_returns(proto, [original, flag]))
        self.assertEqual([177], pure_helper_returns(proto, [177, True]))

    def test_helper_parameters_are_scalars_instead_of_player_objects(self):
        record = trace_method(method("gcl107", "getTextIdStewart"), event_parameters=False)
        self.assertFalse(record["uncovered_feasible_instructions"])
        self.assertFalse(record["uncovered_branch_edges"])
        self.assertEqual(11, len(record["variants"]))

    def test_stewart_menu_three_and_cancel_exit_with_original_choice(self):
        record = trace_method(method("gcl107", "processEventStewart"))
        for choice in (3, -3):
            paths = [v for v in record["variants"] if matches(v, {"call37.1.return1": choice, "arg5": False})]
            self.assertEqual(1, len(paths))
            self.assertEqual("return", paths[0]["terminal"]["kind"])
            self.assertEqual([{"symbol": "call37.1.return1"}], paths[0]["terminal"]["values"])
            self.assertEqual("finishCliantTalkTurn", paths[0]["calls"][-1]["method"])

    def test_stewart_menu_two_repeats_but_one_exits(self):
        record = trace_method(method("gcl107", "processEventStewart"))
        paths = [v for v in record["variants"] if matches(v, {"call37.1.return1": 2, "call37.2.return1": 2, "arg5": False})]
        self.assertTrue(paths)
        self.assertTrue(all(v["terminal"]["kind"] == "loop" for v in paths))
        once = [v for v in record["variants"] if matches(v, {"call37.1.return1": 1, "arg5": False})]
        self.assertEqual(1, len(once))
        self.assertEqual("return", once[0]["terminal"]["kind"])
        self.assertFalse(record["uncovered_branch_edges"])
        self.assertFalse(record["uncovered_feasible_instructions"])

    def test_prior_core_contracts_keep_identical_paths(self):
        for code, name in (("com0l7", "processEventGuincamStart"), ("gcl101", "processEvent_070"),
                           ("com0g4", "processEventClear")):
            proto = method(code, name)
            self.assertEqual(historical_trace(proto)["variants"], trace_method(proto)["variants"])

    def test_type_nil_guard_preserves_menu_result_identity(self):
        state = {"domains": {}}
        value = Symbol("menu")
        self.assertTrue(constrain(state, "EQ", TypeOf(value), "nil", True, (None, False, 0, 1, "")))
        self.assertEqual([None], list(state["domains"]["menu"]))
        self.assertFalse(constrain(state, "EQ", value, 1, True, (None, False, 0, 1, "")))

    def test_rank_strict_less_than_preserves_boundary(self):
        for rank, expected in ((16, True), (17, False), (18, False)):
            self.assertEqual(expected, constrain({"domains": {}}, "LT", rank, 17, True, (rank,)))

    def test_auxiliary_service_methods_trace_without_unsupported_instructions(self):
        methods = direct_method_map(read_chunk(RECOVERED / "luac/quest/scenario/noc/noc001.luac"))
        for name, proto in methods.items():
            if name == "initText":
                continue
            record = trace_method(proto)
            self.assertFalse(record["uncovered_feasible_instructions"], name)

    def test_unknown_opcode_still_fails_closed(self):
        proto = copy.deepcopy(method("gcl107", "getTextIdStewart"))
        first = proto.instructions[0]
        proto.instructions[0] = Instruction((first.raw & ~63) | OPNAMES.index("ADD"), first.offset)
        with self.assertRaisesRegex(ValueError, "Unsupported ADD"):
            trace_method(proto, event_parameters=False)

    def test_every_core_source_method_and_instruction_is_accounted_for(self):
        total = 0
        for row in quest_rows():
            if row["scope"] != "core":
                continue
            code = row["code"]
            recovered = json.loads((OUTPUT / f"quests/{code}.json").read_text(encoding="utf-8"))
            methods = direct_method_map(read_chunk(RECOVERED / f"luac/quest/scenario/{code[:3]}/{code}.luac"))
            self.assertEqual(set(methods) - {"initText"}, set(recovered["methods"]), code)
            for name, record in recovered["methods"].items():
                self.assertEqual("traced", record["status"], (code, name))
                self.assertFalse(record["uncovered_feasible_instructions"], (code, name))
                self.assertFalse(record["uncovered_branch_edges"], (code, name))
                self.assertEqual(len(methods[name].instructions), record["instruction_count"])
                total += 1
        self.assertEqual(695, total)


if __name__ == "__main__":
    unittest.main()
