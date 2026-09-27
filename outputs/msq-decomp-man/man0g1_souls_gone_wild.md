# Souls Gone Wild — Man0g1 (110006, Lv 1)

- Prereq: 110005 (SQL + header). Next: Man1g0.
- Availability: enabled (`110006 ... Man0g1`, "instance + escort").
- Hardening (this pass, behavior-preserving): removed duplicated
  `local data = quest:GetData()` in `getJournalMapMarkerList` (shadowed local,
  no behavior change).

## Sequence flow (verified from Lua)

| Seq | Beat |
|-----|------|
| 0 | Roost echo; Miounne → LS → SEQ_005 + public warp. |
| 5 | Attune Camp Bentbranch (parent crystal 1280062; tutorial leve 12401 journal-checked). |
| 10→12 | Miounne talks → SEQ_012 → LS → SEQ_015. |
| 15 | LTW (Hereward, counter 0) + CNJ halves (Soileine/CNJ trigger/O-App echo, counter 1 → 0..3). Both done → LS → SEQ_040. |
| 40→50 | BTN guild Opyltyl → private copy; 6-child dance lesson (flags 1–6: beckon/clap/bow/cheer/surprised/lookout). Any one success → SEQ_055 (verified `bit32.band(flags,0x7E)`). |
| 55→60 | Kids trigger → SEQ_060 + public warp; gate trigger → escort content. |
| 65 | Escort duty (director). End trigger → private stump → SEQ_070. |
| 70→71→72 | Stump scenes → SEQ_071 → SEQ_072 + zone 206 warp; BTN trigger → 3000 gil + LS → SEQ_075. |
| 75→80→85 | → SEQ_080 (Willelda → private LNC copy → SEQ_085 Burchard) → SEQ_090 (echo cast) → SEQ_095 (Nuala → LS → SEQ_100). |
| 100→105 | → SEQ_105; Miounne `processEventComplete` + `sqrwa` + CompleteQuest + 6000 gil + 200 exp. |

## Delegate events (verified sample)

`processEvent100/110/114/115/120/125/130/135/136/140/150/160/170/180/181/182/185/190/200/210/220`,
`processEvent1000_3/1000_5`, `processEventTu_001`, `contentsJoinAskInBasaClass`.
Cutscene→warp ownership comments verified (man0g100..220 series documented header-side).

## ENPC/BNPC IDs (verified)

Miounne 1000230, Hereward 1000231, Soileine 1000234, CNJ trigger 1090200,
echo cast (Yda/Papalymo/O-App-Pesi/Ingram/Hetzkin/Gugula/Biddy/Challinie),
BTN cast (Opyltyl 1000236, Fufucha 1000237, 6 kids 1000238–1000412),
triggers 1090201/1090202/1090203/1090204/1090205/1090046,
LNC cast (Willelda 1000242, Burchard 1000243/1002061, Nuala 1000681 + wounded).
No BNPC in script; escort enemies director-side (`Quest/QuestDirectorMan0g101`, verified).

## Markers (verified): 11000601–11000620.

## Counters/flags: counters 0 (LTW), 1 (CNJ); flags 1–6 emote lesson.

## Journal hooks: `getJournalInformation` (leve 12401 live check + counters x5);
full marker list.

## Rewards (verified, staged, single CompleteQuest): 2000 + 3000 + 6000 gil +
200 exp. No SQL auto-grant — no double-grant.

## Mob profiles + spawn evidence

- No quest-script kills. Escort roster director-side (inferred, not re-stated).

## Instance / scene surface

- NEEDED: Roost/CNJ/BTN/LNC echo copies, escort battlefield (zone 150 entry
  -195.221, 3.535, -1022.112 — verified), stump privates.
- EXISTING (verified): directors `QuestDirectorMan0g101` (+`Man0g001`),
  content `man0g101`, final-encounter + completion-cutscene test helpers.

## Prior decomp references

- `docs/level_8_city_main_quests_decomp_2026-07-07.md` (chain context)

## Open gaps

- Escort enemy composition director-side; emote→lesson mapping is
  archive-annotated, not retail-verified per child.
