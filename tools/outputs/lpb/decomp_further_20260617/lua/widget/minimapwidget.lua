require("/Widget/WidgetBaseClass")
_defineClass("MiniMapWidget", "WidgetBaseClass")
function MiniMapWidget.init(A0_0)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "Ready", false)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "Region", -1)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "Layout", -1)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "Rect", -1)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "isDisplayGrid", false)
  A0_0:_setProperty(nil, "CustomControl_MiniMap", "Ready", true)
end
function MiniMapWidget.clearActiveGuildleveMarker(A0_1)
  A0_1:deleteListPropertyAll("GLMakerData")
end
function MiniMapWidget.setMiniMapWidgetMarkerData(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8)
  local L7_9
  if A2_4 == -1 then
    L7_9 = A0_2.clearActiveGuildleveMarker
    L7_9(A0_2)
    return
  end
  if A1_3 == nil or A1_3 == "" then
    return
  end
  if A2_4 < 0 or A2_4 > 8 or A2_4 == "" then
    return
  end
  if A3_5 == nil or A3_5 == "" then
  end
  if A4_6 == nil or A4_6 == "" then
    return
  end
  if A5_7 == nil or A5_7 == "" then
    return
  end
  if A6_8 == nil or A6_8 == "" then
    return
  end
  L7_9 = nil
  if A3_5 == 1 then
    L7_9 = 32
    break
  else
  end
  if A3_5 == 2 then
    L7_9 = 64
    break
  else
  end
  if A3_5 == 3 then
    L7_9 = 128
    break
  else
  end
  do return end
  A0_2:setListProperty("GLMakerData", A2_4, "X", math:_floor(A4_6))
  A0_2:setListProperty("GLMakerData", A2_4, "Y", math:_floor(A5_7))
  A0_2:setListProperty("GLMakerData", A2_4, "Z", math:_floor(A6_8))
  A0_2:setListProperty("GLMakerData", A2_4, "Radius", L7_9)
  A0_2:updateListProperty("GLMakerData")
end
