# Flan initialization, Spriggan rocks and drake Smoulder — 2026-09-13

## Flans: selected colour in initial spawn

`BattleNpc.Pudding.cs` chooses an ordinary flan's element once at actor
initialization. Seeing another player never rerolls it. At the user's request,
ordinary flans now send that selected colour in their initial construction
packet. Their neutral-first, one-second delayed per-viewer colour presenter has
been removed, including its special respawn SubState suppression. Re-entering
visibility sends the same selected colour immediately.

The previous delay worked around native model initialization: a nonzero state
can be remembered before material metadata exists, so resending the same state
may produce no transition. The direct spawn policy replaces that workaround;
its appearance still needs an in-game check. See
`docs/pudding_elements_2026-09-12.md`, `Npc.CreateSpawnSubStatePacket`, and
`outputs/flan-spirit-color-transition-decomp-20260831/03-flan-model-state-native-decomp.txt`.
Explicit Toto-Rak ownership, all six spell/appearance pairs and same-element
absorption remain intact. The compiled pudding harness checks the selected
state in initial and repeated construction packets for all six elements,
reload persistence, unrelated substate fields and Toto-Rak's explicit deferral.

## Spriggans: random ordinary world rocks

The user explicitly requested random rocks at spawn. The static world loader
now selects a rock before publishing eligible ordinary m520/e001 Spriggans.
`ForceRespawn` chooses again before the new appearance packet. Viewers and
command reloads retain the existing choice. Random selection can choose the same
rock again; it does not force a different color.

| Rock | e001 texture | Default body appearance | Spell and ranged elements |
| --- | --- | ---: | --- |
| Purple | 0000 | 1024 | Wind / Earth (Aero 27353 / Stone 27355) |
| Yellow-green | 0001 | 1056 | Fire / Water (Fire 27310 / Water 28957) |
| Red-brown | 0003 | 1120 | Ice / Lightning (Blizzard 27308 / Thunder 27313) |

The stone/element pairs are from the preserved eLeMeN Spriggan family record in
`docs/elemen-monster-archive/bestiary.json`. Its source URL is
<http://elemen.sakura.ne.jp/ff14_dated_archives/monster/bestiary/Spriggan.html>.
It describes the stone affecting spells and ranged attacks but does not provide
a random distribution, spell tiers or an element-switch cadence. Equal
three-way rock selection, the canonical basic spell pair and equal selection
between the two ranged elements per attack are authored implementation choices.
No flan-style absorption was added.

The installed client's diffuse textures were decoded as 256x256 DXT1 images and
visually inspected. Texture 0002 is grey with no recovered element pair and is
excluded from the random pool. Textures 0004–0007 repeat the stone palette with
different fur/eyes; that bank is preserved when selecting the stone.
Native source SHA-256 values, relative to `client/chara/mon`:

```
m520/equ/e001/top_tex1/0000 23b3f4cbd2a25e3d43f4864bbf8b79f9b7d68322b96849bb044483c62286314d
m520/equ/e001/top_tex1/0001 8c2cf135908ac641d3cf95324e66b0c0e5b8f4af5ec2dbab558d87b5faa28408
m520/equ/e001/top_tex1/0003 bcddb821e5057ab208b5c555ecbe93b214425c291469f2dad2e9cdcfeca96f41
```

NMs, nonstandard/seasonal classes, non-e001 bodies, private/content actors and
preassigned spell lists are excluded. Dynamic quest/leve spawners do not opt
into the random fallback. No profile, placement, drop, or SQL row is modified.

## Drakes: Smoulder owns the glow

The user selected **glow only while Smoulder is active**. Entering combat does
not itself set glow. Smoulder command 23271 applies the existing 30-second server
effect 230116. Its gain hook now sets native m034 mode bit `0x10`, and its loss
hook restores the previous value. Shared AI disengagement removes Smoulder,
covering a party wipe, loss of combat targets and a leash reset. Force-respawn
also clears it before constructing the new client actor.

