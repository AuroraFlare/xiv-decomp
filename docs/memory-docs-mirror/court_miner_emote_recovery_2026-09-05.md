# Court miner emote recovery

The emote step requires both Manic Miner and Maddened Miner. Completing one
removes that miner's marker, so an absent second miner blocks progression.

Map Server now ensures both actors are present when Ul'dah's
PrivateAreaMasterPast level 2 starts. It supplies their talk/emote definitions,
normalizes missing or duplicate spawn rows, and preserves the other stage NPCs.
Maddened Miner uses the supplied position (-107.531, 195.000, 326.063), rotation
1.060. The existing Manic Miner position is unchanged.

The Lua handler saves each accepted miner response and only advances after both.
It commits sequence 58 before the final scene's exit warp, leaving EventFinish
to the zone-change pipeline. If both emotes were saved but the final scene was
interrupted, F'lhaminn has a recovery marker; talking to her or either miner
retries the scene. Existing completed emotes are preserved.

Deploy the Lua update and rebuild/restart Map Server. The optional targeted
migration `Data/sql/migrations/20260905_court_miner_emotes.sql` also repairs stored
definitions/spawns and fills missing retail appearance rows without replacing
existing appearances. No quest reset is needed.

Verification: the quest-map-marker test suite exercises both miner orders, all
six emotes, saved partial progress, interrupted scene recovery, and commit/warp
ordering. The quest-NPC routing suite checks missing/duplicate spawn recovery,
area isolation, exact placement, and both actors' emote definitions. Live NPC
rendering and scene playback still require an in-game retest.
