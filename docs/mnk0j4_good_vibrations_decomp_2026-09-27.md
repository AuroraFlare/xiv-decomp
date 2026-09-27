# MNK 111224 Mnk0j4 — Good Vibrations (Lv45) — deep decomp

Target file (repo-blocked, staged here): `FF14-Decomp/docs/mnk0j4_good_vibrations_decomp_2026-09-27.md`

## Stages / sequences
- 0: Erik offer `processEventERIKStart` (4 params; arg4 unread; local fades
  pc34/0x35B + pc41/0x377; offer pc172/0x583; accept 17,18 / decline 16).
  Grants Experimental Aetheriometer 11000555 ✓.
- 5 battle: one Apep, actor 2100723 = BasiliskLesserMnk0j4/display 3100721 ✓
  actor row, level 53 (archive). **No mob profile row** → new private row
  32750 (lv53, basilisk-family list 5006 + job 4 + basilisk resists as
  explicitly-labeled adapter policy; quest-specific kit unrecovered).
- 10 reward at Erik: `onJobQuestCompleteFirst` (51125+11000555),
  `Second` (ability 27118 Dragon Kick, mode 3 — do NOT normalize to 1),
  `Third` (linkshell **2200241** event 93 = Widargelt, NOT Erik's 92).
  Instrument "shatters" = start-item removed at reward (new
  `removeItems` support; retail shows no separate break event in this chunk).
- Journal: Wil 549 (measure NW of Camp Horizon; Apep; RECOMMENDED 7 companions,
  8 total) / 550 next notice (Widargelt). Selector map exists.

## NPCs / mobs / positions
- Erik 1060033 ✓. Marker 11221301: zone 172 Western Thanalan,
  (-1670.09,-1212.10), map (10.17,18.60); 21 recorded nodes, Y≈55.6–57.3
  (`!pos 172 -1675.417 55.632 -1212.309`); no ambient mobs in selection.

## Instance / triggers / rewards
- Private content `quest_sqb_mnk0j4_<ownerId>`, cap 8 (journal recommendation),
  timeout 900s.
- Rewards: exp 5340; action 27118 ✓.

## Edge cases → guards
Single-target exact kill → 10. Wipe/timeout/disconnect/death/area-exit →
retrySequence 0 at Erik. Abandon/reacquire → start-item re-grant guarded by
HasItem; kill credit requires bound quest at 5. Party: leader-only, cap 8,
entrant validation + pre-publish recheck. Instrument dupe: RemoveItemAtSlot on
reward only if held; re-use impossible (no registry entry for 11000555).
Mounts: engine-handled. No sync (retail fixed-level; eligibility PGL/MNK45).
Cutscene: none (no skip surface).

## Amendment 2026-09-27 (MNK-B pass)

Superseding package: `quests/111224-mnk0j4-good-vibrations/` (data.json +
decomp.md + quest.md). Corrections: mob is 32761 (moved off BRD range
32750-32756; the director's stale 32750 reference is fixed in FF14-Memory
this pass — it would have spawned a brd0j1 shirrer, not Apep).
