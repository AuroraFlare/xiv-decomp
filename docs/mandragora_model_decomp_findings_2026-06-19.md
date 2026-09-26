# Mandragora / m009 Decomp Findings

Later work: the [2026-09-13 authored-motion overlay](mandragora_authored_animation_2026-09-13.md)
uses the recovered full-key decoder to encode new idle/walk/run curves against
the native 24-bone m521 skeleton. This is a new experimental construction, not
a recovered retail bank or a live-validated replacement for the failures below.

## 2026-07-26 Live Recovery Boundary

The server now exposes `!spawnmonster mandragora` and a constrained `!mobanimation wss 1..11` probe. The retail-asset conclusion remains unchanged: installed `m521` has eleven WSS one-shot banks but no BID, BTL, or MGC bank. The spawn defaults to stationary, disables auto-attacks, and suppresses server turn/look-at updates so it requests fewer unsupported client states.

The 1.x-only evidence pack at `outputs/legacy-monster-animation-recovery-20260726` also scanned all 24 recovered late-1.x patches. `m521` model and skeleton assets first appear in `D2011.10.04.0000.patch`; no recovered patch contains an `m521` BID entry, and no installed action bank outside `m521` references `skl_m521b001`.

On 2026-07-28, `tools/build_legacy_monster_bid_probe.py` produced a new experimental boundary rather than discovering a shipped bank. It rebuilds the known-good `m020` BID state container, removes all donor motion transforms, fills every motion-transform resource with a one-frame `m521`-native WSS 0001 payload, retargets the state graph to `skl_m521b001`, and substitutes the WSS controller that contains `RapturePhysicsIgnoreLookAtClip` for both idle states. Windower loads the result from `outputs/legacy-monster-bid-probe-20260728` without overwriting the client.

Live 1.0 testing proves that the reconstructed BID containers are accepted, but later close visual checks disqualify every tested pose as a genuine rest state: held WSS 0001 leans and rotates the head, a looping WSS 0007 spins the head, and held WSS 0007 does not visibly improve the malformed baseline. Raw `!mobanimation wss 7` briefly raises Mandragora upright, but the supplied one-second recording shows a deliberate, noisy special-action cycle rather than a calm idle; its internal motion name is `cbbm_sp_02`. Periodic WSS 0007 replay therefore remains an opt-in `!mobidle on` diagnostic and is not enabled by `!spawnmonster mandragora`. No current probe is evidence of a recovered retail idle, stable rest pose, or locomotion.

## 2026-06-19 Continuation Update

This note's native `m009/m010` trace is still valid, but the Mandragora model identity has been superseded by a deeper client-folder string pass.

- `m009` is still not Mandragora; it is still bound by actor data to Great Buffalo/Kujata.
- `m010` is still missing from the installed client tree.
- `m521` is now the direct Mandragora asset candidate. Its WSS files contain paths such as `vfx/mon/mandragora_521/skill01/...`.
- No `actorclass_graphic` / `gamedata_actor_appearance` row currently binds `base = 10521`, so Mandragora is asset-proven but actor-unbound.
- A follow-up check of the raw DAT-mined `docs/Dat Mining/actorclass_graphic.csv` also found zero `base = 10521` rows, so the missing binding is not just a SQL projection/import gap.
- The later actor binding continuation traced nearby false positives (`10526/10527` Garuda support and `10022` Cloud/Sephiroth dragon) and still found no alternate Mandragora route; `10521` remains unbound.
- A wider residual sweep found local wiki `Mandrake` references, but those are item/gathering/food context rather than Mandragora/Mandrake combat actor data.
- `docs/Dat Mining/xtx_monsterRace.csv` and `xtx_displayName.csv` do not expose `Mandragora` or `Mandrake` as a race/display family.
- The complete decompiled monster Lua species summary also has no `mandragora` / `mandrake` script family, and current `gamedata_guildleve_mob_types` has no `base = 10521` row.
- `skillListId 47` is not an unused Mandragora bucket. It is live Roselet data: `pruned_roselet` uses actor `2102722`, display `3102722`, `base = 10039 -> mon/m039`, and `/Chara/Npc/Monster/Flower/FlowerPoisonousStandard`.
- The Roselet commands `23085..23089` still matter for a custom Mandragora experiment because they select model animation slots `2..6`, which line up with `m521` WSS `skill02..skill06`. `23084 bombardier` selects slot `1`, but it belongs to `skillListId 84: beetle`, which is live on `lightning_beetle` / Orebeetle data, not Mandragora.
- No exact command scripts were found for `bombardier`, `spoil`, `seedvolley`, `germinate`, `seedspray`, or `sough`; they currently fall back to `weaponskill/default.lua`, meaning generic potency damage only unless custom Lua is added. `Soughspeak = 223115` exists as a Lua/C# status enum value, but no `server_statuseffects` row or effect script was found, so true `sough` behavior needs status data/script work before a custom Mandragora can use it faithfully.

