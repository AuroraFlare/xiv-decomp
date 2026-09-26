#!/usr/bin/env python3
"""Build a focused audit for missing quest/content event surfaces.

This pass complements the broader content confidence report. It is intentionally
small and opinionated: collect the recovered client-side Lua contracts for
terminal/gimmick objects, dungeon warp widgets, Chocobo Caravan, Hamlet widgets,
and content-information surfaces, then compare them with local server/script
coverage.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Iterable


DEFAULT_CONTENT_DECOMP = Path("tools/outputs/lpb/content_systems_20260612/lua")
DEFAULT_WIDE_DECOMP = Path("tools/outputs/lpb/decomp_further_20260617/lua")
DEFAULT_OUTPUT = Path("tools/outputs/lpb/missing_event_surface_decomp_20260619")
DEFAULT_DOC = Path("docs/missing_event_surface_decomp_2026-06-19.md")

LOCAL_SCAN_ROOTS = (
    Path("Data/scripts"),
    Path("Map Server"),
    Path("World Server"),
    Path("Data/sql"),
)

LOCAL_SCAN_EXTENSIONS = {".cs", ".lua", ".sql"}
LOCAL_SKIP_PARTS = {"bin", "obj", ".git", ".vs"}

FUNCTION_RE = re.compile(
    r"^\s*function\s+(?:(?P<class>[A-Za-z_][A-Za-z0-9_]*)\.)?"
    r"(?P<method>[A-Za-z_][A-Za-z0-9_]*)\s*\(",
    re.MULTILINE,
)
CLASS_RE = re.compile(r"_define(?:Base)?Class\(\s*\"(?P<class>[^\"]+)\"(?:\s*,\s*\"(?P<base>[^\"]+)\")?")
TEXT_RE = re.compile(r"_loadTextDataPermanently\((?P<args>[^)]*)\)")
DESKTOP_CALL_RE = re.compile(r"desktopWidget[:\.](?P<call>[A-Za-z_][A-Za-z0-9_]*)\s*\(")
WORLD_CALL_RE = re.compile(r"worldMaster[:\.](?P<call>[A-Za-z_][A-Za-z0-9_]*)\s*\(")
NATIVE_CALL_RE = re.compile(r"[:\.](?P<call>_[A-Za-z_][A-Za-z0-9_]*)\s*\(")
ASK_EXTEND_RE = re.compile(r"askExtendWidget\((?P<args>[^)]*)\)")
ACTOR_CLASS_ROW_RE = re.compile(
    r"\((?P<class_id>\d+),\s*'(?P<actor_path>[^']*)',\s*(?P<model_id>[^,]+),\s*(?P<actor_kind>[^,]+),"
)
SPAWN_ROW_RE = re.compile(
    r"\((?P<spawn_id>\d+),\s*(?P<class_id>\d+),\s*'(?P<unique_id>[^']*)',\s*"
    r"(?P<zone_id>[^,]+),\s*'(?P<private_area>[^']*)',\s*(?P<private_level>[^,]+),\s*"
    r"(?P<x>[^,]+),\s*(?P<y>[^,]+),\s*(?P<z>[^,]+),"
)
MAPOBJ_ROW_RE = re.compile(r"\((?P<spawn_id>\d+),\s*(?P<layout_id>\d+),\s*(?P<instance_id>\d+)\)")


@dataclass(frozen=True)
class Surface:
    surface: str
    family: str
    client_paths: tuple[str, ...]
    local_terms: tuple[str, ...]
    client_entry: str
    client_contract: str
    local_interpretation: str
    gap: str
    recommended_next: str
    confidence: str


@dataclass(frozen=True)
class EvidenceProbe:
    surface: str
    evidence_type: str
    paths: tuple[str, ...]
    terms: tuple[str, ...]
    interpretation: str


@dataclass(frozen=True)
class ActorCandidateProbe:
    surface: str
    terms: tuple[str, ...]
    interpretation: str


SURFACES: tuple[Surface, ...] = (
    Surface(
        surface="Gimmick/Magitek terminal",
        family="gimmick_terminal",
        client_paths=("chara/npc/gimmick/gimmickterminal.lua",),
        local_terms=("GimmickTerminal", "gimmickTerminal", "eventTalkTerminal", "terminal"),
        client_entry="GimmickTerminal.eventTalkTerminal(player)",
        client_contract="Loads text bank 10096/gimmickTerminal; terminal talk is a worldMaster:say path, not a bespoke widget path.",
        local_interpretation="Local GimmickTerminal.lua exists; the remaining proof gap is TalkCommand routing plus actor/spawn binding.",
        gap="Bind terminal-like dungeon/quest map objects to the local GimmickTerminal script only after TalkCommand target routing and actor/spawn identity are captured.",
        recommended_next="Capture TalkCommand target params and terminal actor classes, then bind read-only terminal rows without stealing stateful dungeon devices.",
        confidence="97% client contract; script present, binding unproven",
    ),
    Surface(
        surface="Dungeon warp device",
        family="dungeon_device",
        client_paths=("chara/npc/object/raiddungeonwarp.lua",),
        local_terms=("RaidDungeonWarp", "raidDungeonWarp", "activateWarpDevice"),
        client_entry="RaidDungeonWarp.activateWarpDevice / askYesNo",
        client_contract="Loads text bank 6781/raidDungeonWarp; activateWarpDevice runs scheduler 67493888; askYesNo uses askExtendWidget(self, 2, 2, 1, 2) and falls back to say(1).",
        local_interpretation="Local RaidDungeonWarp.lua and content-return helpers exist; actor/spawn binding and destination validation remain unresolved.",
        gap="Dungeon terminal/warp device behavior remains unbound even though the local script/helper path exists.",
        recommended_next="Capture or seed the real transporter actor, validate askYesNo/activateWarpDevice, and route yes through the existing private-area return helper.",
        confidence="96% client contract; script present, binding unproven",
    ),
    Surface(
        surface="Beacon Fort gate gimmick",
        family="gimmick_gate",
        client_paths=("chara/npc/gimmick/gimmickmapobj/beaconfortgategimmick.lua",),
        local_terms=("BeaconFortGateGimmick", "beaconFortGateGimmick", "mapStat", "runBgScheduler", "processUpdateWork", "getSchedulerName"),
        client_entry="BeaconFortGateGimmick.processUpdateWork(status)",
        client_contract="Syncs status through tag mapStat, stores show/hide scheduler names, and runs the appropriate BG scheduler when status changes.",
        local_interpretation="Local BeaconFortGateGimmick identity shim exists; recovered scheduler/status behavior remains unproven.",
        gap="Stronghold/dungeon gate identity can be represented locally, but the recovered scheduler/status protocol is not wired.",
        recommended_next="Validate one real BeaconFortGateGimmick binding before adding status-synced scheduler playback.",
        confidence="96% client contract; script present, binding unproven",
    ),
    Surface(
        surface="Chocobo Caravan retail HUD",
        family="caravan_hud",
        client_paths=(
            "director/caravanguard/caravanguarddirector.lua",
            "widget/chocobocaravanwidget.lua",
        ),
        local_terms=("ChocoboCaravanDirector", "CreateChocoboCaravanDirector", "RegionalCaravan", "CaravanGuardDirector", "ChocoboCaravanRoute"),
        client_entry="CaravanGuardDirector.processUIInit/processUIUpdate/processUIFinalize",
        client_contract="Uses work.step/progressPer/finishTime/chocoboStatus[3]/chocoboHPStatus[3]/markerX/Y/Z[3], content-information kind 2, public effects 13-20, and escaped-chocobo minimap/map markers.",
        local_interpretation="Local ChocoboCaravanDirector now seeds CaravanGuardDirector work fields through the recovered RegionalCaravan client path while keeping guildleveWork as fallback plumbing.",
        gap="The retail work surface is seeded locally; remaining gaps are live ChocoboCaravanWidget validation, guide actor binding, and real reward grants.",
        recommended_next="Probe the recovered CaravanGuardDirector path in-client, then validate step/progress/status/hp/finishTime and pending guide reward results.",
        confidence="97% client HUD contract; local retail lane seeded, live validation pending",
    ),
    Surface(
        surface="Chocobo Caravan manager/signup",
        family="caravan_signup",
        client_paths=("chara/npc/populace/populacecaravanmanager.lua",),
        local_terms=("PopulaceCaravanManager", "caravanGuardEntry", "caravanGuardQuestion", "caravanGuardJoinOK", "caravanGuardCancel"),
        client_entry="PopulaceCaravanManager.caravanGuardEntry/caravanGuardQuestion",
        client_contract="Manager dialogue covers signup, route question, join OK/NG, full-party/other-GC responses, emotes, and cancel.",
        local_interpretation="A local PopulaceCaravanManager script exists, but it is a fixed harness that only calls caravanGuardEntry with sample values.",
        gap="Retail caravan signup and cancellation are not wired to route ownership, party capacity, Grand Company eligibility, or director creation.",
        recommended_next="Promote PopulaceCaravanManager from harness to flow controller: question, join result, cancel, then create the retail-mode caravan director.",
        confidence="97% client signup contract; local implementation partial",
    ),
    Surface(
        surface="Chocobo Caravan guide/dialogue",
        family="caravan_dialogue",
        client_paths=("chara/npc/populace/populacecaravanguide.lua",),
        local_terms=("PopulaceCaravanGuide", "caravanGuardReward", "caravanGuardOffer", "caravanGuardFailReward"),
        client_entry="PopulaceCaravanGuide.caravanGuard*",
        client_contract="Guide dialogue covers offer/thanks/cancel/success/failure/reward/no-reward/bonus-reward branches and uses askExtendWidget for abandon/reward teleport choices.",
        local_interpretation="A local PopulaceCaravanGuide script now checks pending caravan completion/failure results before active-offer fallback, then calls recovered reward/fail dialogue and clears the pending result.",
        gap="Completion/failure dialogue is bridged through pending director results; remaining gaps are live guide actor binding, reward-claim persistence, and real reward grants.",
        recommended_next="Validate guide actor binding and pending result display in-client, then add claimed/expiry persistence and real reward grants.",
        confidence="97% client dialogue contract; local pending-result bridge seeded, live validation pending",
    ),
    Surface(
        surface="Pack chocobo caravan command",
        family="caravan_chocobo_actor",
        client_paths=("chara/npc/monster/chocobo/chocobocaravanguard.lua",),
        local_terms=("ChocoboCaravanGuard", "chocoboCommand", "defaultTalkCaravanChocobo", "pack_chocobo", "1500228", "1500230"),
        client_entry="ChocoboCaravanGuard.chocoboCommand(...)",
        client_contract="Pack chocobo starts a client talk turn, asks restricted choices, optionally asks text id 6 with three route/name args, and returns both choices.",
        local_interpretation="Visible pack_chocobo spawns use PopulaceStandard/defaultTalkCaravanChocobo actors; a local ChocoboCaravanGuard script exists but only initializes the actor and does not call chocoboCommand.",
        gap="Pack chocobo interaction is split between default-talk emotes and the recovered ChocoboCaravanGuard command flow.",
        recommended_next="Decide whether chocoboCommand belongs on visible 1500228/1500230 pack_chocobo actors or on spawned 22105xx ChocoboCaravanGuard actors, then bridge route/name args accordingly.",
        confidence="96% client actor contract; local actor mapping split",
    ),
    Surface(
        surface="Hamlet execution widget",
        family="hamlet_execution",
        client_paths=(
            "director/instanceraid/instanceraidbaseclass.lua",
            "director/instanceraid/instanceraidhamletdefense.lua",
            "widget/hamletdefensewidget.lua",
            "widget/hamletdefensepopupwidget.lua",
        ),
        local_terms=("HamletDefenseDirector", "openHamletDefenseWidget", "SendHamletDefenseWidgetOpenBurst", "InstanceRaidHamletDefense"),
        client_entry="InstanceRaidBaseClass.startEvent/reloginEvent -> InstanceRaidHamletDefense.openInformationWidget",
        client_contract="Hamlet opens slot-backed HamletDefenseWidget/Popup only after InstanceRaidBaseClass initFlag is set; kind 3 data packets dispatch to InstanceRaidHamletDefense.processUserMessage.",
        local_interpretation="Local Hamlet has many debug/probe paths and direct widget-open bursts, but the retail lifecycle entry remains the known blocker.",
        gap="The implementation can create/probe widgets, but it does not yet reliably enter the stock InstanceRaidHamletDefense lifecycle.",
        recommended_next="Prioritize the instance-raid start/relogin trigger, then send typed kind 3 user-message helpers instead of direct widget construction probes.",
        confidence="97% client widget contract; local startup below 95%",
    ),
    Surface(
        surface="Hamlet score widget",
        family="hamlet_score",
        client_paths=("widget/ask/hamletdefensescorewidget.lua",),
        local_terms=("HamletDefenseScorePacket", "_countHamletDefenseScore", "_getHamletDefenseScore", "hamletDefScore"),
        client_entry="desktopWidget.askHamletDefenseScoreWidget(contentID)",
        client_contract="Score widget pulls _countHamletDefenseScore/_getHamletDefenseScore/_getHamletDefenseScoreAll from native-backed client data and displays final score rows.",
        local_interpretation="Local HamletDefenseScorePacket exists, including native-shape work, but row-value DAT reconciliation is still a validation boundary.",
        gap="Functional score packets exist, but exact installed-DAT row values/visual validation should remain gated.",
        recommended_next="Keep score rows table-driven from hamlet_score_row_code_mapping.csv and run one retail visual validation before claiming exactness.",
        confidence="97% parser/row order; lower for exact local DAT values",
    ),
    Surface(
        surface="Hamlet ranking widget",
        family="hamlet_ranking",
        client_paths=("widget/ask/hamletdefenserankingwidget.lua", "quest/scenario/noc/noc002.lua"),
        local_terms=("HamletSupplyRankingPacket", "askHamletDefenseRankingWidget", "_countHamletSupplyRanking", "_getHamletSupplyRanking"),
        client_entry="Noc002.processSupplyAskWhatA04 -> desktopWidget.askHamletDefenseRankingWidget(...)",
        client_contract="Ranking widget pulls _countHamletSupplyRanking/_getHamletSupplyRanking and labels rank, grand company, player, points, linkshell, and linkshell icon slots.",
        local_interpretation="Local HamletSupplyRankingPacket has empty/sample packet support, but the non-empty visual bridge is still a gated probe.",
        gap="Supply ranking can be probed, but exact 0x01A6 field-to-widget labels are not fully validated.",
        recommended_next="Use hamlet_supply_ranking_field_bridge.csv for one non-empty row probe, then promote fields that visually validate.",
        confidence="95-96% container; 90-94% raw field labels",
    ),
    Surface(
        surface="Hamlet supply/captain dialogue widgets",
        family="hamlet_supply_dialogue",
        client_paths=("quest/scenario/noc/noc002.lua", "chara/npc/populace/populacehamletsupply.lua"),
        local_terms=("PopulaceHamletSupply", "processSupplyAskWhat", "processCaptainAskWhat", "itemHamletSupply"),
        client_entry="Noc002 processCaptain*/processSupply* and PopulaceHamletSupply menu helpers",
        client_contract="Noc002 drives captain/supply option menus, tutorial page, task-board item listings, ranking widget open, supply errors, and itemHamletSupply data reads.",
        local_interpretation="Local Hamlet combat/scoring exists, but this pass did not find a full captain/supply dialogue implementation matching Noc002/PopulaceHamletSupply.",
        gap="Hamlet participation and supply-turn-in UI is not wired with the recovered Noc002 option/menu functions.",
        recommended_next="Implement captain and supply NPC scripts from Noc002, then connect itemHamletSupply rows and existing local supply/reward state.",
        confidence="95% client dialogue/menu contract; local bridge incomplete",
    ),
    Surface(
        surface="Legacy dungeon execution widget",
        family="legacy_occupancy",
        client_paths=("director/occupancy/raidfst0dungeon03.lua", "director/occupancy/raidroc0dungeon01.lua"),
        local_terms=("Totorak", "openRaidDungeonExecutionWidget", "RaidDungeonExecutionWidget", "eventNoticeCutScene"),
        client_entry="RaidFst0Dungeon03/RaidRoc0Dungeon01 eventNoticeCutScene/relogin",
        client_contract="Toto-Rak uses display/content 2123/1 and Dzemael uses 4102/2, opening RaidDungeonExecutionWidget around eventNoticeCutScene/relogin flows.",
        local_interpretation="Local Totorak delegates quest events and sets _setInstanceRaid, but no local occupancy wrapper widget bridge was found by this pass.",
        gap="Old dungeon HUD/cutscene wrappers need the recovered occupancy director path, not only quest delegate events.",
        recommended_next="Wire legacy occupancy directors for Toto-Rak/Dzemael style duties with eventNoticeCutScene/relogin and open/close RaidDungeonExecutionWidget behavior.",
        confidence="97% client occupancy contract; local bridge partial",
    ),
    Surface(
        surface="Quest content-information widgets",
        family="quest_content_info",
        client_paths=(
            "director/quest/questdirectorgcg70101.lua",
            "director/quest/questdirectorgcl70101.lua",
            "director/quest/questdirectorgcu70101.lua",
            "director/quest/questdirectornmrush01.lua",
            "director/quest/questdirectornmrush02.lua",
        ),
        local_terms=("processUpdateContentsInformation", "QuestDirectorGcg70101", "QuestDirectorNMRush", "isContentsCommand"),
        client_entry="QuestDirector*.processUIUpdate -> desktopWidget.processUpdateContentsInformation",
        client_contract="Several quest directors use the same content-information widget lane for start/update/cancel state, independently from guildleve and caravan.",
        local_interpretation="Local generic quest delegate/cutscene support exists, but these recovered quest content-information directors are not clearly implemented.",
        gap="Quest-specific content widgets can be missed if only guildleve/instance HUDs are implemented.",
        recommended_next="Add a quest director content-information audit before closing quest/widget coverage; start with GCG/GCL/GCU 70101 and NMRush 01/02.",
        confidence="94-96% client lane; local coverage unclear",
    ),
)


BRIDGE_EVIDENCE_PROBES: tuple[EvidenceProbe, ...] = (
    EvidenceProbe(
        surface="Gimmick/Magitek terminal",
        evidence_type="dat_and_local_equivalent",
        paths=(
            "docs/Dat Mining/gimmickTerminal.csv",
            "docs/Dat Mining/raidDungeonLight.csv",
            "docs/Dat Mining/raidDungeonBarrier.csv",
            "docs/Dat Mining/raidDungeonPoster.csv",
            "docs/Dat Mining/worldMaster.csv",
            "Data/scripts/base/chara/npc/object/RaidDungeonLight.lua",
            "Data/scripts/base/chara/npc/object/RaidDungeonBarrier.lua",
            "Data/scripts/base/chara/npc/object/RaidDungeonPoster.lua",
        ),
        terms=("terminal", "photocell", "52023", "52024", "52025", "52069", "eventTalkRead", "askYesNo"),
        interpretation="Local GimmickTerminal.lua now exists as a generic read-only prompt leaf; Toto-Rak terminal behavior remains split across dedicated light/barrier/poster objects with worldMaster photocell messages.",
    ),
    EvidenceProbe(
        surface="Dungeon warp device",
        evidence_type="client_dat_contract",
        paths=(
            "docs/Dat Mining/raidDungeonWarp.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/object/raiddungeonwarp.lua",
        ),
        terms=("raidDungeonWarp", "activateWarpDevice", "askExtendWidget", "67493888", "askYesNo"),
        interpretation="RaidDungeonWarp has a recovered yes/no plus scheduler contract and a local script/helper path; the remaining gap is exact actor/spawn binding and destination validation.",
    ),
    EvidenceProbe(
        surface="Beacon Fort gate gimmick",
        evidence_type="client_dat_contract",
        paths=(
            "docs/Dat Mining/beaconFortGateGimmick.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/gimmick/gimmickmapobj/beaconfortgategimmick.lua",
        ),
        terms=("beaconFortGateGimmick", "mapStat", "status", "showSchedulerName", "hideSchedulerName", "_runBgScheduler"),
        interpretation="Beacon Fort gate is a status-synced map object that drives show/hide BG schedulers from mapStat.",
    ),
    EvidenceProbe(
        surface="Chocobo Caravan retail HUD",
        evidence_type="client_vs_local_director",
        paths=(
            "tools/outputs/lpb/content_systems_20260612/lua/director/caravanguard/caravanguarddirector.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/widget/chocobocaravanwidget.lua",
            "Map Server/Actors/Director/ChocoboCaravanDirector.cs",
            "Data/scripts/directors/ChocoboCaravan/RegionalCaravan.lua",
        ),
        terms=("progressPer", "finishTime", "chocoboStatus", "chocoboHPStatus", "markerX", "getKindContentsInformation", "GuildleveWork", "RegionalCaravan"),
        interpretation="Client retail HUD expects CaravanGuardDirector work arrays; local director now seeds the recovered RegionalCaravan/CaravanGuardDirector lane while retaining guildleve-compatible fallback fields.",
    ),
    EvidenceProbe(
        surface="Chocobo Caravan manager/signup",
        evidence_type="client_sql_local_dialogue",
        paths=(
            "docs/Dat Mining/populaceCaravanManager.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravanmanager.lua",
            "Data/scripts/base/chara/npc/populace/PopulaceCaravanManager.lua",
            "Data/sql/gamedata_actor_class.sql",
        ),
        terms=("PopulaceCaravanManager", "caravanGuardEntry", "caravanGuardQuestion", "caravanGuardJoinOK", "caravanGuardJoinNG", "caravanGuardCancel"),
        interpretation="Signup NPC class exists in SQL and local script, but only the entry prompt is exercised locally.",
    ),
    EvidenceProbe(
        surface="Chocobo Caravan guide/dialogue",
        evidence_type="client_sql_local_dialogue",
        paths=(
            "docs/Dat Mining/populaceCaravanGuide.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacecaravanguide.lua",
            "Data/scripts/base/chara/npc/populace/PopulaceCaravanGuide.lua",
        ),
        terms=("caravanGuardReward", "caravanGuardFailReward", "caravanGuardThanks", "caravanGuardOffer", "caravanGuardSuccess", "caravanGuardFailure", "caravanGuardBonusReward"),
        interpretation="Guide reward/failure branches are recovered and now called from pending completion/failure results after the caravan director ends; reward persistence and live actor validation remain open.",
    ),
    EvidenceProbe(
        surface="Pack chocobo caravan command",
        evidence_type="client_sql_default_talk",
        paths=(
            "docs/Dat Mining/chocoboCaravanGuard.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/monster/chocobo/chocobocaravanguard.lua",
            "Data/scripts/base/chara/npc/monster/Chocobo/ChocoboCaravanGuard.lua",
            "Data/scripts/quests/dft/DftFst.lua",
            "Data/scripts/quests/dft/DftSea.lua",
            "Data/scripts/quests/dft/DftWil.lua",
            "Data/sql/gamedata_actor_class.sql",
            "Data/sql/server_eventnpc_spawn_locations.sql",
        ),
        terms=("ChocoboCaravanGuard", "chocoboCommand", "defaultTalkCaravanChocobo", "Pack Chocobo", "pack_chocobo", "1500228", "1500230"),
        interpretation="Visible pack_chocobo spawns are default-talk PopulaceStandard actors; the ChocoboCaravanGuard actor family and local init script exist, but no route command bridge is wired.",
    ),
    EvidenceProbe(
        surface="Hamlet execution widget",
        evidence_type="client_vs_local_lifecycle",
        paths=(
            "tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/instanceraidbaseclass.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/instanceraid/instanceraidhamletdefense.lua",
            "Map Server/Actors/Director/HamletDefenseDirector.cs",
            "Map Server/Hamlets/HamletDefenseManager.cs",
            "Data/scripts/directors/Hamlet/Defense.lua",
        ),
        terms=("startEvent", "reloginEvent", "openHamletExecutionWidget", "initFlag", "processUserMessage", "_setInstanceRaid", "HamletDefenseWidget"),
        interpretation="Local probes can open Hamlet widgets, but the stock InstanceRaidBaseClass start/relogin lifecycle remains the key bridge.",
    ),
    EvidenceProbe(
        surface="Hamlet score widget",
        evidence_type="client_vs_local_packet",
        paths=(
            "docs/Dat Mining/hamletDefScore.csv",
            "docs/Dat Mining/xtx_hamletDefScore.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/widget/ask/hamletdefensescorewidget.lua",
            "Map Server/Actors/Director/HamletDefenseDirector.cs",
            "Map Server/Hamlets/HamletDefenseManager.cs",
        ),
        terms=("_countHamletDefenseScore", "_getHamletDefenseScore", "HamletDefenseScorePacket", "hamletDefScore"),
        interpretation="Score packet and row contracts are largely recovered; exact installed-DAT value validation remains the main risk.",
    ),
    EvidenceProbe(
        surface="Hamlet ranking widget",
        evidence_type="client_vs_local_packet",
        paths=(
            "tools/outputs/lpb/content_systems_20260612/lua/widget/ask/hamletdefenserankingwidget.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/noc/noc002.lua",
            "Map Server/Actors/Director/HamletDefenseDirector.cs",
            "Map Server/Hamlets/HamletDefenseManager.cs",
        ),
        terms=("_countHamletSupplyRanking", "_getHamletSupplyRanking", "askHamletDefenseRankingWidget", "HamletSupplyRankingPacket"),
        interpretation="Ranking packet shell exists locally, but a non-empty row visual probe is still needed before field labels are locked.",
    ),
    EvidenceProbe(
        surface="Hamlet supply/captain dialogue widgets",
        evidence_type="client_sql_local_dialogue",
        paths=(
            "docs/Dat Mining/populaceHamletSupply.csv",
            "docs/Dat Mining/PopulaceHamletCaptain.csv",
            "docs/Dat Mining/itemHamletSupply.csv",
            "tools/outputs/lpb/content_systems_20260612/lua/quest/scenario/noc/noc002.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/chara/npc/populace/populacehamletsupply.lua",
            "Data/scripts/quests/noc/noc002.lua",
            "Data/sql/gamedata_actor_class.sql",
            "Data/sql/gamedata_quests.sql",
        ),
        terms=("PopulaceHamletSupply", "Noc002", "processSupply", "processCaptain", "itemHamletSupply", "Hamlet Defense"),
        interpretation="Client Noc002 and PopulaceHamletSupply expose the supply/captain menus; local Noc002 is still only a scaffold.",
    ),
    EvidenceProbe(
        surface="Legacy dungeon execution widget",
        evidence_type="client_vs_local_occupancy",
        paths=(
            "tools/outputs/lpb/content_systems_20260612/lua/director/occupancy/raidfst0dungeon03.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/occupancy/raidroc0dungeon01.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/widget/raiddungeonexecutionwidget.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/widget/desktopwidget_connector.lua",
            "Data/scripts/directors/Instance/Totorak.lua",
        ),
        terms=("eventNoticeCutScene", "openRaidDungeonExecutionWidget", "closeRaidDungeonExecutionWidget", "2123", "4102", "_setInstanceRaid"),
        interpretation="Legacy occupancy directors recover Toto-Rak/Dzemael widget open/close IDs; local Totorak currently only triggers instance-raid state.",
    ),
    EvidenceProbe(
        surface="Quest content-information widgets",
        evidence_type="client_quest_director_lane",
        paths=(
            "tools/outputs/lpb/content_systems_20260612/lua/director/quest/questdirectorgcg70101.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/quest/questdirectorgcl70101.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/quest/questdirectorgcu70101.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/quest/questdirectornmrush01.lua",
            "tools/outputs/lpb/content_systems_20260612/lua/director/quest/questdirectornmrush02.lua",
        ),
        terms=("processUpdateContentsInformation", "processOpenContentsInformation", "processCloseContentsInformation", "isContentsCommand"),
        interpretation="Several recovered quest directors use the content-information widget lane outside guildleve/caravan paths.",
    ),
)


ACTOR_CANDIDATE_PROBES: tuple[ActorCandidateProbe, ...] = (
    ActorCandidateProbe(
        surface="Gimmick/Magitek terminal",
        terms=("RaidDungeonLight", "RaidDungeonBarrier", "RaidDungeonPoster", "~~~magitek???~~~", "fstdun3_photocell", "fstdun3_barrier", "photocell barrier"),
        interpretation="Local Toto-Rak terminal-like objects are concrete RaidDungeonLight/Barrier/Poster classes and placeholder magitek rows; generic GimmickTerminal exists but should not hijack these dedicated objects.",
    ),
    ActorCandidateProbe(
        surface="Dungeon warp device",
        terms=("RaidDungeonWarp", "raidDungeonWarp", "~~~magitek???~~~", "magitek terminal", "magitek device"),
        interpretation="Recovered RaidDungeonWarp has a local script path, but no exact actor class/spawn binding is proven; placeholder magitek rows remain the closest SQL-level lead.",
    ),
    ActorCandidateProbe(
        surface="Chocobo Caravan manager/signup",
        terms=("PopulaceCaravanManager",),
        interpretation="Retail caravan signup managers exist as actor classes and should own the join/cancel dialogue before director creation.",
    ),
    ActorCandidateProbe(
        surface="Pack chocobo caravan command",
        terms=("ChocoboCaravanGuard", "Pack Chocobo", "defaultTalkCaravanChocobo", "pack_chocobo", "1500228", "1500230"),
        interpretation="Both visible pack_chocobo PopulaceStandard actors and 22105xx ChocoboCaravanGuard actor classes are present; the missing part is the route command bridge.",
    ),
    ActorCandidateProbe(
        surface="Hamlet supply/captain dialogue widgets",
        terms=("PopulaceHamletSupply", "Noc002", "Hamlet Defense"),
        interpretation="Hamlet supply actors and the static Noc002 quest row exist; local quest logic still needs the recovered menu functions.",
    ),
)


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8", errors="replace")
    except OSError:
        return ""


def normalize_rel(path: str) -> str:
    return path.replace("/", "\\")


def first_existing(content_root: Path, wide_root: Path, rel: str) -> Path | None:
    rel_path = Path(normalize_rel(rel))
    for root in (content_root, wide_root):
        candidate = root / rel_path
        if candidate.exists():
            return candidate
    return None


def csv_write(path: Path, rows: Iterable[dict[str, object]], fields: list[str]) -> int:
    rows = list(rows)
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    return len(rows)


def unique_ordered(values: Iterable[str]) -> list[str]:
    seen: set[str] = set()
    result: list[str] = []
    for value in values:
        if value and value not in seen:
            seen.add(value)
            result.append(value)
    return result


def semicolon(values: Iterable[object], limit: int | None = None) -> str:
    text_values = [str(value) for value in values if str(value)]
    if limit is not None:
        text_values = text_values[:limit]
    return "; ".join(text_values)


def matching_terms(text: str, terms: Iterable[str]) -> list[str]:
    lower_text = text.lower()
    return [term for term in terms if term and term.lower() in lower_text]


def sample_line(path: Path, line_no: int, line: str) -> str:
    cleaned = re.sub(r"\s+", " ", line.strip())
    return f"{path}:{line_no}: {cleaned[:220]}"


def summarize_lua(surface: str, rel: str, path: Path | None) -> dict[str, object]:
    if path is None:
        return {
            "surface": surface,
            "relative_path": rel,
            "resolved_path": "",
            "exists": False,
            "classes": "",
            "functions": "",
            "text_loads": "",
            "desktop_widget_calls": "",
            "world_calls": "",
            "native_calls": "",
            "ask_extend_widgets": "",
            "line_count": 0,
        }

    text = read_text(path)
    classes = [
        match.group("class") + (f" : {match.group('base')}" if match.group("base") else "")
        for match in CLASS_RE.finditer(text)
    ]
    functions = [
        f"{match.group('class') + '.' if match.group('class') else ''}{match.group('method')}"
        for match in FUNCTION_RE.finditer(text)
    ]
    text_loads = [match.group("args").strip() for match in TEXT_RE.finditer(text)]
    desktop_calls = [match.group("call") for match in DESKTOP_CALL_RE.finditer(text)]
    world_calls = [match.group("call") for match in WORLD_CALL_RE.finditer(text)]
    native_calls = [match.group("call") for match in NATIVE_CALL_RE.finditer(text)]
    ask_extend = [match.group("args").strip() for match in ASK_EXTEND_RE.finditer(text)]

    return {
        "surface": surface,
        "relative_path": rel,
        "resolved_path": str(path),
        "exists": True,
        "classes": semicolon(unique_ordered(classes)),
        "functions": semicolon(unique_ordered(functions)),
        "text_loads": semicolon(unique_ordered(text_loads)),
        "desktop_widget_calls": semicolon(unique_ordered(desktop_calls)),
        "world_calls": semicolon(unique_ordered(world_calls)),
        "native_calls": semicolon(unique_ordered(native_calls)),
        "ask_extend_widgets": semicolon(unique_ordered(ask_extend)),
        "line_count": text.count("\n") + 1 if text else 0,
    }


def iter_local_files(roots: Iterable[Path]) -> Iterable[Path]:
    for root in roots:
        if not root.exists():
            continue
        for path in root.rglob("*"):
            if any(part.lower() in LOCAL_SKIP_PARTS for part in path.parts):
                continue
            if path.is_file() and path.suffix.lower() in LOCAL_SCAN_EXTENSIONS:
                yield path


def find_local_hits(terms: tuple[str, ...], roots: Iterable[Path], sample_limit: int = 12) -> tuple[int, list[str]]:
    lowered_terms = [(term, term.lower()) for term in terms if term]
    hit_count = 0
    samples: list[str] = []
    for path in iter_local_files(roots):
        text = read_text(path)
        if not text:
            continue
        lower_text = text.lower()
        if not any(term_lower in lower_text for _, term_lower in lowered_terms):
            continue
        for line_no, line in enumerate(text.splitlines(), start=1):
            lower_line = line.lower()
            if any(term_lower in lower_line for _, term_lower in lowered_terms):
                hit_count += 1
                if len(samples) < sample_limit:
                    samples.append(f"{path}:{line_no}: {line.strip()[:180]}")
    return hit_count, samples


def find_hits_in_paths(paths: tuple[str, ...], terms: tuple[str, ...], sample_limit: int = 20) -> tuple[int, list[str], list[str], list[str]]:
    hit_count = 0
    samples: list[str] = []
    found: list[str] = []
    missing: list[str] = []
    for rel in paths:
        path = Path(rel)
        if not path.exists():
            missing.append(rel)
            continue
        found.append(rel)
        text = read_text(path)
        for line_no, line in enumerate(text.splitlines(), start=1):
            if matching_terms(line, terms):
                hit_count += 1
                if len(samples) < sample_limit:
                    samples.append(sample_line(path, line_no, line))
    return hit_count, samples, found, missing


def build_bridge_evidence_rows() -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for probe in BRIDGE_EVIDENCE_PROBES:
        hit_count, samples, found, missing = find_hits_in_paths(probe.paths, probe.terms)
        rows.append(
            {
                "surface": probe.surface,
                "evidence_type": probe.evidence_type,
                "terms": semicolon(probe.terms),
                "sources_found": semicolon(found),
                "sources_missing": semicolon(missing),
                "hit_count": hit_count,
                "sample_hits": semicolon(samples),
                "interpretation": probe.interpretation,
            }
        )
    return rows


def parse_actor_class_candidates() -> list[dict[str, object]]:
    actor_class_path = Path("Data/sql/gamedata_actor_class.sql")
    spawn_path = Path("Data/sql/server_eventnpc_spawn_locations.sql")
    mapobj_path = Path("Data/sql/server_eventnpc_mapobj.sql")
    rows: list[dict[str, object]] = []

    actor_ids_by_surface: dict[str, set[str]] = {}
    actor_lookup: dict[str, dict[str, str]] = {}
    for probe in ACTOR_CANDIDATE_PROBES:
        actor_ids_by_surface[probe.surface] = set()

    if actor_class_path.exists():
        for line_no, line in enumerate(read_text(actor_class_path).splitlines(), start=1):
            for probe in ACTOR_CANDIDATE_PROBES:
                terms = matching_terms(line, probe.terms)
                if not terms:
                    continue
                match = ACTOR_CLASS_ROW_RE.search(line)
                if not match:
                    continue
                actor_class_id = match.group("class_id")
                actor_path = match.group("actor_path")
                actor_lookup[actor_class_id] = {
                    "actor_path": actor_path,
                    "model_id": match.group("model_id").strip(),
                    "actor_kind": match.group("actor_kind").strip(),
                }
                actor_ids_by_surface[probe.surface].add(actor_class_id)
                rows.append(
                    {
                        "surface": probe.surface,
                        "candidate_kind": "actor_class",
                        "actor_class_id": actor_class_id,
                        "actor_path": actor_path,
                        "model_id": match.group("model_id").strip(),
                        "actor_kind": match.group("actor_kind").strip(),
                        "spawn_id": "",
                        "unique_id": "",
                        "zone_id": "",
                        "private_area": "",
                        "position": "",
                        "mapobj_layout_id": "",
                        "mapobj_instance_id": "",
                        "matched_terms": semicolon(terms),
                        "line_no": line_no,
                        "source_path": str(actor_class_path),
                        "interpretation": probe.interpretation,
                    }
                )

    spawn_ids_by_surface: dict[str, set[str]] = {probe.surface: set() for probe in ACTOR_CANDIDATE_PROBES}
    spawn_lookup: dict[str, dict[str, str]] = {}
    if spawn_path.exists():
        for line_no, line in enumerate(read_text(spawn_path).splitlines(), start=1):
            match = SPAWN_ROW_RE.search(line)
            if not match:
                continue
            actor_class_id = match.group("class_id")
            unique_id = match.group("unique_id")
            for probe in ACTOR_CANDIDATE_PROBES:
                terms = matching_terms(line, probe.terms)
                if actor_class_id in actor_ids_by_surface[probe.surface]:
                    terms = unique_ordered([*terms, actor_class_id])
                if not terms:
                    continue
                actor = actor_lookup.get(actor_class_id, {})
                spawn_id = match.group("spawn_id")
                spawn_ids_by_surface[probe.surface].add(spawn_id)
                spawn_lookup[spawn_id] = {
                    "actor_class_id": actor_class_id,
                    "actor_path": actor.get("actor_path", ""),
                    "unique_id": unique_id,
                    "zone_id": match.group("zone_id").strip(),
                    "private_area": match.group("private_area"),
                    "position": f"{match.group('x').strip()},{match.group('y').strip()},{match.group('z').strip()}",
                }
                rows.append(
                    {
                        "surface": probe.surface,
                        "candidate_kind": "spawn_location",
                        "actor_class_id": actor_class_id,
                        "actor_path": actor.get("actor_path", ""),
                        "model_id": actor.get("model_id", ""),
                        "actor_kind": actor.get("actor_kind", ""),
                        "spawn_id": spawn_id,
                        "unique_id": unique_id,
                        "zone_id": match.group("zone_id").strip(),
                        "private_area": match.group("private_area"),
                        "position": f"{match.group('x').strip()},{match.group('y').strip()},{match.group('z').strip()}",
                        "mapobj_layout_id": "",
                        "mapobj_instance_id": "",
                        "matched_terms": semicolon(terms),
                        "line_no": line_no,
                        "source_path": str(spawn_path),
                        "interpretation": probe.interpretation,
                    }
                )

    if mapobj_path.exists():
        for line_no, line in enumerate(read_text(mapobj_path).splitlines(), start=1):
            match = MAPOBJ_ROW_RE.search(line)
            if not match:
                continue
            spawn_id = match.group("spawn_id")
            for probe in ACTOR_CANDIDATE_PROBES:
                terms = matching_terms(line, probe.terms)
                if spawn_id in spawn_ids_by_surface[probe.surface]:
                    terms = unique_ordered([*terms, spawn_id])
                if not terms:
                    continue
                spawn = spawn_lookup.get(spawn_id, {})
                rows.append(
                    {
                        "surface": probe.surface,
                        "candidate_kind": "map_object",
                        "actor_class_id": spawn.get("actor_class_id", ""),
                        "actor_path": spawn.get("actor_path", ""),
                        "model_id": "",
                        "actor_kind": "",
                        "spawn_id": spawn_id,
                        "unique_id": spawn.get("unique_id", ""),
                        "zone_id": spawn.get("zone_id", ""),
                        "private_area": spawn.get("private_area", ""),
                        "position": spawn.get("position", ""),
                        "mapobj_layout_id": match.group("layout_id"),
                        "mapobj_instance_id": match.group("instance_id"),
                        "matched_terms": semicolon(terms),
                        "line_no": line_no,
                        "source_path": str(mapobj_path),
                        "interpretation": probe.interpretation,
                    }
                )

    return rows


def build_surface_rows(content_root: Path, wide_root: Path, local_roots: tuple[Path, ...]) -> tuple[list[dict[str, object]], list[dict[str, object]], list[dict[str, object]]]:
    matrix_rows: list[dict[str, object]] = []
    inventory_rows: list[dict[str, object]] = []
    local_rows: list[dict[str, object]] = []

    for surface in SURFACES:
        resolved_paths: list[str] = []
        missing_paths: list[str] = []
        for rel in surface.client_paths:
            path = first_existing(content_root, wide_root, rel)
            if path is None:
                missing_paths.append(rel)
            else:
                resolved_paths.append(str(path))
            inventory_rows.append(summarize_lua(surface.surface, rel, path))

        local_hit_count, local_samples = find_local_hits(surface.local_terms, local_roots)
        local_rows.append(
            {
                "surface": surface.surface,
                "family": surface.family,
                "terms": semicolon(surface.local_terms),
                "hit_count": local_hit_count,
                "sample_hits": semicolon(local_samples),
            }
        )

        matrix_rows.append(
            {
                "surface": surface.surface,
                "family": surface.family,
                "client_entry": surface.client_entry,
                "client_contract": surface.client_contract,
                "client_paths_found": semicolon(resolved_paths),
                "client_paths_missing": semicolon(missing_paths),
                "local_hit_count": local_hit_count,
                "local_interpretation": surface.local_interpretation,
                "gap": surface.gap,
                "recommended_next": surface.recommended_next,
                "confidence": surface.confidence,
            }
        )

    return matrix_rows, inventory_rows, local_rows


def write_readme(
    path: Path,
    matrix_rows: list[dict[str, object]],
    inventory_count: int,
    local_rows: list[dict[str, object]],
    bridge_rows: list[dict[str, object]],
    actor_rows: list[dict[str, object]],
) -> None:
    absent = [row for row in matrix_rows if int(row.get("local_hit_count", 0)) == 0]
    readyish = [
        row for row in matrix_rows
        if row not in absent and "below" not in str(row["confidence"]).lower()
    ]
    partial = [row for row in matrix_rows if row not in readyish and row not in absent]

    lines = [
        "# Missing Event Surface Decomp",
        "",
        f"- Created: {datetime.now().isoformat(timespec='seconds')}",
        f"- Surfaces audited: {len(matrix_rows)}",
        f"- Client source inventory rows: {inventory_count}",
        f"- Local bridge scan rows: {len(local_rows)}",
        f"- Bridge evidence probes: {len(bridge_rows)}",
        f"- SQL actor/spawn/map-object candidates: {len(actor_rows)}",
        "",
        "## Bottom Line",
        "",
        "The next missing surfaces are mostly not new cutscene assets. They are small actor/widget bridge contracts: terminal/gimmick scripts, dungeon warp devices, Caravan signup and HUD sync, Hamlet's stock InstanceRaid lifecycle, and quest-specific content-information widgets.",
        "",
        "## Highest Priority",
        "",
    ]

    for name in (
        "Gimmick/Magitek terminal",
        "Dungeon warp device",
        "Chocobo Caravan manager/signup",
        "Chocobo Caravan retail HUD",
        "Hamlet execution widget",
        "Hamlet supply/captain dialogue widgets",
    ):
        row = next((candidate for candidate in matrix_rows if candidate["surface"] == name), None)
        if row:
            lines.append(f"- **{row['surface']}**: {row['gap']} Next: {row['recommended_next']}")

    lines.extend(
        [
            "",
            "## Surface Matrix",
            "",
            "| Surface | Local Hits | Gap | Next |",
            "| --- | ---: | --- | --- |",
        ]
    )
    for row in matrix_rows:
        lines.append(
            f"| {row['surface']} | {row['local_hit_count']} | {row['gap']} | {row['recommended_next']} |"
        )

    lines.extend(
        [
            "",
            "## Generated Files",
            "",
            "- `event_surface_matrix.csv`",
            "- `client_function_inventory.csv`",
            "- `local_bridge_hits.csv`",
            "- `bridge_evidence.csv`",
            "- `actor_class_candidates.csv`",
            "- `summary.json`",
            "",
            "## Bridge Evidence Highlights",
            "",
            "| Surface | Evidence Hits | Interpretation |",
            "| --- | ---: | --- |",
        ]
    )
    for row in bridge_rows:
        lines.append(f"| {row['surface']} | {row['hit_count']} | {row['interpretation']} |")

    candidate_counts: dict[str, int] = {}
    for row in actor_rows:
        surface = str(row["surface"])
        candidate_counts[surface] = candidate_counts.get(surface, 0) + 1
    lines.extend(
        [
            "",
            "## SQL Candidate Counts",
            "",
            "| Surface | Candidates |",
            "| --- | ---: |",
        ]
    )
    for surface, count in sorted(candidate_counts.items()):
        lines.append(f"| {surface} | {count} |")

    lines.extend(
        [
            "",
            "## Bucket Counts",
            "",
            f"- Ready-ish/static contract rows: {len(readyish)}",
            f"- Local absent rows: {len(absent)}",
            f"- Partial/below-confidence rows: {len(partial)}",
        ]
    )

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def write_doc(
    path: Path,
    output_dir: Path,
    matrix_rows: list[dict[str, object]],
    bridge_rows: list[dict[str, object]],
    actor_rows: list[dict[str, object]],
) -> None:
    candidate_counts: dict[str, int] = {}
    for row in actor_rows:
        surface = str(row["surface"])
        candidate_counts[surface] = candidate_counts.get(surface, 0) + 1

    lines = [
        "# Missing Event Surface Decomp - 2026-06-19",
        "",
        f"Generated by `tools/build_missing_event_surface_decomp.py` into `{output_dir}`.",
        "",
        "## Generated Evidence",
        "",
        "- `event_surface_matrix.csv` - surface-by-surface gap matrix.",
        "- `client_function_inventory.csv` - recovered Lua classes, functions, text loads, and widget calls.",
        "- `local_bridge_hits.csv` - broad local name/term scan.",
        "- `bridge_evidence.csv` - selected DAT/decomp/local cross-checks.",
        "- `actor_class_candidates.csv` - SQL actor class, spawn, and map-object candidates.",
        "",
        "## SQL Candidate Counts",
        "",
        "| Surface | Candidates |",
        "| --- | ---: |",
    ]
    for surface, count in sorted(candidate_counts.items()):
        lines.append(f"| {surface} | {count} |")

    lines.extend(
        [
            "",
            "## Bridge Evidence",
            "",
            "| Surface | Hits | Interpretation |",
            "| --- | ---: | --- |",
        ]
    )
    for row in bridge_rows:
        lines.append(f"| {row['surface']} | {row['hit_count']} | {row['interpretation']} |")

    lines.extend(
        [
        "",
        "## Findings",
        "",
        ]
    )
    for row in matrix_rows:
        lines.extend(
            [
                f"### {row['surface']}",
                "",
                f"- Client entry: `{row['client_entry']}`",
                f"- Contract: {row['client_contract']}",
                f"- Local read: {row['local_interpretation']} Local hits: {row['local_hit_count']}.",
                f"- Gap: {row['gap']}",
                f"- Next: {row['recommended_next']}",
                f"- Confidence: {row['confidence']}",
                "",
            ]
        )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--content-decomp", type=Path, default=DEFAULT_CONTENT_DECOMP)
    parser.add_argument("--wide-decomp", type=Path, default=DEFAULT_WIDE_DECOMP)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--doc", type=Path, default=DEFAULT_DOC)
    args = parser.parse_args()

    output = args.output
    output.mkdir(parents=True, exist_ok=True)

    local_roots = tuple(root for root in LOCAL_SCAN_ROOTS)
    matrix_rows, inventory_rows, local_rows = build_surface_rows(args.content_decomp, args.wide_decomp, local_roots)
    bridge_rows = build_bridge_evidence_rows()
    actor_rows = parse_actor_class_candidates()

    csv_write(
        output / "event_surface_matrix.csv",
        matrix_rows,
        [
            "surface",
            "family",
            "client_entry",
            "client_contract",
            "client_paths_found",
            "client_paths_missing",
            "local_hit_count",
            "local_interpretation",
            "gap",
            "recommended_next",
            "confidence",
        ],
    )
    csv_write(
        output / "client_function_inventory.csv",
        inventory_rows,
        [
            "surface",
            "relative_path",
            "resolved_path",
            "exists",
            "classes",
            "functions",
            "text_loads",
            "desktop_widget_calls",
            "world_calls",
            "native_calls",
            "ask_extend_widgets",
            "line_count",
        ],
    )
    csv_write(
        output / "local_bridge_hits.csv",
        local_rows,
        ["surface", "family", "terms", "hit_count", "sample_hits"],
    )
    csv_write(
        output / "bridge_evidence.csv",
        bridge_rows,
        [
            "surface",
            "evidence_type",
            "terms",
            "sources_found",
            "sources_missing",
            "hit_count",
            "sample_hits",
            "interpretation",
        ],
    )
    csv_write(
        output / "actor_class_candidates.csv",
        actor_rows,
        [
            "surface",
            "candidate_kind",
            "actor_class_id",
            "actor_path",
            "model_id",
            "actor_kind",
            "spawn_id",
            "unique_id",
            "zone_id",
            "private_area",
            "position",
            "mapobj_layout_id",
            "mapobj_instance_id",
            "matched_terms",
            "line_no",
            "source_path",
            "interpretation",
        ],
    )

    summary = {
        "created": datetime.now().isoformat(timespec="seconds"),
        "output": str(output),
        "content_decomp": str(args.content_decomp),
        "wide_decomp": str(args.wide_decomp),
        "surface_count": len(matrix_rows),
        "inventory_rows": len(inventory_rows),
        "local_bridge_rows": len(local_rows),
        "bridge_evidence_rows": len(bridge_rows),
        "actor_candidate_rows": len(actor_rows),
        "local_absent_surfaces": [
            row["surface"] for row in matrix_rows
            if int(row.get("local_hit_count", 0)) == 0
        ],
        "highest_priority": [
            "Gimmick/Magitek terminal",
            "Dungeon warp device",
            "Chocobo Caravan manager/signup",
            "Chocobo Caravan retail HUD",
            "Hamlet execution widget",
            "Hamlet supply/captain dialogue widgets",
        ],
    }
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_readme(output / "README.md", matrix_rows, len(inventory_rows), local_rows, bridge_rows, actor_rows)
    write_doc(args.doc, output, matrix_rows, bridge_rows, actor_rows)

    print(f"Wrote {len(matrix_rows)} event surface rows and {len(actor_rows)} SQL candidate rows to {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