The native BID schedulers `init_msb4_1` and `init_msb4_0` select material motions
`cbxs_st2` and `cbxs_st1`. Smoulder's WSS101/201 resources contain `st1to2`;
the scheduler inventory also records `st2to1` in WSS501. Evidence is in
`outputs/monster-action-scheduler-contract-20260810/scheduler_manifest.csv` and
`scheduler_clips.csv`.

```
m034/act/emp_emp/bid/base/0000 fa03315aeed7fc7553384b1a16bf6c4a410bce1ab96cb04962f58b6092c2da84
m034/act/emp_emp/wss/base/0002 3530ba8206deffa6ab836095e945a6317a4a65c9abd1556f3aca466fae02d671
m034/equ/e001/top_tex1/0000 f108058593396c174fe1e363d02fb5a9056dbd5517db8eb09a90d78e7d1e987a
```

Other model-state bits and pre-existing encounter-owned glow are preserved.
Late viewers receive the current state after model binding; a pending viewer
cannot reapply an already expired glow. Other monster models are untouched.
Smoulder's existing fire imbuement, action behavior and duration are unchanged.

### Smoulder crash correction

Smoulder's synthetic status ID 230116 is absent from both native `status.csv`
and `xtx_status.csv`. Its former visible/non-silent database flags caused the
server to publish that unsupported ID in status icons and gain/loss results.
That is a concrete unsafe client lookup path, consistent with the reported
crash; it is not a new live crash reproduction.

The main `Data/sql/server_statuseffects.sql` now marks Smoulder hidden and
silent. The same correction covers the adjacent documented server-only
compatibility statuses 230114, 230115 and 230117. The existing 230119 marker
already had those SQL flags. `StatusEffect` enforces the policy even when an
installation still has the old SQL rows. Status application and failure
results also respect the policy, retaining the action/damage result without
an invalid status lookup. Native statuses continue to publish normally.

Smoulder remains a working damaging command with its configured 30-second
fire imbuement and native glow. Real Lua gain, command-start, refresh, expiry
and disengagement paths are exercised by the compiled tests. It does not
grant Blaze Spikes or Greywine's separate counter behavior.

Greywine's purple counter window is a separate documented encounter limitation
in `docs/class_job_quest_implementation_2026-08-23.md` and
`QuestDirectorJobDrg0j6.lua`. This change does not reconstruct that mechanic.
The supplied modern Firedrake/Smoldering Scales references do not establish an
automatic 1.23 aggro trigger or Blaze Spikes for Smoulder; no such behavior was
added. The eLeMeN Drake record explicitly associates red glow with Smoulder.
The preserved historical wiki table in
`docs/ffxiv-1.0-wiki/bestiary/scalekin/drake/special_actions.md` also describes
Smoulder's fiery aura and fire attacks, while listing Surge separately as
purple glow with lightning attacks.

## Validation

An isolated Release build passed with zero errors. These compiled suites passed:

- `--monster-presentation-only`: all three stone/element/spell pairs, appearance
  bank preservation, rebind/reload persistence, respawn selection, exclusions,
  real Smoulder command-helper and status Lua hooks, physical-command fire
  imbuement, spell preservation, refresh/expiry/disengagement, main SQL flags,
  absence from native status sheets, invalid failure-result suppression,
  other state-bit ownership and late viewer packets.
- `--pudding-elements-only`: existing six-element gameplay and presentation.
- `--totorak-leash-only`: existing return/leash contract.

The existing workspace `--compatibility-status-only` harness also covers stale
database flags, status gain/refresh/loss, empty icon/snapshot packets, native
status controls and Smoulder fire restoration. The build reported existing
package/obsolete-API warnings.

The broader `tools/validate_elemen_server_implementation.py` gets through its
Smoulder and updated Spriggan checks, then fails its existing sight-detection
source-text contract. This pass does not change the sight-detection controller.
The obsolete Spriggan check was updated to allow the requested random rock
selection and no longer rejects unrelated elemental-appearance field names.

The isolated build is under `.codex-build/monster-presentation-tests`.
Deploy the rebuilt Map Server and updated scripts together, and use the normal
Python SQL updater to import the corrected main status rows. The runtime guard
also protects old rows until that import.

No running server, live database or installed client was changed. Native asset
inspection and server tests are not an in-game visual confirmation.
