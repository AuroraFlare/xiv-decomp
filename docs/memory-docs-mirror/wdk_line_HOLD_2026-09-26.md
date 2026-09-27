# Carpenter (Wdk200/300/306) — HOLD assessment

Assessed: 2026-09-26. NOT implemented.

Shared decisive blocker for all three quests: ZERO quest-item
recipes are registered in `Data/recipes.csv`, so no crafted quest
item (Vibrant Arrows, Splintered Bow variants, bows 11000058/59/60,
Colorful Block, Sable Salve, Fairweather Fetish) is obtainable, and
the server has no synthesis-detection/credit, per-stage synthesis
flags, or work-slot mutation for quests.

## Wdk200 The Mouths of Babes

Branching bow outcomes (3 candidate branches, 4 outcomes, ask-85
selection) need branch-search callbacks + outcome mapping + recipe/
inventory mutation that do not exist. Wybir/youngling/Marcelloix
placement unresolved.

## Wdk300 Hide and Seek Shenanigans

Nine states + six hide substates, 3 proven mandatory Parleys (+1
unmapped title variant), building-block/salve deliveries. Child
actors unresolved; Parley result mutation + item/package
transactions + private-scene ownership missing.

## Wdk306 Spanning the Spectrum

Non-combat ally-shooter route (Wybir shoots, player supplies
arrows; zero player kills), ask-108 drawing interactions, leaf/
fetish/petition items. Enemy roster, arrow recipe/delivery,
ally-failure callbacks, and route/private ownership unresolved.

## What would unblock them

Quest recipe registration + synthesis credit, Parley subsystem,
branch/selector state mutation, ally-shooter driver support,
child-actor placement, atomic reward transactions. Owners,
markers, states, scenes, and items are recovered in the template.
