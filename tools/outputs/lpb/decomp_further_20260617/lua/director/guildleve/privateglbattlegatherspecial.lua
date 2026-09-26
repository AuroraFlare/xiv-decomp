require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleGatherSpecial", "GuildleveBaseClass")
function PrivateGLBattleGatherSpecial.initAsGuildleve(A0_0)
  local L1_1
end
function PrivateGLBattleGatherSpecial.getArticleDataOnGuildleveInfo(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8, L7_9
  L2_4 = 0
  L3_5 = nil
  L4_6 = 0
  L5_7 = 0
  L6_8 = 0
  L7_9 = A1_3
  if L7_9 == 1 then
  elseif L7_9 == 2 then
  elseif L7_9 == 3 then
  else
  end
  if L7_9 == 4 then
    L2_4 = A0_2:getArticleTypeForInfo("barFraction")
    L3_5 = worldMaster
    L4_6 = A0_2:getTextIdForInfo("item")
    L5_7 = A0_2:getGuildleveId()
    L6_8 = A1_3
    break
  else
  end
  L7_9 = L2_4
  return L7_9, L3_5, L4_6, L5_7, L6_8
end
function PrivateGLBattleGatherSpecial.getArticleCondition(A0_10, A1_11)
  local L2_12, L3_13
  L2_12 = 0
  L3_13 = A1_11
  if L3_13 == 1 then
  elseif L3_13 == 2 then
  elseif L3_13 == 3 then
  else
  end
  if L3_13 == 4 then
    L2_12 = A0_10:getArticleConditionForInfo("get")
    break
  else
  end
  return L2_12
end
function PrivateGLBattleGatherSpecial.processMapOpenMessageForAchieve(A0_14)
  local L1_15
end
function PrivateGLBattleGatherSpecial.processSetMiniMapMarkerForGLAchieve(A0_16)
  local L1_17
end
function PrivateGLBattleGatherSpecial.processSetMapMarkerSize(A0_18, A1_19)
  if A1_19 == 1 then
    return "small"
  else
  end
  if A0_18:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
