require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("PrivateGLBattleSweepSpecial", "GuildleveBaseClass")
function PrivateGLBattleSweepSpecial.initAsGuildleve(A0_0)
  local L1_1
end
function PrivateGLBattleSweepSpecial.processMapOpenMessageForAchieve(A0_2)
  local L1_3
end
function PrivateGLBattleSweepSpecial.processSetMiniMapMarkerForGLAchieve(A0_4)
  local L1_5
end
function PrivateGLBattleSweepSpecial.processSetMapMarkerSize(A0_6, A1_7)
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
