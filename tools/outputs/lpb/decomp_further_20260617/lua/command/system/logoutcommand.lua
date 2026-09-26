require("/Command/System/SystemCommandBaseClass")
_defineClass("LogoutCommand", "SystemCommandBaseClass")
function LogoutCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11
  if A2_2 == nil then
    L11_11 = true
    return L11_11
  end
  if A2_2 == 2 or A2_2 == 1 then
    L11_11 = true
    return L11_11
  end
  L11_11 = false
  return L11_11
end
function LogoutCommand.eventConfirm(A0_12, A1_13)
  local L2_14
  L2_14 = A1_13._wait
  L2_14(A1_13, 1)
  L2_14 = {
    34129,
    34130,
    34131
  }
  return (desktopWidget:askForEventMode(A0_12, worldMaster, worldMaster, 3, false, true, 34123, L2_14))
end
function LogoutCommand.eventCountDown(A0_15)
  return desktopWidget:askEventModeWidgetYield("Ask/WaitingCountdownWidget", 1, 15, worldMaster, 34135)
end
function LogoutCommand.eventLogoutFade(A0_16, A1_17)
  A1_17:_wait(2)
  return
end
