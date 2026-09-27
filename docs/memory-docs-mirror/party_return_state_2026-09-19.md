# Retained party actor after death Return

The user's screenshots show Anzyr as a corpse with zero party HP, then standing
with 158 HP after entering combat. The supplied short recording also shows the
corpse and empty party HP bar; it does not capture the Return itself.

The attached Map log records server restoration at 15:48:47.073:
HP 0 -> 158 and main state 1 -> 0. The local revival animation is queued at
15:48:49.585. Anzyr's final ready gate opens at 15:48:55.946. Illusive remains
near (-1339.280, 29.845, -1709.316), while Return places Anzyr near
(-1056.318, 20.000, -1761.308), outside ordinary actor visibility range.

Same-area party retention preserves the old peer actor. However, final readiness
called the arrival helper without forced refresh, which skipped known actors.
The helper also only selected nearby viewers. Ordinary distant-party refreshes
sent positions, leaving the retained corpse's HP and main state unchanged until
a later combat broadcast repaired them.

Final readiness now requests a state refresh. The helper includes same-area
party viewers already holding the arriving actor, even outside ordinary range.
Known actors receive speed, position, current HP/MP/TP, status list, main state
and substate. It does not send RemoveActor, AddActor, script binding, full init
or a second name packet. New actors retain their existing construction path.
The returning player's local revival animation remains unchanged. Loading or
disconnected clients cannot receive this refresh.

Regression coverage exercises a ready bystander retaining a distant party peer:
no publication while the returner loads, then current restored resources and
standing state without combat flags or actor reconstruction. A distant nonparty
viewer is excluded. Five focused checks, the existing peer/marker cases and all
2,485 seamless scenarios pass. The leve widget, retained Return, party arrival
and teleport-handoff suites also pass against the same isolated Map DLL.

Build output: `tools/outputs/party-return-state-test/`. No running server was
replaced or restarted. The next affected-server retest should show
`[PeerArrivalRefresh] viewer=1 peer=12 hp=158 state=0 zone=152` (current values
may differ) immediately after readiness, and the spectator should see Anzyr
alive before either character starts another fight. Native client confirmation
remains pending.
