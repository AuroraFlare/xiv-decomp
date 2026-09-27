# Auction House Bot

The AH bot is the automatic stock manager for the web Auction House. It creates a hidden system user, character, and retainer, posts tagged listings through `auction_house_listings`, and refreshes the public `auction_house_bot_stock` catalog used by the Auction House "Always in Stock" tab.

Run it from the web login directory or with an absolute script path:

```powershell
php Data\www\login\auction_house_bot_seed.php
```

Stock rules:

- The default profile excludes mob drops and stocks ordinary NPC-vendor items plus Weathered/Dated gear.
- GMs can optionally include eligible normal battle NPC drop-list items.
- NPC-sold items from `Data/scripts/shop_prices.lua` are also eligible even if they are not mob drops, which keeps starter weapons, armor, belts, accessories, tools, and low-tier materials easy to find.
- Weathered and Dated tradeable equipment is pulled directly from `gamedata_items`/`gamedata_items_equipment`, even when it is not present in NPC shop data or normal mob drops.
- Any item that appears on a Notorious Monster drop list is excluded from AH bot stock, even if the same item also appears on normal mobs, NPC shops, or dated/weathered catalog fallback data. The exception is elemental shards, crystals, and clusters sold by ordinary gil vendors; all six elements of each type remain eligible at the lowest NPC shop price. NM drops are detected through `server_battlenpc_mob_types.isNotorious` and actor class paths containing `NM`.
- Grand Company-only items are excluded from the dated/weathered catalog fallback. Items that are also sold by an ordinary gil vendor remain eligible through `Data/scripts/shop_prices.lua`.
- All NPC-vendor elemental shards, crystals, and clusters are prioritized as market staples and listed at exactly the lowest NPC shop price. Common crafting materials, Weathered/Dated gear, and low-tier NPC equipment are also prioritized.
- Unique, untradeable, key-item, dummy, gil, materia, novelty/status-effect consumables, non-equipment single-stack, and potion items are excluded.
- Items present in `Data/scripts/shop_prices.lua` are treated as NPC-sold and capped to the lowest NPC shop price, with `gamedata_items.sellPrice` as the floor. Elemental shards, crystals, and clusters use the exact lowest NPC shop price. This prevents buy-from-NPC and relist-above-NPC arbitrage.
- Non-NPC mob drops use a deterministic legacy-economy price: sell value, mob level, and drop rarity are scaled toward the higher 1.0-style gil economy, while crystals use a gentler multiplier.
- The default stock run targets up to 2,500 distinct item types and keeps a stock quantity of 10 per type. Stackable items list as stacks of 10; equipment and other unstackables list as ten separate quantity-1 listings.

Each restock cancels previous active bot listings, refreshes the always-stocked item catalog, and creates fresh active listings. Sold listings are left intact for market history.

Automatic stock:

- Opening the control panel or Auction House initializes the default profile when needed and refills sold-out bot stock.
- The automatic pass uses a database advisory lock, so it will not collide with a GM or command-line stock push.
- Existing GM profile settings are preserved during automatic refill. NM-drop items and Grand Company-only catalog items remain hard exclusions.
- GMs can inspect stock totals, change the optional profile limits, and push stock from the **Auction House Stock Manager** on the control panel.

Buyback rules:

- The bot treats `auction_house_bot_stock.unitPriceGil` as the standing always-stock unit price.
- Player listings for always-stocked items are bought automatically when listed through the web AH and during restock sweeps when `auction_house_listings.priceGil <= unitPriceGil * quantity`.
- Buybacks mark the listing as sold to the hidden bot character and credit the seller retainer with the listing price. The bot does not debit a player-facing gil wallet.
- `--buyback-limit=N` caps how many qualifying player listings a restock run can buy. Use `--buyback-limit=0` to disable the sweep.

Useful options:

- `--limit=N` changes how many distinct item types the bot tries to stock.
- `--stock-quantity=N` changes the target quantity per item type. `--restock-quantity=N` is accepted as an alias.
- `--max-item-level=N` defaults to 99 so NPC-sold starter and dated/weathered gear are not filtered out by the older low-tier cap.
- `--exclude-mob-drops` skips normal battle NPC drop-list stock entirely. This is the default.
- `--include-mob-drops` adds eligible normal-mob drops. NM drop-list items remain excluded.
- `--exclude-dated-weathered` disables the dated/weathered catalog fallback.
- `--dated-weathered-only` stocks only tradeable Weathered/Dated equipment from the catalog fallback. `--dated-only` is accepted as an alias.

Examples:

```powershell
php Data\www\login\auction_house_bot_seed.php --limit=5000 --per-category=5000 --stock-quantity=10 --buyback-limit=0
php Data\www\login\auction_house_bot_seed.php --limit=5000 --include-mob-drops --buyback-limit=0
php Data\www\login\auction_house_bot_seed.php --limit=5000 --per-category=5000 --stock-quantity=10 --buyback-limit=0 --dated-weathered-only
```
