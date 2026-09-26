require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("CompanyleveRescueNormal", "GuildleveBaseClass")
function CompanyleveRescueNormal.initAsGuildleve(A0_0)
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
  A0_0:_loadTextDataPermanently(7728, "companyleveRescueNormal")
end
function CompanyleveRescueNormal.processUIUpdate(A0_1, A1_2)
  if A1_2 == "info" and A0_1:getStartTime() > 0 then
    desktopWidget:processUpdateContentsInformation(A0_1, "update", 1)
  end
end
function CompanyleveRescueNormal.getArticleDataOnGuildleveInfo(A0_3, A1_4)
  local L2_5, L3_6, L4_7, L5_8, L6_9
  L2_5 = 0
  L3_6 = nil
  L4_7 = 0
  L5_8 = 0
  L6_9 = 0
  if A1_4 == 1 then
    L2_5 = A0_3:getArticleTypeForInfo("bar")
    L3_6 = worldMaster
    L4_7 = A0_3:getTextIdForInfo("enemy")
    L5_8 = A0_3:getGuildleveId()
    L6_9 = A1_4
    break
  else
  end
  return L2_5, L3_6, L4_7, L5_8, L6_9, 0
end
function CompanyleveRescueNormal.getArticleCondition(A0_10, A1_11)
  local L2_12
  L2_12 = 0
  if A1_11 == 1 then
    L2_12 = A0_10:getArticleConditionForInfo("guard")
    break
  else
  end
  return L2_12
end
function CompanyleveRescueNormal.getArticleParamOnGuildleveInfo(A0_13, A1_14)
  local L2_15, L3_16, L4_17, L7_18
  L7_18 = A1_14
  if L7_18 == 1 then
    L2_15 = A0_13.work.npcHP
    L3_16 = 100
    break
  else
  end
  L7_18 = L2_15
  return L7_18, L3_16, L4_17
end
function CompanyleveRescueNormal.processSetMapMarkerSize(A0_19, A1_20)
  local L2_21
  L2_21 = "small"
  return L2_21
end
