require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLFreeGatherNormal", "GuildleveBaseClass")
function PrivateGLFreeGatherNormal.initAsGuildleve(A0_0)
  local L1_1
end
function PrivateGLFreeGatherNormal.processMapOpenMessageForAchieve(A0_2)
  local L1_3
end
function PrivateGLFreeGatherNormal.processSetMiniMapMarkerForGLAchieve(A0_4)
  local L1_5
end
function PrivateGLFreeGatherNormal.processSetMapMarkerSize(A0_6, A1_7)
  if A1_7 == 1 then
    return "small"
  else
  end
  if A0_6:getAetheryteLocation() == 6 then
    return "normal"
  else
    return "small"
  end
end
