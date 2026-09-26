require("/Command/System/SystemCommandBaseClass")
_defineClass("TeleportCommand", "SystemCommandBaseClass")
function TeleportCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if A2_2 ~= nil then
    if A1_1:isLiving() ~= true then
      return false
    end
  else
    if A1_1:isLiving() ~= true then
      return true
    end
    if A1_1:getWarpRecastTime() > 0 then
      return false
    end
  end
  return true
end
function TeleportCommand.eventConfirm(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17)
  local L7_18, L8_19, L9_20, L10_21, L11_22
  L8_19 = A1_12
  L7_18 = A1_12._wait
  L9_20 = 1
  L7_18(L8_19, L9_20)
  L7_18, L8_19, L9_20, L10_21 = nil, nil, nil, nil
  if A2_13 == true then
    if A4_15 == 0 or A4_15 == nil or A6_17 == true then
      L11_22 = worldMaster
      L11_22 = L11_22.ask
      L11_22 = L11_22(L11_22, A0_11, worldMaster, 34117, 2)
      L7_18 = L11_22
    else
      L11_22 = worldMaster
      L11_22 = L11_22.askMultipleTextMacro
      L11_22 = L11_22(L11_22, worldMaster, worldMaster, 3, 34138, 3, 1, true, true, true, A5_16, A4_15, 1)
      L7_18 = L11_22
      if L7_18 == 2 then
        L8_19 = true
        L7_18 = 1
      end
    end
  else
    L11_22 = worldMaster
    L11_22 = L11_22.ask
    L11_22 = L11_22(L11_22, A0_11, worldMaster, 34120, 2)
    L7_18 = L11_22
  end
  if L7_18 == 1 then
    L11_22 = _getStaticActor
    L11_22 = L11_22(320013)
    if L11_22:isRiding(A1_12) then
      L7_18 = worldMaster:ask(A0_11, worldMaster, L11_22:getRidingErrorTextId(A1_12, 26010), 2)
    end
  end
  if A3_14 == true and L7_18 == 1 then
    L11_22 = nil
    if A2_13 == true then
      L11_22 = 34137
    else
      L11_22 = 34136
    end
    if desktopWidget:askEventModeWidgetYield("Ask/WaitingCountdownWidget", 1, 15, worldMaster, L11_22) == false or desktopWidget:askEventModeWidgetYield("Ask/WaitingCountdownWidget", 1, 15, worldMaster, L11_22) == 2 then
      L7_18 = 2
    end
  end
  L11_22 = L7_18
  return L11_22, L8_19
end
function TeleportCommand.eventRegion(A0_23, A1_24, A2_25)
  local L3_26
  if desktopWidget:openEventModeWidgetYield("Ask/AetheryteListWidget") == true then
    L3_26 = desktopWidget:selectAetheryteRegion(A2_25)
  end
  return L3_26
