require("/Widget/DesktopUtil")
require("/Widget/DesktopWidget_connector")
require("/Widget/DesktopWidget_itemDetail")
require("/Widget/DesktopWidget_materia")
function DesktopWidget._onInit(A0_0)
  do break end
  A0_0:_callSuperClassFunc("_onInit")
  A0_0.work._temp = {}
  do return end
  A0_0:_callSuperClassFunc("_onInit", A0_0:initDesktopInitialParameter())
  _createActor("desktopUtil", "DesktopUtil")
  A0_0:_setLoopInterval(1)
end
function DesktopWidget._onLoop(A0_1, A1_2)
  do break end
  do return end
  A0_1:updateBazaarPackage()
end
function DesktopWidget.createWidget(A0_3, A1_4, A2_5, ...)
  require("/Widget/" .. A1_4)
  worldMaster:_getMyPlayer():recordRequestInformation()
  return (_createActor(nil, _string.gsub(A1_4, ".+/", ""), false, A2_5, true, ...))
end
function DesktopWidget.cancelWidgetCommand(A0_7)
  worldMaster:_getMyPlayer():cancelCommandAboutWidget()
end
function DesktopWidget.commandCreateWidget(A0_8, A1_9, A2_10, ...)
  return worldMaster:_getMyPlayer():commandAboutWidget(worldMaster:_getMyPlayer():getSystemCommand(24228), A2_10, A1_9, ...)
end
function DesktopWidget.isCreateWidgetCommandPlaying(A0_12)
  return worldMaster:_getMyPlayer():isCommandAboutWidgetPlaying(worldMaster:_getMyPlayer():getSystemCommand(24228))
end
function DesktopWidget.commandMacro(A0_13, A1_14)
  return worldMaster:_getMyPlayer():commandAboutWidget(worldMaster:_getMyPlayer():getSystemCommand(24229), true, A1_14)
end
function DesktopWidget.isMacroCommandPlaying(A0_15)
  return worldMaster:_getMyPlayer():isCommandAboutWidgetPlaying(worldMaster:_getMyPlayer():getSystemCommand(24229))
end
function DesktopWidget.cancelMacroCommand(A0_16)
  worldMaster:_getMyPlayer():cancelCommandAboutWidget(worldMaster:_getMyPlayer():getSystemCommand(24229))
end
function DesktopWidget._onPreWarp(A0_17, A1_18)
  do break end
  do return end
  A0_17:orderDesktopWidgetMode(127)
  worldMaster:_getMyPlayer():_setLockonTarget(nil)
  A0_17:cancelAllTarget()
end
function DesktopWidget._onPostWarp(A0_19, A1_20)
  local L2_21, L3_22
  do break end
  do return end
  L3_22 = A0_19
  L2_21 = A0_19.getModeLevel
  L2_21 = L2_21(L3_22, 126)
  L3_22 = A0_19.work
  L3_22 = L3_22.desktopMode
  L3_22 = L3_22[L2_21]
  if L3_22 == 126 then
    L3_22 = A0_19.cancelDesktopWidgetMode
    L3_22(A0_19, 126)
  end
  L3_22 = A0_19.cancelDesktopWidgetMode
  L3_22(A0_19, 127)
  L3_22 = A0_19._getCurrentAreaMaster
  L3_22 = L3_22(A0_19)
  if (_isInstanceOf(L3_22, "PrivateAreaMasterMarket") == true or _isInstanceOf(L3_22, "PrivateAreaMasterBranch") == true) and type(A1_20) == "number" and A1_20 == 2 then
    L3_22:cueAttentionOnClient()
  end
  if A1_20 == 18 then
    worldMaster:notify(worldMaster, 52036)
  elseif A1_20 == 23 and L3_22:isInstanceRaid() then
    A0_19:openPublicInformDialogWidget(worldMaster, 34270)
  elseif A1_20 == 24 then
    worldMaster:notify(worldMaster, 51139)
  end
end
function DesktopWidget._onPreCutSceneCancel(A0_23)
  desktopWidget:orderDesktopWidgetMode(127)
end
function DesktopWidget._onPostCutSceneCancel(A0_24)
  desktopWidget:cancelDesktopWidgetMode(127)
end
function DesktopWidget._onCreatedWidgetInWidgetContainer(A0_25, A1_26, A2_27)
end
function DesktopWidget.showMessage(A0_28, A1_29, A2_30, A3_31, A4_32, ...)
  local L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40
  do break end
  do return end
  L7_35 = A0_28
  L6_34 = A0_28._appendMessagePool
  L8_36 = A1_29
  L9_37 = A2_30
  L10_38 = A3_31
  L11_39 = A4_32
  L12_40 = ...
  L6_34(L7_35, L8_36, L9_37, L10_38, L11_39, L12_40)
end
function DesktopWidget.showLog(A0_41, A1_42, A2_43, A3_44, A4_45, ...)
  local L6_47, L7_48, L8_49, L9_50, L10_51, L11_52, L12_53
  do break end
  do return end
  L7_48 = A0_41
  L6_47 = A0_41._appendLogPool
  L8_49 = A1_42
  L9_50 = A2_43
  L10_51 = A3_44
  L11_52 = A4_45
  L12_53 = ...
  L6_47(L7_48, L8_49, L9_50, L10_51, L11_52, L12_53)
end
