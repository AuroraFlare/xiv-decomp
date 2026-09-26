# Garuda runtime appearance-ID binding note

This note supplements `GARUDA_CLIENT_AND_BATTLEFIELD_FINDINGS.md` and makes the runtime lookup semantics explicit.

## Exact runtime behavior

The live `Npc` constructor calls:

`LoadNpcAppearance(actorClass.actorClassId)`

`LoadNpcAppearance(id)` then queries:

`gamedata_actor_appearance WHERE id = @templateId`

`ChangeNpcAppearance(id)` also passes the supplied ID directly to `LoadNpcAppearance(id)` and broadcasts the resulting appearance packet.

Source anchors:

- `Map Server/Actors/Chara/Npc/Npc.cs:113-117`
- `Map Server/Actors/Chara/Npc/Npc.cs:535-539`
- `Map Server/Actors/Chara/Npc/Npc.cs:560-614`

Accordingly, Garuda 2209501, plumes 2209510/2209512, clones 2209514/2209515, and towers 2209509/2209508/2209507 resolve their same-ID rows in `gamedata_actor_appearance`. The separate 32xxxxx field carried by the actor-class rows—including the repeated 3209510 value in this family—is not what this runtime path uses to resolve the visual appearance.

For the towers, this means the current live ladder is genuinely:

`2209509 (m526 size 4)` → `2209508 (m526 size 3)` → `2209507 (m526 size 2)` → despawn.

The three same-ID appearance rows share model `m526` but carry sizes 4, 3, and 2, so the live ladder visibly rescales the model. It still never invokes `m526` WSS1 `rock_top01`, WSS2 `rock_mdl01`, WSS3 `rock_low01`, or WSS4 `rock_all01`.

No client, server, SQL, or encounter data was modified while producing this note.

## 2026-08-05 implementation reconciliation

The note above records the 2026-08-02 snapshot. The current director preserves the same-ID appearance ladder and now serializes m526 WSS1, WSS2, and WSS3 for ordinary top-, middle-, and low-tier losses, then emits WSS4 on the Aerial full-collapse path before despawn. The exact original retail ordering remains a high-confidence reconstruction from the authored filenames rather than a captured selector trace.
