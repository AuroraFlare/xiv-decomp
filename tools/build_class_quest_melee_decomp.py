#!/usr/bin/env python3
"""Build the melee class-quest (PGL/GLA/EXC 200/300/306) indepth decomp CSVs.

Reads exact DAT markers + SQL rewards/mobs from FF14-Memory so coordinates,
ids, levels and skill lists are transcribed, not hand-copied. Sequences,
processEvents, actors and wave mechanics are curated from the recovered
wiki function lists, the template configs in
Data/scripts/quests/class_quest_template.lua and the bespoke quest bodies
(pgl200/exc300/exc306), matching docs/class-quest-melee-pgl-gla-exc-indepth-decomp-2026-09-27.md.

Cross-repo: MEMORY points at the FF14-Memory checkout.
"""

from __future__ import annotations

import csv
from pathlib import Path

MEMORY = Path(r"C:\Users\drime\source\repos\AuroraFlare\FF14-Memory")
OUT = Path(__file__).resolve().parents[1] / "outputs" / "class-quest-melee-decomp-20260927"

QUESTS = [
    (110060, "Pgl200", "The House Always Wins", 20, 2, "Pugilist"),
    (110061, "Pgl300", "Here There Be Pirates", 30, 2, "Pugilist"),
    (110062, "Pgl306", "Two Sides to Every Chip", 36, 2, "Pugilist"),
    (110080, "Gla200", "All Bark and No Bite", 20, 3, "Gladiator"),
    (110081, "Gla300", "Unalienable Rights", 30, 3, "Gladiator"),
    (110082, "Gla306", "Thrill of the Fight", 36, 3, "Gladiator"),
    (110100, "Exc200", "Bloody Baptism", 20, 4, "Marauder"),
    (110101, "Exc300", "Two-man Crew", 30, 4, "Marauder"),
    (110102, "Exc306", "Captain's Orders", 36, 4, "Marauder"),
]

