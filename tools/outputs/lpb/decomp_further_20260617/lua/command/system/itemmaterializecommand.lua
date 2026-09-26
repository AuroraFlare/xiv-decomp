require("/Command/System/SystemCommandBaseClass")
_defineClass("ItemMaterializeCommand", "SystemCommandBaseClass")
function ItemMaterializeCommand.isDesktopCommandMode(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function ItemMaterializeCommand.canFire(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12)
  local L11_13
  L11_13 = true
  return L11_13
end
function ItemMaterializeCommand.showResult(A0_14, A1_15, A2_16)
  local L3_17
  L3_17 = A1_15._createVirtualItem
  L3_17 = L3_17(A1_15, A2_16, 1, 1)
  if desktopWidget:openEventModeWidgetYield("Ask/MateriaInformWidget", true, L3_17) == true and desktopWidget:getEventModeWidget("Ask/MateriaInformWidget") ~= nil then
    desktopWidget:getEventModeWidget("Ask/MateriaInformWidget"):show()
    A0_14:_wait(3)
    desktopWidget:closeEventModeWidget("Ask/MateriaInformWidget")
  end
end
