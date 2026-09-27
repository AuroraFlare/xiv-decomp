# 110062 Two Sides to Every Chip (Pgl306) — in-depth decomp

Pugilist rank 36. Offer: Gagaruna (1000862), Ul'dah zone 175. Requires PUG +
level 36 (server gates; gamedata prereq 0). Walkthrough note: retail gated
behind main-scenario progress ("Fade to White" point); not enforced — OPEN.

## Sequence / route (server: pgl306.lua stub + class_quest_template `Pgl306`)

| Step | NPC / objective | Event |
|---|---|---|
| OFFER | Gagaruna `processEventGagarunaStart` → `pgl30610`, Titinin enters asking Lewena collection | offer |
| 1 | Mirage entrance: Hurrey (1000603; id 3218) + Lewena's handmaiden (1001013; zone 175, -181.81/190.0/71.35, id 3219, Y/rot scaffold); either actor may take the packet | `processEvent020` → `pgl30620` (after-warp; shared Echo setup) |
| 2 | Handmaiden Echo gate {11006203} | `processEvent030`: Echo ask 51030 → `pgl30630`; requiredResult 1, decline holds |
| 3 | Silver Bazaar plateau push trigger (1000174; zone 172, -1387.26/56.0/304.2, id 3220, Y/rot scaffold; display 4000257; walkthrough map ≈ (12,33), west-side entrance) | `processEvent040`: Echo ask → `pgl30640`; requiredResult 1, push; keyed on uniqueId |
| BATTLE (10) | Plateau: 2x Ossuary Almstaker | private battle, markers {11006204} |
| 20/21 | Titinin (1000934; id 64) | `processEvent050` (`pgl30650`, after-warp: Lewena pays thaumaturge, asks extension) + `processEvent060` (`pgl30660`, after-warp report) |
| 22/23 | Gagaruna {11006205} | `processEvent070` (`pgl30670`, after-warp) + `processEvent080` (`pgl30680`) → CompleteQuest, EXP 4720 via Lua |

`processEvent030_2/040_2` are after-warp twins of the Echo scenes; base-vs-twin
selection rule unrecovered, so the route binds base events only BY DESIGN
(playing a twin without its warp desyncs the client). Text bank 537.

## Markers (DAT; 11006207-20 filler)

11006201 guild waypoint (= PGL trigger 1090042 exact position, not a live step),
11006202 Hurrey, 11006203 Echo gate, 11006204 Silver Bazaar battle, 11006205
Gagaruna, 11006206 Titinin.

## Instance / territory

Fight: SimpleContentQuestBattle content copy `quest_sqb_pgl306_<pid>`,
boundary 45, spawn = leader pos + 4 facing. Client `QuestDirectorPgl30601`
recovered EMPTY. Re-entry disabled.

## Fight: 2x Ossuary Almstaker (lv 36)

- Actor class 2289014 / mob type 3079, uniqueIds
  `pgl306_ossuary_almstaker_1/2`, formation offsets (∓3,0) — adapter formation,
  NOT retail plateau geometry.
- Stats: speed 6, hostile, detectRange 10, job 22, lv 36/36, hpMax 0 (scaled),
  att 40, skillList **14** (only non-15 humanoid list in the pack: sonorous_blast
  23299, terrene_blast 23300, remembrance 23301, chthonic_call 23302, blaster
  23321, aerial_blast 23546/23570-23572), spellList 0.
- Director QuestDirectorClassPgl306: expected 10 → success 20 → retry 0,
  requireAllTargets. Party cap 3, 600 s. Single wave, no phases/reinforcements.
- Walkthrough: "Hurrey will assist you in this fight" — ally-combatant support
  does not exist in the private-battle shell; Hurrey stays a route actor only
  (documented gap, no invented ally AI).

## Edge handling

Template class+level gates; Echo decline-hold; trigger keyed on uniqueId;
failed launch reverts to pre-battle sequence; death/timeout/abandon/logout/DC
via gc_sqb runtime; mounted leader/members blocked pre- and post-movie; party
leader-only start, max 3, same-area/alive/combat-class checks. No level sync
(retail-accurate); no lockout beyond 600 s timer.

## Rewards

Central: gil 36000 + PUG marks 1000101x3600 (rows 39-40). Lua EXP 4720.

## Sources

Recovered client `Pgl306`, empty `QuestDirectorPgl30601`,
[Gamer Escape obsolete walkthrough](https://ffxiv.gamerescape.com/wiki/Two_Sides_to_Every_Chip)
(plateau instance at (12,33), 2x Almstakers, Hurrey assist, Lewena payoff
cutscene), DAT markers, SQL rows above. Validator
`tools/validate_pgl306_route.py` PASS.