# (quest_id, seq, meaning, owner, next_step)
SEQUENCES = [
    (110060, -1, "Offer at Gagaruna (1000862)", "Gagaruna", 0),
    (110060, 0, "Talk to Titinin (Platinum Ledger handoff msg)", "Titinin", 5),
    (110060, 5, "Talk to Esperaunce 3 times (counters)", "Esperaunce", 10),
    (110060, 10, "Private-area: collect 5 Shiny Chips, then Esperaunce", "coin triggers/Esperaunce", 15),
    (110060, 15, "Wise Miser pay/decline (paid==1 advances)", "Naida Zamaida", 25),
    (110060, 25, "PGL guild-entrance trigger (Lewena)", "trigger 1090042", 30),
    (110060, 30, "Singleton: enter private Toothless Gladiator fight", "Singleton", 35),
    (110060, 35, "Return to Titinin (reward, counter=1)", "Titinin", "done"),
    (110061, -1, "Offer at Gagaruna (1000862)", "Gagaruna", 1),
    (110061, 1, "Astalicia/Waekbyrt handoff (pgl30020)", "Waekbyrt 1000003", 2),
    (110061, 2, "Mytesyn/ship-object handoff + pre-fight scene", "Mytesyn 1000167", 10),
    (110061, 10, "Private 5x Kraken Deckhand fight (director-owned)", "content", 20),
    (110061, 20, "Titinin report + payment-pending continuation", "Titinin 1000934", 21),
    (110061, 21, "Echo on Hurrey (ask-gated)", "Hurrey 1000603", 22),
    (110061, 22, "Echo on Melisie (ask-gated)", "Melisie 1001009", 23),
    (110061, 23, "Echo on Halstein (ask-gated)", "Halstein 1001007", 24),
    (110061, 24, "Gagaruna reward boundary (processEvent090)", "Gagaruna", "done"),
    (110062, -1, "Offer at Gagaruna (1000862)", "Gagaruna", 1),
    (110062, 1, "Hurrey/handmaiden Echo entrance scene", "Hurrey 1000603", 2),
    (110062, 2, "Echo gate ask 51030 (0 holds step)", "1001013", 3),
    (110062, 3, "Silver Bazaar push trigger + Echo gate", "trigger 1000174", 10),
    (110062, 10, "Private 2x Ossuary Almstaker fight (director-owned)", "content", 20),
    (110062, 20, "Lewena aftermath (pays thaumaturge, asks time)", "Titinin 1000934", 21),
    (110062, 21, "Titinin report", "Titinin 1000934", 22),
    (110062, 22, "Gagaruna scene 070", "Gagaruna", 23),
    (110062, 23, "Gagaruna final/reward (processEvent090)", "Gagaruna", "done"),
    (110080, -1, "Offer at Lulutsu (1000863)", "Lulutsu", 0),
    (110080, 0, "Lulutsu retry point / battle launch", "Lulutsu", 10),
    (110080, 10, "Private Ala Mhigan challenger fight (director-owned)", "content", 20),
    (110080, 20, "Lulutsu post-fight scene (gla20020)", "Lulutsu", 30),
    (110080, 30, "Lulutsu reward (gla20030)", "Lulutsu", "done"),
    (110081, -1, "Offer at Lulutsu (1000863)", "Lulutsu", 1),
    (110081, 1, "Gridania/Miounne waypoint scene", "Miounne 1000230", 2),
    (110081, 2, "Willelda spar choice (decline holds) + pre-fight", "Willelda 1000242", 10),
    (110081, 10, "Private J'moldva fight (director-owned)", "content", 20),
    (110081, 20, "J'moldva Echo + linkpearl handoff (same talk)", "J'moldva 1000599", 21),
    (110081, 21, "Lulutsu scene 055", "Lulutsu", 22),
    (110081, 22, "Yoyobina Echo (ask-gated) + aftermath", "Yoyobina 1001076", 23),
    (110081, 23, "Yoyobina talk 070 (pure say chain)", "Yoyobina", 24),
    (110081, 24, "Yoyobina talk 080 (pure say chain)", "Yoyobina", 25),
    (110081, 25, "Lulutsu reward (processEvent090)", "Lulutsu", "done"),
    (110082, -1, "Offer at Lulutsu (1000863)", "Lulutsu", 1),
    (110082, 1, "Yoyobina Coliseum briefing", "Yoyobina 1001076", 2),
    (110082, 2, "Yoyobina ready check (decline holds)", "Yoyobina", 10),
    (110082, 10, "Private Ala Mhigan challenger fight (director-owned)", "content", 20),
    (110082, 20, "Lulutsu final report/reward (055)", "Lulutsu", 30),
    (110082, 30, "Authoritative completion handshake", "Lulutsu", "done"),
    (110100, -1, "Offer at Waekbyrt (1000003)", "Waekbyrt", 1),
    (110100, 1, "Nunuba briefing (result-gated)", "Nunuba 1000004", 10),
    (110100, 10, "Private Swiftperch Tower fight (director-owned)", "content", 20),
    (110100, 20, "Nunuba report + aftermath, then reward (050)", "Nunuba", "done"),
    (110101, -1, "Offer at Waekbyrt (1000003)", "Waekbyrt", 0),
    (110101, 0, "Rostnsthal briefing (result-gated)", "Rostnsthal 1001652", 5),
    (110101, 5, "Steal valuables, none collected", "triggers 1090199", 7),
    (110101, 7, "Steal valuables, one collected", "triggers 1090199", 8),
    (110101, 8, "Steal valuables, two collected", "triggers 1090199", 9),
    (110101, 9, "Steal valuables, three collected", "triggers 1090199", 10),
    (110101, 10, "Steal valuables, four collected", "triggers 1090199", "11>12"),
    (110101, 11, "All five collected (transient, same talk)", "content", 12),
    (110101, 12, "Report to Rostnsthal", "Rostnsthal", 15),
    (110101, 15, "Sell loot to Rorojaru (Ship Funds grant)", "Rorojaru 1000374", 16),
    (110101, 16, "Waekbyrt reward (funds consumed, 3420 EXP)", "Waekbyrt", "done"),
    (110102, -1, "Offer at Waekbyrt (1000003)", "Waekbyrt", 0),
    (110102, 0, "Push captain's-quarters door -> survival duty", "door exc306_quarters_door", 1),
    (110102, 1, "Unwinnable first attack (survive 300s, internal)", "content", 2),
    (110102, 2, "Check rum barrel (register grant, internal)", "barrel exc306_warehouse_barrel", 5),
    (110102, 5, "Waekbyrt warning", "Waekbyrt", 10),
    (110102, 10, "Lounge confrontation trigger", "trigger exc306_lounge_trigger", 15),
    (110102, 15, "Deck oath + register handoff", "Rostnsthal", 20),
    (110102, 20, "Waekbyrt routing talk", "Waekbyrt", 25),
    (110102, 25, "Push rematch doors -> winning rematch", "door exc306_quarters_door", 26),
    (110102, 26, "Rematch vs Moenskaet + hands (internal)", "content", 30),
    (110102, 30, "Rostnsthal report + Echo (ask-gated)", "Rostnsthal", 35),
    (110102, 35, "Waekbyrt reward (4720 EXP)", "Waekbyrt", "done"),
]

