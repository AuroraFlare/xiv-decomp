require("/Command/System/SystemCommandBaseClass")
_defineClass("LoginEventCommand", "SystemCommandBaseClass")
function LoginEventCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11
  L11_11 = true
  return L11_11
end
function LoginEventCommand.fire(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19, A8_20, A9_21, A10_22)
  local L11_23, L12_24, L13_25, L14_26, L15_27
  if A2_14 == 20 then
    L11_23 = ""
    if A3_15 == 1 then
      L11_23 = "drm0l000"
    elseif A3_15 == 2 then
      L11_23 = "drm0g000"
    else
      L11_23 = "drm0u000"
    end
    L12_24 = worldMaster
    L13_25 = L12_24
    L12_24 = L12_24.createCutScene
    L14_26 = L11_23
    L12_24 = L12_24(L13_25, L14_26)
    L14_26 = L12_24
    L13_25 = L12_24.startCutScene
    L15_27 = 1
    L13_25(L14_26, L15_27, 61, 1, 0)
    L14_26 = L12_24
    L13_25 = L12_24._delete
    L13_25(L14_26)
    L14_26 = A1_13
    L13_25 = A1_13._fadeInAfterWarp
    L13_25(L14_26)
    L13_25 = false
    return L13_25
  elseif A2_14 == 1 or A2_14 == 2 then
    L11_23 = {}
    L12_24 = {}
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5l110"
    L15_27 = 110839
    L12_24[1] = L13_25
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5g110"
    L15_27 = 110829
    L12_24[2] = L13_25
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5u110"
    L15_27 = 110849
    L12_24[3] = L13_25
    L11_23[1] = L12_24
    L12_24 = {}
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5l310"
    L15_27 = 110841
    L12_24[1] = L13_25
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5g310"
    L15_27 = 110841
    L12_24[2] = L13_25
    L13_25 = {L14_26, L15_27}
    L14_26 = "etc5u310"
    L15_27 = 110841
    L12_24[3] = L13_25
    L11_23[2] = L12_24
    L12_24 = L11_23[A2_14]
    L12_24 = L12_24[A3_15]
    L13_25 = L12_24[1]
    L14_26 = L12_24[2]
    L15_27 = _getQuestActorForCutSceneReplay
    L15_27 = L15_27(L14_26)
    worldMaster:createCutScene(L13_25, L15_27):_delete()
    if L15_27:_isAlive() then
      L15_27:_delete()
    end
    if worldMaster:createCutScene(L13_25, L15_27):startCutScene(1, 61, 2) == 1 then
      A1_13:_fadeInAfterWarp()
      return false
    else
      A1_13:_fadeIn(0.5)
      return true
    end
  else
    if A2_14 >= 21 then
      L12_24 = A1_13
      L11_23 = A1_13._lockPlayerControl
      L11_23(L12_24)
      L11_23 = nil
      if A2_14 == 21 then
        L11_23 = 16
      elseif A2_14 == 22 then
        L11_23 = 8
      elseif A2_14 == 23 then
        L11_23 = 9
      elseif A2_14 == 24 then
        L11_23 = 10
      elseif A2_14 == 25 then
        L11_23 = 11
      elseif A2_14 == 26 then
        L11_23 = 12
      elseif A2_14 == 27 then
        L11_23 = 13
      elseif A2_14 == 28 then
        L11_23 = 14
      elseif A2_14 == 29 then
        L11_23 = 14
      elseif A2_14 == 30 then
        L11_23 = 14
      elseif A2_14 == 31 then
        L11_23 = 14
      elseif A2_14 == 32 then
        L11_23 = 14
      elseif A2_14 == 33 then
        L11_23 = 14
      else
        if A2_14 == 35 then
          L11_23 = 17
        else
        end
      end
      L13_25 = A1_13
      L12_24 = A1_13._runCharaScheduler
      L14_26 = 83791872
      L12_24(L13_25, L14_26)
      L13_25 = A1_13
      L12_24 = A1_13._wait
      L14_26 = 8
      L12_24(L13_25, L14_26)
      if L11_23 ~= nil then
        L12_24 = worldMaster
        L13_25 = L12_24
        L12_24 = L12_24.notify
        L14_26 = A6_18
        L15_27 = L11_23
        L12_24(L13_25, L14_26, L15_27)
      end
      L13_25 = A1_13
      L12_24 = A1_13._unlockPlayerControl
      L12_24(L13_25)
      L12_24 = true
      return L12_24
    else
    end
  end
  L11_23 = true
  return L11_23
end
