# Garuda, Good King Moggle Mog XII, and giant-coffer decomp index

Generated: 2026-08-02  
Client examined: FINAL FANTASY XIV `2012.09.19.0001`  
Server/source examined: `C:\Users\drime\source\repos\AuroraFlare\FF14-Memory`

## Safety and scope

This bundle is documentation from read-only inspection. No client DAT, server source, SQL, Lua, C#, model, skeleton, motion, VFX, sound, actor, spawn, or encounter data was changed. The only authored outputs are Markdown files.

The bundle covers three requested surfaces:

- Garuda and the Howling Eye: boss abilities, all installed direct action banks, coordinate relocations versus jump/landing assets, rock-tower degradation, shelter logic, plumes, clones, wind phases, and battlefield presentation.
- Good King Moggle Mog XII and Thornmarch: every court role, abilities, all installed `m701` action/library families, phase choreography, Memento, Maximoogle, inherited arts, arrivals, arena ring/wall presentation, and current implementation gaps.
- Giant non-guildleve coffers: the complete installed `b919`, `b920`, `b923`, and `b927` `e001`-`e003` model families; action banks `0001`, `0101`, and `0201`; lid/joint/handle motion; embedded VFX and sound; all 55 same-ID appearance bindings; proven and candidate spawn evidence; and unresolved retail encounter joins. The Guildleve Bonus Treasure Box is excluded except as an explicitly labelled control.

## Reports

Read these files together. A client asset being present does not mean that the current server selects it, and a current selector does not by itself prove the original retail mapping.

| Report | Contents |
|---|---|
| [GARUDA_CLIENT_AND_BATTLEFIELD_FINDINGS.md](GARUDA_CLIENT_AND_BATTLEFIELD_FINDINGS.md) | Garuda `m851`, plume `m527`, rock `m526`, WSS inventories, root-motion evidence, Howling Eye battlefield/weather resources, cinematic separation, hashes, and gaps. |
| [GARUDA_RUNTIME_APPEARANCE_ID_NOTE.md](GARUDA_RUNTIME_APPEARANCE_ID_NOTE.md) | Exact same-ID runtime appearance lookup and the proven tower size ladder `2209509 -> 2209508 -> 2209507`. |
| [MOOGLE_CLIENT_AND_BATTLEFIELD_FINDINGS.md](MOOGLE_CLIENT_AND_BATTLEFIELD_FINDINGS.md) | Court `m701` banks and libraries, role/ability evidence, Memento and phase presentation, Thornmarch ring/wall schedulers, arena resources, hashes, and gaps. |
| [GIANT_COFFER_CLIENT_AND_OPENING_FINDINGS.md](GIANT_COFFER_CLIENT_AND_OPENING_FINDINGS.md) | Four non-guildleve coffer families, all equipment variants and action banks, skeleton/motion structure, VFX/sound, the full 55-row same-ID appearance inventory, server selectors, proven decorative and candidate bindings, negative reward joins, and guildleve exclusion. |
| [LIVE_SERVER_IMPLEMENTATION_AUDIT.md](LIVE_SERVER_IMPLEMENTATION_AUDIT.md) | What the current Garuda and Moogle directors actually execute: targeting, damage geometry, queues, phases, packets, rewards, reconnect behavior, and emitted animation selectors. |
| [REQUESTED_SCOPE_COVERAGE.md](REQUESTED_SCOPE_COVERAGE.md) | One matrix that accounts for every requested feature and identifies proven evidence, high-confidence interpretation, unresolved mapping, and excluded scope. |

The earlier Ifrit, battlefield, eruption, plume, and Infernal Nail work remains a separate sibling bundle: [Ifrit animation decomp](../ifrit-animation-decomp-2026-08-02/README.md). In the published repository layout, the target is `docs/ifrit-animation-decomp-2026-08-02/README.md`.

## Confidence terminology

The status words in this bundle are deliberately narrow:

- **Proven**: directly present in decoded installed-client data or directly executed by the pinned current server/source path. The report states which of those evidence classes applies.
- **High-confidence**: supported by explicit internal names, motion curves, timing, scheduler structure, or multiple consistent joins, but not confirmed by an authoritative retail packet/selector trace.
- **Unresolved**: the installed evidence does not establish an exact retail mechanic-to-animation, actor-to-spawn, or coffer-to-encounter mapping.
- **Excluded**: deliberately outside the requested target. It may appear only as a negative/control that helps bound the target.

“Proven client asset” and “proven current implementation” are not interchangeable. For example, Garuda's ascend and landing banks are proven client assets, while her current relocation by ordinary position update is proven current behavior; the original retail event-to-WSS binding remains unresolved.

## Headline findings

- Garuda has fourteen direct WSS packages. Her current command table selects WSS1 for every listed private action except Mistral Shriek, which selects WSS2. High-confidence takeoff and landing assets exist in WSS12-14, while current mechanic relocations use coordinate updates without selecting them.
- Rock towers have three live size stages and four authored top/middle/low/all break-effect banks. The size ladder is emitted; the authored break banks are not. Shelter is an X/Z server line-projection test used only for the pre-blast Mistral mechanics.
- Plumes have multiple installed `m527` packages and equipment variants, but current Feather Lance and Thermal Tumult both select WSS1.
- All eight Thornmarch actors share the installed `m701` action root, which contains far more direct and library animation content than the current fight selects. Almost every ordinary Moogle art uses WSS1; Memento uses WSS1-3. Current arrivals, ritual replacement, growth, and inherited-art acquisition have no dedicated choreography selector.
- Thornmarch contains named arena ring and wall show/hide scheduler groups. Their installed presence is proven; exact retail sequencing beyond recovered scheduler structure remains separated from current director behavior.
- The four coffer families each have three model/equipment variants and three installed action banks with skeletal motion, effect, and sound content. Three rigs have a single `n_lid`; `b920` has `n_joint` and `n_handle`. No inspected target rig has paired left/right door bones.
- The exhaustive same-ID binding inventory contains 55 appearance rows: eight `b919`, eight `b920`, 30 `b923`, and nine `b927`. Only `1080056` has class path `/Chara/Npc/Populace/PopulaceStandard`; excluded control `1200161` has `/Chara/Npc/Object/GuildleveBonusTreasureBox`; the other 53 class paths are blank.
- Three exact PWIB records bind `b919/e001` to an Ixali Natalan cutscene prop, `b920/e002` to a Kobold U'Ghamaro cutscene prop, and `b927/e001` to an Amalj'aa Zahar'ak cutscene prop. These prove stronghold themes only, not reward-coffer, opening-bank, or primal joins. The other 9,590 of 9,593 inspected cut files have no valid target-family record; Garuda `sum6g000` and Moogle `sum6m000` specifically have none.
- Three proven current static spawns, `etc5l1_chest_1`, `etc5l1_chest_2`, and `etc5l1_chest_3`, use `1080056 -> b923/e001` in a Private Eyes quest room. They are decorative non-primal evidence, not a dungeon/primal reward join and not a proven opening receiver.
- A raid-dungeon server path selects bank `0201`, but the original concrete retail actor/appearance/spawn join is unresolved. Historical Garuda and Thornmarch sources establish that reward chests existed, not which of the four coffer families they used.

## Evidence boundary

No live viewer/render pass was used for this bundle because the available viewer writes configuration and dump files. Visual-direction claims are therefore limited to what the decoded skeletons, motion resources, schedulers, VFX/sound references, current server source, and archived local evidence support. No report assigns a primal or dungeon identity to `b919`, `b920`, `b923`, or `b927` without a direct join.
