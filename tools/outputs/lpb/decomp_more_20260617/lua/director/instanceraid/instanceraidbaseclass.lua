require("/Director/DirectorBaseClass")
require("/Director/InstanceRaid/OccupancyPlayers/RaidPlayers")
_defineBaseClass("InstanceRaidBaseClass", "DirectorBaseClass")
function InstanceRaidBaseClass.init(A0_0, ...)
  A0_0.instanceRaidWork._temp = {
    {"startTime", "integer32"},
    {"finishTime", "integer32"},
    {"contentID", "integer16"},
    {"eventType", "integer8"},
    {
      "countdownStatus",
      "integer8"
    },
    {"clearFlag", "boolean"},
    {"initFlag", "boolean"},
    {
      "_assignForChild",
      192
    }
  }
  A0_0.instanceRaidWork.countdownStatus = 0
  A0_0.instanceRaidWork.clearFlag = false
  A0_0.instanceRaidWork.initFlag = false
  A0_0:_setLoopInterval(1)
  A0_0:processInitialize()
end
function InstanceRaidBaseClass.processUIFinalize(A0_2)
  A0_2:closeInformationWidget()
  A0_2.instanceRaidWork.countdownStatus = 0
  A0_2.instanceRaidWork.clearFlag = false
end
function InstanceRaidBaseClass._onEventCancel(A0_3, A1_4, A2_5, A3_6)
  A1_4:_resetFade()
end
function InstanceRaidBaseClass._onLoop(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  L2_9 = A0_7.instanceRaidWork
  L2_9 = L2_9.countdownStatus
  if L2_9 ~= 0 then
    L3_10 = A0_7
    L2_9 = A0_7.getRestTimeStatus
    L2_9 = L2_9(L3_10)
    if L2_9 ~= 0 then
      L3_10 = A0_7.instanceRaidWork
      L3_10 = L3_10.countdownStatus
      if L2_9 <= L3_10 then
        L3_10 = A0_7.instanceRaidWork
        L4_11 = L2_9 - 1
        L3_10.countdownStatus = L4_11
        L3_10 = nil
        L4_11 = 52009
        if L2_9 == 7 then
          L3_10 = _math.ceil(A0_7:getHalfTime() / 60)
          L4_11 = 52092
        else
          L3_10 = ({
            1,
            3,
            5,
            10,
            20,
            30
          })[L2_9]
        end
        worldMaster:notify(worldMaster, L4_11, A0_7:getContentID(), L3_10)
      end
    end
  end
end
function InstanceRaidBaseClass.getRestTimeStatus(A0_12)
  for _FORV_7_ = 1, #{
    1,
    3,
    5,
    10,
    20,
    30
  } do
    if worldMaster:_getServerTime() >= A0_12.instanceRaidWork.finishTime - ({
      1,
      3,
      5,
      10,
      20,
      30
    })[_FORV_7_] * 60 and A0_12:getHalfTime() > ({
      1,
      3,
      5,
      10,
      20,
      30
    })[_FORV_7_] * 60 then
      return _FORV_7_
    end
  end
  if worldMaster:_getServerTime() >= _FOR_.startTime + A0_12:getHalfTime() then
    return 7
  end
  return 0
end
function InstanceRaidBaseClass.getHalfTime(A0_13)
  local L1_14
  L1_14 = A0_13.instanceRaidWork
  L1_14 = L1_14.clearFlag
  if L1_14 == true then
    L1_14 = 5940
    return L1_14
  end
  L1_14 = A0_13.instanceRaidWork
  L1_14 = L1_14.finishTime
  L1_14 = L1_14 - A0_13.instanceRaidWork.startTime
  return _math.ceil(L1_14 / 2)
end
function InstanceRaidBaseClass.setCountDownTimer(A0_15, A1_16, A2_17, A3_18)
  A0_15.instanceRaidWork.startTime = A1_16
  A0_15.instanceRaidWork.finishTime = A2_17
  if A3_18 == false then
    A0_15.instanceRaidWork.countdownStatus = 7
  else
    if A0_15:getRestTimeStatus() ~= 0 then
    else
    end
    A0_15.instanceRaidWork.countdownStatus = 7
  end
end
function InstanceRaidBaseClass.startEvent(A0_19, A1_20, A2_21, A3_22, A4_23, A5_24, A6_25, A7_26, ...)
  A0_19.instanceRaidWork.contentID = A4_23
  A0_19.instanceRaidWork.eventType = A7_26
  A0_19.instanceRaidWork.clearFlag = false
  A0_19:setCountDownTimer(A5_24, A6_25, false)
  A0_19:processLogin(false)
  A0_19:processStartEvent(...)
  if A1_20 ~= "none" then
    A0_19:executeCutScene(A1_20, A2_21, A3_22)
  else
    worldMaster:_getMyPlayer():_fadeInNowLoadingForNoticeEventJustInArea()
  end
  worldMaster:_getMyPlayer():_fadeIn(1)
  A0_19:_wait(1)
  if A7_26 ~= 0 then
    A0_19:processStartEffect()
    A0_19:_wait(1)
  end
  A0_19:openInformationWidget()
  A0_19.instanceRaidWork.initFlag = true
