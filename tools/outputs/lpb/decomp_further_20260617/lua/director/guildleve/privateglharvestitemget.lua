require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLHarvestItemGet", "GuildleveBaseClass")
function PrivateGLHarvestItemGet.initAsGuildleve(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = {L2_2}
  L2_2 = {L3_3, "integer32"}
  L3_3 = "articleTextId"
  L2_2 = {}
  L3_3 = A0_0.initWork
  L3_3(A0_0, nil, L1_1, L2_2)
  L3_3 = guildleveSheet
  L3_3 = L3_3._getData
  L3_3 = L3_3(L3_3, A0_0:getGuildleveId(), 19)
  A0_0:setTempWork("articleTextId", L3_3)
end
function PrivateGLHarvestItemGet.getArticleDataOnGuildleveInfo(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L2_6 = 0
  L3_7 = nil
  L4_8 = 0
  L5_9 = 0
  L6_10 = 0
  L7_11 = A1_5
  if L7_11 == 1 then
  elseif L7_11 == 2 then
  else
  end
  if L7_11 == 3 then
    L2_6 = A0_4:getArticleTypeForInfo("barFraction")
    L3_7 = worldMaster
    L4_8 = A0_4:getTextIdForInfo("item")
    L5_9 = A0_4:getGuildleveId()
    L6_10 = A1_5
    break
  else
  end
  if L7_11 == 4 then
    L2_6 = A0_4:getArticleTypeForInfo("barFraction")
    L3_7 = worldMaster
    L4_8 = A0_4:getIdForInstruction("glText")
    L5_9 = A0_4:getTempWork("articleTextId")
    break
  else
  end
  L7_11 = L2_6
  return L7_11, L3_7, L4_8, L5_9, L6_10, 0
end
function PrivateGLHarvestItemGet.getArticleCondition(A0_12, A1_13)
  local L2_14, L3_15
  L2_14 = 0
  L3_15 = A1_13
  if L3_15 == 1 then
  elseif L3_15 == 2 then
  else
  end
  if L3_15 == 3 then
    L2_14 = A0_12:getArticleConditionForInfo("get")
    break
  else
  end
  if L3_15 == 4 then
    L2_14 = A0_12:getArticleConditionForInfo("none")
    break
  else
  end
  return L2_14
end
