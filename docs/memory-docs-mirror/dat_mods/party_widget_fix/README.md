# Party Widget Fix

This Windower `DatOverlay` patch updates the stock party widgets without
overwriting the installed FFXIV 1.0 client files.

It makes these client changes:

- Escape/Cancel always runs the widget's existing `closeWidgetDirect` path.
- Server-managed Trust party members show their numeric HP/MP and class/rank.
- A party leader sees **Level Sync** in another member's Party Details menu.
- The active sync target appears as `Name - Sync'd to Player` in bright orange.

The **Find** button remains wired to the stock `PcMatchingFindWidget`. The map
server now implements its recruitment listing, search, details, acceptance,
and party-invite flow (`0x01C3` through `0x01C8`).

The Level Sync patch reveals and relabels the stock dormant Send Letter row,
then sends a marked Check-system event directly to the Map server. It never
types or echoes `!levelsync` in chat. The server validates the
leader, party, area, combat classes/jobs, 100-yalm formation, and selected
member before enabling sync to that member's true level.

## Build and Install

Run:

```powershell
python tools/actions/build_party_widget_fix_overlay.py
```

The default output is:

```text
Windower/DatOverlay/PartyWidgetFix/client/script/n1635q/u9sqlsvvqn1635q.le.lpb
Windower/DatOverlay/PartyWidgetFix/client/script/n1635q/u9sqlu9s9x5q5sn1635q.le.lpb
Windower/DatOverlay/PartyWidgetFix/client/script/n1635q/u9sqlx9w935sn1635q.le.lpb
Windower/DatOverlay/PartyWidgetFix/client/script/n1635q/u9sqlx9w935srp8n1635q.le.lpb
```

Point the launcher's `DatOverlay.Folder` setting at the `PartyWidgetFix`
package root (or merge the generated `client/` tree into the active overlay
package), then restart the client.

The builder verifies that the recovered Lua bytecode repacks byte-for-byte to
the installed stock LPB before writing the patched file.

## Expected Behavior

1. Open the Party menu and press Escape. The menu closes regardless of its
   current internal party-matching state.
2. Use **Recruit** to publish a listing for up to 60 minutes.
3. On another character, select **Find**, choose filters, and search. Matching
   recruitment listings appear in the stock results widget. Name/comment text,
   class/job, discipline, and rank ranges are applied by the map server, and
   the result summary shows the requirement row that actually matched.
4. Open a result to view its message and requirements, then accept it. The
   stock `PartyJoinCommand` immediately adds the applicant to the recruiting
   party.
5. When recruitment finishes, a member leaves, leadership changes, or the
   party disbands, the server clears the stale listing and immediately pushes
   the stock widget back to **Recruit**.
6. As party leader, open Party Details for another party member and choose
   **Level Sync**. The party syncs to that selected member; the action does not
   appear in the chat input or log. Typed `!levelsync on` remains the automatic
   lowest-member mode. The active target's name gains a bright-orange
   ` - Sync'd to Player` label, which moves when the automatic lowest member
   changes and clears on desync. Only the party leader sees an enabled Level
   Sync row, and it is disabled for the leader's own row.

Listings are in memory and are removed when ended, expired, disconnected,
superseded, full, changed to a different party, or no longer owned by the party
leader.
