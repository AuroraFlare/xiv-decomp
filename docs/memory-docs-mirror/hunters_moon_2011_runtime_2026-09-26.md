# Hunter's Moon 2011

Native classes 2204022/2204023/2204024 are the moon-eyed, moon-eared and
moon-toothed mice, with native display names 3204022/3204023/3204024. The
[contemporary guide and dated firsthand reports](https://wikiwiki.jp/ff14n/イベント/2011ハンターズムーン)
record ranks 15/25/35 and all six regional hunt locations. The September 6
reports specifically place rank 25 at Red Rooster Stead and Mythril Pit T-8,
and rank 35 at Halfstone; September 15 places rank 35 at Buscarron's Fold.
The full-moon condition is explicitly a question in that source, not a recovered
rule. Original densities, tier rotation, respawn and drop probabilities remain
unrecovered. The separate seasonal field manifest records implemented homes,
frozen ground support and the exact reconstruction policies.

The current field layer has six frozen-ground homes and separate level 15/25/35
profiles. Its independent 50% nut rolls, 5% Moonlet roll and 60-second respawn
are authored reconstruction values. Level 15 at the two remaining sites is
inferred, and higher-tier rotation remains unresolved. Supported town-crier
homes cover Limsa and Gridania; Ul'dah's documented tavern fountain lacks a
frozen ground sample and remains unplaced.

An [official-forum firsthand report from September 6, 2011](https://forum.square-enix.com/ffxiv/threads/23117-Hunter-s-Moon-The-Curse-of-Dalamud-%2809-02-2011%29?daysprune=-1)
reports Moonlet, Moon Nut and Dalamud Nut at any camp. Native item identities
are 9030020, 3011420 and 3011419. The existing ordinary inventory/party loot
pipeline distributes configured drops; there is no invented NPC token exchange.

Native `populaceTownCryer.csv` rows 118-163 and the decompiled
`populacetowncryer.lua` preserve the three city conversations. Actors 1001725
(Nolmo Lilmo), 1001724 (E'qawhau) and 1001723 (Joldewin) dispatch native
`tcTalkEvent05`, `06` and `07` respectively. The `_01` and `_02` variants point
to the two regional sites; they do not check Moonlet possession or grant a reward.
The server alternates these directions on successive conversations, an authored
selection policy. Native text and widgets handle the three lore choices. Both
the NPC and field profile are controlled by `hunters_moon_2011_enabled`.

The same period guide records history for one and fifty mouse kills. The
authoritative ordinary kill-credit callback now records those milestones in
main `characters_hunters_moon_2011.sql`, using locked SQL updates, a saturating
counter and UTC timestamps. Shared party kill eligibility is retained. Failed
writes do not announce a completed milestone; completed history does not repeat.
The simple local milestone messages are reconstructed presentation. There is no
recovered numeric achievement or Lodestone-service integration; native title
902 alone does not establish an earned title condition, so it is not awarded.

The production-linked fixture adds seven kill-history behavior checks and a
MoonSharp suite for all three native NPC identities, both direction variants,
unknown actors, disabled state and non-talk events. Its database is a test
double, not a live MySQL test. Client dialogue, combat, drop presentation and
field floor acceptance remain open.

An isolated production Map Server build passed with zero errors and four
pre-existing package warnings after the Hunter's Moon integration.