# (quest_id, event, scene, role, wired)
EVENTS = [
    (110060, "processEventGagarunaStart", "-", "offer", "wired"),
    (110060, "processEvent010", "-", "Titinin debt cutscene", "wired"),
    (110060, "processEvent020", "-", "Esperaunce gil-throw (3rd talk)", "wired"),
    (110060, "processEvent020_2", "-", "Esperaunce completion", "wired"),
    (110060, "processEvent030", "-", "Esperaunce leaving", "wired"),
    (110060, "processEvent040", "-", "Wise Miser pay/decline ask", "wired"),
    (110060, "processEvent050", "-", "PGL entrance/Lewena", "wired"),
    (110060, "processEvent060", "-", "duty entry confirm", "wired"),
    (110060, "processEvent070", "-", "Titinin reward", "wired"),
    (110060, "processEvent005_2..005_8", "-", "guild ambient talks", "wired"),
    (110060, "processEvent010_2..010_5", "-", "Ul'dah ambient talks", "wired"),
    (110060, "processEvent060_2..060_8", "-", "post-fight ambient talks", "wired"),
    (110061, "processEventGagarunaStart", "-", "offer", "wired"),
    (110061, "processEvent020", "pgl30020", "Waekbyrt handoff", "wired"),
    (110061, "processEvent025", "-", "Mytesyn handoff", "wired"),
    (110061, "processEvent030", "-", "pre-fight scene (afterEvent)", "wired"),
    (110061, "processEvent040", "-", "Titinin report", "wired"),
    (110061, "processEvent050", "-", "payment-pending continuation", "wired"),
    (110061, "processEvent060", "-", "Hurrey Echo (requiredResult 1)", "wired"),
    (110061, "processEvent070", "-", "Melisie Echo (requiredResult 1)", "wired"),
    (110061, "processEvent080", "-", "Halstein Echo (requiredResult 1)", "wired"),
    (110061, "processEvent090", "-", "Gagaruna reward boundary", "wired"),
    (110062, "processEventGagarunaStart", "-", "offer", "wired"),
    (110062, "processEvent020", "-", "Hurrey/handmaiden entrance", "wired"),
    (110062, "processEvent030", "-", "Echo gate ask 51030", "wired"),
    (110062, "processEvent030_2", "-", "after-warp twin (unbound by design)", "unbound"),
    (110062, "processEvent040", "-", "Silver Bazaar push Echo gate", "wired"),
    (110062, "processEvent040_2", "-", "after-warp twin (unbound by design)", "unbound"),
    (110062, "processEvent050", "pgl30650", "Lewena aftermath", "wired"),
    (110062, "processEvent060", "pgl30660", "Titinin report", "wired"),
    (110062, "processEvent070", "-", "Gagaruna scene", "wired"),
    (110062, "processEvent080", "-", "Gagaruna scene 2", "wired"),
    (110062, "processEvent090", "-", "reward boundary", "wired"),
    (110080, "processEventLulutsuStart", "-", "offer", "wired"),
    (110080, "processEvent010", "gla20010", "duty entry scene (preEvent)", "wired"),
    (110080, "processEvent020", "gla20020", "post-fight scene", "wired"),
    (110080, "processEvent030", "gla20030", "reward scene", "wired"),
    (110081, "processEventLulutsuStart", "-", "offer", "wired"),
    (110081, "processEvent020", "-", "Gridania waypoint scene", "wired"),
    (110081, "processEvent025", "-", "Willelda spar choice (requiredResult 1)", "wired"),
    (110081, "processEvent030", "-", "pre-fight scene (afterEvent)", "wired"),
    (110081, "processEvent040", "-", "J'moldva Echo", "wired"),
    (110081, "processEvent050", "-", "linkpearl handoff (afterEvent)", "wired"),
    (110081, "processEvent055", "-", "Lulutsu scene", "wired"),
    (110081, "processEvent065", "-", "Yoyobina Echo (requiredResult 1)", "wired"),
    (110081, "processEvent070", "-", "Yoyobina talk (no gate)", "wired"),
    (110081, "processEvent080", "-", "Yoyobina talk (no gate)", "wired"),
    (110081, "processEvent090", "-", "Lulutsu reward boundary", "wired"),
    (110082, "processEventLulutsuStart", "-", "offer", "wired"),
    (110082, "processEvent003", "-", "Yoyobina briefing", "wired"),
    (110082, "processEvent005", "-", "Yoyobina ready check (requiredResult 1)", "wired"),
    (110082, "processEvent010", "gla30610", "battle lead-in (preEvent)", "wired"),
    (110082, "processEvent055", "-", "Lulutsu final report/reward", "wired"),
    (110082, "processEvent020/023/024/025/030/040/045/050", "gla30620..50", "Coliseum/refugee chain (no content owner yet)", "unbound"),
    (110100, "processEventWaekbyrtStart", "-", "offer", "wired"),
    (110100, "processEvent015", "-", "Nunuba briefing (requiredResult 1)", "wired"),
    (110100, "processEvent020", "-", "battle handoff (preEvent)", "wired"),
    (110100, "processEvent030", "-", "post-fight scene", "wired"),
    (110100, "processEvent040", "-", "post-fight continuation", "wired"),
    (110100, "processEvent050", "-", "reward boundary", "wired"),
    (110101, "processEventWaekbyrtStart", "exc30010", "offer", "wired"),
    (110101, "processEvent020", "exc30020", "Rostnsthal briefing (result-gated)", "wired"),
    (110101, "trialObject", "-", "pickup flavor variants 1-3", "wired"),
    (110101, "processEvent022", "-", "Rostnsthal report (pure say)", "wired"),
    (110101, "processEvent025", "-", "Rorojaru sale (pure say)", "wired"),
    (110101, "processEvent030", "exc30030", "Waekbyrt reward", "wired"),
    (110101, "processEvent010_2..010_14/020_2..020_7/022_2..023_7/025_2..025_9", "-", "ambient talks, owners unrecovered", "unbound"),
    (110102, "processEventWaekbyrtStart", "-", "offer", "wired"),
    (110102, "processEvent010", "exc30610", "quarters scene (in-instance)", "wired"),
    (110102, "processEvent020", "exc30620", "barrel/Rostnsthal recovery", "wired"),
    (110102, "processEvent035", "-", "Waekbyrt warning", "wired"),
    (110102, "processEvent040", "exc30640", "lounge confrontation", "wired"),
    (110102, "processEvent050", "exc30650", "deck oath + register handoff", "wired"),
    (110102, "processEvent060", "exc30660", "post-rematch report", "wired"),
    (110102, "processEvent070", "exc30670", "Echo ask 51030 (nil/1 advances)", "wired"),
    (110102, "processEvent080", "-", "Waekbyrt reward", "wired"),
    (110102, "processEvent030/033/000/111/112", "-", "ambient, owners unrecovered", "unbound"),
]

