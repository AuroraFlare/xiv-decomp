# Level-50-only faction-leve cost widget

The server calculates and deducts faction-credit cost independently of the
client UI. The retail `GuildleveCardOrderWidget` shows its cost grid for every
guildleve ID below `2000`, so setting the server reward table to zero does not
remove the line shown in the card-selection window.

`tools/actions/build_faction_leve_level_50_cost_overlay.py` patches both stock
visibility sites. The widget now shows/formats the cost only for the known
level-50 faction-card IDs: `1011-1020`, `1111-1119`, and `1214`. Level 1,
20, 30, and 40 selections leave the entire cost grid hidden. The displayed
amount for level 50 still comes from the retail sheet's field `4`.

Build the DatOverlay package from the repository root:

```powershell
python tools/actions/build_faction_leve_level_50_cost_overlay.py
```

The DatOverlay-ready file is written to:

```text
outputs/faction-leve-level-50-cost-overlay/client/script/n1635q/9rz/3p1y6y5o579s6vs65sn1635q.le.lpb
```

Copy the `client` directory beneath a dedicated enabled Windower `DatOverlay`
package. Keep the server-side level-50-only cost check in place; this overlay
changes display behavior only.
