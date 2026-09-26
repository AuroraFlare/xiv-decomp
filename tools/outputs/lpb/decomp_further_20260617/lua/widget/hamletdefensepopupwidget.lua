require("/Widget/WidgetBaseClass")
_defineClass("HamletDefensePopupWidget", "WidgetBaseClass")
function HamletDefensePopupWidget.dispInformation(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, ...)
  A0_0:setText("TextBlock_Text")
  A0_0:setTextByOwner("TextBlock_Text", A4_4, A5_5, ...)
  if A3_3 ~= 0 then
    A0_0:setIcon("IconControl_Buff", A3_3)
    A0_0:setVisibility("IconControl_Buff", true)
  else
    A0_0:setVisibility("IconControl_Buff", false)
  end
  if A1_1 == true then
    A0_0:setIcon("IconControl_ArmyFlag", 988 + A2_2 - 1)
    A0_0:setVisibility("IconControl_ArmyFlag", true)
    A0_0:setVisibility("IconControl_EnemyForces", false)
    A0_0:sendCommand("ArmyAnimation.Start")
  else
    A0_0:setIcon("IconControl_EnemyForces", 994 + A2_2 - 1)
    A0_0:setVisibility("IconControl_ArmyFlag", false)
    A0_0:setVisibility("IconControl_EnemyForces", true)
    A0_0:sendCommand("EnemyAnimation.Start")
  end
end
