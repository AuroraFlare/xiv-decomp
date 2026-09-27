# Assassin Complete Client Overlay

This is the installable client pack for the playable Assassin class. It combines:

- genuine custom action rows `29743` through `29760`;
- genuine custom trait rows `29761` through `29771`, including Triple Attack I
  (3%), Triple Attack II (an additional 4%), and the level-48 Enhanced Physical
  Attack Power II trait;
- a patched ActionSettingWidget class-13 branch that displays all eleven traits at
  their proper levels;
- donor action icons for the Assassin kit, with the supplied custom Shade Shift
  icon reserved at unused action-icon ID `30999`;
- Assassin action-detail terminology (the retail placeholder `Dark Arts` is
  presented as `Assassin`) and authoritative client-visible recast/TP costs;
- Shadow Fang's visible enemy status and supplied purple icon;
- the generated dagger/short-sword item, weapon, equipment, graphics-category,
  localized-name, and compatibility rows;
- Assassin-compatible non-AF battle gear rows.

The weapon tables use main-hand equip point `37`, frequency `1`, main skill
`13`, and Assassin compatibility `2174`. The 1.x client T-poses when an
Assassin dagger occupies the secondary arm, so Assassin weapons are restricted
to the main hand and Triple Attack supplies multi-hit rounds instead.

Install the contents as one Windower DatOverlay collection and fully restart
the client. The server must also load the Assassin SQL package and restart so
its command IDs match these client rows.
