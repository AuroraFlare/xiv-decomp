# 00 — Guildleves 1.0 overview: how the system works

All statements here are VERIFIED unless tagged. Sources: [SOURCES.md](SOURCES.md).

## 1. What a guildleve is

- A guildleve is a small rectangular plate of **stained crystal in a precious
  metal frame**, each depicting a virtuous deed of one of Eorzea's patron
  saints ("guardians"). Bearing one grants "leave" to do what the job needs:
  enter restricted areas, hunt/harvest on private land, confiscate goods, even
  parley with enemies of the city-states. [Fandom 1.0]
- The plate itself carries only the **issuing city-state name and the leve's
  "theme"**; everything else (objectives, location, rewards) comes from the
  counter NPC at the Adventurers' Guild. [Fandom 1.0]
- Plates resonate with **aetheryte/aetherial gates** (both are manifestations
  of the planet's aether): starting a regional leve at a camp aetheryte opens
  the job, and resonating again on completion opens an **aetherial node** to
  return with. City-state duties that need no node still perform the
  resonance as a "wish" for safe return. [Fandom 1.0]

## 2. Regional vs Local (the two counters)

At the Adventurers' Guild there are **two different people to speak to**
[Fandom 1.0]:

| Counter | Leve family | Who it's for | Where it happens |
|---|---|---|---|
| Regional | **Battlecraft** (combat) + **Fieldcraft** (gathering) | Disciples of War/Magic (Battlecraft), Disciples of Land (Fieldcraft) | Out in the field, started at a camp aetheryte / aetherial gate |
| Local | **Handcraft** ("local levequests") | Disciples of the Hand (crafters) | Craft anywhere + deliver to an NPC (town or camp, almost always safe) |

- Local-leve crafted items **cost the player nothing, take no inventory
  space, and can't be equipped or sold** to anyone but the stated NPC.
  [GameSpot primer]
- Regional leves are further split into **Battlecraft** (kill/do objectives)
  and **Fieldcraft** (gather). Completing them earns **faction favor**
  (see file 40). [GameSpot primer]

## 3. Leve allowances (the currency)

- You spend **leve allowances** to accept guildleves from Adventurers' Guilds
  (company leves from company officers also cost allowances — file 10).
- Late-1.0 rule: **+4 allowances every 12 hours Earth time, cap 99**.
  [Fandom 1.0]
- Era note: the allowance rate/cap changed across patches (launch-era
  allowances behaved differently, commonly remembered as 8 per ~36h in early
  guides). Treat any single number as era-specific; the +4/12h/99 rule is the
  documented late-1.0 state.
- **Failed guildleves can be retried on the spot, but the retry costs another
  allowance.** [Fandom 1.0]

## 4. Accepting and starting a leve

**Regional (Battlecraft/Fieldcraft):**

1. Pick up leves at the Adventurers' Guild counter (a guildmaster offers a
   selection from the guild's stock; you weigh risk vs reward). [Fandom 1.0]
2. Travel to the **specified camp** and select the **Aetheryte Gate**; if in
   a party you can be teleported to locations **any teammate has visited**.
   [GameSpot primer]
3. Choose the levequest, set **difficulty (1–5 stars)**, optionally apply
   **Guardian's Favor/Aspect**, then start the **30:00 timer**.
4. Complete objectives before time expires; resonate/return; Victory Fanfare
   plays on success (battle, field, and faction leves). [Fandom 1.0]

**Local (Handcraft):** accept at the counter, then either craft immediately
(Constancy — materials handed over at accept) or talk to the levequest NPC
first for materials (Ingenuity). Craft via **Quest Synthesis** at your
leisure, deliver the quota. Full loop in file 30.

## 5. Difficulty stars (regional)

- Settable **1 star (easiest) to 5 stars (hardest)** at start. [Fandom 1.0]
- Higher stars: more gil + EXP at completion, more EXP per monster — but
  stronger enemies, **including newly enabled enemy skills**. [Fandom 1.0]
- Pick difficulty for party size + rank: the period example is that a 5-star
  Camp Drybone leve wants **~15 rank-10 members** yet is trivial for a solo
  rank-30. [GameSpot primer]
- New battle sets unlock as **any class (even DoL/DoH) hits 5, 13, 23, 33**
  (level-1 leves initially); field sets unlock at DoL **15, 25, 35**; local
  sets unlock **every 5 levels**. [Fandom 1.0] (GameSpot's launch-era
  version: "new leves open every 10 ranks" — era difference, both kept.)

## 6. Guardian's Favor / Guardian's Aspect (EXP bonus)

- At leve start you may apply a **Guardian bonus that raises EXP gain**.
  [Fandom 1.0, GameSpot primer]
- Launch-era name: **Guardian's Favor** — "greatly boosts skill point
  returns"; tied to your chosen guardian deity, restoring on a **moon-phase**
  schedule. [GameSpot primer]
- Late-1.0 name: **Guardian's Aspect**. Fieldcraft nuance: on Munificence it
  buffs only the levequest item; on Piety it buffs every success.
  [Fandom 1.0]
- **Abolished in patch 1.21**, replaced by a logout-rested bonus; leve EXP
  rebalanced at the same time. [Producer Letter XXIV summary]

## 7. Party rules and leve linking

- "There are no regulations stating that tasks must be completed alone" —
  companions join freely, **only one leve is required** for the whole party
  to share its privileges, and parties can chain several members' leves into
  grand campaigns. [Fandom 1.0]
- Everyone should be **present and ready before activation**; a player who
  joins mid-mission starts the leve themselves by **returning to the
  Aetheryte Gate**. [GameSpot primer]
- Treasure-chest spawn chance during battle leves **rises with party size**.
  [Fandom 1.0]
- **Disconnect/crash = automatic leve failure.** [GameSpot primer]

## 8. Treasure coffers

- During battle and field leves, **treasure chests/coffers can spawn**
  (battle: higher chance with bigger parties). They always hold **gil** and
  sometimes items/equipment, randomly assigned to a party member's loot list
  (battle) or the player's list (field). [Fandom 1.0]

## 9. Timers

| Leve family | Timer (VERIFIED) |
|---|---|
| Battlecraft regional | **30 minutes** |
| Fieldcraft | **30 minutes** |
| Faction (battle or field) | **40 minutes** + talk to a specific NPC at start and end |
| Grand Company Promptitude | **15 minutes** (kill as many as possible) |
| Local (crafting) | No combat timer — craft at your leisure, then deliver |

## 10. Leve history evaluation ("trading in" leves)

- **Launch-era (GameSpot):** after completing — or even failing or never
  starting — a leve, you can return to a **tavern and trade leves in toward
  a future one**; traded-in completed leves strongly affect the next leve's
  rewards.
- **Late-1.0 (Fandom):** with **6–8 battle or faction leves in history**,
  ask the counter for an **evaluation** to get a new levequest with a **gil
  bonus** — bigger for multi-city-state mixes, mixed types, company leves,
  and faction leves. Highest known: **90,000 gil** (5 Coerthas faction leves
  + 3 other-city faction leves); this bonus is the only known path to the
  Lodestone achievement for 100,000 gil from one levequest.

## 11. Guild marks

- Randomly, a leve's gil reward is replaced by **Guild marks ≈ 10% of the
  gil value** (10,000 gil → ~1,000 marks). [Fandom 1.0]
- Battlecraft/fieldcraft: you **must not switch classes mid-leve** or the
  marks are forfeited. Local leves: no class-change penalty; higher
  performance rating → more likely marks. [Fandom 1.0]
- Marks appear from **level 20+** leves, only in the city-state hosting that
  class's guild (e.g. Archer marks only from Gridania leves); any class
  **10+ levels below the leve** is eligible. [Fandom 1.0]

## 12. Rewards recap

- Battlecraft/fieldcraft: always **gil or Guild Marks + treasure**.
  [Fandom 1.0]
- Local: always **gil or Guild Marks**. [Fandom 1.0]
- Faction: **more gil than same-level normal leves + Unique equipment**,
  much of it upgradeable into very strong gear. [Fandom 1.0]
- Company: primarily **company seals**. [Fandom 1.0]
- Victory Fanfare on battle/field/faction completion. [Fandom 1.0]

## 13. Patch-era notes (OPEN details)

- Faction leves arrive/update around the **Nov–Dec 2010** updates (faction
  dispatch + server-load maps). [Engadget/Massively]
- **June 2011 direction change** (Siliconera, forum thread 14828): Yoshida —
  guildleves "will no longer be central," reworked as content "for solo
  adventurers who have limited time to play a MMORPG"; team also building
  NPC quests + instanced raids for **patch 1.18**. "We still have some ways
  to go, but FFXIV will gradually shift from being a grind-centric game to
  one that offers enjoyment for all playing styles and circumstances with
  its ever-expanding variety of content."
- **Guildleve reforms** announced mid-2011 (MMORPG.com) — exact contents
  OPEN, needs the article text.
- **1.21**: Guardian's Aspect abolished, logout bonus added, leve EXP
  rebalanced. [Producer Letter XXIV]
- GameSpot primer = launch-era snapshot (Guardian's *Favor*, favor/100
  faction rule, 10-rank unlocks). Fandom 1.0 article = late-1.0 snapshot
  (Guardian's *Aspect*, +4 allowances/12h, granular unlocks). Both are kept
  and labeled because 1.0 changed under its own feet.
