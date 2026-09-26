require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("InstanceRaidGuideBaseClass", "NpcBaseClass")
function InstanceRaidGuideBaseClass.initForEvent(A0_0)
  A0_0.instanceRaidGuideWork._temp = {}
  A0_0:initForInstanceRaidGuide()
end
function InstanceRaidGuideBaseClass.initForInstanceRaidGuide(A0_1)
  local L1_2
end
function InstanceRaidGuideBaseClass.askEnterInstanceRaid(A0_3, A1_4)
  local L2_5, L3_6
  L2_5 = false
  L3_6 = {52046, 52047}
  if desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true, 52045, L3_6, A1_4) == 1 then
    L2_5 = true
  end
  return L2_5
end
