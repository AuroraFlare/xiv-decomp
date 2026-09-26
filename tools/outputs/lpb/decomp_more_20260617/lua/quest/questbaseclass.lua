require("/Quest/QuestBaseClass_common")
function QuestBaseClass.getQuestId(A0_0)
  return A0_0:_getStaticActorID()
end
function QuestBaseClass.getQuestData(A0_1, A1_2)
  return questSheet:_getData(A0_1:getQuestId(), A1_2)
end
function QuestBaseClass._onInit(A0_3)
  local L1_4
  L1_4 = A0_3._callSuperClassFunc
  L1_4(A0_3, "_onInit")
  L1_4 = _isExistActor
  L1_4 = L1_4("questSheet")
  if L1_4 == false then
    L1_4 = _createActor
    L1_4("questSheet", "SpreadSheet", true, "quest")
  end
  L1_4 = A0_3._getStaticActorID
  L1_4 = L1_4(A0_3)
  questSheet:_loadKeySemipermanently(L1_4, L1_4)
  A0_3:initText()
  worldMaster:_loadWord("quest", A0_3:getQuestId())
end
function QuestBaseClass._onFinalize(A0_5)
  local L1_6
  L1_6 = A0_5._getStaticActorID
  L1_6 = L1_6(A0_5)
  questSheet:_unloadKey(L1_6, L1_6)
  worldMaster:_unloadWord("quest", A0_5:getQuestId())
end
function QuestBaseClass.initText(A0_7)
  local L1_8
end
function QuestBaseClass.tellByNpcLinkshellChat(A0_9, A1_10, A2_11, A3_12, ...)
  local L6_14, L7_15, L8_16, L9_17, L10_18, L11_19
  L6_14 = desktopWidget
  L7_15 = L6_14
  L6_14 = L6_14.showLog
  L8_16 = A1_10
  L9_17 = 39
  L10_18 = A2_11
  L11_19 = A3_12
  L6_14(L7_15, L8_16, L9_17, L10_18, L11_19, ...)
end
function QuestBaseClass._onJobQuestCompleteFirst(A0_20)
  local L1_21
  L1_21 = worldMaster
  L1_21 = L1_21._getMyPlayer
  L1_21 = L1_21(L1_21)
  A0_20:onJobQuestCompleteFirst(L1_21)
end
function QuestBaseClass._onJobQuestCompleteSecond(A0_22)
  local L1_23
  L1_23 = worldMaster
  L1_23 = L1_23._getMyPlayer
  L1_23 = L1_23(L1_23)
  A0_22:onJobQuestCompleteSecond(L1_23)
end
function QuestBaseClass._onJobQuestCompleteThird(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29, A6_30, A7_31, A8_32, A9_33, A10_34)
  local L11_35, L12_36, L13_37
  L11_35 = {
    L12_36,
    L13_37,
    A5_29,
    A6_30,
    A7_31,
    A8_32,
    A9_33,
    A10_34
  }
  L12_36 = A3_27
  L12_36 = nil
  for _FORV_16_ = 1, 8 do
    if L11_35[_FORV_16_] == nil then
      break
    end
  end
  L13_37:_runCharaScheduler(67111902)
  desktopWidget:openQuestRewardWidget(A0_24:getQuestId(), A1_25, A2_26, unpack(L11_35, 1, L12_36))
  A0_24:onJobQuestCompleteThird(L13_37)
end
function QuestBaseClass._onCancelJobQuestCompleteFirst(A0_38)
  local L1_39
end
function QuestBaseClass._onCancelJobQuestCompleteSecond(A0_40)
  local L1_41
end
function QuestBaseClass._onCancelJobQuestCompleteThird(A0_42)
  local L1_43