# (quest_id, actor_class, display_id, role, source)
ACTORS = [
    (110060, 1000862, "-", "Gagaruna offer", "bespoke"),
    (110060, 1000934, "-", "Titinin", "bespoke"),
    (110060, 1000954, "-", "Esperaunce", "bespoke"),
    (110060, 1000952, "-", "Sultry Strumpet", "bespoke"),
    (110060, 1000953, "-", "Beauteous Beauty", "bespoke"),
    (110060, 1000955, "-", "Naida Zamaida (Wise Miser)", "bespoke"),
    (110060, 1001445, "-", "Singleton (duty entry)", "bespoke"),
    (110060, 1090058, "-", "GSM private-area trigger", "bespoke"),
    (110060, 1090042, "-", "PGL guild trigger", "bespoke"),
    (110060, 1290002, "-", "private-area exit", "bespoke"),
    (110060, 1090199, "-", "5 coin pickups (uniqueIds pgl200_coin_1..5)", "bespoke"),
    (110060, 1001009, "-", "Melisie (ambient)", "bespoke"),
    (110060, 1001256, "-", "Gunnulf (ambient)", "bespoke"),
    (110060, 1001012, "-", "Shamani (ambient)", "bespoke"),
    (110060, 1001007, "-", "Halstein (ambient)", "bespoke"),
    (110060, 1001257, "-", "Heibert (ambient)", "bespoke"),
    (110060, 1001260, "-", "Ipaghlo (ambient)", "bespoke"),
    (110061, 1000862, "-", "Gagaruna offer/reward", "template"),
    (110061, 1000003, "1600217", "Waekbyrt", "template"),
    (110061, 1000167, "1600123", "Mytesyn waypoint", "template"),
    (110061, 1000934, "1400021", "Titinin report", "template"),
    (110061, 1000603, "2200172", "Hurrey Echo + placement row", "template"),
    (110061, 1001009, "1300104", "Melisie Echo", "template"),
    (110061, 1001007, "1000134", "Halstein Echo", "template"),
    (110062, 1000862, "1400019", "Gagaruna offer/reward", "template"),
    (110062, 1000603, "2200172", "Hurrey entrance", "template"),
    (110062, 1001013, "4000515", "Echo gate actor", "template"),
    (110062, 1000174, "4000257", "Silver Bazaar push trigger (scaffold Y)", "template"),
    (110062, 1000934, "1400021", "Titinin aftermath/report", "template"),
    (110080, 1000863, "1500022", "Lulutsu offer/fight/reward", "template"),
    (110081, 1000863, "1500022", "Lulutsu offer/reward", "template"),
    (110081, 1000230, "1300018", "Miounne waypoint (Yoyobina stand-in)", "template"),
    (110081, 1000242, "1100014", "Willelda spar choice", "template"),
    (110081, 1000599, "1900046", "J'moldva Echo", "template"),
    (110081, 1001076, "1400023", "Yoyobina Echo + talks", "template"),
    (110082, 1000863, "1500022", "Lulutsu offer/reward", "template"),
    (110082, 1001076, "1400023", "Yoyobina briefing/ready", "template"),
    (110100, 1000003, "1600217", "Waekbyrt offer", "template"),
    (110100, 1000004, "1500015", "Nunuba briefing/report/reward", "template"),
    (110101, 1000003, "1600217", "Waekbyrt offer/reward", "bespoke"),
    (110101, 1001652, "1600150", "Rostnsthal briefing/report", "bespoke"),
    (110101, 1000374, "1400067", "Rorojaru sale", "bespoke"),
    (110101, 1090199, "-", "5 valuables (uniqueIds exc300_valuable_1..5)", "bespoke"),
    (110102, 1000003, "1600217", "Waekbyrt offer/warning/reward", "bespoke"),
    (110102, 1001652, "1600150", "Rostnsthal deck/report", "bespoke"),
    (110102, 1090199, "-", "quarters door / lounge trigger / barrel (uid-keyed)", "bespoke"),
]

