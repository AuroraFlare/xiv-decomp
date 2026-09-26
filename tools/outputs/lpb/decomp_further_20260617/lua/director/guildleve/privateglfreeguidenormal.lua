require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLFreeGuideNormal", "GuildleveBaseClass")
function PrivateGLFreeGuideNormal.initAsGuildleve(A0_0)
  local L1_1
end
function PrivateGLFreeGuideNormal.getArticleDataOnGuildleveInfo(A0_2, A1_3)
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
    L2_4 = A0_2:getArticleTypeForInfo("number")
    L3_5 = worldMaster
    L4_6 = A0_2:getTextIdForInfo("item")
    L5_7 = A0_2:getGuildleveId()
    L6_8 = A1_3
    break
  else
  end
  L7_9 = L2_4
  return L7_9, L3_5, L4_6, L5_7, L6_8, 0
end
function PrivateGLFreeGuideNormal.getArticleCondition(A0_10, A1_11)
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
function PrivateGLFreeGuideNormal.getArticleParamOnGuildleveInfo(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19
  L5_19 = A1_15
  if L5_19 == 1 then
  elseif L5_19 == 2 then
  elseif L5_19 == 3 then
  else
  end
  if L5_19 == 4 then
    L2_16 = A0_14:getAimNumNowOf(A1_15)
    break
  else
  end
  L5_19 = L2_16
  return L5_19, L3_17, L4_18
end
function PrivateGLFreeGuideNormal.processMapOpenMessageForAchieve(A0_20)
  local L1_21
end
function PrivateGLFreeGuideNormal.processSetMiniMapMarkerForGLAchieve(A0_22)
  local L1_23
end
function PrivateGLFreeGuideNormal.processSetMapMarkerSize(A0_24, A1_25)
  if A1_25 == 1 then
    return "small"
  else
  end
  if A0_24:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
