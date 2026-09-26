require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleSurviveNormal", "GuildleveBaseClass")
function PrivateGLBattleSurviveNormal.initAsGuildleve(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = {L2_2}
  L2_2 = {L3_3, "integer32"}
  L3_3 = "articleTextId"
  L2_2 = {
    L3_3,
    {
      "surviveTime",
      "integer16"
    },
    {
      "surviveStartTime",
      "integer16"
    }
  }
  L3_3 = {
    "surviveStop",
    "boolean"
  }
  L3_3 = A0_0.initWork
  L3_3(A0_0, nil, L1_1, L2_2)
  L3_3 = A0_0.setTempWork
  L3_3(A0_0, "articleTextId", A0_0:getGuildleveWordText())
  L3_3 = {
    {
      "info",
      1,
      {
        "surviveStop"
      },
      {
        "surviveTime"
      },
      {
        "surviveStartTime"
      }
    }
  }
  A0_0:initWorkSyncTag(L3_3)
end
function PrivateGLBattleSurviveNormal.processUIUpdate(A0_4, A1_5)
  if A1_5 == "info" and A0_4:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_4, "update", 5)
  end
end
function PrivateGLBattleSurviveNormal.getMaxIndexNumberOnGuildleveInfo(A0_6)
  local L1_7
  L1_7 = 5
  return L1_7
end
function PrivateGLBattleSurviveNormal.getArticleDataOnGuildleveInfo(A0_8, A1_9)
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
    L2_10 = A0_8:getArticleTypeForInfo("time")
    L3_11 = worldMaster
    L4_12 = A0_8:getIdForInstruction("glText")
    L5_13 = A0_8:getTempWork("articleTextId")
    break
  else
  end
  L7_15 = L2_10
  return L7_15, L3_11, L4_12, L5_13, L6_14, 0
end
function PrivateGLBattleSurviveNormal.getArticleStateOnGuildleveInfo(A0_16, A1_17)
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
  if A1_17 == 5 then
    if A0_16:getSyncWork("surviveTime") > 0 then
      L2_18 = A0_16:getArticleStateForInfo("on")
    else
      L2_18 = A0_16:getArticleStateForInfo("cleared")
    end
  else
  end
  return L2_18
end
function PrivateGLBattleSurviveNormal.getArticleCondition(A0_19, A1_20)
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
    L2_21 = A0_19:getArticleConditionForInfo("time")
    break
  else
  end
  return L2_21
end
function PrivateGLBattleSurviveNormal.getArticleParamOnGuildleveInfo(A0_23, A1_24)
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
    L2_25 = A0_23:getSyncWork("surviveTime")
    if A0_23:getSyncWork("surviveStop") == true then
      L3_26 = L2_25
    else
      L2_25 = L2_25 - (worldMaster:_getServerTime() - (A0_23:getStartTime() + A0_23:getSyncWork("surviveStartTime")))
      if L2_25 < 0 then
        L2_25 = 0
      end
      L3_26 = 0
    end
    L4_27 = 10
  else
  end
  L5_28 = L2_25
  return L5_28, L3_26, L4_27
end
function PrivateGLBattleSurviveNormal.processSetMapMarkerSize(A0_29, A1_30)
  local L2_31
  L2_31 = "small"
  return L2_31
end