# (quest_id, wave, actor_class, mob_type, display_name, unique_id, mechanic,
#  evidence_source) — evidence_source is a short key; full source log
# (URLs, dates, timestamps) lives in the pack doc §14 video-evidence addendum.
FIGHTS = [
    (110060, 1, 2289013, 3108, "toothless gladiator", "pgl200_toothless_gladiator", "single kill; director returns to seq 35; retry at Singleton", "bespoke pgl200.lua + meteor-wiki s20"),
    (110061, 1, 2280217, 3066, "Kraken Deckhand", "pgl300_kraken_deckhand_1..5 (x5)", "5x lv-25 deckhands; requireAllTargets; retry seq 0; mold stays corpse loot", "ge-walkthrough 5x lv25 + mob3066/SQL"),
    (110062, 1, 2289014, 3079, "Ossuary Almstaker", "pgl306_ossuary_almstaker_1..2 (x2)", "2x almstakers; requireAllTargets; Hurrey assist unimplemented; retry seq 0", "ge-walkthrough 2x + mob3079/SQL"),
    (110080, 1, 2289006, 3034, "Ala Mhigan challenger", "gla200_ala_mhigan_challenger", "single kill + gla20010 entry scene; retry seq 0", "ge-walkthrough single challenger + scenario scenes"),
    (110081, 1, 2289009, 3062, "J'moldva", "gla300_j_moldva", "single kill; retry seq 0", "ge-walkthrough single J'moldva (lancer) + template"),
    (110082, 1, 2289007, 3035, "Ala Mhigan challenger", "gla306_ala_mhigan_challenger", "single kill + gla30610 lead-in; observed bladedancer 2289010 stays scene-only", "template safe slice; ge-walkthrough confirms unbound Echo chain order (HOLD)"),
    (110100, 1, 2204003, 3129, "Tower Lemming", "exc200_tower_lemming_1..7 (x7)", "single wave of 8 incl. Lord; requireAllTargets", "ge-walkthrough handful+Lord + DAT actors + mob3129"),
    (110100, 1, 2204004, 3130, "Lord of Swiftperch", "exc200_lord_of_swiftperch", "counts as 1 of 8 kills", "ge-walkthrough lv20 Lord + DAT actor + mob3130"),
    (110101, 0, 0, 0, "(no battle; collection route)", "-", "5 distinct pickups + sale; no duty", "bespoke exc300.lua + meteor-wiki s27; ge-walkthrough stealth variant unrecovered (HOLD)"),
    (110102, 1, 2289004, 32743, "Moenskaet the Honorbound", "exc306_moenskaet_survival", "SURVIVE 300s (kill also advances); death retries at door", "bespoke exc306.lua + ge-walkthrough 5-min survive"),
    (110102, 2, 2289005, 32744, "Moenskaet the Honorbound", "exc306_moenskaet_rematch", "rematch: all 3 must fall; register consumed", "bespoke exc306.lua + ge-walkthrough 1+2 rematch"),
    (110102, 2, 2280219, 32745, "Moenskaet's right hand", "exc306_moenskaets_right_hand", "rematch add", "bespoke exc306.lua + ge-walkthrough"),
    (110102, 2, 2280220, 32746, "Moenskaet's left hand", "exc306_moenskaets_left_hand", "rematch add", "bespoke exc306.lua + ge-walkthrough"),
]

