require("/Chara/Npc/Populace/InstanceRaidGuide/InstanceRaidGuideBaseClass")
_defineBaseClass("NoQuestGuideBaseClass", "InstanceRaidGuideBaseClass")
function NoQuestGuideBaseClass.askExplainInstanceRaid(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5)
  local L6_6, L7_7, L8_8, L9_9, L10_10
  L7_7 = A0_0
  L6_6 = A0_0.startCliantTalkTurn
  L8_8 = 2
  L9_9 = worldMaster
  L10_10 = L9_9
  L9_9 = L9_9._getMyPlayer
  L10_10 = L9_9(L10_10)
  L6_6(L7_7, L8_8, L9_9, L10_10, L9_9(L10_10))
  L6_6 = false
  L7_7 = {
    [4] = L8_8(L9_9, L10_10)
  }
  L9_9 = A0_0
  L8_8 = A0_0.createExplainSelection_
  L10_10 = A1_1
  L10_10 = L8_8(L9_9, L10_10)
  ;({
    [4] = L8_8(L9_9, L10_10)
  })[1] = L8_8
  ;({
    [4] = L8_8(L9_9, L10_10)
  })[2] = L9_9
  ;({
    [4] = L8_8(L9_9, L10_10)
  })[3] = L10_10
  L8_8 = #L7_7
  if L8_8 == 0 then
    L9_9 = A0_0
    L8_8 = A0_0.finishCliantTalkTurn
    L8_8(L9_9)
    L8_8 = false
    return L8_8
  end
  L8_8 = true
  L9_9 = false
  while L8_8 do
    L10_10 = desktopWidget
    L10_10 = L10_10.askForEventMode
    L10_10 = L10_10(L10_10, nil, nil, A0_0, 1, false, true, unpack(L7_7))
    L9_9 = A0_0:processExplainSelected_(L10_10, A1_1, A2_2, A3_3, A4_4, A5_5)
    if L9_9 == nil then
      L8_8 = false
      L9_9 = false
    elseif L9_9 == true then
      L8_8 = false
    end
  end
  L10_10 = A0_0.finishCliantTalkTurn
  L10_10(A0_0)
  return L9_9
end
function NoQuestGuideBaseClass.createExplainSelection_(A0_11, A1_12)
  return
end
function NoQuestGuideBaseClass.processExplainSelected_(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18, A6_19)
  local L7_20
  return L7_20
end