end
function TeleportCommand.eventAetheryte(A0_27, A1_28, A2_29, ...)
  local L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39
  if A2_29 == 6 then
    L6_33 = {
      L7_34,
      L8_35,
      L9_36,
      L10_37,
      L11_38,
      L12_39
    }
    L7_34 = select
    L12_39 = ...
    L7_34 = L7_34(L8_35, L9_36, L10_37, L11_38, L12_39, ...)
    L12_39 = ...
    L12_39 = ...
    L12_39 = 0
    L4_31 = L6_33
    L6_33 = {
      L7_34,
      L8_35,
      L9_36,
      L10_37,
      L11_38,
      L12_39
    }
    L7_34 = select
    L12_39 = ...
    L7_34 = L7_34(L8_35, L9_36, L10_37, L11_38, L12_39, ...)
    L12_39 = ...
    L12_39 = ...
    L12_39 = 0
    L5_32 = L6_33
  else
    L6_33 = {
      L7_34,
      L8_35,
      L9_36,
      L10_37,
      L11_38,
      [7] = L12_39(6, ...)
    }
    L7_34 = select
    L12_39 = ...
    L7_34 = L7_34(L8_35, L9_36, L10_37, L11_38, L12_39, ...)
    L12_39 = ...
    L12_39 = ...
    L12_39 = ...
    L12_39 = 5
    L12_39 = select
    L12_39 = L12_39(6, ...)
    ;({
      L7_34,
      L8_35,
      L9_36,
      L10_37,
      L11_38,
      [7] = L12_39(6, ...)
    })[6] = L12_39
    L4_31 = L6_33
  end
  L6_33 = {}
  L7_34 = {}
  if A2_29 == 1 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = 1280001
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = 1280002
          break
        else
        end
        if L12_39 == 3 then
          L6_33[L8_35] = 1280003
          break
        else
        end
        if L12_39 == 4 then
          L6_33[L8_35] = 1280004
          break
        else
        end
        if L12_39 == 5 then
          L6_33[L8_35] = 1280005
          break
        else
        end
        if L12_39 == 6 then
          L6_33[L8_35] = 1280006
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  elseif A2_29 == 2 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = 1280092
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = 1280093
          break
        else
        end
        if L12_39 == 3 then
          L6_33[L8_35] = 1280094
          break
        else
        end
        if L12_39 == 4 then
          L6_33[L8_35] = 1280095
          break
        else
        end
        if L12_39 == 5 then
          L6_33[L8_35] = 1280096
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  elseif A2_29 == 3 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = 1280061
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = 1280062
          break
        else
        end
        if L12_39 == 3 then
          L6_33[L8_35] = 1280063
          break
        else
        end
        if L12_39 == 4 then
          L6_33[L8_35] = 1280064
          break
        else
        end
        if L12_39 == 5 then
          L6_33[L8_35] = 1280065
          break
        else
        end
        if L12_39 == 6 then
          L6_33[L8_35] = 1280066
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  elseif A2_29 == 4 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = 1280031
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = 1280032
          break
        else
        end
        if L12_39 == 3 then
          L6_33[L8_35] = 1280033
          break
        else
        end
        if L12_39 == 4 then
          L6_33[L8_35] = 1280034
          break
        else
        end
        if L12_39 == 5 then
          L6_33[L8_35] = 1280035
          break
        else
        end
        if L12_39 == 6 then
          L6_33[L8_35] = 1280036
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  elseif A2_29 == 5 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = 1280121
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = 1280122
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  elseif A2_29 == 6 then
    for L12_39 = 1, 6 do
      if L4_31[L12_39] ~= 0 then
        if L12_39 == 1 then
          L6_33[L8_35] = L5_32[1]
          break
        else
        end
        if L12_39 == 2 then
          L6_33[L8_35] = L5_32[2]
          break
        else
        end
        if L12_39 == 3 then
          L6_33[L8_35] = L5_32[3]
          break
        else
        end
        if L12_39 > L8_35 then
          L4_31[L8_35] = L4_31[L12_39]
          L4_31[L12_39] = 0
        end
        L7_34[L8_35] = L12_39
      end
    end
  end
  for L11_38 = 1, 6 do
    L12_39 = L6_33[L11_38]
    if L12_39 == 1280092 then
    elseif L12_39 == 1280064 then
    elseif L12_39 == 1280065 then
    elseif L12_39 == 1280032 then
    else
    end
    if L12_39 == 1280034 then
      if worldMaster:_getSpecialEventWork(9) ~= 20 then
      else
        elseif L12_39 == 1280121 then
        elseif L12_39 == 1280122 then
        elseif L12_39 == 1280094 then
        elseif L12_39 == 1280095 then
        else
        end
        if L12_39 == 1280035 then
          L4_31[L11_38] = 0
        else
        end
      end
  end
  L12_39 = L6_33[2]
  L9_36(L10_37, L11_38)
  return L9_36
end