# Per-quest evidence key for sequences.csv (short keys; full source log with
# URLs/dates lives in the pack doc §14 video-evidence addendum).
SEQ_SOURCES = {
    110060: "meteor-wiki s20 + bespoke pgl200.lua",
    110061: "meteor-wiki s21 + template Pgl300 + ge-walkthrough",
    110062: "meteor-wiki s22 + template Pgl306 + ge-walkthrough",
    110080: "meteor-wiki s23 + template Gla200 + ge-walkthrough",
    110081: "meteor-wiki s24 + template Gla300 + ge-walkthrough",
    110082: "meteor-wiki s25 + template Gla306 safe slice + ge-walkthrough/journal",
    110100: "meteor-wiki s26 + template Exc200 + ge-walkthrough",
    110101: "meteor-wiki s27 + bespoke exc300.lua + scenario ==1 gate + ge-walkthrough (flow)",
    110102: "meteor-wiki s28 + bespoke exc306.lua + ge-walkthrough",
}

# (quest_id, kind, ref, count, source, note)
REWARDS = [
    (110060, "Gil", 1000001, 20000, "central", "wiki"),
    (110060, "Currency", 1000101, 2000, "central", "dat-old pugilist marks"),
    (110060, "Item", 4020208, 1, "central", "dat-old Spiked Knuckles"),
    (110060, "Exp", 0, 1760, "central", "Lua plays sqrwa only; no AddExp (no double-pay)"),
    (110061, "Gil", 1000001, 30000, "central", "wiki"),
    (110061, "Currency", 1000101, 3000, "central", "dat-old pugilist marks"),
    (110061, "Exp", 0, 3420, "lua", "template sqrwa + AddExp"),
    (110062, "Gil", 1000001, 36000, "central", "wiki"),
    (110062, "Currency", 1000101, 3600, "central", "dat-old pugilist marks"),
    (110062, "Exp", 0, 4720, "lua", "template sqrwa + AddExp"),
    (110080, "Gil", 1000001, 20000, "central", "wiki"),
    (110080, "Currency", 1000102, 2000, "central", "dat-old gladiator marks"),
    (110080, "Item", 4030203, 1, "lua", "template grantItems"),
    (110080, "Exp", 0, 1760, "lua", "template sqrwa + AddExp"),
    (110081, "Gil", 1000001, 30000, "central", "wiki"),
    (110081, "Currency", 1000102, 3000, "central", "dat-old gladiator marks"),
    (110081, "Exp", 0, 3420, "lua", "template sqrwa + AddExp"),
    (110082, "Gil", 1000001, 36000, "central", "wiki"),
    (110082, "Currency", 1000102, 3600, "central", "dat-old gladiator marks"),
    (110082, "Exp", 0, 4720, "lua", "template sqrwa + AddExp"),
    (110100, "Gil", 1000001, 20000, "central", "wiki"),
    (110100, "Currency", 1000103, 2000, "central", "dat-old marauder marks"),
    (110100, "Item", 4040405, 1, "lua", "template grantItems"),
    (110100, "Exp", 0, 1760, "lua", "template sqrwa + AddExp"),
    (110101, "Gil", 1000001, 24000, "central", "wiki"),
    (110101, "Currency", 1000103, 2400, "central", "dat-old marauder marks"),
    (110101, "Exp", 0, 3420, "lua", "bespoke sqrwa + AddExp"),
    (110102, "Gil", 1000001, 36000, "central", "wiki"),
    (110102, "Currency", 1000103, 3600, "central", "dat-old marauder marks"),
    (110102, "Exp", 0, 4720, "lua", "bespoke sqrwa + AddExp"),
]


