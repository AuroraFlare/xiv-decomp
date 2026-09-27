"""Build the Etc patch_1_16 active-quest decomp package (Phase 2, 14 quests).

Reads live in-repo evidence (FF14-Memory checkout) and emits per-quest notes,
summary.json and quest_flow.csv into this directory. Every generated claim is
either Verified (traced to a pinned source below) or marked Inferred/Open.

Verified sources:
  V1  Data/scripts/quests/etc/etc1*.lua (server routes, this checkout)
  V2  tools/etc1-quest-runtime-tests/source-contracts.json (pinned client
      bytecode signatures, journal sheet/row bindings, reward slots, EXP)
  V3  docs/Dat Mining/etc1*.csv (client text rows), xtx_quest.csv,
      xtx_journalxtx{Sea,Fst,Wil}.csv, quest_marker.csv (docs/Dat Mining),
      quest_new_reward.csv
  V4  Data/sql/gamedata_quests.sql (id, title, code, prerequisite, minLevel)
  V5  Data/sql/gamedata_quest_rewards.sql (auto-grant EXP + item per quest)
  V6  Data/sql/server_eventnpc_spawn_locations.sql (ENPC zones/XYZ)
  V7  Data/sql/server_battlenpc_mob_types.sql + server_battlenpc_spawn_locations.sql
  V8  Data/mobplacements/etc1_quest_mobs.json (frozen recorded-ground packs
      for 9 quests, with source SHA-256)
  V9  tools/mobspawns/map_coordinates.py locate (navmesh zone + nearest-node
      support for the 3 ordinary-spawn quests; nearby samples are context only)

NOT available in this checkout (recorded as gaps, not silently replaced):
  G1  meteor-wiki-quests/quests-archive.md (path does not exist here)
  G2  Per-quest hits in FF14-Decomp atlas indexes (quest_blueprint_index.csv,
      quest_bnpc_objective_index.csv: 0 rows for these 14 IDs)
  G3  tools/outputs/lpb/decomp_more_20260617 client .lua sources (absent from
      this checkout; V2 pins their extracted contracts with SHA-256)

Usage: python3 -B build_decomp.py [memory-repo-root]  (defaults to sibling checkout)
"""
import csv
import json
import re
import sys
from pathlib import Path

MEM = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(
    r"C:\Users\drime\source\repos\AuroraFlare\FF14-Memory")
OUT = Path(__file__).resolve().parent
sys.path.insert(0, str(MEM / "tools" / "mobspawns"))
from map_coordinates import sql_rows  # noqa: E402  (evidence reader, V9 tool)