end
function InstanceRaidBaseClass.reloginEvent(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33)
  A0_28.instanceRaidWork.contentID = A1_29
  A0_28.instanceRaidWork.eventType = A4_32
  A0_28.instanceRaidWork.clearFlag = A5_33
  if A2_30 > 0 then
    A0_28:setCountDownTimer(A2_30, A3_31, true)
  else
    A0_28.instanceRaidWork.countdownStatus = 0
  end
  A0_28:processLogin(true)
  worldMaster:_getMyPlayer():_fadeInNowLoadingForNoticeEventJustInArea()
  worldMaster:_getMyPlayer():_fadeIn(1)
  A0_28:_wait(1)
  if A5_33 == false then
    A0_28:openInformationWidget()
  end
  A0_28.instanceRaidWork.initFlag = true
end
function InstanceRaidBaseClass.clearEvent(A0_34)
  A0_34.instanceRaidWork.countdownStatus = 0
  desktopWidget:orderDesktopWidgetMode(126)
  A0_34:closeInformationWidget()
  worldMaster:notify(worldMaster, 52021, A0_34:getContentID())
end
function InstanceRaidBaseClass.failedEvent(A0_35, A1_36)
  A0_35.instanceRaidWork.countdownStatus = 0
  while desktopWidget:getDesktopWidgetMode() == 127 do
    A0_35:_wait(0.5)
  end
  desktopWidget:orderDesktopWidgetMode(126)
  A0_35:closeInformationWidget()
  worldMaster:notify(worldMaster, ({
    52065,
    52054,
    52010,
    52093
  })[A1_36], A0_35:getContentID())
  if A1_36 ~= 1 then
    if A0_35.instanceRaidWork.eventType ~= 0 then
      A0_35:processFailedEffect()
    end
    if A1_36 ~= 2 then
      A0_35:_wait(1)
    else
      A0_35:_wait(3)
    end
    worldMaster:_getMyPlayer():_fadeOut(4)
    worldMaster:_getMyPlayer():_waitForFading()
    A0_35:_wait(1)
    worldMaster:_getMyPlayer():_fadeInAfterWarp()
  end
end
function InstanceRaidBaseClass.exitCutScene(A0_37, A1_38, A2_39, A3_40)
  A0_37.instanceRaidWork.countdownStatus = 0
  worldMaster:_getMyPlayer():_fadeOut(1)
  worldMaster:_getMyPlayer():_waitForFading()
  A0_37:executeCutScene(A1_38, A2_39, A3_40)
  worldMaster:_getMyPlayer():_fadeInAfterWarp()
  desktopWidget:orderDesktopWidgetMode(126)
end
function InstanceRaidBaseClass.cutSceneEvent(A0_41, A1_42, ...)
  worldMaster:_getMyPlayer():_fadeOut(1)
  worldMaster:_getMyPlayer():_waitForFading()
  A0_41:executeCutScene(A1_42, nil, true, ...)
  worldMaster:_getMyPlayer():_fadeIn(1)
  A0_41:_wait(1)
end
function InstanceRaidBaseClass._onReceiveDataPacket(A0_44, A1_45, ...)
  local L3_47, L4_48, L5_49
  L3_47 = A0_44.instanceRaidWork
  L3_47 = L3_47.initFlag
  if L3_47 == false then
    return
  end
  L3_47 = A1_45
  if L3_47 == 1 then
    L4_48 = A0_44.instanceRaidWork
    L4_48.clearFlag = true
    L4_48 = select
    L5_49 = 1
    L4_48 = L4_48(L5_49, ...)
    L5_49 = select
    L5_49 = L5_49(2, ...)
    A0_44:setCountDownTimer(L4_48, L5_49, false)
    A0_44:closeInformationWidget()
    break
  else
  end
  if L3_47 == 2 then
    L4_48 = A0_44.instanceRaidWork
    L4_48.clearFlag = true
    L4_48 = A0_44.instanceRaidWork
    L4_48.countdownStatus = 0
    L5_49 = A0_44
    L4_48 = A0_44.closeInformationWidget
    L4_48(L5_49)
    break
  else
  end
  if L3_47 == 3 then
    L5_49 = A0_44
    L4_48 = A0_44.processUserMessage
    L4_48(L5_49, ...)
    break
  else
  end
  return
end
function InstanceRaidBaseClass.getContentID(A0_50)
  return A0_50.instanceRaidWork.contentID
end
function InstanceRaidBaseClass.getFinishTime(A0_51)
  return A0_51.instanceRaidWork.finishTime
end
function InstanceRaidBaseClass.executeCutScene(A0_52, A1_53, A2_54, A3_55, ...)
  local L5_57
  L5_57 = 1
  if A3_55 == false then
    L5_57 = 2
  end
  if A2_54 == nil then
    A2_54 = A0_52
  end
  worldMaster:createCutScene(A1_53, A2_54):startCutScene(1, 63, L5_57, ...)
  worldMaster:createCutScene(A1_53, A2_54):_delete()
end
function InstanceRaidBaseClass.processInitialize(A0_58)
  local L1_59
end
function InstanceRaidBaseClass.processLogin(A0_60, A1_61)
end
function InstanceRaidBaseClass.processStartEvent(A0_62, ...)
end
function InstanceRaidBaseClass.processStartEffect(A0_64)
  desktopWidget:openPublicEffectWidget(1)
end
function InstanceRaidBaseClass.processFailedEffect(A0_65)
  desktopWidget:openPublicEffectWidget(3)
end
function InstanceRaidBaseClass.openInformationWidget(A0_66)
  desktopWidget:openRaidDungeonExecutionWidget(nil, A0_66:getContentID(), A0_66.instanceRaidWork.finishTime)
end
function InstanceRaidBaseClass.closeInformationWidget(A0_67)
  desktopWidget:closeRaidDungeonExecutionWidget()
end
function InstanceRaidBaseClass.processUserMessage(A0_68, ...)
end