def parse_markers():
    rows = []
    for line in (MEMORY / "docs" / "Dat Mining" / "quest_marker.csv").read_text(encoding="utf-8").splitlines():
        if not line[:6].isdigit():
            continue
        parts = line.split(",")
        try:
            mid = int(parts[0])
        except ValueError:
            continue
        qid = mid // 100
        if qid not in {110060, 110061, 110062, 110080, 110081, 110082, 110100, 110101, 110102}:
            continue
        # kind is parts[12] (MapMarkerQuest = live row, MapMarker = filler
        # aliasing @5208/i11000101); the mid%100 range is a second opinion only.
        kind = parts[12] if len(parts) > 12 else ""
        live_by_kind = kind.strip() == "MapMarkerQuest"
        seqnum = mid % 100
        live_by_range = {
            110060: seqnum <= 8, 110061: seqnum <= 8, 110062: seqnum <= 6,
            110080: seqnum <= 2, 110081: seqnum <= 9, 110082: seqnum <= 9,
            110100: seqnum <= 3, 110101: seqnum <= 6, 110102: seqnum <= 11,
        }[qid]
        filler = not (live_by_kind and live_by_range)
        rows.append({
            "marker_id": mid,
            "quest_id": qid,
            "x": parts[3] if len(parts) > 3 else "",
            "z": parts[4] if len(parts) > 4 else "",
            "display_id": parts[5] if len(parts) > 5 else "",
            "map_region": parts[10] if len(parts) > 10 else "",
            "map_area": parts[11] if len(parts) > 11 else "",
            "kind": kind.strip(),
            "status": "filler" if filler else "live",
        })
    rows.sort(key=lambda r: r["marker_id"])
    return rows


