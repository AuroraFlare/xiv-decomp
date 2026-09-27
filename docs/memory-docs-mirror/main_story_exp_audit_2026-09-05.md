# Main story completion EXP audit — 2026-09-05

Scope: the 19 named main scenario quests in the original three-city story chain,
through Futures Perfect. This audit checks configured base completion EXP, the
reward widget, and Lua versus central SQL ownership. It excludes combat EXP,
Grand Company quests, and the untranslated Man502/Man504 reference scripts.

## Sources

- [Gamer Escape, October 2012 archive](https://web.archive.org/web/20121023162132/http://ffxiv.gamerescape.com/wiki/Category:Main_Scenario_Quests), inspected from the repository's saved copy at `docs/ffxiv-1.0-wiki/pages/Category__Main_Scenario_Quests.html`.
- [eLeMeN dated main quest archive](http://elemen.sakura.ne.jp/ff14_dated_archives/quest/MainQuest/index.html), retrieved directly on 2026-09-05.

Both sources agree on the numerical EXP values below. eLeMeN prefixes the shared
level-18-and-later rewards with `～`; those values should not be taken as proof
that historical level-dependent scaling is implemented. The server currently
uses fixed base rewards and applies its general EXP modifiers through AddExp.

## Findings and corrections

| Quest(s) | Base EXP before this task | Sourced base EXP | Result |
| --- | ---: | ---: | --- |
| Shapeless Melody / Sundered Skies / Flowers for All | No completion EXP grant | No EXP listed | No change |
| Treasures of the Main / Souls Gone Wild / Court in the Sands | 10,000 | 200 | Lua award and widget corrected |
| Legends Adrift / Whispers in the Wood / Golden Sacrifices | 30,000 | 300 | Lua award and widget corrected |
| Never the Twain Shall Meet / Beckon of the Elementals / Calamity Cometh | 50,000 | 500 | Lua award and widget corrected |
| Fade to White | 70,000 | 6,500 | Lua award and widget corrected |
| Together We Stand | 50,000 | 11,000 | Lua award and widget corrected |
| Toll of the Warden | 19,000 | 19,000 | SQL award and widget match |
| Forever Taken | 26,500 | 26,500 | SQL award and both completion widgets match |
| Lord Errant | 32,500 | 32,500 | SQL award and widget match |
| Of Men They Sing | 39,000 | 39,000 | SQL award and widget match |
| Futures Perfect | 46,000 | 46,000 | SQL award and widget match |

The eleven corrected quests previously displayed 300 regardless of their award.
Each now shares one local REWARD_EXP between the widget and the Lua grant.
The five later quests use CompleteQuest to grant their SQL rewards; no extra
scripted EXP grant was found. The repository SQL has no central EXP reward for
the earlier quests, so it does not duplicate their Lua awards.

## Validation and limits

`tools/starter-city-tests/StoryRewardTests.cs` executes all eleven corrected
completion paths with MoonSharp, including the real scenario reward helpers.
It checks a single EXP award, matching widget values, and existing gil rewards.
It also checks the five later quests' SQL EXP rows and every completion widget,
and rejects duplicate script/SQL EXP grants.

Command: `dotnet run --project tools/starter-city-tests/StarterCityTests.csproj --no-restore -m:1 -p:BuildInParallel=false -p:UseSharedCompilation=false`.

This is a repository audit and automated validation, not a live-database query
or an in-game playthrough. Already-awarded character EXP was not modified.
