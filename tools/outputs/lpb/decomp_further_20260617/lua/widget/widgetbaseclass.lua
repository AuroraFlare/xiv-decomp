require("/Widget/WidgetBaseClass_common")
function WidgetBaseClass._onInit(A0_0, A1_1, A2_2, ...)
  local L4_4, L5_5, L6_6
  do break end
  L5_5 = A0_0
  L4_4 = A0_0._callSuperClassFunc
  L6_6 = "_onInit"
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.widgetWork
  L5_5 = {L6_6}
  L6_6 = {
    "_assignForChild",
    128
  }
  L4_4._temp = L5_5
  L4_4 = _isInstanceOf
  L5_5 = A0_0
  L6_6 = "DesktopWidget"
  L4_4 = L4_4(L5_5, L6_6)
  if L4_4 then
    L4_4 = A0_0.desktopWidgetWork
    L5_5 = {L6_6}
    L6_6 = {
      "_assignForChild",
      1024
    }
    L4_4._temp = L5_5
  end
  L5_5 = A0_0
  L4_4 = A0_0._setLoopInterval
  L6_6 = 0.1
  L4_4(L5_5, L6_6)
  do return end
  L5_5 = A0_0
  L4_4 = A0_0._callSuperClassFunc
  L6_6 = "_onInit"
  L4_4(L5_5, L6_6)
  L4_4 = A0_0.widgetWork
  L5_5 = {
    L6_6,
    {
      "requestSsdLoadKeyMin",
      "integer32"
    },
    {
      "requestSsdLoadKeyMax",
      "integer32"
    },
    {
      "commonTimer",
      "timer",
      true
    },
    {
      "common",
      "nesting",
      72
    },
    {
      "initialized",
      "boolean"
    },
    {
      "_assignForChild",
      290
    }
  }
  L6_6 = {
    "requestSsdLoadSheet",
    "actor"
  }
  L4_4._temp = L5_5
  L4_4 = false
  L5_5 = _isInstanceOf
  L6_6 = A0_0
  L5_5 = L5_5(L6_6, "DesktopWidget")
  if L5_5 then
    L4_4 = true
    L5_5 = A0_0.desktopWidgetWork
    L6_6 = {
      {
        "_assignForChild",
        1024
      }
    }
    L5_5._temp = L6_6
  end
  L6_6 = A0_0
  L5_5 = A0_0.initCommon
  L5_5 = L5_5(L6_6, A1_1, ...)
  L6_6 = A0_0.sendCommand
  L6_6(A0_0, "UIOperatorCommands.BeforeLuaInit")
  L6_6 = A0_0.init
  L6_6(A0_0, select(L5_5, ...))
  L6_6 = A0_0.sendCommand
  L6_6(A0_0, "UIOperatorCommands.AfterLuaInit")
  if A1_1 ~= nil then
    L6_6 = A1_1._isAlive
    L6_6 = L6_6(A1_1)
    if not L6_6 then
      return
    end
    L6_6 = A0_0._setParentWidget
    L6_6(A0_0, A1_1)
  end
  L6_6 = A0_0.widgetWork
  L6_6.initialized = true
  if not L4_4 then
    L6_6 = desktopWidget
    L6_6 = L6_6.isInitializing
    L6_6 = L6_6(L6_6)
    if not L6_6 then
      L6_6 = A1_1 == nil or not L6_6
      desktopWidget:processWidgetCreated(A0_0, L6_6, A2_2, ...)
    end
  end
end
function WidgetBaseClass.init(A0_7, ...)
end
function WidgetBaseClass.isInitializing(A0_9)
  local L1_10
  L1_10 = A0_9.widgetWork
  L1_10 = L1_10.initialized
  L1_10 = not L1_10
  return L1_10
end
function WidgetBaseClass.loadFormData(A0_11, A1_12)
  A0_11:_setFilename(A1_12)
  A0_11:_loadForm()
end
function WidgetBaseClass._onFinalize(A0_13)
  A0_13:_callSuperClassFunc("_onFinalize")
  if not _isInstanceOf(A0_13, "DesktopWidget") and not A0_13:isInitializing() then
    desktopWidget:processWidgetDeleted(A0_13)
  end
  A0_13:processFinalize()
end
function WidgetBaseClass.processFinalize(A0_14)
  local L1_15
end
function WidgetBaseClass._onUICommandEvent(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  A0_16.widgetWork.requestSsdLoadSheet = nil
  desktopWidget:setThreadOwnerWidget(A0_16)
  A0_16:processUICommandEvent(A1_17, A2_18, A3_19, A4_20, A5_21)
  if A0_16.widgetWork.requestSsdLoadSheet ~= nil then
    A0_16.widgetWork.requestSsdLoadSheet:_loadKeyTemporarily(A0_16.widgetWork.requestSsdLoadKeyMin, A0_16.widgetWork.requestSsdLoadKeyMax)
    A0_16:processSpreadSheetDataLoaded(A0_16.widgetWork.requestSsdLoadSheet)
    A0_16.widgetWork.requestSsdLoadSheet = nil
  end
  desktopWidget:setThreadOwnerWidget(nil)
end
function WidgetBaseClass._onUICommandRequest(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27)
  desktopWidget:setThreadOwnerWidget(A0_22)
  A0_22:processUICommandRequest(A1_23, A2_24, A3_25, A4_26, A5_27)
  desktopWidget:setThreadOwnerWidget(nil)
end
function WidgetBaseClass._onHoverHelp(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33)
end
function WidgetBaseClass.requestSelectSubTarget(A0_34, A1_35, A2_36, A3_37, A4_38)
  return desktopWidget:executeSubTarget(A0_34, A1_35, A2_36, A3_37, A4_38)
end
function WidgetBaseClass.processSubTargetDecided(A0_39, A1_40)
end
function WidgetBaseClass.requestLoadSpreadSheetData(A0_41, A1_42, A2_43, A3_44)
  local L4_45
  L4_45 = A0_41.widgetWork
  L4_45.requestSsdLoadSheet = A1_42
  L4_45 = A0_41.widgetWork
  L4_45.requestSsdLoadKeyMin = A2_43
  L4_45 = A0_41.widgetWork
  L4_45.requestSsdLoadKeyMax = A3_44
end
function WidgetBaseClass.processSpreadSheetDataLoaded(A0_46, A1_47)
end
function WidgetBaseClass.loadSpreadSheetDataAsync(A0_48, A1_49, A2_50, A3_51)
  A1_49:_loadMultiKeyAsync(A2_50, A3_51, A0_48)
end
function WidgetBaseClass.processSpreadSheetDataAsync(A0_52, A1_53, A2_54, A3_55)
end
function WidgetBaseClass._onLoadMultiKeyAsync(A0_56, A1_57, A2_58, A3_59)
  A0_56:processSpreadSheetDataAsync(A1_57, A2_58, A3_59)
end
function WidgetBaseClass.setCommonTimer(A0_60, A1_61)
  A0_60.widgetWork.commonTimer = A1_61
end
function WidgetBaseClass._onTimer(A0_62, A1_63, A2_64, ...)
  A0_62:processTimer()
end
function WidgetBaseClass.processTimer(A0_66)
  local L1_67
end
function WidgetBaseClass._onLoop(A0_68, A1_69)
end
