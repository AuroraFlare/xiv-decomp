require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLFreeGoNormal", "GuildleveBaseClass")
function PrivateGLFreeGoNormal.initAsGuildleve(A0_0)
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
function PrivateGLFreeGoNormal.processUIUpdate(A0_4, A1_5)
  if A1_5 == "info" and A0_4:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_4, "update", 4)
  end
end
function PrivateGLFreeGoNormal.getArticleDataOnGuildleveInfo(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12, L7_13
  L2_8 = 0
  L3_9 = nil
  L4_10 = 0
  L5_11 = 0
  L6_12 = 0
  L7_13 = A1_7
  if L7_13 == 1 then
  elseif L7_13 == 2 then
  else
  end
  if L7_13 == 3 then
    L2_8 = A0_6:getArticleTypeForInfo("barFraction")
    L3_9 = worldMaster
    L4_10 = A0_6:getTextIdForInfo("enemy")
    L5_11 = A0_6:getGuildleveId()
    L6_12 = A1_7
    break
  else
  end
  if L7_13 == 4 then
    L2_8 = A0_6:getArticleTypeForInfo("time")
    L3_9 = worldMaster
    L4_10 = A0_6:getIdForInstruction("glText")
    L5_11 = A0_6:getTempWork("articleTextId")
    break
  else
  end
  L7_13 = L2_8
  return L7_13, L3_9, L4_10, L5_11, L6_12, 0
end
function PrivateGLFreeGoNormal.getArticleStateOnGuildleveInfo(A0_14, A1_15)
  local L2_16
  L2_16 = A0_14.getArticleStateForInfo
  L2_16 = L2_16(A0_14, "off")
  if A1_15 == 1 then
  elseif A1_15 == 2 then
  else
  end
  if A1_15 == 3 then
    L2_16 = A0_14:getUiStateOf(A1_15)
    break
  else
  end
  if A1_15 == 4 then
    L2_16 = A0_14:getArticleStateForInfo("on")
  else
  end
  return L2_16
end
function PrivateGLFreeGoNormal.getArticleCondition(A0_17, A1_18)
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
    L2_19 = A0_17:getArticleConditionForInfo("time")
    break
  else
  end
  return L2_19
end
function PrivateGLFreeGoNormal.getArticleParamOnGuildleveInfo(A0_21, A1_22)
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
    L2_23 = A0_21:getSyncWork("surviveTime")
    if A0_21:getSyncWork("surviveStop") == true then
      L3_24 = L2_23
    else
      L2_23 = L2_23 - (worldMaster:_getServerTime() - (A0_21:getStartTime() + A0_21:getSyncWork("surviveStartTime")))
      if L2_23 < 0 then
        L2_23 = 0
      end
      L3_24 = 0
    end
    L4_25 = 10
  else
  end
  L5_26 = L2_23
  return L5_26, L3_24, L4_25
end
function PrivateGLFreeGoNormal.processMapOpenMessageForAchieve(A0_27)
  local L1_28
end
function PrivateGLFreeGoNormal.processSetMiniMapMarkerForGLAchieve(A0_29)
  local L1_30
end
function PrivateGLFreeGoNormal.processSetMapMarkerSize(A0_31, A1_32)
  if A1_32 == 1 then
    return "small"
  else
  end
  if A0_31:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
