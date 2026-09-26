require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLFreeGatherTown", "GuildleveBaseClass")
function PrivateGLFreeGatherTown.initAsGuildleve(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = {L2_2}
  L2_2 = {L3_3, "integer8"}
  L3_3 = "mapSizeTmp"
  L2_2 = {L3_3}
  L3_3 = {"mapSize", "integer8"}
  L3_3 = A0_0.initWork
  L3_3(A0_0, nil, L1_1, L2_2)
  L3_3 = A0_0.setTempWork
  L3_3(A0_0, "mapSizeTmp", 0)
  L3_3 = {
    {
      "info",
      1,
      {"mapSize"}
    }
  }
  A0_0:initWorkSyncTag(L3_3)
end
function PrivateGLFreeGatherTown.processUIUpdate(A0_4, A1_5)
  if A1_5 == "info" and A0_4:getStartTime() > 0 then
    A0_4:setTempWork("mapSizeTmp", A0_4:getSyncWork("mapSize"))
    A0_4:setMiniMapMarkerForGL()
  end
end
function PrivateGLFreeGatherTown.getArticleDataOnGuildleveInfo(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12, L7_13
  L2_8 = 0
  L3_9 = nil
  L4_10 = 0
  L5_11 = 0
  L6_12 = 0
  L7_13 = A1_7
  if L7_13 == 1 then
  elseif L7_13 == 2 then
  elseif L7_13 == 3 then
  else
  end
  if L7_13 == 4 then
    L2_8 = A0_6:getArticleTypeForInfo("number")
    L3_9 = worldMaster
    L4_10 = A0_6:getTextIdForInfo("item")
    L5_11 = A0_6:getGuildleveId()
    L6_12 = A1_7
    break
  else
  end
  L7_13 = L2_8
  return L7_13, L3_9, L4_10, L5_11, L6_12, 0
end
function PrivateGLFreeGatherTown.getArticleCondition(A0_14, A1_15)
  local L2_16, L3_17
  L2_16 = 0
  L3_17 = A1_15
  if L3_17 == 1 then
  elseif L3_17 == 2 then
  elseif L3_17 == 3 then
  else
  end
  if L3_17 == 4 then
    L2_16 = A0_14:getArticleConditionForInfo("get")
    break
  else
  end
  return L2_16
end
function PrivateGLFreeGatherTown.getArticleParamOnGuildleveInfo(A0_18, A1_19)
  local L2_20, L3_21, L4_22, L5_23
  L5_23 = A1_19
  if L5_23 == 1 then
  elseif L5_23 == 2 then
  elseif L5_23 == 3 then
  else
  end
  if L5_23 == 4 then
    L2_20 = A0_18:getAimNumNowOf(A1_19)
    break
  else
  end
  L5_23 = L2_20
  return L5_23, L3_21, L4_22
end
function PrivateGLFreeGatherTown.processMapOpenMessageForAchieve(A0_24)
  local L2_25, L3_26, L4_27, L5_28
  L2_25 = desktopWidget
  L3_26 = L2_25
  L2_25 = L2_25.setMapNavigationWidgetMarkerData
  L4_27 = 2
  L5_28 = 0
  L2_25(L3_26, L4_27, L5_28, 1, A0_24:getPosByMapMarkerExtra())
  L2_25 = true
  return L2_25
end
function PrivateGLFreeGatherTown.processSetMiniMapMarkerForGLAchieve(A0_29)
  local L2_30, L3_31, L4_32, L5_33
  L2_30 = desktopWidget
  L3_31 = L2_30
  L2_30 = L2_30.setMiniMapWidgetMarkerData
  L4_32 = 2
  L5_33 = 0
  L2_30(L3_31, L4_32, L5_33, 1, A0_29:getPosByMapMarkerExtra())
  L2_30 = true
  return L2_30
end
function PrivateGLFreeGatherTown.processSetMapMarkerSize(A0_34, A1_35)
  local L2_36
  L2_36 = A1_35
  if L2_36 == 1 then
    if A0_34:getTempWork("mapSizeTmp") == 0 then
      return "small"
    end
  else
  end
  if L2_36 == 4 and A0_34:getTempWork("mapSizeTmp") == 0 then
    return "small"
  else
  end
  if A0_34:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
