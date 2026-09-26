require("/Command/System/SystemCommandBaseClass")
_defineClass("PlaceDrivenCommand", "SystemCommandBaseClass")
function PlaceDrivenCommand.mapJudgeCommand(A0_0, A1_1)
  local L2_2
  if A1_1 == 20001 then
    L2_2 = 22002
  elseif A1_1 == 20002 then
    L2_2 = 22003
  elseif A1_1 == 20004 then
    L2_2 = 22005
  elseif A1_1 == 20003 then
    L2_2 = 22004
  elseif A1_1 == 20005 or A1_1 == 20009 then
    L2_2 = 22006
  elseif A1_1 == 20006 or A1_1 == 20010 then
    L2_2 = 22007
  elseif A1_1 == 20007 or A1_1 == 20011 then
    L2_2 = 22008
  else
    if A1_1 == 30003 then
      L2_2 = 22004
    else
    end
  end
  return L2_2
end
function PlaceDrivenCommand.canFire(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10, A8_11, A9_12, A10_13)
  local L11_14, L12_15, L13_16, L14_17
  if A2_5 == 30004 then
    L11_14 = true
    return L11_14
  end
  L12_15 = A1_4
  L11_14 = A1_4.isLiving
  L11_14 = L11_14(L12_15)
  if not L11_14 then
    L11_14 = false
    return L11_14
  end
  L11_14, L12_15, L13_16 = nil, nil, nil
  L14_17 = 1
  while true do
    L11_14, L12_15, L13_16 = A1_4:getPlaceDrivenCommandVariation(L14_17)
    if L11_14 == nil then
      return false
    end
    if A2_5 == L11_14 and A3_6 == L12_15 and A6_9 == L13_16 then
      break
    end
    L14_17 = L14_17 + 1
  end
  if A2_5 >= 10000 and A2_5 <= 19999 then
    return true
  elseif A2_5 >= 20001 and A2_5 <= 20012 then
    return A1_4:searchReadyCommand(A0_3:mapJudgeCommand(A2_5)) ~= nil and A1_4:searchReadyCommand(A0_3:mapJudgeCommand(A2_5)):canFire(A1_4, nil, nil, nil, A5_8, A6_9, nil, nil, nil, nil)
  else
    if A2_5 == 30003 then
      return A1_4:searchReadyCommand(A0_3:mapJudgeCommand(A2_5)) ~= nil and A1_4:searchReadyCommand(A0_3:mapJudgeCommand(A2_5)):canFire(A1_4, nil, nil, nil, A5_8, A6_9, nil, nil, nil, nil) and A1_4:_isTouching(1)
    else
    end
  end
  return false
end
function PlaceDrivenCommand.fire(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23, A6_24, A7_25, A8_26, A9_27, A10_28)
  local L11_29
  L11_29 = false
  return L11_29
end
function PlaceDrivenCommand.isEnabled(A0_30)
  return worldMaster:_getMyPlayer():getPlaceDrivenCommandVariation() ~= nil
end
