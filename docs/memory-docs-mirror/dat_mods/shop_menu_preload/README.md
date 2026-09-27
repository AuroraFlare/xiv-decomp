# Standard Shop Buy-Menu Preload

This Windower `DatOverlay` patch speeds up the initial construction of standard
shop Buy menus without changing shop contents, prices, selections, purchases,
or the server protocol.

The stock client asks `ShopBuyWidget` to build every row synchronously. During
that build it loads individual `shopItem` rows and creates their referenced
item/detail data. The patched `ShopBaseClass.openShopBuy` instead:

1. resolves the selected shop's exact start/end row range;
2. loads that range semipermanently;
3. preloads its referenced item spreadsheet container;
4. runs the unchanged stock widget creation and list build; and
5. releases the item container and unloads the range immediately afterward.

Only `ShopBaseClass.openShopBuy` is replaced. Sell menus and every other client
method remain byte-for-byte stock.

## Build and install

Close the game client, then run from the repository root:

```powershell
python tools/actions/build_shop_menu_preload_overlay.py
```

The default installed output is:

```text
..\Launcher Windower\New\FFXIV Meteor Launcher\bin\x86\Release\net48\Windower\DatOverlay\ShopMenuFast\client\script\729s9\wu7\uvupy975\r2vu\r2vu89r57y9rr.le.lpb
```

The launcher's existing additive `Windower\DatOverlay` setting should remain
unchanged. The builder refuses to install if either the recovered bytecode or
the installed retail LPB differs from the supported client version.

Fully restart the client after building. A relog or `//windower dat reload`
does not guarantee that an already-loaded Lua class is replaced.

## Verify and compare

1. Run `//windower dat status` in the client.
2. Open a normal NPC Buy menu, preferably one with many items.
3. Run `//windower dat trace` and inspect `Windower\Logs\Windower.log`.
4. Confirm the redirect for
   `client\script\729s9\wu7\uvupy975\r2vu\r2vu89r57y9rr.le.lpb` points to
   the `ShopMenuFast` collection.
5. Compare first-open and repeat-open times against the stock client.

This patch addresses local spreadsheet/item preparation only. It does not
remove the client/server widget handshake or the remaining synchronous XML UI
work, so the size of the improvement must be measured on the live client.

## Revert

Move the entire `ShopMenuFast` directory outside the active `DatOverlay`
directory, then fully restart the client. Renaming the collection is not a
reliable disable mechanism because first-level collection names are ignored.

DatOverlay LPB replacements are whole-file overrides and do not merge. If a
future package targets this same LPB, combine the bytecode patches or use the
trace output to confirm which collection wins.
