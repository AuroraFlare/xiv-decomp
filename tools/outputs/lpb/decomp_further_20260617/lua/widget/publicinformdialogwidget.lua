require("/Widget/WidgetBaseClass")
_defineClass("PublicInformDialogWidget", "WidgetBaseClass")
function PublicInformDialogWidget.init(A0_0)
  A0_0:setDrawPriority(0.2)
end
function PublicInformDialogWidget.setInitialData(A0_1, A1_2, A2_3, A3_4, ...)
  local L5_6, L6_7
  L6_7 = A0_1
  L5_6 = A0_1.setText
  L5_6(L6_7, "TextBlock_Text")
  L5_6 = "WIN_basis_active"
  L6_7 = 5
  if A1_2 == 2 then
    L6_7 = 7
    break
  else
  end
  if A1_2 == 3 then
    L5_6 = "WIN_basis_yellow_active"
    break
  else
  end
  A0_1:setStyle("Window_PublicInformDialogWidget", L5_6)
  if A2_3 ~= nil then
    A0_1:setTextByOwner("TextBlock_Text", A2_3, A3_4, ...)
  end
  A0_1:setCommonTimer(L6_7)
end
function PublicInformDialogWidget.processTimer(A0_8)
  A0_8:hide()
end
