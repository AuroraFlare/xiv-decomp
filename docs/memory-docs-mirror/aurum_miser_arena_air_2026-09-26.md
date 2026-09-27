# Miser arena Gold Lung clearance

The owned Miser now stops refreshing the route's arena Gold Lung volume when
actual HP first reaches 70% or lower. Healing does not restore that volume.
This is a reconstruction of the [preserved eLeMeN 1.x guide](http://elemen.sakura.ne.jp/ff14_dated_archives/gamecontents/InstancedRaids/AurumVale.html),
which reports clearance at approximately 70%. No independent numeric threshold
or pinned launch revision was recovered; 70% equality and persistence across
regeneration are explicit implementation choices.

The transition claims native `worldMaster` row **52072**, “The air seems clearer.”,
once for current original entrants. This audience and timing are reconstructed.
The existing cleaner-air exit notice remains separate. Previously applied Gold
Lung expires normally; this does not invent an instant status removal, change
poison damage or mitigation, or identify a native fog-rendering control.

`AurumMiserArenaAir` accepts only the owned, registered, living native Miser in
its active zone-245 instance. It binds the first accepted actor reference;
replacement actors, stale registry entries, expired runs, pending victory and
cleanup cannot trigger the transition. The HP comparison uses actual HP rather
than rounded `HPP`, so 70.01% does not cross the chosen boundary early.

`LegacyRaidRuntime.HasGas` can exclude only the named arena entry
`stage3a-gas`. Other route volumes and GM-created gas volumes still apply,
including overlapping volumes. Goldbile, boss regeneration, normal status expiry,
fruit/root effects and the reviewed arena coordinates remain unchanged.

The production manager tests cover the threshold, healing, new-instance state,
actor identity and lifecycle rejection, and overlapping route volumes. The
period [full-cycle review](aurum_miser_cycle_review_2026-09-26.md) distinguishes this
change from the still incomplete pool-travel and repeated regeneration cycle.
No client or live server test has been performed for this change.

Source response: `.codex-build/aurum-archive-20260926.html`, retrieved 2026-09-26
over public HTTP; SHA-256
`a1aad74d5b1d3a53f23f35c947a8987bccf214b46b1985fa71b34d75c47e6e06`.
The response is a local research cache, not redistributed evidence of a specific
2012 revision. Native wording is in `docs/Dat Mining/worldMaster.csv`.
