# Futures Perfect — Man406 (110019, Lv 46)

- Prereq: 110018. Next: Man502/504 (prereq 0 — chain break, see below).
- Availability: enabled (`110019 ... Man406`, instance).
- Accept: SEQ_ACCEPT on Minfilia (`pES` accept + same-position rebase for the
  after-warp fade, verified pattern shared with Man300).

## Sequence flow (verified)

ACCEPT → 0 (7 Resistance briefings, flags 0–6, all required before Minfilia
advances → 5) → 5 (Minfilia `pE10` → 10) → 10 (Revenants Toll trigger →
content) → 15 (pursuit; combat inside) → 20 (cave trigger `pE50` → 25 +
content finish + public return; child dialogues 1000957–1000961) → 25
(Tataru `pE60` + reward window 46000 exp + CompleteQuest + rebase).

## Pursuit + juggernaut fight (verified header + code)

- Three retreating imperials → trio + juggernaut; chained airship/Echo/cave
  scenes after.
- Entry (verified): content `man40601`/`SimpleContentMan40601` zone 190,
  boundary (-300,-830)-(340,-630), duty entry (-168.856, 18.640, -703.840);
  arrival (-218.470, 18.542, -666.627); cave recovery slot
  (265.470, 56.408, -799.867, owner-only — party disbanded, verified);
  public return (173.430, 18.700, -641.260).
- Force-combat temp branch marker (explicit one-use var, verified) so GM
  shortcuts don't infer combat from rewritten notice payloads.
- Navmesh verdict: nearest recorded node 1244 at **2.9 yalms** (Y 18.598 vs
  18.64, Δ0.04). Strong nearby support — authored Y, marked inferred.
- Director (verified exists): `Quest/QuestDirectorMan40601`.

## Delegate events (verified): `pES/pE10/pE15/pE50/pE60`,
`processEvent000_1..7/045_1..5`, reward window, SNPC preview helpers.

## ENPC IDs (verified)

Minfilia 1000843, Tataru 1001046, Resistance 1000477–1000483, children
1000957–1000961, market 1090265, Toll/cave triggers 1090191/1090192.

## Markers (verified): entry 11001901, Minfilia 11001902, Toll 11001903,
cave 11001904, Tataru 11001905, public return 11001906.

## Flags: 0–6 briefings, 7 pursuit-complete. Journal: sequence + briefing
count + SNPC nickname.

## Rewards (verified): 46000 exp award + **Goobbue mount** via onFinish
(`completed == true` + `hasGoobbue == false` guard — retail custom reward,
verified; this is a goobbue, not a chocobo — no policy conflict).

## Instance / scene surface

- NEEDED: Waking Sands office, Revenants Toll approach, pursuit field,
  airship/Echo/cave chain.
- EXISTING (verified): content + director + pursuit/combat/cave test entries +
  `finishMan406CaveVision`.

## Prior decomp references

- `docs/futures_perfect_man406_decomp_2026-07-07.md`
- `docs/futures_perfect_man406_decomp_2026-08-14.md`
- `docs/man402_man406_decomp_2026-07-07.md`
- `docs/msq_man304_308_402_406_in-depth_decomp_2026-08-17.md`
- `docs/msq_110016_110017_110018_110019_in-depth_decomp_2026_08_17.md`
- `tools/decompile_man406_cutscene_setup.py`

## Open gaps

- Imperial/juggernaut stats director-side; airship scene choreography
  client-owned; exact retail party rules beyond the 3-slot cap open.
