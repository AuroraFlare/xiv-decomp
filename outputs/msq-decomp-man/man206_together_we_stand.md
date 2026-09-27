# Together We Stand — Man206 (110014, Lv 22)

- Prereq: 110013. Next: Man300 + GC quest lines (SQL rows reference 110014).
- Availability: enabled (`110014 ... Man206`, "instance + escort").
- Accept: no SEQ_ACCEPT; onStart → SEQ_000 + LS 6 (SNPC carried over from Man200).

## Sequence flow (verified)

0 (Minfilia `processEvent001` == 1 → 5 + zone 181 move + music 39) → 5
(SNPC-pack LS → 10) → 10 (Gridania trigger `pE12` → 15) → 15 (Nine Ivies
rendezvous trigger → static content, below) → 20 (Dokixia handoff) → 25
(Flaxio handoff) → 30 (Tataru `processEvent040` + reward window +
`completeQuestWithRewards` 11000 exp/60000 gil + reposition + EndEvent).

## Escort content (verified)

- Static private area 151/past/1 with boundary square (1200,-1700)-(2400,-450);
  exclusive director `Quest/QuestDirectorMan20610` (verified exists);
  entry (1882.422, 34.153, -1018.115) rot 1.392; post-CS (1927.550, 34.356,
  -1058.200); Moonspore NPC leg (2237.857, 32.004, -1695.957);
  return (1700.337, 20.022, -866.217).
- Route keys (verified): `together_we_stand_inbound/post_cs/return`,
  `man206_moonspore_npc`; test modes per leg (inbound/post-CS/Moonspore/return).
- Entry scene `pE13` result-gated (non-1 → cancel + EndEvent, verified).
- Companion SNPC slot passed through scene args (verified helper use).
- Navmesh verdict: zone 151 entry — nearest recorded 119 yalms (node 4567).
  **No coverage (Moonspore interior).** Heights authored.

## Delegate events (verified): `processEventUdowntownrectStart/000_2..11/
001[_2..11]/010_2/012_2..7/016[_1..3]/020_2/030_2..8/040`, `pE12/pE13/pE20/pE30`,
`processEvent001_8..11` (merchant wards), reward window.

## ENPC IDs (verified)

Tataru 1001046, Minfilia 1000843, Momodi 1000841, sylphs Almxio 1001085 /
Zoxio 1001086 / Diluxio 1001178 / Dokixia 1001238 / Flaxio 1001237,
Waking Sands cast carried over, triggers 1090177/1090178/1090265/1090160–162.

## Markers: 11001401–11001407 + Waking Sands Tataru 11001303 reuse (verified);
11001408–420 header-noted spares.

## LS: pack 6 (SNPC personality packs 2–10).

## Journal hooks: `getPathCompanionJournalInfo` + unpacked sequence markers.

## Rewards (verified, single completion): 60000 gil + 11000 exp.

## Mob profiles + spawn evidence: escort opposition director-side (sylph
trickery scenes HQ client-owned); no quest-script kills; nothing invented.

## Instance / scene surface

- NEEDED: Waking Sands office, Gridania rendezvous, Nine Ivies camp,
  Moonspore Grove interior.
- EXISTING (verified): static content + exclusive director + 4 test entries.

## Prior decomp references

- `docs/together_we_stand_man206_decomp_2026-07-07.md`
- `docs/together_we_stand_man206_decomp_more_2026-07-08.md`
- `docs/msq_110012_110013_110014_in-depth_decomp_2026-08-17.md`

## Open gaps

- Garlean sentinel stealth/detection rules are director-side and unrecovered;
  podling-carry mechanics not numerically documented.
