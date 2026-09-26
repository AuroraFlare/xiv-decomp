require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectItemStorage", "NpcBaseClass")
function ObjectItemStorage.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(10272, "objectItemStorage")
  A0_0:_setGroundOn(false)
end
function ObjectItemStorage.storageMenu(A0_3, A1_4)
  if worldMaster:ask(A0_3, A0_3, 1, 4) == 1 then
    return 1
  elseif worldMaster:ask(A0_3, A0_3, 1, 4) == 2 then
    return 2
  elseif worldMaster:ask(A0_3, A0_3, 1, 4) == 3 then
    worldMaster:say(A0_3, 6)
    worldMaster:say(A0_3, 7)
    return 3
  end
  return 4
end
function ObjectItemStorage.selectCategory(A0_5, A1_6)
  return (worldMaster:ask(A0_5, A0_5, 8, 5))
end
function ObjectItemStorage.selectStoreItem(A0_7, A1_8, A2_9)
  if desktopWidget:askEventModeWidgetYield("Ask/ItemStoragePutWidget", 1, A2_9) == true then
    if desktopWidget:askEventModeWidgetYield("Ask/ItemStoragePutWidget", 1, A2_9) == nil then
    end
    return desktopWidget:askEventModeWidgetYield("Ask/ItemStoragePutWidget", 1, A2_9)
  else
    return nil
  end
end
function ObjectItemStorage.selectReceiveItem(A0_10, A1_11, A2_12)
  if desktopWidget:askEventModeWidgetYield("Ask/ItemStorageGetWidget", 1, A2_12) == true then
    if desktopWidget:askEventModeWidgetYield("Ask/ItemStorageGetWidget", 1, A2_12) == nil then
    end
    return desktopWidget:askEventModeWidgetYield("Ask/ItemStorageGetWidget", 1, A2_12)
  else
    return nil
  end
end
