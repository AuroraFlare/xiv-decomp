# New-chat handoff: implement Ifrit Plumes, Incinerate, Eruption, and Nail hold

Created: **2026-08-04, America/New_York**  
Repository: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`  
Installed 1.23b client used as read-only evidence: `C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV`

## Paste this into the new chat

```text
Continue the Aurora Flare FFXIV 1.23b Ifrit work in:

C:\Users\drime\source\repos\AuroraFlare\FF14-Memory

I now authorize implementing the server/source-side presentation fixes for:

1. Incinerate / Ifrit's breath flames;
2. Radiant Plume's recognizable ground pattern;
3. Eruption's fixed ground fire and rocks;
4. Infernal Nails staying raised after their entrance.

First read this handoff completely, then read these two primary decomp reports:

- docs/ifrit-animation-decomp-2026-08-02/PLUME_ERUPTION_INCINERATE_DEEP_DIVE_2026-08-03.md
- docs/ifrit-animation-decomp-2026-08-02/INFERNAL_NAIL_RISE_RETURN_HANDOFF_DECOMP_2026-08-03.md

Also consult these narrower reports when needed:

- docs/ifrit-animation-decomp-2026-08-02/RADIANT_PLUME_AND_GROUND_ERUPTION_DECOMP.md
- docs/ifrit-animation-decomp-2026-08-02/IFRIT_ERUPTION_ANIMATION_DECOMP.md
- docs/ifrit-animation-decomp-2026-08-02/INFERNAL_NAIL_CLIENT_CURVE_APPENDIX.md
- docs/ifrit-animation-decomp-2026-08-02/INFERNAL_NAIL_RUNTIME_PROBLEM_DECOMP.md

Important boundaries:

- Do not modify installed client/DAT files or replace recovered retail assets.
- Prefer scoped server/source changes. Do not change canonical SQL/client-data rows unless implementation truly requires it; ask me before a material data migration.
- Preserve unrelated worktree changes. At handoff time the dirty files were Data/scripts/commands/gm/weather.lua, Data/sql/server_weather_rates.sql, and Fishing Tests/Program.cs. They are unrelated and must not be edited or reverted.
- Inspect the current source before editing because it has moved beyond the older report snapshots. Re-pin relevant file hashes and reconcile rather than restoring an older version.
- Do not commit, push, or clean the worktree unless I explicitly ask.
- Use the existing GM probes and add narrowly scoped diagnostic controls only when they materially answer a visual ownership question.
- Implement incrementally, validate after each mechanic, and report what is source-proven versus what still needs my live-client visual confirmation.

Architectural rule: keep authoritative damage geometry separate from visual ownership. Damage can continue using the existing private commands and frozen server coordinates. Ground VFX must be emitted by a compatible, invisible, inert, untargetable actor located where the client effect expects its caster or target to be. The action-result packets carry actor IDs, not arbitrary XYZ coordinates.

Implementation order:

A. Incinerate first because its donor is high confidence.

- Private command 23982 maps to canonical 23363 for Normal/Hard and 23579 for Extreme.
- Both use packed animation 0x13001000 / m852 WSS1.
- WSS1 contains the two-second Ifrit body motion, a 61-frame caster VEFF, three 21-frame kick effect controllers, and the target effect.
- Its large forward flame/line/distortion meshes are approximately 17 units wide and 8.2-8.5 units deep, matching the ten-yalm 90-degree cone.
- Do not replace WSS1 and do not use body-only PlayAnimation. Ensure the normal ForceScriptedMobSkill/action-result path lets the client consume the full WSS1 caster scheduler and kick layers from the real m852 Ifrit actor.
- If the body plays but flames are missing, debug command/result envelope, actor compatibility, animation selection, and scheduler consumption. The missing flames are not a second body animation.

B. Eruption second because ownership is the main known defect.

- Existing server damage already freezes the selected target position at cast start in MobSkillState. Preserve this.
- Current WSS2 supplies compact target-side fire rings but no rocks.
- WSS10 contains caster-owned rock/fire/glow/distortion and has no target branch.
- WSS22 is the strongest combined comparison: its Kuroko caster branch owns rocks/fire, while its target branch generates fire rings. Its rocks still remain at the caster.
- The production solution should create a compatible stationary visual anchor at each frozen Eruption point. It must be invisible, combat-inert, untargetable, UI-hidden, instantiated before playback, and cleaned up only after the effect tail.
- Keep damage on the existing authoritative cast. Use a presentation-only action from/to the anchor so the helper cannot deal duplicate damage.
- First ranked trial: an m999-compatible anchor at the frozen point playing WSS22 as both source and self-target, which gives the caster-owned rocks and target-owned ring the same world position.
- Secondary trial: WSS10 from the anchor for caster-only rocks, optionally retaining WSS2 target fire separately if the combined WSS22 package is wrong.
- Do not play WSS10/WSS22 from Ifrit or an arena-center helper when the desired burst is at a remote frozen point; that guarantees caster-owned rocks appear at the wrong location.
- Extreme currently aliases Eruption 23983 to canonical 23582/WSS1, unlike Normal/Hard 23364/WSS2. Do not assume the current difficulty-specific donor is correct when adding the visual-emitter path.