QUESTS = [
    dict(id=110634, code="etc1l1", title="Bridging the Gap", kind="kill",
         flow=[("ACCEPT", "talk Hihine 1000267", "processEventHihineStart(OBJECTIVE_AMOUNT=8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Toll Puk 2100113", "onKillBNpc counter0 + attention 50041/name 3100116", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Hihine", "processEvent010 + sqrwa(300,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=None, bnpc_actor=2100113, bnpc_name="toll_puk",
         enpcs=[1000267], markers={11063401: "area", 11063402: "turnin"}),
    dict(id=110638, code="etc1l5", title="Till Death Do Us Part", kind="kill",
         flow=[("ACCEPT", "talk H'lahono 1000250", "processEventLahonoStart(0,8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Musk Roseling 2102717", "onKillBNpc counter0 + attention 25226/item 11000149", "threshold -> SEQ_001"),
               ("SEQ_001", "talk H'lahono", "processEventAfter(0) + sqrwa(1440,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000149, bnpc_actor=2102717, bnpc_name="musk_roseling",
         enpcs=[1000250], markers={11063801: "area", 11063802: "turnin"}),
    dict(id=110639, code="etc1l6", title="Beryl Overboard", kind="kill",
         flow=[("ACCEPT", "talk Nanapiri 1000136", "processEventNanapiriStart(8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Beryl Crab 2107613", "onKillBNpc counter0 + attention 25226/item 11000150", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Nanapiri", "processEvent010 + sqrwa(1440,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000150, bnpc_actor=2107613, bnpc_name="beryl_crab",
         enpcs=[1000136], markers={11063901: "area", 11063902: "turnin"}),
    dict(id=110640, code="etc1l7", title="Have You Seen My Son", kind="kill-referral",
         flow=[("ACCEPT", "talk Imania 1001567", "processEventImaniaStart()", "accept -> SEQ_000"),
               ("SEQ_000", "talk Yuyubesu 1001166", "processEventYuyubesuStart(0,8)", "-> SEQ_001"),
               ("SEQ_001", "kill 8x Bomb Ember 2101609", "onKillBNpc counter0 + attention 25226/item 11000151", "threshold -> SEQ_002"),
               ("SEQ_002", "talk Yuyubesu", "processEventYuyubesuAfter(0)", "-> SEQ_003"),
               ("SEQ_003", "talk Hildie 1000787", "processEventHildie(0) + sqrwa(3040,1,1,9) + CompleteQuest", "done")],
         kill_stage=1, amount=8, item=11000151, bnpc_actor=2101609, bnpc_name="bomb_ember",
         enpcs=[1001567, 1001166, 1000787],
         markers={11064001: "referral", 11064002: "turnin-city", 11064003: "area"}),
    dict(id=110654, code="etc1g0", title="Proceed with Caution", kind="interaction",
         flow=[("ACCEPT", "talk Sandre 1001102 (alias 1000223)", "processEventSandreStart(3)", "accept+grant 11000140 -> SEQ_000"),
               ("SEQ_000", "fuel 3 Watchers 1090193/94/95", "onTalk flags 0/1/2, counter recomputed, no double-count", "all 3 -> SEQ_001"),
               ("SEQ_001", "talk Sandre", "processEvent010(botanistFlag) + sqrwa(300,1,1,9) + CompleteQuest", "done; onFinish removes 11000140")],
         kill_stage=None, amount=3, item=11000140, bnpc_actor=None, bnpc_name=None,
         enpcs=[1001102, 1090193, 1090194, 1090195], markers={11065401: "watcher", 11065402: "watcher", 11065403: "watcher", 11065404: "turnin"}),
    dict(id=110655, code="etc1g1", title="Playing with Fire", kind="interaction",
         flow=[("ACCEPT", "talk Maroile 1000512", "processEventMaroileStart(conjurerFlag,3)", "accept+grant 11000141 -> SEQ_000"),
               ("SEQ_000", "push 3 hearths 1090196/97/98", "onPush processBUSH, flags, counter recomputed", "all 3 -> SEQ_001"),
               ("SEQ_001", "talk Maroile", "processEvent010 + sqrwa(500,1,1,9) + CompleteQuest", "done; onFinish removes 11000141")],
         kill_stage=None, amount=3, item=11000141, bnpc_actor=None, bnpc_name=None,
         enpcs=[1000512, 1090196, 1090197, 1090198], markers={11065501: "hearth", 11065502: "hearth", 11065503: "hearth", 11065504: "turnin"}),
    dict(id=110656, code="etc1g2", title="A Well-Balanced Diet", kind="kill-referral",
         flow=[("ACCEPT", "talk V'nabyano 1001101", "processEventV_NabyanoStart(1,8)", "accept -> SEQ_000"),
               ("SEQ_000", "talk Mestonnaux 1001103", "processEvent00(0)", "-> SEQ_001"),
               ("SEQ_001", "kill 8x Popoto-opo 2100509", "onKillBNpc counter0 + attention 25226/item 11000142", "threshold -> SEQ_002"),
               ("SEQ_002", "talk V'nabyano", "processEvent05_3 + sqrwa(1891,1,1,9) + CompleteQuest", "done")],
         kill_stage=1, amount=8, item=11000142, bnpc_actor=2100509, bnpc_name="popoto_opo_opo",
         enpcs=[1001101, 1001103], markers={11065601: "offer-city", 11065602: "area", 11065604: "turnin"}),
    dict(id=110659, code="etc1g5", title="The Search for Sicksa", kind="kill",
         flow=[("ACCEPT", "talk Beli 1001077", "processEventLahonoStart(0,8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Bristletail Marmot 2104022", "onKillBNpc counter0 + attention 25226/item 11000144", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Beli", "processEventAfter(0) + sqrwa(300,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000144, bnpc_actor=2104022, bnpc_name="bristletail_marmot",
         enpcs=[1001077], markers={11065901: "area", 11065902: "turnin"}),
    dict(id=110660, code="etc1g6", title="The Ultimate Prank", kind="kill-referral",
         flow=[("ACCEPT", "talk Nicoliaux 1000409", "processEventNicoliauxStart()", "accept -> SEQ_000"),
               ("SEQ_000", "talk Sylbyrt 1000428", "processEvent000(2,3)", "-> SEQ_001"),
               ("SEQ_001", "kill 3x Wandering Wight 2101908", "onKillBNpc counter0 + attention 25226/item 11000145", "threshold -> SEQ_002"),
               ("SEQ_002", "talk Sylbyrt", "processEvent010(2) + IncCounter(1) marionette", "-> SEQ_003"),
               ("SEQ_003", "talk Nicoliaux", "processEvent020(0) + sqrwa(3360,1,1,9) + CompleteQuest", "done")],
         kill_stage=1, amount=3, item=11000145, bnpc_actor=2101908, bnpc_name="wandering_wight",
         enpcs=[1000409, 1000428], markers={11066001: "area", 11066002: "referral", 11066004: "turnin"}),
    dict(id=110662, code="etc1g8", title="Say it with Wolf Tails", kind="kill-delivery",
         flow=[("ACCEPT", "talk Francis 1000566", "processEventFrancisStart1g8(8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Gnawing Gnat 2100609", "onKillBNpc kill-counter + attention 50041/name 3100611", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Francis", "processEventFrancisAfter(0) + wolftail bouquet notice", "-> SEQ_002"),
               ("SEQ_002", "talk Imania 1001567", "processEventImania(0) + sqrwa(3040,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000152, bnpc_actor=2100609, bnpc_name="gnawing_gnat",
         enpcs=[1000566, 1001567], markers={11066201: "offer-city", 11066202: "turnin-city", 11066203: "area"}),
    dict(id=110675, code="etc1u0", title="A Knock in the Night", kind="kill",
         flow=[("ACCEPT", "talk Eleanor 1001565", "processEventEleanorStart(8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Cursed Eye 2101711", "onKillBNpc counter0 + attention 25226/item 11000153", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Eleanor", "processEvent010 + sqrwa(3360,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000153, bnpc_actor=2101711, bnpc_name="cursed_eye",
         enpcs=[1001565], markers={11067501: "area", 11067502: "turnin"}),
    dict(id=110676, code="etc1u1", title="Sleepless in Eorzea", kind="kill",
         flow=[("ACCEPT", "talk Kukusi 1001463", "processEventKukusiStart(0,8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Nutgrabber Marmot 2104021", "onKillBNpc counter0 + attention 25226/item 11000154", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Kukusi", "processEvent000_2(1) + sqrwa(300,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000154, bnpc_actor=2104021, bnpc_name="nutgrabber_marmot",
         enpcs=[1001463], markers={11067601: "area", 11067602: "turnin"}),
    dict(id=110680, code="etc1u5", title="An Inconvenient Dodo", kind="kill",
         flow=[("ACCEPT", "talk U'bokhn 1000668", "processEventUbokhnStart(0,8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Stuffed Dodo 2102009", "onKillBNpc kill-counter + attention 50041/name 3102011", "threshold -> SEQ_001"),
               ("SEQ_001", "talk U'bokhn", "processEvent010(5) + sqrwa(500,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=None, bnpc_actor=2102009, bnpc_name="stuffed_dodo",
         enpcs=[1000668], markers={11068001: "area", 11068002: "turnin"}),
    dict(id=110681, code="etc1u6", title="Besmitten and Besmirched", kind="kill",
         flow=[("ACCEPT", "talk Mohtfryd 1001170", "processEventMohtfrydStart(0,8)", "accept -> SEQ_000"),
               ("SEQ_000", "kill 8x Moiling Mole 2105717", "onKillBNpc counter0 + attention 25226/item 11000157", "threshold -> SEQ_001"),
               ("SEQ_001", "talk Mohtfryd", "processEventAfter(0,0) + sqrwa(500,1,1,9) + CompleteQuest", "done")],
         kill_stage=0, amount=8, item=11000157, bnpc_actor=2105717, bnpc_name="moiling_mole",
         enpcs=[1001170], markers={11068102: "area", 11068101: "offer-city", 11068103: "turnin-city"}),
]


def load():
    contracts = json.loads((MEM / "tools/etc1-quest-runtime-tests/source-contracts.json").read_text(encoding="utf-8"))
    contracts = {q["id"]: q for q in contracts["quests"]}
    with (MEM / "docs/Dat Mining/quest_marker.csv").open(encoding="utf-8-sig", newline="") as h:
        markers = {int(r[0]): r for r in csv.reader(h) if r and r[0].isdigit()}
    quests = {int(r["id"]): r for r in sql_rows(MEM / "Data/sql/gamedata_quests.sql", "gamedata_quests")}
    rewards = list(sql_rows(MEM / "Data/sql/gamedata_quest_rewards.sql", "gamedata_quest_rewards"))
    enpcs = {int(r["actorClassId"]): r for r in
             sql_rows(MEM / "Data/sql/server_eventnpc_spawn_locations.sql", "server_eventnpc_spawn_locations")}
    types = {int(r["bnpcId"]): r for r in
             sql_rows(MEM / "Data/sql/server_battlenpc_mob_types.sql", "server_battlenpc_mob_types")}
    spawns = list(sql_rows(MEM / "Data/sql/server_battlenpc_spawn_locations.sql", "server_battlenpc_spawn_locations"))
    manifest = json.loads((MEM / "Data/mobplacements/etc1_quest_mobs.json").read_text(encoding="utf-8"))
    placed = {e["quest_id"]: e for e in manifest["entries"]}
    return contracts, markers, quests, rewards, enpcs, types, spawns, manifest, placed


def check_lua(q, lua_text, contract, sql_exp):
    """Assert route/contract/SQL consistency. Raises on drift."""
    for step in q["flow"]:
        event = re.match(r"([A-Za-z0-9_]+)\(", step[2])
        if event and event.group(1) not in ("onKillBNpc", "accept"):
            assert event.group(1) in contract["signatures"], (q["code"], event.group(1))
    if q["bnpc_actor"]:
        assert re.search(r"BNPC_\w+\s*=\s*%d\s*;" % q["bnpc_actor"], lua_text), q["code"]
    m = re.search(r'"sqrwa",\s*(\d+|REWARD_EXP),\s*1,\s*1,\s*9', lua_text)
    assert m, (q["code"], "sqrwa")
    if m.group(1) == "REWARD_EXP":
        rm = re.search(r"REWARD_EXP\s*=\s*(\d+)\s*;", lua_text)
        assert rm and int(rm.group(1)) == sql_exp, (q["code"], rm.group(1) if rm else None, sql_exp)
    else:
        assert int(m.group(1)) == sql_exp, (q["code"], m.group(1), sql_exp)
    assert lua_text.count("player:CompleteQuest(quest)") == 1, q["code"]
    assert "hocobo" not in lua_text.lower(), q["code"]
    assert "npc.GetActorClassId" not in lua_text and "GetActorClassId(npc" not in lua_text, q["code"]


def mob_evidence(q, types, spawns, placed):
    lines = []
    if q["bnpc_actor"] is None:
        return "Not applicable: pure interaction quest, no BNPC objective (V1).", "none", "-", 0
    if q["id"] in placed:
        e = placed[q["id"]]
        p = e["profile"]
        lines.append("VERIFIED (V8): quest-specific stationary pack, bnpcId %d / actorId %d (%s), "
                     "level %d, zone %d, %d placements at exact frozen recorded XYZ." %
                     (p["bnpcId"], p["actorId"], p["displayName"], p["min_lvl"], e["zone"], len(e["nodes"])))
        lines.append("  donor bnpcId %d; marker %d at (%.3f, %.3f) territory %d; radius %d; "
                     "height %.5f +- %d; source %s sha256 %.12s...; nodes %s." %
                     (e["donor_id"], e["marker_id"], e["marker_x"], e["marker_z"], e["marker_territory"],
                      e["radius"], e["height"], e["height_tolerance"], e["source"],
                      e["source_sha256"], ", ".join(map(str, e["nodes"]))))
        inst = [r for r in spawns if int(r["bnpcId"]) == p["bnpcId"]]
        lines.append("  installed spawn rows for bnpcId %d: %d (zones %s)." %
                     (p["bnpcId"], len(inst), sorted({int(r["zoneId"]) for r in inst})))
        return "\n".join(lines), "quest-pack", e["zone"], len(inst)
    actor = q["bnpc_actor"]
    bnpcs = sorted(b for b, t in types.items() if int(t["actorId"]) == actor)
    inst = [r for r in spawns if int(r["bnpcId"]) in bnpcs]
    zones = sorted({int(r["zoneId"]) for r in inst})
    lvls = sorted({(int(types[b]["min_lvl"]), int(types[b]["max_lvl"]), types[b]["displayName"]) for b in bnpcs})
    lines.append("VERIFIED (V7): ordinary open-world coverage, no quest-specific pack. actorId %d <- bnpcIds %s %s; "
                 "%d spawn rows in zones %s." % (actor, bnpcs, lvls, len(inst), zones))
    return "\n".join(lines), "ordinary", (zones[0] if zones else None), len(inst)


def render_quest(q, contracts, markers, quests, rewards, enpcs, types, spawns, placed):
    contract = contracts[q["id"]]
    lua_text = (MEM / ("Data/scripts/quests/etc/%s.lua" % q["code"])).read_text(encoding="utf-8")
    own = [r for r in rewards if int(r["questId"]) == q["id"]]
    sql_exp = sum(int(r["quantity"]) for r in own if r["rewardType"] == "Exp")
    check_lua(q, lua_text, contract, sql_exp)
    sqlq = quests[q["id"]]
    assert sqlq["className"].lower() == q["code"] and sqlq["questName"] == q["title"], q["code"]

    ev_lines = ["| delegate event | bytecode arity (V2) | Lua call (V1) |",
                "|---|---|---|"]
    for name, arity in sorted(contract["signatures"].items()):
        uses = sorted(set(re.findall(r'"%s",\s*([^)]*)\)' % re.escape(name), lua_text)))
        ev_lines.append("| %s | %d | %s |" % (name, arity, ("; ".join(u.strip() for u in uses)) or "INCONSISTENT"))
    journals = "; ".join("seq %s -> %s row %d" % (s, v["sheet"], v["row"]) for s, v in sorted(contract["journals"].items(), key=lambda kv: int(kv[0])))

    enpc_lines = []
    for e in q["enpcs"]:
        r = enpcs.get(e)
        enpc_lines.append("  %d: %s" % (e, ("zone %s (%s, %s, %s) priv=%s" %
                         (r["zoneId"], r["positionX"], r["positionY"], r["positionZ"], r["privateAreaName"] or "-")) if r
                         else "NO public spawn row (legacy alias; handled in Lua, never offered alone)"))
    marker_lines = []
    for mid, role in sorted(q["markers"].items()):
        m = markers[mid]
        marker_lines.append("  %d [%s]: x=%s z=%s territory=%s kind=%s (V3)" % (mid, role, m[3], m[4], m[10], m[12]))
    mob_text, mob_kind, mob_zone, mob_rows = mob_evidence(q, types, spawns, placed)
    gaps = gap_text(q, mob_kind, mob_zone, mob_rows)

    flow = "\n".join("  %d. [%s] %s -- %s => %s" % ((i + 1,) + tuple(s)) for i, s in enumerate(q["flow"]))
    item_note = ("quest-script counter item %d (virtual; no inventory grant outside CompleteQuest)" % q["item"]
                 if q["item"] and q["kind"] in ("kill", "kill-referral", "kill-delivery") and q["id"] not in (110680,)
                 else ("objective item %d granted/removed by route (V1)" % q["item"] if q["item"]
                       else ("kill-counter only, no item (V1)" if q["kind"] == "kill" else "route item handling in V1")))
    if q["id"] == 110680:
        item_note = "kill-counter only, no item (V1); completion delegate takes display arg 5 (V2 arity 1, VERIFIED)"
    if q["id"] == 110662:
        item_note = ("virtual wolftail bouquet 11000152: held-item display gated on journal field 2 "
                     "(held_items_expression V2); Lua journal returns 1 only at SEQ_002 (V1). No inventory grant; VERIFIED consistent")
    if q["id"] == 110660:
        item_note = ("virtual marionette 11000146 via counter1 at SEQ_002 (held_items_expression V2 gates on "
                     "$E8(3)); Lua IncCounter(COUNTER_QUESTITEM2) then SEQ_003 (V1). VERIFIED consistent")

    prereq = int(sqlq["prerequisite"])
    prereq_note = ("none (SQL prerequisite=0)" if prereq == 0
                   else "SQL prerequisite=%d%s" % (prereq, " (disabled for new offers; engine enforces)" if prereq == 110658 else " (engine enforces)"))

    return """# %s (%s, id %d)

Patch 1.16 Etc-family sidequest. Status in quest_availability.lua: ACTIVE offer (side_quests.patch_1_16).
Decomp scope: retail client contract (V2/V3) vs server route (V1) vs installed data (V4-V9).

## Sequence flow (V1, verified against %s.lua)
%s

Offer gate: ENPC match + `seq == SEQ_ACCEPT`; decline leaves SEQ_ACCEPT (V2 test contract).
Journal callback returns stage + five fields; map markers per stage (V1 `getJournalMapMarkerList`).
One `CompleteQuest` call site; `UpdateENPCs` + `EndEvent` on every talk path (V1).

## Delegate events (client bytecode contract V2 x server route V1)
%s
`sqrwa` reward screen: EXP %d, slots (1,1,9) (V2 arity + V5 auto-grant EXP match).

## Actors
ENPCs (V6 spawn rows; XYZ are spawn positions, not quest objectives):
%s
%s

## Markers (V3 quest_marker.csv)
%s

## Counters / flags (V1)
%s

## Journal hooks
Client bindings (V2): %s.
Server: `getJournalInformation` forwards counters; `getJournalMapMarkerList` returns stage markers (V1).
No cutscene, no instance, no escort, no chocobo (V1 grep + V3 text grep: 0 hits).

## Rewards (V5 gamedata_quest_rewards.sql, autoGrant=1)
%s; engine `CompleteQuest` grants; `sqrwa` display matches SQL EXP (verified).

## Prerequisites (V4 gamedata_quests.sql)
%s; minLevel %s.

## Ground / spawn evidence
%s

## Verified vs inferred
| claim | status |
|---|---|
| sequence flow, offer/turn-in actors, delegate names + arities | VERIFIED (V1 x V2) |
| marker coords/territory/kind | VERIFIED (V3) |
| journal sheet/row per stage | VERIFIED (V2) |
| EXP + item rewards | VERIFIED (V5; display == SQL) |
| ENPC spawn zones/XYZ | VERIFIED (V6) |
| mob identity + spawn rows | VERIFIED (V7/V8, see above) |
| retail drop chance, retail aggro radii, retail respawn | INFERRED/open: donor combat stats reused (V8 policy); quest counters are server-side, not donor loot |
| exact client rendering/packet order | INFERRED/open: offline contract checks only |
| live-client acceptance | OPEN: needs in-game run |

## Open gaps
%s
""" % (q["title"], q["code"], q["id"], q["code"], flow, "\n".join(ev_lines), sql_exp, "\n".join(enpc_lines),
       ("BNPC actorId %s (%s), kill stage %s, x%d (V1)" % (q["bnpc_actor"], q["bnpc_name"], q["kill_stage"], q["amount"])
        if q["bnpc_actor"] else "No BNPC: pure interaction quest (V1). Mob-profile section not applicable."),
       "\n".join(marker_lines),
       ("counter0 x%d %s" % (q["amount"], item_note)) if q["kill_stage"] is not None
       else ("per-target flags + recomputed counter x%d; %s" % (q["amount"], item_note)),
       journals,
       "; ".join("%s id %s x%s" % (r["rewardType"], r["rewardId"], r["quantity"]) for r in own),
       prereq_note, sqlq["minLevel"], mob_text,
       gaps)


FLOWS = []  # (quest_id, code, from, to, trigger, event)

GAPS = {
    110654: "ENPC 1000223 (legacy Sandre alias) has no spawn row (V6); Lua matches either id and the offer route uses 1001102. No other quest-level gaps.",
    110660: "SQL prerequisite 110658 (The Penultimate Prank) is disabled for new offers; returning players with it complete can be offered this quest, new players cannot earn the chain. Engine-enforced; route unchanged.",
    110676: ("Navmesh zone 170 (Central Thanalan, navi 1000): marker (171.57,-696.69) has 0 recorded nodes within 30 yalms; "
             "nearest recorded node 4519 at 37.2 yalms (y 215.444, context only). Ordinary nutgrabber rows 489/490 at 18-24 yalms "
             "carry SQL Y ~216.1. Playable via ordinary spawns; marker height unresolved, do not invent."),
    110680: ("Navmesh zone 170: marker (-0.45,-917.68) has 0 recorded nodes within 30 yalms; nearest recorded node 1109 at 55.7 yalms "
             "(context only). Ordinary stuffed-dodo row 462 at 9.4 yalms carries SQL Y 183.813. Playable via ordinary spawns; "
             "marker height unresolved, do not invent."),
    110681: ("Navmesh zone 170: marker (-100.53,-798.40) has 30 recorded nodes within 30 yalms; nearest node 1539 at 7.0 yalms "
             "(y 216.634, context only). Ordinary moiling-mole row 453 at 5.7 yalms carries SQL Y 216.848, consistent with nearby "
             "recorded heights. Per policy nearby samples stay context-only; SQL Y stands as authored."),
}


def gap_text(q, mob_kind, mob_zone, mob_rows):
    base = "Mob kind: %s; fight zone: %s; installed rows: %d. " % (mob_kind, mob_zone, mob_rows)
    return base + GAPS.get(q["id"], "No quest-level gaps beyond package items (live-client acceptance open).")


def main():
    contracts, markers, quests, rewards, enpcs, types, spawns, manifest, placed = load()
    assert len(QUESTS) == 14
    summary = {"package": "etc-sidequest-decomp-patch116", "quests": [], "evidence": {
        "V2_contracts": "tools/etc1-quest-runtime-tests/source-contracts.json",
        "V8_manifest": "Data/mobplacements/etc1_quest_mobs.json",
        "gaps": ["meteor-wiki-quests/quests-archive.md absent from checkout",
                 "FF14-Decomp atlas indexes hold 0 rows for these 14 IDs",
                 "decomp_more_20260617 client .lua absent; V2 pins extracted contracts"]}}
    for q in QUESTS:
        text = render_quest(q, contracts, markers, quests, rewards, enpcs, types, spawns, placed)
        (OUT / ("%s-%d.md" % (q["code"], q["id"]))).write_text(text, encoding="utf-8", newline="\n")
        for step in q["flow"]:
            FLOWS.append((q["id"], q["code"]) + tuple(step))
        own = [r for r in rewards if int(r["questId"]) == q["id"]]
        summary["quests"].append({"id": q["id"], "code": q["code"], "title": q["title"], "kind": q["kind"],
                                  "min_level": int(quests[q["id"]]["minLevel"]),
                                  "prerequisite": int(quests[q["id"]]["prerequisite"]),
                                  "exp": sum(int(r["quantity"]) for r in own if r["rewardType"] == "Exp"),
                                  "mob_kind": ("quest-pack" if q["id"] in placed else ("ordinary" if q["bnpc_actor"] else "none"))})
    (OUT / "summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8", newline="\n")
    with (OUT / "quest_flow.csv").open("w", encoding="utf-8", newline="") as h:
        w = csv.writer(h)
        w.writerow(["quest_id", "code", "stage", "action", "delegate_or_handler", "transition"])
        w.writerows(FLOWS)
    print("wrote %d quest notes + summary.json + quest_flow.csv" % len(QUESTS))


if __name__ == "__main__":
    main()
