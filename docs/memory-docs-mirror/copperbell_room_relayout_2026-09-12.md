# Copperbell Formicary round-room correction

The user requested breaking up the circular mob layout in the eastern lower
round chamber, then approved the displayed two-mob proposal: “that looks good
to me.” One Plain Pudding and one Gas Bomb now move inward. The room still
has three of each species, Formicary has 111 mobs, and Copperbell has 192.

[Before/after room review](maps/copperbell-room-relayout-20260912/index.html)
and [updated full floor](maps/mistbeard-copperbell-20260912/178-1720.png).

| Existing identity | Species | Before X / Y / Z | After X / Y / Z |
| --- | --- | --- | --- |
| map_2f3df3e2ff32b1db2f4d7560 | Plain Pudding, BNPC 39304 | -341.583 / 91.925 / 113.226 | -329 / 92 / 122 |
| map_7bd5f11fe1a3f9fc4b414c9d | Gas Bomb, BNPC 39302 | -294.741 / 92.633 / 145.990 | -310 / 92 / 135 |

Both remain zone 178, native MapNavi 1720. Each new point is within thirteen
horizontal yalms of the room centre, approximately X=-320 / Z=130. New
positions retain more than twenty horizontal yalms from other same-floor
mobs. The doorway stays open. IDs, profiles, facing, roaming, respawn behavior,
counts and all other actors are unchanged.

The centre has no recorded ground in the current or frozen original/repaired
178/175/209 sources, including the supplied external recordings. The nearest
sample is approximately 23.86 yalms from the room centre. The supplemental
inventory was also checked. **Y=92.0 is an expressly approved estimate**, based
on the nearby recorded rim heights around 91–93; it is not a measured centre
height or a collision/walkability guarantee. The user's approval concerns the
displayed layout and proposed estimate, not an in-game floor test. No
recording nodes, links or confirmed-coordinate validations were changed.

The manifest is `Data/mobplacements/copperbell_room_relayout.json`. Run
`python -B tools/mobspawns/copperbell_room_relayout.py build|check|render` to
rebuild, verify or display the correction. Original generated VALUES rows and
frozen placement plans remain intact. A later two-statement UPDATE block in
the canonical spawn SQL applies the correction without changing identities.
The full-floor and navigation-gallery renderers project that later update;
`map_coordinates.sql_rows` alone intentionally reads literal VALUES only.

For an existing server, import
`Data/sql/live migrations/copperbell_room_relayout_20260912.sql`
after the earlier Copperbell population and expansion migrations, then reload
the Map Server normally. The update matches the stable unique ID, zone,
profile, mob name, existing XYZ and other spawn settings. A repeat import is
a no-op; customized positions or identities are preserved. Nothing is inserted
or deleted. No live SQL import or server restart was performed by this task.

Verification covers repeat updates, exact identity/count preservation,
custom-position/profile conflicts, minimum spacing, unchanged prior catalog
bytes outside the correction, and truthful estimated-ground metadata in the
projected review. The full-floor and before/after PNGs are visually reviewed.
All **87 tests pass** across this six-test correction suite and the existing
81 dungeon/coordinate tests. `copperbell_room_relayout.py check` passes.