def parse_mob_levels():
    levels = {}
    for line in (MEMORY / "Data" / "sql" / "server_battlenpc_mob_types.sql").read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("("):
            continue
        cells = [c.strip() for c in line.strip("();").split(",")]
        if len(cells) < 41:
            continue
        try:
            mob = int(cells[0])
        except ValueError:
            continue
        if mob in {3034, 3035, 3062, 3066, 3079, 3108, 3129, 3130, 32743, 32744, 32745, 32746}:
            levels[mob] = {"min": cells[13], "max": cells[14], "skills": cells[38], "name": cells[2].strip("'")}
    return levels


def write_csv(name, rows, fields):
    OUT.mkdir(parents=True, exist_ok=True)
    with open(OUT / name, "w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)
    print(f"wrote {name}: {len(rows)} rows")


def main():
    qname = {qid: (code, title) for qid, code, title, _, _, _ in QUESTS}
    write_csv("sequences.csv",
              [{"quest_id": q, "code": qname[q][0], "seq": s, "meaning": m, "owner": o, "next": n,
                "evidence_source": SEQ_SOURCES[q]}
               for q, s, m, o, n in SEQUENCES],
              ["quest_id", "code", "seq", "meaning", "owner", "next", "evidence_source"])
    write_csv("process_events.csv",
              [{"quest_id": q, "code": qname[q][0], "event": e, "scene": sc, "role": r, "wired": w}
               for q, e, sc, r, w in EVENTS],
              ["quest_id", "code", "event", "scene", "role", "wired"])
    write_csv("markers.csv", parse_markers(),
              ["marker_id", "quest_id", "x", "z", "display_id", "map_region", "map_area", "kind", "status"])
    write_csv("actors.csv",
              [{"quest_id": q, "code": qname[q][0], "actor_class": a, "display_id": d, "role": r, "source": s}
               for q, a, d, r, s in ACTORS],
              ["quest_id", "code", "actor_class", "display_id", "role", "source"])
    mobinfo = parse_mob_levels()
    fight_rows = []
    for q, wave, actor, mob, name, uid, mech, src in FIGHTS:
        info = mobinfo.get(mob, {})
        fight_rows.append({"quest_id": q, "code": qname[q][0], "wave": wave, "actor_class": actor,
                           "mob_type": mob, "level_min": info.get("min", ""), "level_max": info.get("max", ""),
                           "skill_list": info.get("skills", ""), "display_name": name,
                           "unique_id": uid, "mechanic": mech, "evidence_source": src})
    write_csv("fight_waves.csv", fight_rows,
              ["quest_id", "code", "wave", "actor_class", "mob_type", "level_min", "level_max",
               "skill_list", "display_name", "unique_id", "mechanic", "evidence_source"])
    write_csv("rewards.csv",
              [{"quest_id": q, "code": qname[q][0], "kind": k, "ref": r, "count": c, "source": s, "note": n}
               for q, k, r, c, s, n in REWARDS],
              ["quest_id", "code", "kind", "ref", "count", "source", "note"])


if __name__ == "__main__":
    main()
