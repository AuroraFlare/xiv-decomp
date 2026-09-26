require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleSweepEscort", "GuildleveBaseClass")
function PrivateGLBattleSweepEscort.initAsGuildleve(A0_0)
  A0_0.work._sync = {
    {"npcHP", "integer8"}
  }
  A0_0.work._tag = {
    {
      "info",
      1,
      {"npcHP"}
    }
  }
  A0_0:_loadTextDataPermanently(10616, "privateGLBattleSweepEscort")
end
function PrivateGLBattleSweepEscort.processUIUpdate(A0_1, A1_2)
  if A1_2 == "info" and A0_1:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_1, "update", 4)
  end
end
function PrivateGLBattleSweepEscort.processMapOpenMessageForAchieve(A0_3)
  local L1_4
end
function PrivateGLBattleSweepEscort.processSetMiniMapMarkerForGLAchieve(A0_5)
  local L1_6
end
function PrivateGLBattleSweepEscort.processSetMapMarkerSize(A0_7, A1_8)
  if A1_8 == 1 then
    return "small"
  else
  end
  if A0_7:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
function PrivateGLBattleSweepEscort.getArticleDataOnGuildleveInfo(A0_9, A1_10)
  local L2_11, L3_12, L4_13, L5_14, L6_15, L7_16
  L2_11 = 0
  L3_12 = nil
  L4_13 = 0
  L5_14 = 0
  L6_15 = 0
  L7_16 = A1_10
  if L7_16 == 1 then
  elseif L7_16 == 2 then
  else
  end
  if L7_16 == 3 then
    L2_11 = A0_9:getArticleTypeForInfo("barFraction")
    L3_12 = worldMaster
    L4_13 = A0_9:getTextIdForInfo("enemy")
    L5_14 = A0_9:getGuildleveId()
    L6_15 = A1_10
    break
  else
  end
  if L7_16 == 4 then
    L2_11 = A0_9:getArticleTypeForInfo("bar")
    L3_12 = worldMaster
    L4_13 = A0_9:getTextIdForInfo("enemy")
    L5_14 = A0_9:getGuildleveId()
    L6_15 = A1_10
    break
  else
  end
  L7_16 = L2_11
  return L7_16, L3_12, L4_13, L5_14, L6_15, 0
end
function PrivateGLBattleSweepEscort.getArticleCondition(A0_17, A1_18)
  local L2_19, L3_20
  L2_19 = 0
  L3_20 = A1_18
  if L3_20 == 1 then
  elseif L3_20 == 2 then
  else
  end
  if L3_20 == 3 then
    L2_19 = A0_17:getArticleConditionForInfo("smash")
    break
  else
  end
  if L3_20 == 4 then
    L2_19 = A0_17:getArticleConditionForInfo("guard")
    break
  else
  end
  return L2_19
end
function PrivateGLBattleSweepEscort.getArticleParamOnGuildleveInfo(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26
  L5_26 = A1_22
  if L5_26 == 1 then
  elseif L5_26 == 2 then
  else
  end
  if L5_26 == 3 then
    L2_23 = A0_21:getAimNumNowOf(A1_22)
    L3_24 = A0_21:getAimNumOf(A1_22)
    break
  else
  end
  if L5_26 == 4 then
    L2_23 = A0_21.work.npcHP
    L3_24 = 100
    break
  else
  end
  L5_26 = L2_23
  return L5_26, L3_24, L4_25
end
