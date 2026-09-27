# Fsh300 - The Beast of the Barrel (110501) - VERIFIED (HOLD-gated)

- SQL (VERIFIED): `(110501, 'The Beast of the Barrel', 'Fsh300', 110500, 30)`.
- Availability (VERIFIED): disabled (commented). Script HOLD gate
  `FSH300_OFFER_ENABLED = false` independently blocks offer.
- Script: `Data/scripts/quests/fsh/fsh300.lua`. Fully routed bespoke
  implementation; HOLD-gated, not offered.

## Sequence flow (VERIFIED, recovered numbering 0/5/10/15/20/22/25/30/35/40/45)

- 0 Sisipu start (1000155): `processEvent010`, grants Barrel Feed (11000025),
  -> 5.
- 5 Rerenasu outbound (1000201): boat leg (`processEvent010_1001`) consumes
  feed on arrival, `processEvent020` -> 10. Without dev bypass the leg holds
  (no Barrel coords). VERIFIED fail-closed.
- 10 Barrel push (1000174 Wawlago): `processEvent025` + `processEvent030`,
  grants Wawlago Message (11000133) -> 15 (Rorojaru, 1000374).
- 15 Rorojaru: `processEvent040`, consumes message, grants Star-Spangled
  Subligar (8050521, legs slot 12) -> 20.
- 20 equip + return (AUTHORED reading of a journal-only state): Rorojaru
  re-issues a lost subligar; Rerenasu requires it equipped, then boat leg
  (`processEvent010_1002`) -> 22. NOTE (this phase): `player:HasItemEquippedInSlot`
  uses dot-form; the whole repo (including live command scripts) uses
  dot-form for this binding, so this is consistent, not a bug.
- 22 emote rounds at Barrel: 4 ordered rounds, flags 0-3, any client emote
  trigger accepted per round (AUTHORED: exact per-round emote identity binding
  awaits client trigger capture) -> 25.
- 25 Barrel catch: needs the C# `onFishCatch` fanout (any-species gain cannot
  be item-probed); location unenforced until Barrel coords exist -> 30.
- 30/35 Sisipu: `processEvent050` -> `processEvent060` -> 40.
- 40 Sisipu Echo: `processEvent070` requires result `== 1`
  (`FshEchoAccepted`) -> 45.
- 45 N'nmulika report: `processEvent075`, `sqrwa` EXP, single CompleteQuest,
  `AddExp(3420)`.
- `onFinish`: removes Barrel Feed + Wawlago Message leftovers; subligar
  retained. Dev bypass `FSH300_DEV_BYPASS` default false, GM testing only.

## Delegate events (VERIFIED)

Listed above. Ask/echo scenes gate on explicit result `== 1`.

## ENPC IDs (VERIFIED)

N'nmulika 1000153 (public row 325), Sisipu 1000155, Rerenasu 1000201 (row
348), Wawlago Barrel 1000174 (push trigger), Rorojaru 1000374 (row 43).

## Spawn evidence update (this phase, VERIFIED)

- Sisipu: private `man0l1_fsh_sisipu` (row 2051) PLUS public row 3329
  (`fsh306_sisipu`, zone 230, -620.82, 4.25, 354.55, in the guild
  neighborhood). The script header's "no public Sisipu" note is therefore
  partially stale: a same-zone public Sisipu exists, but whether its position
  satisfies states 0/30/35/40 is unverified, and the Barrel boat-travel
  blocker is independent. HOLD unchanged.

## Markers (RECOVERED)

11050101/02 (Sisipu/Rerenasu), 11050103/04 (Barrel), 11050105 (Rorojaru),
11050109/10/08 (mid/late/echo Sisipu), 11050111 (report). State-20 reuses
11050102 (AUTHORED, marked).

## Counters/flags (VERIFIED)

Flags 0-3 emote rounds, flag 4 Barrel catch. No counters.

## Journal hooks (VERIFIED)

Emote rounds `(seq, done, 0,0,4)`; catch `(seq, caught, 0,0,1)`; else
`(seq,0,0,0,0)`. Markers per state above.

## Gather/delivery mechanics (VERIFIED)

Feed/message/subligar are verified grants (`FshGrantVerified`); feed consumed
on arrival; message consumed at Rorojaru; subligar equipped-gated, retained.
Emote/catch credit via flags. No gathering nodes involved (boat + push +
emote + catch).

## Rewards (VERIFIED)

Script EXP 3420 (post-1.20 maximum per header). Central: 30000 gil + 3000
marks. No double-grant.

## Prereq chain

Fisher 30 + 110500 completed (enforced in-script via `fsh300_qualified`).
Feeds Fsh306.

## Kills

None. No BNPC surface needed.
