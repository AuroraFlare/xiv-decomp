# War0j1 - Pride and Duty (Will Take You from the Mountain) (111201) - live adapter, MOB ROW ADDED - VERIFIED

- SQL (VERIFIED): `(111201, 'Pride and Duty (Will Take You from the
  Mountain)', 'War0j1', 0, 30)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter for quest
  battle"). Template `offer = true`.
- Template row (VERIFIED): Warrior 30 (base MRD 4, job 17, sub PGL 3/15).
  Route: Neale 1000090 (public row 315, zone 230, VERIFIED) -> Curious Gorge
  1060028 (public row 2483, zone 172, VERIFIED) `processEventCurious`
  @11220001 -> battle @11220002 -> Gorge reward @11220003. Rewards: EXP 2661,
  action 27186, key item 2000203, item 3020410.
- Battle (VERIFIED): private, director `Quest/QuestDirectorJobWar0j1`,
  maxParty 4, requireAllTargets, four Antling Worker copies actor 2203001
  (TermiteStandard, display 3203001) / mob 32730, ant-crawler skill family.
  Four-copy count is adapter tuning for the journal's "group" (marked); the
  empty client director exposes no count.
- Mob profile FIX (this phase, VERIFIED): mobTypeId 32730 had NO row.
  Promoted the existing `war0j1_antling_workers.sql` migration values into a
  main-SQL full row (actor 2203001; job 8, level 30, ant-crawler skill 3;
  speed/resists from public sibling antling_digger 39300; HP/MP derived;
  drops 0; provenance comment) + parity note in the migration header. No
  public Western Thanalan spawn/profile is claimed (marked).
- No central reward rows (VERIFIED zero). OPEN: retail count; public owner.

# War0j2 - Embracing the Beast (111202) - live adapter - VERIFIED

- SQL (VERIFIED): `(111202, 'Embracing the Beast', 'War0j2', 0, 35)`.
- Availability (VERIFIED): disabled ("Implemented - private adapter for
  open-world fight"). Template `offer = true`, prereq 111201.
- Template row (VERIFIED): Warrior 35. Curious Gorge start (public).
  Battle @11220101 (west of Humblehearth, Central Shroud, source-backed),
  director `Quest/QuestDirectorJobWar0j2`, maxParty 4 (recommendation total),
  single target Sirocco actor 2100309 / mob 3097.
- Mob profile (VERIFIED, this phase): row
  `(3097, 2100309, 'sirocco', ..., 42, 42, 28739, 773, ..., 6031, 0, 3097)`
  exists; skill 6031 = Sirocco NM moves (Stampede, Hoofkick). Row todo's
  "skill list 4" was stale; corrected to 6031. No new SQL needed.
- Rewards: EXP 3360, action 27187. No central rows. OPEN: public trigger
  owner; retail phase/balance (live-verification follow-ups, marked).