C. Plumes third because WSS21 is still a ranked candidate, not a proved retail selector.

- Current Center Plume resolves to WSS3 in Normal/Hard; outer/final resolves to WSS1. These are structurally poor radial-floor donors. WSS1 is dominated by the Incinerate forward wedge.
- WSS21 is the strongest unproved Plume candidate. It is effect-only Kuroko/helper content and both caster and target graphs contain ManyGenerateUnitTime, FormSphere, MotionEmission, and DrawLine.
- WSS12-WSS14 are secondary comparisons; they have generated layouts but also carry a 4.333-second Ifrit body special and may be Hellfire/another major special.
- Preserve the authoritative Plume damage shapes: center radius 16, ordinary outer donut 8-22, final/full-floor donut 8-50.
- Do not expect those numeric damage radii to scale the VFX automatically; they are not serialized into the animation packet.
- Use a compatible invisible visual owner at the layout center. Prefer a source/target configuration that keeps WSS21's generated branches co-located. If one WSS21 emission cannot visually distinguish center versus outer layouts, use the smallest evidence-backed set of emitters/branches rather than changing damage geometry.
- Extend the GM probe matrix to test WSS21 on a true m999-compatible owner as source and self-target if the existing ground probe does not exercise both branches correctly. Get a live visual result before permanently replacing every production Plume donor.

D. Nails last, and do not try to pause the rise.

- WSS1 cbbm_sp_01 is 90 frames / 3.0 seconds. It settles raised by frame 55 (~1.833 seconds) and holds the same raised Y through frame 90.
- The apparent drop is separate one-frame cbbm_id0, which restores n_hara Y to approximately -6 and contracts the spikes.
- There is no current pause/seek/stop-at-frame packet. Do not loop, split, interrupt, or repeatedly replay WSS1.
- Persistent state candidate is breakage/substate index 4, raw bit 0x10, associated with cbbm_msb4_1 and m524_body_aura.
- Current source already changed from the old 3.35-second handoff: it now waits 2.1 seconds after WSS1 begins, toggles raw 0x10 inside the raised hold window, waits another 1.25 seconds, and intentionally uses no height bridge for its first A/B.
- Test that current path before rewriting it. If it remains raised and grown, keep the state handoff. If it still falls at 3.0 seconds, add a presentation-only +6 height bridge at the body-release boundary; then determine whether msb4 is additive or replacement before deciding whether height stays +6 or resets to zero.
- Do not move authoritative Nail XYZ. Remember current NAIL_APPEARANCE_SIZE = 4 is marked as a live diagnostic while canonical retail data uses size 2; do not accidentally treat that diagnostic as a proved final value.

Existing GM controls to reuse:

- !testifrit <normal|hard|extreme>
- !testifrit ground <2|3|4|10|12|13|14|21|22>
- !testifrit eruptionprobe <player|anchor>
- !testifrit eruptionprobe <4|10|21|22> <23364|23374|23375> <magic|anim>
- !testifrit nailstate <on|off>
- !testifrit nailbreak <0|8|16>
- !testifrit nailanim
- !testifrit nailcast

Be aware of probe limitations:

- ProbeGroundBank currently chooses actor class 2207310 only for banks <= 3 and 2207314 for the others; that is not the same as proving m999 compatibility for WSS21/WSS22.
- ProbeEruptionVfx creates an m999 base-model anchor but sends the tested action from live Ifrit to that anchor. This isolates the target branch; it does not place WSS22's caster-owned rocks on the anchor. Add an anchor-source/self-target cell when needed.
- The older runtime trace reported actorMismatch warnings for class 2207310/Ifrit mob-type combinations. Reaching the helper spawn path does not prove the helper can consume m852 or m999 art.

Validation and acceptance:

- Run: powershell -ExecutionPolicy Bypass -File .\tools\validate_ifrit_family.ps1
- Update the validator narrowly for intentional new contracts; do not weaken or delete unrelated checks.
- Build the affected Map Server project/solution with the repository's existing build workflow.
- Verify Normal, Hard, and Extreme command mapping and cleanup paths.
- Confirm helpers never expose a nameplate, HP bar, enmity UI, collision target, auto-attack, or duplicate damage.
- Confirm Eruption damage remains fixed at cast-start XYZ while the player moves.
- Confirm Plume safe regions remain center/outer/final as authored by server geometry.
- Confirm Incinerate shows body plus forward flames, not just the pose.
- Confirm Nails rise once, remain mature, retain aura/flames, can be targeted at the intended time, and still use their normal death presentation.
- At handoff, list every file changed, tests run, live observations still needed, and any candidate bank that remains provisional.

Do not stop at a prose recommendation: make the safest scoped implementation that the current evidence supports, validate it, and leave explicit A/B controls for any visual choice that cannot be proved without my client.
```

## Current source pin for the receiving chat

The receiving chat must re-check these because the repository may continue changing.

| File | Bytes | SHA-256 at handoff |
|---|---:|---|
| `Data/scripts/directors/InstanceRaid/IfritEncounter.lua` | 74,260 | `e23b81708d430fe0b32d65cd53552862d7fdeac7301843ae3f8460bb4fd4ee84` |
| `Data/scripts/monster_tp.lua` | 39,007 | `fc9394f55734e92e9bb9fd8b53e194d2f9c39330b81d07274d937f7316ec9269` |
| `Data/scripts/commands/gm/testifrit.lua` | 3,407 | `f57a8e973c666eef691e1506600a10b9c333dad220c146d7af63d2a1bb3c2703` |
| `Map Server/Primals/IfritManager.cs` | 74,898 | `2134bd5289959aed2d95a5caf792d0862514cd08ab80b6e804b5de208a8659ad` |
| `Map Server/Actors/Chara/Ai/BattleCommand.cs` | 20,678 | `273e24860aa9d2d3ce0795e7a1d88ef39db646bd65268528537b87f74e6cdb30` |
| `Map Server/Actors/Chara/Ai/Controllers/BattleNpcController.cs` | 90,613 | `2d21314eb01d6819eaa37da1ec1e1a763dc09b5c0fc1bb67233b9e4de05b3f1c` |
| `Map Server/Actors/Chara/Ai/State/MobSkillState.cs` | 11,847 | `fc03f519877d0aac45dfb24f84165dab9a762a3f4c3abd71ce50530f8bcb3240` |
| `Map Server/Actors/Chara/Npc/BattleNpc.cs` | 197,045 | `94193b75d2fec46c7f7decc9b17700f664390029634200399014f49ed7c6db20` |
| `Map Server/Actors/Chara/Character.cs` | 176,418 | `1436cf760d4b710adc78aba8a504efe2fe1a25c618572e0df4fd1b4b90268725` |
| `Map Server/Actors/Actor.cs` | 43,695 | `d31e8509b88485a0e5611b358e360030819706ff88bb9019fed49b74a500f2c7` |
| `Map Server/WorldManager.cs` | 666,324 | `307a4aa704be4b9fd983d64781a21c53d573c9cdd67bb5cdce5ac563a19d354b` |
| `tools/validate_ifrit_family.ps1` | 76,356 | `980405e0195ad939311675f61dae48721d22dcb0b49ac0accce299584430a080` |

## Evidence summary behind the prompt

| Mechanic | High-confidence fact | Remaining live decision |
|---|---|---|
| Incinerate | m852 WSS1 contains the body, large forward flame wedge, caster curve, three kick curves, and target branch | Why the live client may consume the body without every effect layer |
| Plume | Current WSS1/WSS3 donors lack the radial generator family; WSS21 has generated caster and target layouts | Whether WSS21 is recognizable Radiant Plume and which branch/layout matches center versus outer |
| Eruption | Damage is frozen server-side; WSS2 has target fire rings; WSS10/WSS22 have caster-owned rocks | Which compatible anchor/bank/envelope produces the intended combined burst |
| Nails | WSS1 ends raised; separate BID idle buries at Y=-6; raw 0x10 is the persistent-state candidate | Whether msb4 replaces or overlays buried idle, determining the need for a +6 bridge |

## Handoff safety check

At creation time `git status --short` showed only these unrelated tracked modifications:

- `Data/scripts/commands/gm/weather.lua`;
- `Data/sql/server_weather_rates.sql`;
- `Fishing Tests/Program.cs`.

This handoff adds only this Markdown file. It does not implement or modify any encounter, client, SQL, or server data.
