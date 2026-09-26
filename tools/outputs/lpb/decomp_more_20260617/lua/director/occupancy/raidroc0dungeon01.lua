require("/Director/Occupancy/OccupancyDirectorBaseClass")
_defineClass("RaidRoc0Dungeon01", "OccupancyDirectorBaseClass")
function RaidRoc0Dungeon01.initForEvent(A0_0)
  local L1_1
end
function RaidRoc0Dungeon01.processUIFinalize(A0_2)
  desktopWidget:closeRaidDungeonExecutionWidget()
end
function RaidRoc0Dungeon01.eventNoticeCutScene(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8
  L5_8 = 1
  if A2_5 == "rad0r100" then
  else
    A1_4:_fadeOut(L5_8)
    if A2_5 == "rad0r106" then
      desktopWidget:closeRaidDungeonExecutionWidget()
    end
    A1_4:_waitForFading()
  end
  worldMaster:createCutScene(A2_5, A0_3):startCutScene(1, 61, 1, 0, A3_6)
  worldMaster:createCutScene(A2_5, A0_3):_delete()
  A1_4:_fadeIn(L5_8)
  if true then
    desktopWidget:openRaidDungeonExecutionWidget(4102, 2, A4_7)
    desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
  end
end
function RaidRoc0Dungeon01.relogin(A0_9, A1_10, A2_11, A3_12)
  A1_10:_fadeInNowLoadingForNoticeEventJustInArea()
  if A3_12 == false then
    desktopWidget:openRaidDungeonExecutionWidget(4102, 2, A2_11)
  end
end
function RaidRoc0Dungeon01.widgetSetOn(A0_13, A1_14, A2_15, A3_16)
end
function RaidRoc0Dungeon01.widgetSetOff(A0_17)
  desktopWidget:closeRaidDungeonExecutionWidget()
end
function RaidRoc0Dungeon01.debugSelect(A0_18)
  local L1_19
  return L1_19
end