end
function QuestBaseClass.getCutSceneReplayData(A0_44, A1_45)
  local L2_46, L3_47, L4_48
  L3_47 = worldMaster
  L4_48 = L3_47
  L3_47 = L3_47._getMyPlayer
  L3_47 = L3_47(L4_48)
  if A1_45 == -201 then
    L4_48 = L3_47._getCutSceneReplaySnpcNickname
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -202 then
    L4_48 = L3_47._getCutSceneReplaySnpcCoordinate
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -203 then
    L4_48 = L3_47._getCutSceneReplaySnpcSkin
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -204 then
    L4_48 = L3_47._getCutSceneReplaySnpcPersonality
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -205 then
    L4_48 = L3_47.getInitialTown
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -207 then
    L4_48 = L3_47.getInitialTown
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -208 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 110480)
    if L4_48 == true then
      L2_46 = 1
    else
      L2_46 = 2
    end
  elseif A1_45 == -209 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 110019)
    if L4_48 == true then
      L4_48 = L3_47.getInitialTown
      L4_48 = L4_48(L3_47)
      if L4_48 == 2 then
        L2_46 = 1
      end
    else
      L2_46 = 0
    end
  elseif A1_45 == -210 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 110019)
    if L4_48 == true then
      L4_48 = L3_47.getInitialTown
      L4_48 = L4_48(L3_47)
      if L4_48 == 1 then
        L2_46 = 1
      end
    else
      L2_46 = 0
    end
  elseif A1_45 == -211 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 110019)
    if L4_48 == true then
      L4_48 = L3_47.getInitialTown
      L4_48 = L4_48(L3_47)
      if L4_48 == 3 then
        L2_46 = 1
      end
    else
      L2_46 = 0
    end
  elseif A1_45 == -212 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 111806)
    if L4_48 == false then
      L4_48 = L3_47._isCompletedCutSceneReplayQuest
      L4_48 = L4_48(L3_47, 111606)
      if L4_48 == false then
        L2_46 = 1
      end
    else
      L2_46 = 0
    end
  elseif A1_45 == -213 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 111406)
    if L4_48 == false then
      L4_48 = L3_47._isCompletedCutSceneReplayQuest
      L4_48 = L4_48(L3_47, 111606)
      if L4_48 == false then
        L2_46 = 1
      end
    else
      L2_46 = 0
    end
  elseif A1_45 == -214 then
    L4_48 = L3_47._getCutSceneReplaySnpcSkin
    L4_48 = L4_48(L3_47)
    if L4_48 == 1 then
      L2_46 = 1
    elseif L4_48 == 2 then
      L2_46 = 1
    elseif L4_48 == 3 then
      L2_46 = 2
    elseif L4_48 == 4 then
      L2_46 = 2
    elseif L4_48 == 5 then
      L2_46 = 3
    elseif L4_48 == 6 then
      L2_46 = 3
    elseif L4_48 == 7 then
      L2_46 = 4
    elseif L4_48 == 8 then
      L2_46 = 5
    elseif L4_48 == 9 then
      L2_46 = 1
    else
      L2_46 = 1
    end
  elseif A1_45 == -215 then
    L4_48 = L3_47.getNation
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
  elseif A1_45 == -216 then
    L2_46 = "???"
  elseif A1_45 == -217 then
    L4_48 = L3_47._getCutSceneReplaySnpcSkin
    L4_48 = L4_48(L3_47)
    L2_46 = A0_44:getSnpcSexualityToSkin(L4_48)
  elseif A1_45 == -218 then
    L2_46 = true
  elseif A1_45 == -219 then
    L2_46 = false
  elseif A1_45 == -200 then
    L2_46 = 0
  elseif A1_45 == -220 then
    L4_48 = L3_47.getInitialTown
    L4_48 = L4_48(L3_47)
    if L4_48 == 3 then
      L2_46 = 1
    else
      L2_46 = 2
    end
  elseif A1_45 == -221 then
    L4_48 = L3_47._getBelongGrandCompany
    L4_48 = L4_48(L3_47)
    L2_46 = L4_48
    if L2_46 == 0 then
      L2_46 = 1
    end
  elseif A1_45 == -222 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 110019)
    if L4_48 == true then
      L2_46 = 1
    else
      L2_46 = 0
    end
  elseif A1_45 == -223 then
    L4_48 = L3_47._isCompletedCutSceneReplayQuest
    L4_48 = L4_48(L3_47, 111827)
    if L4_48 ~= true then
      L4_48 = L3_47._isCompletedCutSceneReplayQuest
      L4_48 = L4_48(L3_47, 111627)
      if L4_48 ~= true then
        L4_48 = L3_47._isCompletedCutSceneReplayQuest
        L4_48 = L4_48(L3_47, 111427)
      end
    else
      if L4_48 == true then
        L2_46 = 1
    end
    else
      L2_46 = 0
    end
  else
    L2_46 = A1_45
  end
  if A1_45 == -218 then
  else
    if A1_45 == -219 then
    else
    end
  end
  return L2_46
end
