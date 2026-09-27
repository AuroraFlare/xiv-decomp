# Custom instanced-content timer

The implementation is a server-controlled Windower countdown with a custom
instance name and objective. It does not patch a `.dat` file or open the retail
`RaidDungeonExecutionWidget`.

API v9 sends opcode `0x0133` directly from the player with a collision-resistant
operation tag. The `customtimer` Windower addon recognizes that packet and
renders the supplied instance name, objective, and remaining time. The retail client ignores the
unknown tag. This path starts no client event, waits for no `EventUpdate`, and
therefore cannot freeze chat.

## Protocol

The server uses the normal Lua-parameter wire format:

```text
open:  0x49575401, title, finishTime
close: 0x49575402
objective update: 0x49575403, objective
```

- `title` is printable ASCII normalized to at most 64 bytes. The first `|`
  separates a custom instance name from its objective. Without a separator,
  the heading defaults to `Instanced Content` and the title becomes the
  objective.
- `finishTime` is an absolute Unix timestamp, clamped to at most 24 hours.
- an objective update replaces only the lower text. The addon's active
  monotonic deadline is retained, and the launcher flashes the changed text
  for ten seconds.
- the addon anchors that timestamp to the incoming subpacket timestamp and
  advances the display from Windower's monotonic `elapsed_ms` status clock.

The addon writes to its own `customtimer` widget channel. The launcher renders
that channel as a dedicated navy, gold, and ivory panel modeled after FFXIV
1.0's native widget styling. It does not replace the NPC-distance text. The
timer changes to gold with five minutes remaining and red with two minutes
remaining, matching the warning thresholds recovered from the retail timer.

## Install and validate

The production addon is now part of the launcher source at:

```text
../Launcher Windower/New/FFXIV Windower/Windower/Addons/customtimer
```

The launcher project embeds that Lua source, copies it to the runtime
`Windower/Addons/customtimer` directory, enables it in normalized
`Windower.json` configuration, and upgrades older copies automatically. The
mirror under `tools/windower/addons/customtimer` remains the server repository's
protocol-test fixture.

Because the dedicated widget also adds launcher and injected-Windower code, the
client must be fully closed and relaunched once after installing a new build.
No manual `/addon load` command is required after that relaunch. Run the focused
validations from the server repository root with:

```powershell
powershell -ExecutionPolicy Bypass -File tools/validate_customtimer.ps1
powershell -ExecutionPolicy Bypass -File tools/validate_instanced_content_widget.ps1
```

## GM command

```text
!instancewidget open 10 The Thousand Maws of Toto-Rak | Eliminate the target enemies
!instancewidget open 10 My Custom Event
!instancewidget objective Reach the evacuation point
!instancewidget close
!instancewidget remove
!instancewidget status
```

`open` sends the custom display text and finish time to the addon. The
`instance | objective` form controls both lines; the legacy one-name form
keeps `Instanced Content` as the heading. `objective` changes the lower line
without resending, restarting, or extending the timer; production battle
scripts can call `InstancedContentWidget.updateObjectiveWindower(player, text)`
through the same direct player transport. `close` and
`remove` both stop the overlay. The v9 command does not create a director and
is safe even while an unrelated client event is active.
