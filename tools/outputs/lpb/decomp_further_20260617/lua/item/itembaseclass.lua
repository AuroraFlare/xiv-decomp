require("/Item/ItemBaseClass_common")
function ItemBaseClass._onInit(A0_0)
  A0_0:_callSuperClassFunc("_onInit")
  A0_0:_bindSpreadSheetData(itemDataSheet)
  A0_0:_bindSpreadSheetData(equipmentSheet)
  A0_0:_bindSpreadSheetData(weaponSheet)
  A0_0:_bindSpreadSheetData(armorSheet)
  A0_0:_bindSpreadSheetData(accessorySheet)
  if A0_0:_getOwner() ~= nil then
    worldMaster:_loadWord("itemName", A0_0:_getCatalogID())
  end
end
function ItemBaseClass._onFinalize(A0_1)
  if A0_1:_getOwner() ~= nil then
    worldMaster:_unloadWord("itemName", A0_1:_getCatalogID())
  end
end
