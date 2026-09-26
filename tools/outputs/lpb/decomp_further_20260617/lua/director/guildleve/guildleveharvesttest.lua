require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("GuildleveHarvestTest", "GuildleveBaseClass")
function GuildleveHarvestTest.initAsGuildleve(A0_0)
  local L1_1
end
function GuildleveHarvestTest.getArticleDataOnGuildleveInfo(A0_2, A1_3)
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
    L2_4 = A0_2:getArticleTypeForInfo("get")
    L3_5 = worldMaster
    L4_6 = A0_2:getIdForInstruction("glText")
    L5_7 = 31001
    break
  else
  end
  L7_9 = L2_4
  return L7_9, L3_5, L4_6, L5_7, L6_8
end
