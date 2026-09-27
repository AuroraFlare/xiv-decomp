# Valentione 2012 runtime

The `valentione_2012_enabled` profile now runs the nine native
`PopulaceValentMaster` roles, chocolate gifts, Pure/Dearest certification,
Partner's Glory scoring and ordinary party-invitation matchmaking. Apply the
main `Data/sql/characters_valentione_2012.sql` schema before enabling it. Profile
spawns and activation belong to the shared seasonal profile layer.

## Evidence and behavior

The installed client facade is
`tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/populace/populacevalentmaster.lua`;
its English text is `docs/Dat Mining/populaceValentMaster.csv`. Native rows
11/14/20/23/30 establish two players of any gender, the daily race condition,
daily gift, either member qualifying and shared gift limit. Rows 43/48–58/63/65
establish targeted chocolate kisses, two-player recording, twenty combined
points, reset of both members, daily city leaderboard, first band and repeat
chocolate. Rows 82/89/98 establish a five-minute registration and ordinary
accepted party invitation. Actor roles and city order are native classes
1001841–1001849. Item names resolve to 3010418 chocolate, 9040019 Pure pendant,
9040020 Dearest pendant and 9040021 Passion band; native emote 149 uses animation
45 and message 21433.

The contemporary [Bonds of Love discussion](https://forum.square-enix.com/ffxiv/threads/36751-Valentione-s-Day-The-Bonds-of-Love-LIVE)
corroborates three chocolates per Eorzea day shared across Pure/Dearest,
Grand Company affiliation for the city, matching race on either member, and
the three-city Dearest requirement. The
[contemporary achievement discussion](https://forum.square-enix.com/ffxiv/threads/33263-Achievement-List-%28post-patch-1.20%29/page4)
also transcribes the scoring interaction. Achievement IDs 1207–1210 use the
installed achievement data.

Certification validates the owned current NPC event and exact two-member
social roster. Both players must be online, in the same area, alive, nearby,
and outside zone transfer; removed, replaced and superseded sessions fail.
The daily chocolate entitlement and certifications persist independently of
inventory possession. All gifts are capacity-checked together before granting.
Recording revalidates the confirmed partner ID, preflights both inventories,
resets both point balances only on successful delivery, and records the city
leaderboard. Consuming an exact selected chocolate stack grants one point to
the targeted player; self-use, a foreign item, disconnect/session replacement,
or zoning while waiting for persistence cannot consume it. The normal item path
does not apply a food buff to this item. Matchmaking sends a World Server invite
and leaves acceptance to the other player.

## Reconstruction limits

The [contemporary Japanese guide](https://wikiwiki.jp/ff14n/イベント/2012ヴァレンティオンデー),
last modified February 5, 2012, records the complete 32-day Eorzea monthly race
table. It now replaces the initial authored five-race rotation. The calculation
uses elapsed Eorzea days since the server clock's epoch instead of Gregorian
DateTime.Day, which cannot represent day 32. Exact live client calendar alignment
still needs verification. The same guide reports equal highest scores qualify;
the latest tied submission therefore becomes the displayed couple. Its historical
Lodestone entry has no recovered numeric achievement mapping and is not invented.
The native repeat reward identifies chocolate but not quantity; one is the
explicit fallback. The eight-yalm horizontal and five-yalm vertical eligibility
limits are server policy, not recovered retail measurements.

The state transaction locks character rows in ascending order. Inventory changes
use the existing separate inventory persistence connection, with compensation on
ordinary grant or commit failure. They are **not crash-atomic** with event state:
a process kill or machine failure between inventory write and state commit can
leave rewards without the matching entitlement update. This limitation matches
the existing inventory API and requires a broader transactional inventory journal
to remove. Compensation failures are logged. No client-rendering, live SQL,
normal-party or live animation acceptance is claimed.

## Validation

`dotnet run --project tools/valentione-2012-tests/Valentione2012Tests.csproj`
links the production Player partial and rules into deterministic inventory,
social-roster and persistence doubles. Ninety-two checks cover actual reward methods,
aggregate capacity, partial gift/commit compensation, daily replay/rollover,
three-city certification, target ownership/replacement, point thresholds and
reset, both-player rewards, leaderboard, match lifecycle and all 32 calendar days.
The same executable
runs the real NPC Lua through MoonSharp, covering native A/B/C menu branches,
confirmation/cancel and disabled gates. These are behavioral offline checks;
the database double does not execute MySQL locking or establish crash safety.

An isolated production Map Server build passed with zero errors. Test restore
reported only an unavailable NuGet vulnerability-feed check and unused fake-field
warnings; the checks completed successfully.
