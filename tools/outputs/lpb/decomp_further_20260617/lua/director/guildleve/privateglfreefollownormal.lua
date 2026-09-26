require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLFreeFollowNormal", "GuildleveBaseClass")
function PrivateGLFreeFollowNormal.initAsGuildleve(A0_0)
  local L1_1
end
function PrivateGLFreeFollowNormal.getArticleDataOnGuildleveInfo(A0_2, A1_3)
  local L2_4, L3_5, L4_6, L5_7, L6_8
  L2_4 = 0
  L3_5 = nil
  L4_6 = 0
  L5_7 = 0
  L6_8 = 0
  if A1_3 == 1 then
    L2_4 = A0_2:getArticleTypeForInfo("number")
    L3_5 = worldMaster
    L4_6 = A0_2:getTextIdForInfo("item")
    L5_7 = A0_2:getGuildleveId()
    L6_8 = A1_3
    break
  else
  end
  return L2_4, L3_5, L4_6, L5_7, L6_8, 0
end
function PrivateGLFreeFollowNormal.getArticleCondition(A0_9, A1_10)
  local L2_11
  L2_11 = 0
  if A1_10 == 1 then
    L2_11 = A0_9:getArticleConditionForInfo("get")
    break
  else
  end
  return L2_11
end
function PrivateGLFreeFollowNormal.getArticleParamOnGuildleveInfo(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  if A1_13 == 1 then
    L2_14 = A0_12:getAimNumNowOf(A1_13)
    break
  else
  end
  return L2_14, L3_15, L4_16
end
function PrivateGLFreeFollowNormal.processMapOpenMessageForAchieve(A0_17)
  local L1_18
end
function PrivateGLFreeFollowNormal.processSetMiniMapMarkerForGLAchieve(A0_19)
  local L1_20
end
function PrivateGLFreeFollowNormal.processSetMapMarkerSize(A0_21, A1_22)
  if A1_22 == 1 then
    return "small"
  else
  end
  if A0_21:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
