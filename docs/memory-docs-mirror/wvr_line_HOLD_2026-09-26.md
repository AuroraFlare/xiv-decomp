# Weaver (Wvr200/300/306) — HOLD assessment

Assessed: 2026-09-26. NOT implemented.

Shared decisive blocker: no quest-item recipes registered (Red
Riding Hood, Midnight Slippers, Luxurious Gloves chain) and no
synthesis/Parley/private-area transaction owners.

## Wvr200 Hoodwinked

Exact Red Riding Hood recipe recovered, but synthesis/result-state
callbacks, item grant/consume/cleanup, and Chuchumu/Ouvielle
exact variants + Golden Bazaar triggers unresolved. Verified
2026-09-26: both Chuchumu candidates (1000905/1000906) are identical
in actor_class (display 1500042, no spawns) — the variant is a coin
flip; both Bazaar scenes are trigger-only (display 4000257, no
actor), which the talk-to-actor driver cannot address. Deaustie
spawn 149, all five recipe items, and central gil/mark rewards
exist. Needs trigger-actor owners + variant ruling first.

## Wvr300 Dance the Night Away

Four scenario Parley event groups with all opponent identities
recovered, but negotiation title/opponent bindings, Parley
launch/result/per-opponent flags, slipper grant/consume, and
private-area transitions unresolved.

## Wvr306 A Fruitful Murder

Non-combat "instance": ten Luxurious Gloves from ten Velveteen +
ten Cotton Yarn plus one-at-a-time Thanalan Spider Silk removal
with MANDATORY on-site synthesis beside Chuchumu. Per-strand and
synthesis state mutation, inventory transactions, the non-combat
SQB entry/success/retry/cleanup lifecycle, late-scene state
split, and Echo ownership all unresolved.

## What would unblock them

Recipe registration + synthesis credit (including on-site
synthesis), Parley subsystem, non-combat private-content
lifecycle, actor-variant resolution, atomic rewards. States,
markers, scenes, and items are recovered in the template.
