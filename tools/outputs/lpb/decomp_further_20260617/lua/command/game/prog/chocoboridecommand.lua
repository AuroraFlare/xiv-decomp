require("/Command/Game/Prog/ProgCommandBaseClass")
_defineClass("ChocoboRideCommand", "ProgCommandBaseClass")
function ChocoboRideCommand.isUseActionGauge(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function ChocoboRideCommand.getCanCommandErrTextIdForDead(A0_2)
  local L1_3
  L1_3 = 32501
  return L1_3
end
function ChocoboRideCommand.isGoobbueCommand_(A0_4, A1_5, A2_6)
  if A1_5 == nil then
    return false
  end
  if type(A1_5) == "number" and A1_5 == 0 then
    return false
  end
  return true
end
function ChocoboRideCommand.canFireDetail(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13, A7_14, A8_15, A9_16, A10_17)
  local L11_18, L12_19
  L12_19 = A0_7
  L11_18 = A0_7.getCommandId
  L11_18 = L11_18(L12_19)
  if L11_18 == 12014 then
    L12_19 = _getStaticActor
    L12_19 = L12_19(320013)
    L12_19 = L12_19.isRiding
    L12_19 = L12_19(L12_19, A1_8)
    if L12_19 then
      L12_19 = false
      return L12_19, 32501
    end
    L12_19 = 26002
    if A0_7:isGoobbueCommand_(A2_9, A3_10) then
      L12_19 = 26020
    end
    if A0_7:_getCurrentAreaMaster():_canRideChocobo() == false and A0_7:_getCurrentAreaMaster():_isWarpRideChocobo() == false then
      return false, L12_19
    end
    if A1_8:_isPushingOut() then
      return false, L12_19
    end
  else
    L12_19 = _getStaticActor
    L12_19 = L12_19(320013)
    L12_19 = L12_19.isRiding
    L12_19 = L12_19(L12_19, A1_8)
    if L12_19 == false then
      L12_19 = false
      return L12_19, 32501
    end
  end
  L12_19 = true
  return L12_19, 0
end
function ChocoboRideCommand.myChocoboCutScene(A0_20, A1_21, A2_22)
  A1_21:_fadeOut(1)
  A1_21:_waitForFading()
  worldMaster:createCutScene("sum6a000", nil):_delete()
  A1_21:_fadeInAfterWarp()
end
