# Botanist (Hrv200/300/306) — HOLD assessment

Assessed: 2026-09-26. NOT implemented.

Shared decisive blocker: ZERO quest items exist in the gathering
pools, so no harvest quest item (Spiny Turnip Leaves, Bowing Pine
Branch, Foul-smelling Nut, Pearl Clover Seeds, Yarzon Faeces) is
obtainable, and the server has no node actors/transforms,
gathering callbacks, or item-to-area bindings for quests.

## Hrv200 Gridanian Roots

Non-combat turnip gathering + cleanup recovered, but the exact
weed count, node actors/transforms, callbacks, marker 02/03
ownership, idempotent cleanup, prerequisite conflict, and
linkpearl semantics unresolved.

## Hrv300 The Grass is Always Greener

One-branch/one-nut gathering, Penelope Parley title 1301, seven
exact quest items/exchanges recovered, but item-to-area/node
callbacks, Parley parameters/result persistence, seven atomic
consume/grant boundaries, Nenekko variant, and trigger/event
ownership unresolved.

## Hrv306 A Moogle Bouquet

Two gathering instances, dynamic Pearl Clover Seeds with
over-harvest branch, dynamic/correlated Yarzon Faeces, sleep/wake
hazard-not-kill mechanic, and Cicely Echo recovered, but
counts/formula, node/hazard actors, stealth/aggro/instance
lifecycle, dynamic scene payload, and Greatloam actors unresolved.

## What would unblock them

Quest gathering pools + node bindings, gathering callbacks,
Parley subsystem, stealth/hazard/instance lifecycle, dynamic-
count rules, Echo subsystem, actor-variant resolution, atomic
rewards. States, markers, scenes, and items are recovered in
the template.
