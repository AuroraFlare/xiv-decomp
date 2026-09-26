require("/Widget/WidgetBaseClass")
_defineClass("TargetSelectModeWidget", "WidgetBaseClass")
function TargetSelectModeWidget.init(A0_0)
  local L1_1
  L1_1 = desktopWidget
  L1_1 = L1_1.getDefaultTargetMode
  L1_1 = L1_1(L1_1)
  A0_0:setMode(L1_1, true)
end
function TargetSelectModeWidget.setMode(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8
  L3_5 = "BOD_targetSelectMode_iconAll"
  L4_6 = "TBL_targetSelectMode_all"
  L5_7 = "BOD_targetSelectMode_effectAll"
  L6_8 = 2301
  if A1_3 == 2 then
    L3_5 = "BOD_targetSelectMode_iconPc"
    L4_6 = "TBL_targetSelectMode_pc"
    L5_7 = "BOD_targetSelectMode_effectPc"
    L6_8 = 2302
    break
  else
  end
  if A1_3 == 4 then
    L3_5 = "BOD_targetSelectMode_iconMonster"
    L4_6 = "TBL_targetSelectMode_monster"
    L5_7 = "BOD_targetSelectMode_effectMonster"
    L6_8 = 2304
    break
  else
  end
  if A1_3 == 3 then
    L3_5 = "BOD_targetSelectMode_iconParty"
    L4_6 = "TBL_targetSelectMode_party"
    L5_7 = "BOD_targetSelectMode_effectParty"
    L6_8 = 2303
    do break end
    break
  else
  end
  A0_2:setStyle("Border_ModeIcon", L3_5)
  A0_2:setStyle("TextBlock_ModeText", L4_6)
  A0_2:setStyle("Border_ModeIconEffect", L5_7)
  A0_2:setText("TextBlock_ModeText", L6_8)
  if A2_4 ~= true then
    A0_2:sendControlCommand("Label_ModeIcon", "UILuaCommands.ModeIconAnimeStart")
  end
end
