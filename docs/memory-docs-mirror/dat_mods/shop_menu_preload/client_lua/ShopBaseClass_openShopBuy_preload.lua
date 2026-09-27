-- Semantic reference only. The builder structurally patches the verified
-- retail Lua 5.1 bytecode; this recovered-style source is not compiled.
function ShopBaseClass.openShopBuy(self, player, shopId, currency)
  local startIndex, endIndex
  local didPreload = false

  if currency == nil then
    currency = 1000001
  end

  startIndex, endIndex = self:getShopBaseDetail(shopId)
  if 0 < startIndex and startIndex <= endIndex then
    didPreload = true
    shopItemSheet:_loadKeySemipermanently(startIndex, endIndex)
    self:_preloadItemSpreadSheetContainer(
      "shopItem",
      0,
      startIndex,
      endIndex
    )
  end

  desktopWidget:openEventModeWidgetYield(
    "Ask/ShopBuyWidget",
    self,
    shopId,
    currency
  )

  if didPreload then
    self:_releaseItemSpreadSheetContainer()
    shopItemSheet:_unloadKey(startIndex, endIndex)
  end
end
