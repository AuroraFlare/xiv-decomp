# Guildleve disconnect, Return and party continuity

This change implements the requested server policy. It is not a claim about
recovered retail disconnect rules. No SQL changes are required.

## Causes found in the server

- Cleanup ended the whole run when the accepting player disconnected. This
  depended on the leve owner, not the current social party leader.
- Normal cross-area travel ended the owner's run or removed a participant.
  Rejoining required being in the owner's area and depended on the owner's
  transient `currentParty` pointer, which disconnect cleanup clears.
- An earlier Return fix suppressed all roster refreshes. Full-map lookup still
  needs the roster to resolve the rebuilt director. Conversely, repeatedly
  publishing the group header recreates the duty group; native finalization is
  consistent with the unwanted "no longer bound by duty" notification.
- Actor equality uses character IDs. A retained Player and a replacement Player
  therefore compare equal, although only the new session may control the run.

## Implemented rules

| Event | Result |
| --- | --- |
| Owner/member disconnects while another participant continues | Keep run, objectives, links and original deadline. |
| Solo/all participants disconnect | Five-minute grace from the final disconnect, capped by the original deadline. |
| Repeated cleanup or login outside the field | Does not renew the existing grace. Return to the field before it expires. |
| Death and Return, including solo | Keep participation across areas and restore current UI after client readiness. |
| Voluntary travel while another participant continues | Keep membership and permit returning to the run. |
| Last continuing participant voluntarily leaves | End the run, including reservations for absent participants. |
| Party leader changes | No effect on leve ownership or participation. |
| Member explicitly leaves/is kicked, including an offline member | Remove only that participant; continue if another remains. |
| Owner explicitly abandons the leve, original timer expires, or encounter fails | End normally; reconnect cannot revive the run. |
| Another duty is entered | Release this participant instead of sharing two duty groups. |
| Run completes while a participant is disconnected | Preserve the existing reward-node window and character-keyed claim ledger; no replayed completion reward or extended node lifetime. |

An in-memory character/run reservation permits solo and whole-party reconnection
without a connected owner to discover. Ready arrival replaces the retained
Player reference, updates the owner reference when applicable, restores current
objectives/markers, and publishes the original start time. A stale session cannot
suspend or claim rewards for its replacement. Starting a second leve while a
reservation is active is rejected in both normal admission and the area factory.
The parent/child aetheryte scripts handle a rejected factory call.
Director-owned contextual commands also transfer to the new Player and are
published when that participant returns to the field.

Guildleve groups publish a creation header once per Session/Player binding. Later arrivals and
membership changes refresh the roster and director/restriction work without that
header. Real deletion retires this delivery record. Hamlet and other users of the
same group class retain their previous packet behavior. Owned running guildleve
directors survive spatial refresh and destination filtering while the player is
temporarily away.

Disconnected participants remain eligible members but are excluded from proximity
and inherited hate targeting. Reward nodes and fallback chests use an eligible
field participant or the last recorded field position, never the owner's foreign
zone coordinates. Journal outcomes use the current loaded character when a login
has overtaken the retained object; this avoids replaying completion/history writes.

The grace begins when the server detects/cleans up the disconnect. It does not
pause the duty clock or ordinary encounter mechanics. Reservations are local to
the running Map Server and do not survive a server restart.

## Verification and live acceptance

`Fishing Tests --guildleve-widget-only` covers the existing 1/4/8-player startup,
Return and arrival cases plus production continuity regressions: solo/party DC,
owner replacement, leader change, exact grace boundary, original deadline cap,
travel/Return, deliberate departure, offline kick, stale/competing sessions,
duplicate start prevention, absent proximity targets, field reward anchors and
one-time reward claims after completed-run reconnection.

Also run `--teleport-handoff-only`, `--party-resolution-only`, the seamless-zone
harness, all 58 guildleve completion checks and
`tools/validate_guildleve_encounter_framework.ps1` against the isolated build.

The 2026-09-19 isolated build passed all of those checks, including 2,485
seamless-zone scenarios, plus the compiled/static checks for all 99 gathering
leves and `tools/validate_faction_level50.ps1` for all 20 level-50 encounters.
The tested Map Server DLL SHA-256 is
`05D9D202CB8F446E143F26D8A8A84A2D4582BC70BC966968E78EB123FACEFDE4`.
This is an isolated Debug build, not a deployed Release binary.

Offline verification cannot establish native map rendering or notification timing.
After rebuilding/deploying Map Server and the two aetheryte Lua files, test:

1. Start with the accepting player both as leader and as a nonleader. Disconnect
   that player; continue killing, then reconnect and confirm the same progress.
2. Die and Return solo and in a party. Open the full map immediately, before a
   fight, and verify markers, widget and duty binding.
3. Teleport one participant away and back while the other continues. Then repeat
   with the last field participant leaving, which should end the run.
4. Disconnect everyone and reconnect before five minutes. Repeat beyond five
   minutes and near the original timer's end; neither expired run should resume.
5. Complete while the owner is disconnected, reconnect during the original node
   window and claim once. Verify that another member's claim is unaffected.

The running server was not restarted or replaced by this change. Live acceptance
remains pending; build/test success alone is not confirmation that the client
notification and full-map symptoms are resolved.
