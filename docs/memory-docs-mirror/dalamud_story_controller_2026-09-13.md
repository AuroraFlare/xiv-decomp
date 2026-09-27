# Personal Dalamud progression and Mysterious Woman

Dalamud's native `0x0010` state is now chosen per character. The weather schedule
is unchanged, but **Dalamud weather 8030/8032 overrides the phase's visible
appearance**, per the [packet reference](http://ffxivclassic.fragmenterworks.com/wiki/index.php?title=Game_Opcodes:Set_Dalamud_Phase&oldid=1078).
The saved preference is retained during those weather effects; the phase
packet does not guarantee a particular visible size while they are active.
This is an authored quest-to-sky progression, not a claim that retail used
personal skies instead of its historical descent timeline.

## Story and saved choices

`dalamud_story_progression = true` enables the feature. Turning it off restores
the existing global `dalamud_size` value and disables the NPC's controls.

The opening GC quests 111401/111601/111801 all require **Together We Stand**
(110014) in `gamedata_quests.sql`. Before that story completion, Mysterious Woman
has only the exact dialogue **"...."**, with no choice menu. Completing later
milestones also establishes access, for recovered or GM-created histories.
This does not enable quests disabled in `quest_availability.lua`.

The user's patch/state table was checked against [Set Dalamud Phase, revision
1078](http://ffxivclassic.fragmenterworks.com/wiki/index.php?title=Game_Opcodes:Set_Dalamud_Phase&oldid=1078)
on 2026-09-13. The reference confirms the six-appearance order and the 0/7
equivalence. Its pre-1.19 identification remains **tentative**; this is document
verification, not a live client visual check. Quest unlocks below are authored
gameplay assignments, not reconstructed retail quest/patch dates.

| Menu appearance | Wire state | Completed milestone (Maelstrom / Adder / Flames) |
|---|---:|---|
| Hidden before access | -1 | No qualifying milestone |
| Small orbiting (pre-1.19, tentative) | `0x01` | Together We Stand: 110014 |
| Medium orbiting (1.19) | `0x02` | It Kills with Fire: 111416 / 111616 / 111816 |
| Large orbiting (1.20) | `0x04` | Alive / Two Vans Are Better than One / Gcu102: 111427 / 111627 / 111827 |
| Small persistent (1.21) | `0x05` | Deus ex Machina / Shadow of the Raven / Gcu103: 111429 / 111629 / 111829 |
| Medium persistent (1.22) | `0x06` | In for Garuda Wakening: 111430 / 111630 / 111830 |
| Medium persistent (1.22), retained | `0x06` | Don't Hate the Messenger: 111431 / 111631 / 111831 |
| Medium persistent (1.22), retained | `0x06` | United We Stand: 111432 / 111632 / 111832 |
| Large persistent (1.23) | `0x07` | To Kill a Raven: 111433 / 111633 / 111833, **accepted or completed** |

`0x00` is treated as the documented large-1.23 alias, requiring the final
unlock. The menu uses canonical `0x07` once, without a duplicate appearance.
The wiki's `0x03` description is **"Nothing?"**; this uncertain state is excluded
from personal progression and choices. `-1` is the documented off value.

The highest qualifying branch wins. Company rank and side missions alone do not
advance the sky. Replays retain completed history. Removing an uncompleted,
GM-added final quest restores the ceiling from remaining history. To Kill a
Raven retains state 7 after completion.

The menu offers **Follow my story**, **Hide Dalamud**, and named appearances
through the current ceiling. `characters_dalamud` stores `characterId` as its
primary key and signed `selectedStage`: -2 automatic, -1 hidden, or a raw packet
ID (1, 2, 4, 5, 6, 7, plus final alias 0). The server keeps chronological ranks
0–5 separate from these saved IDs and compares ranks when validating unlocks.
Lua obtains both menu labels and packet IDs from the same C# appearance table.
Missing rows default to automatic. Invalid stored values, including an old 3,
fall back to automatic; a saved later appearance falls back to the story state.
Existing raw saved IDs keep their identity and are revalidated on load/use;
the corrected order requires no SQL schema change or preference rewrite.
Only choices are saved here; quest progress remains in the existing quest data.

The server rechecks current NPC ownership, identity, area, range, feature flag,
and quest ceiling after menu selection. SQL must succeed before the selected
sky is sent. Zone bootstrap always sends the personal state in the original
packet order. Quest accept/completion/removal and completion-flag changes
refresh an already initialized personal sky when the effective state changes.

## NPC, appearance, and presentation

- Display name: **Mysterious Woman**.
- Actor class / appearance: **5900040**, private copy of Minfilia **1000843**.
- Unique placement identity: `dalamud_controller_coerthas`.
- Zone **143**, X **240.210**, Y **302.358**, Z **-264.724**, rotation **1.714**.
- Canonical placement row: 3225. The additive migration allocates an available
  numeric ID and identifies the NPC by unique ID on existing databases.

The position and facing come directly from the user's **second** `!mypos`
screenshot, `codex-clipboard-9070290a-cac6-4914-b446-efa8510d11e7.png`.
It supersedes X241.010/Y302.219/Z-262.199/rotation-0.309. No map transform or
estimated elevation was used.

Minfilia's Hyur female base (2), face, hair and body colors are copied exactly.
Only the new NPC's clothing changes; original Minfilia remains unchanged.

| Slot | Native item | Item ID | Packed appearance |
|---|---|---:|---:|
| Body / sleeves | Vanya Robe (Black) | 8032817 | 70658 |
| Legs | Woolen Slops (Black) | 8050041 | 2145 |
| Hands | Woolen Halfgloves (Black) | 8070334 | 5281 |
| Feet | Oak Pattens (Black) | 8080330 | 5313 |

Graphics come from `gamedata_items_graphics.sql`, using the existing equipment
packing. There is no independent arm slot; the robe supplies sleeves. The head
is uncovered, and original belt/accessories are cleared.

Her persistent actor state is floor-sitting (13). A silent native `/pray`
emote (54, packed scheduler 0x05036000, no-text description 10105) is sent to
each new viewer and replayed every 15 seconds. **This is repeated prayer over a
seated idle, not a frozen prayer frame.** The exact visual behavior of the
prayer animation over this seated model, and clothing clipping, need a live
client check. No unverified idle motion-pack ordinal is assigned.

The dialogue uses the existing CustomMenu API23 `customNpcSay` bridge into
native `NpcSayWidget`. WorldMaster text row **10102** uses the supplied string
argument `[@STRING($EA(1))]` in all four languages, allowing the requested
four dots without new client text assets. The original row 10103 read the
player-name context `$EB(1)` instead; the user's September 13 screenshot
confirmed that defect by displaying "Illusive Fizz". Animation argument -1 avoids
replacing her pose with a speaking animation. The available stages use the
existing paged menu and its version probe/cleanup lifecycle.

## Installation and verification

Fresh database files contain the new rows and `characters_dalamud.sql`.
Existing databases use:

`Data/sql/live migrations/dalamud_story_controller_20260913.sql`

The preference table also has a runtime `CREATE TABLE IF NOT EXISTS` fallback.
The live local migration was applied twice and verified to produce one exact
placement and the four expected equipment graphics. Automatic/hidden/visible
preference insert/update/read round trips were tested inside a rolled-back
transaction; no test character preferences remain.

Build and focused test:

```powershell
dotnet build "Fishing Tests/Fishing Tests.csproj" --no-restore -m:1 -nr:false -p:BuildInParallel=false -c Release -o tmp/dalamud-release
dotnet "tmp/dalamud-release/Fishing Tests.dll" --dalamud-only
```

The focused suite checks the user's nonconsecutive packet order in all three
story branches, all menu ceilings, raw saved values, the final-only zero alias,
and rejection of undocumented state 3. Also checked
`--weather-transitions-only`, `--quest-npc-routing-only`, and
`--rested-exp-teleport-regression-only`. These establish server behavior and
menu routing contracts, not live-client visual confirmation. The running map
server needs the new build and a restart to load the NPC and personal state
logic; source changes and SQL alone do not replace its loaded assembly.
