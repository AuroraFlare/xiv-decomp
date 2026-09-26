require("/Director/Occupancy/OccupancyDirectorBaseClass")
_defineClass("RaidFst0Dungeon03", "OccupancyDirectorBaseClass")
function RaidFst0Dungeon03.initForEvent(A0_0)
  local L1_1
end
function RaidFst0Dungeon03.processUIFinalize(A0_2)
  desktopWidget:closeRaidDungeonExecutionWidget()
end
function RaidFst0Dungeon03.eventNoticeCutScene(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8
  L5_8 = 1
  if A2_5 == "rad0f300" then
  else
    A1_4:_fadeOut(L5_8)
    if A2_5 == "rad0f306" or A2_5 == "rad0f307" or A2_5 == "rad0f308" then
      desktopWidget:closeRaidDungeonExecutionWidget()
    end
    A1_4:_waitForFading()
  end
  worldMaster:createCutScene(A2_5, A0_3):startCutScene(1, 61, 1, 0, A3_6)
  worldMaster:createCutScene(A2_5, A0_3):_delete()
  A1_4:_fadeIn(L5_8)
  if true then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, A4_7)
    desktopWidget:processUpdateGeneralNotificationDialog(3, nil, nil, 1)
  end
end
function RaidFst0Dungeon03.relogin(A0_9, A1_10, A2_11, A3_12)
  A1_10:_fadeInNowLoadingForNoticeEventJustInArea()
  if A3_12 == false then
    desktopWidget:openRaidDungeonExecutionWidget(2123, 1, A2_11)
  end
end
function RaidFst0Dungeon03.widgetSetOn(A0_13, A1_14, A2_15, A3_16)
end
function RaidFst0Dungeon03.widgetSetOff(A0_17)
  desktopWidget:closeRaidDungeonExecutionWidget()
end
function RaidFst0Dungeon03.debugSelect(A0_18)
  local L1_19
  return L1_19
end
