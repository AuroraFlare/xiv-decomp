require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleDetectNormal", "GuildleveBaseClass")
function PrivateGLBattleDetectNormal.initAsGuildleve(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = {}
  L2_2 = {L3_3}
  L3_3 = {
    "detectNumber",
    "integer8"
  }
  L3_3 = A0_0.initWork
  L3_3(A0_0, nil, L1_1, L2_2)
  L3_3 = {
    {
      "info",
      1,
      {
        "detectNumber"
      }
    }
  }
  A0_0:initWorkSyncTag(L3_3)
end
function PrivateGLBattleDetectNormal.processUIUpdate(A0_4, A1_5)
  if A1_5 == "info" and A0_4:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_4, "update", 5)
  end
end
function PrivateGLBattleDetectNormal.getMaxIndexNumberOnGuildleveInfo(A0_6)
  local L1_7
  L1_7 = 5
  return L1_7
end
function PrivateGLBattleDetectNormal.getArticleDataOnGuildleveInfo(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
  L2_10 = 0
  L3_11 = nil
  L4_12 = 0
  L5_13 = 0
  L6_14 = 0
  L7_15 = A1_9
  if L7_15 == 1 then
  elseif L7_15 == 2 then
  elseif L7_15 == 3 then
  else
  end
  if L7_15 == 4 then
    L2_10 = A0_8:getArticleTypeForInfo("barFraction")
    L3_11 = worldMaster
    L4_12 = A0_8:getTextIdForInfo("enemy")
    L5_13 = A0_8:getGuildleveId()
    L6_14 = A1_9
    break
  else
  end
  if L7_15 == 5 then
    L2_10 = A0_8:getArticleTypeForInfo("number")
    L3_11 = worldMaster
    L4_12 = A0_8:getTextIdForInfo("item")
    L5_13 = A0_8:getGuildleveId()
    L6_14 = 4
    break
  else
  end
  L7_15 = L2_10
  return L7_15, L3_11, L4_12, L5_13, L6_14, 0
end
function PrivateGLBattleDetectNormal.getArticleStateOnGuildleveInfo(A0_16, A1_17)
  local L2_18
  L2_18 = A0_16.getArticleStateForInfo
  L2_18 = L2_18(A0_16, "off")
  if A1_17 == 1 then
  elseif A1_17 == 2 then
  elseif A1_17 == 3 then
  else
  end
  if A1_17 == 4 then
    L2_18 = A0_16:getUiStateOf(A1_17)
    break
  else
  end
  if A1_17 == 5 and A0_16:getSyncWork("detectNumber") > -1 then
    L2_18 = A0_16:getArticleStateForInfo("on")
  else
  end
  return L2_18
end
function PrivateGLBattleDetectNormal.getArticleCondition(A0_19, A1_20)
  local L2_21, L3_22
  L2_21 = 0
  L3_22 = A1_20
  if L3_22 == 1 then
  elseif L3_22 == 2 then
  elseif L3_22 == 3 then
  else
  end
  if L3_22 == 4 then
    L2_21 = A0_19:getArticleConditionForInfo("smash")
    break
  else
  end
  if L3_22 == 5 then
    L2_21 = A0_19:getArticleConditionForInfo("get")
    break
  else
  end
  return L2_21
end
function PrivateGLBattleDetectNormal.getArticleParamOnGuildleveInfo(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28
  L5_28 = A1_24
  if L5_28 == 1 then
  elseif L5_28 == 2 then
  elseif L5_28 == 3 then
  else
  end
  if L5_28 == 4 then
    L2_25 = A0_23:getAimNumNowOf(A1_24)
    L3_26 = A0_23:getAimNumOf(A1_24)
    break
  else
  end
  if L5_28 == 5 then
    L2_25 = A0_23:getSyncWork("detectNumber")
  else
  end
  L5_28 = L2_25
  return L5_28, L3_26, L4_27
end
