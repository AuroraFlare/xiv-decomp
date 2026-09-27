# Darkhold barrier initialization review

The Feasting Hall door was already present in the private route roster at layout
211, instance 1493, actor class 5900016, exact unchanged XYZ
(-95.198, 164.884, -13.873). `SpawnRouteDoors` publishes the entire twelve-door
roster at entry. Its earned-open predicate is `DeepvoidDefeated`; the placement
and predicate were not the missing pieces.

The recovered client `DoorServer.initForEvent` in
`tools/outputs/lpb/decomp_further_20260617/lua/chara/npc/mapobj/doorserver.lua`
interprets its final Boolean as an immediate opened endpoint: when true,
5900015 runs `open` at offset 5, while other DoorServer classes run `hide` at
offset 5. A barrier therefore becomes invisible when initialized with true.
False leaves the native layout at its initial closed state. Server `LuaUtils`
encodes true as type 0x3 and false as type 0x4.

The five zone-specific Darkhold barrier Lua initializers and the base DoorServer
initializer returned true. More importantly, private content does not resolve
the zone-specific unique script: `LuaEngine.CallLuaFunctionNpcForReturn` checks
only the private-area child path and then falls back to the base script. Merely
editing the zone scripts cannot fix a private instance. The regression uses
this actual Lua dispatch followed by production `ApplyScriptBindParamDefaults`,
and exposed the fallback rather than assuming a file edit reached the client.

The correction configures private route actors before publication to initialize
closed, then uses native `hide` when their existing conditions are earned.
The public zone-specific Lua definitions remain unchanged. An already-earned
barrier replays `hide` at offset 5 after a fresh/reconnect publication. Ordinary
doors use their separate `open` track and instance-owned latch. Preserve actor
ownership, known-actor and same-area checks on replay. All five barrier homes
and the Deepvoid-only condition for 1493 stay unchanged.

This identifies a concrete initialization and scheduler mismatch. Offline
Lua/bind checks establish the transmitted state and native dispatch contract;
visible appearance, collision and transition timing still require client
acceptance.

Regression: `tools/dzemael-door-integration-tests/Program.cs` resolves the real
private Lua initializer for every barrier, verifies its original true result,
applies the owned closed override, and verifies false after production bind
normalization. Moving that actor to another private area must restore the
unmodified initializer. Ordinary-door tests exercise latch persistence with
an empty room, explicit GM relock and rejection of barriers/public actors.
