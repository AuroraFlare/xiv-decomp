require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCutScenePlayer", "NpcBaseClass")
function PopulaceCutScenePlayer.initForEvent(A0_0)
  local L1_1
  L1_1 = {
    {
      "saveQuestId",
      "integer32"
    }
  }
  A0_0:initWork(nil, L1_1)
  A0_0:_loadTextDataPermanently(9984, "populaceCutScenePlayer")
  A0_0.work.saveQuestId = 0
  A0_0:_setGroundOn(false)
end
function PopulaceCutScenePlayer._onTalkEvent(A0_2, A1_3, A2_4)
  if desktopWidget:isEventLockonCameraEnable() then
    A1_3:_setLockonTarget(A0_2)
  else
    A1_3:_setLockonTarget(nil)
  end
  A0_2:processClientTalkEvent(A1_3, A2_4)
  A1_3:_setLockonTarget(nil)
  desktopWidget:cancelAllTarget()
end
function PopulaceCutScenePlayer.processClientTalkEvent(A0_5, A1_6, A2_7)
  while true do
    if A0_5:askExtendWidget(A0_5, 1, 3, 1, 1) == 1 then
      A0_5:processCutScenePlay(A1_6, A2_7)
      break
    elseif A0_5:askExtendWidget(A0_5, 1, 3, 1, 1) == 2 then
      worldMaster:say(A0_5, 5)
      worldMaster:say(A0_5, 6)
    else
      break
    end
  end
end
function PopulaceCutScenePlayer.processCutScenePlay(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23
  L6_14 = 11000901
  L7_15 = desktopWidget
  L8_16 = L7_15
  L7_15 = L7_15.openCutSceneReplaySelectWidget
  L7_15(L8_16)
  while true do
    L7_15 = false
    L8_16 = desktopWidget
    L9_17 = L8_16
    L8_16 = L8_16.selectCutSceneReplaySelectWidget
    L9_17 = L8_16(L9_17)
    L6_14 = L9_17
    L7_15 = L8_16
    if L7_15 == false or L6_14 <= 0 then
      break
    end
    L8_16 = _math
    L8_16 = L8_16.floor
    L9_17 = L6_14 / 100
    L8_16 = L8_16(L9_17)
    L9_17 = _getQuestActorForCutSceneReplay
    L10_18 = L8_16
    L9_17 = L9_17(L10_18)
    L10_18 = A0_8.work
    L10_18.saveQuestId = L8_16
    L10_18 = cutReplaySheet
    L11_19 = L10_18
    L10_18 = L10_18._loadKeyTemporarily
    L12_20 = L6_14
    L13_21 = L6_14
    L10_18(L11_19, L12_20, L13_21)
    L10_18 = 1
    L11_19 = true
    L12_20 = false
    L13_21 = nil
    L14_22 = {
      L15_23,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    }
    L15_23 = 0
    L15_23 = A0_8.getCutName
    L15_23 = L15_23(A0_8, L6_14)
    for _FORV_19_ = 1, 8 do
      L13_21 = cutReplaySheet:_getData(L6_14, 8 + _FORV_19_ - 1)
      if L13_21 == -202 then
        L12_20 = true
      end
      L14_22[_FORV_19_] = L9_17:getCutSceneReplayData(L13_21)
      if L13_21 == -202 then
        L14_22[_FORV_19_] = L9_17:getSnpcActorClassID(L14_22[_FORV_19_])
      end
      if L13_21 == -206 then
        if A1_9:getStateMainSkill() == 41 then
          L14_22[_FORV_19_] = 1
        else
          L14_22[_FORV_19_] = 0
        end
      end
      if L13_21 == -207 then
        L14_22[_FORV_19_] = A1_9:getInitialTown()
      end
      if L13_21 == -208 then
      end
    end
    A1_9:_setMusic(7, 2)
    if cutReplaySheet:_getData(L6_14, 6) == 2 then
      L11_19 = false
    end
    L9_17:startFadeOutCutSceneDefault(A1_9)
    if L12_20 == true then
      if L11_19 == true then
        L9_17:startSnpcNQCutScene(L15_23, 1, L14_22[1], L14_22[2], L14_22[3], L14_22[4], L14_22[5], L14_22[6], L14_22[7], L14_22[8])
      else
        L9_17:startSnpcHQCutScene(L15_23, 1, L14_22[1], L14_22[2], L14_22[3], L14_22[4], L14_22[5], L14_22[6], L14_22[7], L14_22[8])
      end
    elseif L11_19 == true then
      L9_17:startNQCutScene(L15_23, 1, L14_22[1], L14_22[2], L14_22[3], L14_22[4], L14_22[5], L14_22[6], L14_22[7], L14_22[8])
    else
      L9_17:startHQCutScene(L15_23, 1, L14_22[1], L14_22[2], L14_22[3], L14_22[4], L14_22[5], L14_22[6], L14_22[7], L14_22[8])
    end
    desktopWidget:getStaticWidget(14):display(false)
    L9_17:startFadeInCutSceneDefault(A1_9)
    A0_8.work.saveQuestId = 0
    L9_17:_delete()
    A1_9:_setMusic(61, 2)
    cutReplaySheet:_unloadKey(L6_14, L6_14)
  end
  L7_15 = desktopWidget
  L8_16 = L7_15
  L7_15 = L7_15.closeCutSceneReplaySelectWidget
  L7_15(L8_16)
end
function PopulaceCutScenePlayer.getCutName(A0_24, A1_25)
  return cutReplaySheet:_getData(A1_25, 0)
end
function PopulaceCutScenePlayer._onFinalize(A0_26)
  local L1_27
  L1_27 = A0_26.work
  L1_27 = L1_27.saveQuestId
  if L1_27 ~= 0 then
    L1_27 = A0_26.work
    L1_27 = L1_27.saveQuestId
    if _isExistStaticActor(L1_27) == true then
      _getStaticActor(L1_27):_delete()
    end
  end
end