See the updated candidate audit for the current implementation read:
`docs/candidate_monster_decomp_implementation_audit_2026-06-19.md`.

## Question

Can the native client decomp reveal a hidden model-to-actor binding for Mandragora, especially around `m009` or a missing `m010` slot?

## Native Client Decoder

The useful native path is in the IDA assembly export, not the Ghidra C export. The decompiler missed the smaller function boundaries around this area, but IDA identifies the split and path-builder routines cleanly:

- `sub_6B7840` copies the actor appearance data and decodes the `base` value into a character category plus a local model number.
- `sub_6B7A40` maps that category to path prefixes and builds client asset paths.

The key `base` split in `sub_6B7840` is:

```text
base >= 40000 -> category 2, model = base - 40000
base >= 20000 -> category 3, model = base - 20000
base >= 10000 -> category 1, model = base - 10000
base >=   256 -> category 1, model = base - 256
otherwise     -> category 0, model = base
```

`sub_6B7A40` then indexes these category prefixes:

```text
0 -> pc/c
1 -> mon/m
2 -> wep/w
3 -> bgobj/b
```

and formats paths like:

```text
/client/chara/%s%03d/equ/e%03d/%s%s/%04d
```

So the native decoder resolves these directly:

```text
10009 -> category 1, model 009 -> mon/m009
10010 -> category 1, model 010 -> mon/m010
10011 -> category 1, model 011 -> mon/m011
```

There is no separate Mandragora name lookup or fallback in this path.

## Native Actorclass Graphic Loader

The next deeper native trace is `sub_55D2B0`, which loads the `actorclass_graphic` table itself.

That function:

- Pushes the literal sheet name `actorclass_graphic`.
- Looks up the requested row id through the sheet object.
- Calls `sub_567140` to zero/init the output appearance struct.
- Copies row values into fixed struct offsets.

The first two actor appearance fields are direct:

```text
actorclass_graphic data column 6 -> output +0 -> base/model id
actorclass_graphic data column 7 -> output +4 -> size
```

For the important rows:

```text
2100801 column 6 = 10009, column 7 = 6
2100901 column 6 = 10011, column 7 = 0
```

This means the native client does not appear to use a hidden model-to-actor table between
`actorclass_graphic` and the model path decoder. The row's `base` value is copied into
the appearance struct, then the later decoder turns that value into `mon/m###`.

The rest of the loader also lines up with the server packet layout:

```text
columns 21/22/23 -> COLORINFO
columns 11-20, 14 -> FACEINFO
columns 8/9/10 -> HIGHLIGHT_HAIR
column 24 -> VOICE
columns 25-46 -> equipment and accessories
```

## Data Cross-Check

The server sends the same `base` value through appearance:

- `Npc.cs` reads `base` from `gamedata_actor_appearance`.
- `SetActorAppearancePacket.cs` writes that `modelID` directly into the packet.

The SQL data around the gap says:

- `2100801..2100804` use `base = 10009`.
- There is no `base = 10010` row in this neighborhood.
- `2100901` begins `base = 10011`.
- `2101001` begins `base = 10012`.

The actor class scripts confirm the family names:

