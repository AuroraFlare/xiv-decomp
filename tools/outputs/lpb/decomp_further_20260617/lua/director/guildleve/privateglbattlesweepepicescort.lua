require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleSweepEpicEscort", "GuildleveBaseClass")
function PrivateGLBattleSweepEpicEscort.initAsGuildleve(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {"npcHP", "integer8"}
  }
  L1_1._sync = L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {
      "info",
      1,
      {"npcHP"}
    }
  }
  L1_1._tag = L2_2
end
function PrivateGLBattleSweepEpicEscort.processUIUpdate(A0_3, A1_4)
  if A1_4 == "info" and A0_3:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_3, "update", 4)
  end
end
function PrivateGLBattleSweepEpicEscort.processMapOpenMessageForAchieve(A0_5)
  local L1_6
end
function PrivateGLBattleSweepEpicEscort.processSetMiniMapMarkerForGLAchieve(A0_7)
  local L1_8
end
function PrivateGLBattleSweepEpicEscort.processSetMapMarkerSize(A0_9, A1_10)
  if A1_10 == 1 then
    return "small"
  else
  end
  if A0_9:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
function PrivateGLBattleSweepEpicEscort.getArticleDataOnGuildleveInfo(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16, L6_17, L7_18
  L2_13 = 0
  L3_14 = nil
  L4_15 = 0
  L5_16 = 0
  L6_17 = 0
  L7_18 = A1_12
  if L7_18 == 1 then
  elseif L7_18 == 2 then
  else
  end
  if L7_18 == 3 then
    L2_13 = A0_11:getArticleTypeForInfo("barFraction")
    L3_14 = worldMaster
    L4_15 = A0_11:getTextIdForInfo("enemy")
    L5_16 = A0_11:getGuildleveId()
    L6_17 = A1_12
    break
  else
  end
  if L7_18 == 4 then
    L2_13 = A0_11:getArticleTypeForInfo("bar")
    L3_14 = worldMaster
    L4_15 = A0_11:getTextIdForInfo("enemy")
    L5_16 = A0_11:getGuildleveId()
    L6_17 = A1_12
    break
  else
  end
  L7_18 = L2_13
  return L7_18, L3_14, L4_15, L5_16, L6_17, 0
end
function PrivateGLBattleSweepEpicEscort.getArticleCondition(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = 0
  L3_22 = A1_20
  if L3_22 == 1 then
  elseif L3_22 == 2 then
  else
  end
  if L3_22 == 3 then
    L2_21 = A0_19:getArticleConditionForInfo("smash")
    break
  else
  end
  if L3_22 == 4 then
    L2_21 = A0_19:getArticleConditionForInfo("guard")
    break
  else
  end
  return L2_21
end
function PrivateGLBattleSweepEpicEscort.getArticleParamOnGuildleveInfo(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28
  L5_28 = A1_24
  if L5_28 == 1 then
  elseif L5_28 == 2 then
  else
  end
  if L5_28 == 3 then
    L2_25 = A0_23:getAimNumNowOf(A1_24)
    L3_26 = A0_23:getAimNumOf(A1_24)
    break
  else
  end
  if L5_28 == 4 then
    L2_25 = A0_23.work.npcHP
    L3_26 = 100
    break
  else
  end
  L5_28 = L2_25
  return L5_28, L3_26, L4_27
end
