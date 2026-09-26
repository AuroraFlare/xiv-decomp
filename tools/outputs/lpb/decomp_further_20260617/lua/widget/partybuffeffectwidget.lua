require("/Widget/WidgetBaseClass")
_defineClass("PartyBuffEffectWidget", "WidgetBaseClass")
function PartyBuffEffectWidget.init(A0_0)
  local L1_1
end
function PartyBuffEffectWidget.startEffect(A0_2, A1_3)
  local L2_4
  L2_4 = "LightPartyEffect.Start"
  if A1_3 == true then
    L2_4 = "FullPartyEffect.Start"
  end
  A0_2:sendCommand(L2_4)
end
