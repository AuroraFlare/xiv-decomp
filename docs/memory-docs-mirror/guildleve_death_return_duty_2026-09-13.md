# Guildleve death Return duty notification

Follow-up: [2026-09-19 continuity changes](guildleve_continuity_2026-09-19.md)
retain group-creation suppression but restore the roster on Return for full-map
director lookup. The work-only behavior below describes the earlier fix.

The user reports that death followed by Return during **An Old-fashioned
Exorcism** prints `You are no longer bound by duty.` while the leve remains
active. The supplied screenshot shows one of three spriggans defeated before
Return; it does not establish a leve failure or completion.

The server already preserves the guildleve director and content group during
death Return. After the destination client-ready barrier, however,
`Player.SendZoneInGroupPacketsAfterClientReady` replayed the group's full
creation/roster train. Group objects survive ordinary map replacement. The
recovered `ContentGroupBaseClass._onFinalize` emits message 50012 for guildleve
kind 30001; recreating the retained group is therefore an unnecessary lifecycle
path consistent with the false departure notice.

For a running guildleve, arrival now refreshes the retained group's director
pointer and restriction work, followed by the current objective/marker work and
original timer. It does not resend group creation or roster packets. Existing
session-ready, director, participant and group-identity checks gate the refresh.
Initial duty binding and real duty-exit deletion retain their existing paths.
No SQL or placement changes are required.

Regression coverage in `Fishing Tests/GuildleveReturnMarkerTests.cs` exercises
initial binding, repeated arrival far from leve mobs, changed and cleared
markers, preserved progress/timer/duty identity, serialized director/restriction
work, lifecycle gates, and actual duty-exit deletion. Run the compiled harness
with `--guildleve-widget-only` and `--teleport-handoff-only`.

Validation passed: the Map Server/Fishing Tests build, both focused harness
modes, all 58 `tools/guildleve-completion-tests` checks, and
`tools/validate_guildleve_encounter_framework.ps1`.

The offline packet checks cannot verify native-client notification timing.
After deploying the rebuilt Map Server, repeat death and Return during an active
leve: the false departure message should disappear, the original timer and
progress should remain, and completion/abandonment should still end the duty.
