# Classic client login

The lobby always accepts version `2012.09.19.0001`. All other clients must
exactly match `required_version` in the active `lobby_config.ini`.

Classic clients receive this General Info chat message between the World
server's welcome line and the configured MOTD:

> YOUR RUNNING CLASSIC FINAL FANTASY XIV 1.0 SOME THINGS MAY NOT WORK CORRECTLY

Updated clients and sessions whose version is unknown receive the usual MOTD.

## Deployment

Deploy and restart both Lobby and World with the updated `Meteor.Common.dll`.
The lobby automatically creates `server_login_client_versions` in its configured
database on character selection. Lobby and World must use the same database.
The lobby database account needs CREATE, INSERT, and UPDATE access for this table;
World needs SELECT access.

Each character selection records the accepted connection's version before sending
the World connection response. The record expires after 15 minutes; World reads
it into the new zone session so later logins or expiration cannot change an
already connected player's version. Subsequent selections overwrite the record,
including when a player switches from classic to an updated client.

Database failures log a `[ClientVersion]` warning without preventing login. If
World cannot read a current record, it skips the compatibility message.

## Verification

Run `dotnet run --project tools/classic-login-tests/ClassicLoginTests.csproj`.
The tests exercise the real World MOTD packet queue using local sockets, checking
the exact text, recipient, General Info channel, and suppression for other or
unknown versions. They do not require a database or running game server.

For a deployment check, log in once with classic and once with an updated client.
Confirm that only classic receives the warning and that neither server logs a
`[ClientVersion]` database error.