- `2100801..2100804` are `/Chara/Npc/Monster/Kujata/...`.
- `2100901..2100916` are `/Chara/Npc/Monster/Cactus/...`.
- `2101001..` are `/Chara/Npc/Monster/Morbol/...`.

The display-name sheet confirms the English names:

- `3100801` = `great buffalo`.
- `3100803` = `kujata`.
- `3100901` = `cactuar`.

Targeted scans also came back empty for the missing slot:

- No `actorclass_graphic` or `gamedata_actor_appearance` row with `base = 10010`.
- No raw DAT-mined `actorclass_graphic.csv` row with `base = 10521`.
- No raw DAT-mined `xtx_monsterRace.csv` or `xtx_displayName.csv` family/name hit for `Mandragora` or `Mandrake`.
- No decompiled monster Lua species named `mandragora` or `mandrake`.
- No guildleve/behest combat mob type row using `base = 10521`.
- No raw installed-client string hits for `Mandragora`, `mandragora`, `Mandrake`,
  `mandrake`, `m010`, `/mon/m010`, or `mon/m010` in `ffxivgame.exe`.

The installed client tree also matches the decoder:

```text
client/chara/mon/m008 exists
client/chara/mon/m009 exists
client/chara/mon/m010 missing
client/chara/mon/m011 exists
client/chara/mon/m012 exists
client/chara/mon/m013 exists
```

`m009` contains `equ/e001/top_mdl/0001`, textures, sound, skeleton, and battle/action animation files, but the data binding names that model family as Great Buffalo/Kujata rather than Mandragora.

## Local Script Caveat

The Mandragora label in our current helper outputs is not authoritative data:

- `AI Scripts/scan_monsters.ps1` hardcodes `m009 = Mandragora`.
- `AI Scripts/find_unused.py` hardcodes `mandragora = m009`.
- `AI Scripts/hydrate.py` labels commands as Mandragora heuristically when names contain `seed`, `germinate`, `sough`, `bombardier`, or `spoil`.

Those heuristics explain why the TP-style commands were grouped as Mandragora, but they do not prove an actor-class/model binding.

## Conclusion

The original `m009/m010` decomp makes that specific read stronger, but the continuation pass changes the overall Mandragora wording:

`m009` is not evidence for Mandragora. The native client decodes `base = 10009` as `mon/m009`, and the data says that family is Great Buffalo/Kujata.

If Mandragora had occupied the obvious missing numeric slot, it would have been `base = 10010 -> mon/m010`; however, both the actor appearance data and the installed client `mon` folder are missing that slot.

The actual Mandragora client asset evidence found later is `mon/m521`, through WSS strings containing `vfx/mon/mandragora_521/...`. That is enough for a custom/unbound implementation experiment, but not enough to claim a retail actor binding.

Safe:

- Keep Mandragora experiment data separate from live Roselet and Beetle data, using a new unused custom skill list id that clones selected compatible commands. Do not use `skillListId 47`, `84`, or `93`; the current server data uses `93` for bee swarm.
- If experimenting, use `base = 10521 -> mon/m521` with a deliberately invented/custom actor binding, not `m009` or `m010`.
- Reuse the Roselet/Beetle command rows only deliberately. They are animation-slot-compatible with `m521`, but their current retail/data owners are Flower/Roselet for slots `2..6` and Orebeetle/`lightning_beetle` for slot `1`, not Mandragora. Their current behavior is also generic default damage unless we add exact command Lua.

Not safe:

- Do not spawn/place Mandragora as `m009`; that would bind to the Great Buffalo/Kujata asset family.
- Do not invent `base = 10010` unless a separate source for `mon/m010` or a real Mandragora appearance row turns up.
- Do not treat `m521` as retail spawn data until a real `base = 10521` actor row or equivalent source turns up.
- Do not relabel `skillListId 47` as Mandragora; it is assigned to `pruned_roselet` / `toadtrap` in the current server mob type data.
- Do not relabel `skillListId 84` as Mandragora either; it is assigned to `lightning_beetle`.
