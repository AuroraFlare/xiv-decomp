require("/Command/System/SystemCommandBaseClass")
_defineClass("ContentCommand", "SystemCommandBaseClass")
function ContentCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if A2_2 ~= A1_1:getContentCommandVariation() or A3_3 ~= A1_1:getContentCommandVariation() then
    return false
  end
  if A0_0:isNoneTarget() then
    return A6_6 == nil
  elseif A0_0:isAllTarget() then
    return true
  elseif A0_0:isPcTarget() then
    return A6_6 ~= nil and A6_6:isPlayer()
  elseif A0_0:isNpcTarget() then
    return A6_6 ~= nil and not A6_6:isPlayer()
  elseif A0_0:isPartyTarget() then
    return A6_6 ~= nil and A1_1:getPlayerParty():_isMember(A6_6)
  else
    return false
  end
end
function ContentCommand.fire(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18, A8_19, A9_20, A10_21)
  local L11_22
  L11_22 = false
  return L11_22
end
function ContentCommand.isEnabled(A0_23)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil
end
function ContentCommand.isNoneTarget(A0_24)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil and worldMaster:_getMyPlayer():getContentCommandVariation() >= 10000 and worldMaster:_getMyPlayer():getContentCommandVariation() <= 19999
end
function ContentCommand.isAllTarget(A0_25)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil and worldMaster:_getMyPlayer():getContentCommandVariation() >= 20000 and worldMaster:_getMyPlayer():getContentCommandVariation() <= 29999
end
function ContentCommand.isPcTarget(A0_26)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil and worldMaster:_getMyPlayer():getContentCommandVariation() >= 30000 and worldMaster:_getMyPlayer():getContentCommandVariation() <= 39999
end
function ContentCommand.isNpcTarget(A0_27)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil and worldMaster:_getMyPlayer():getContentCommandVariation() >= 40000 and worldMaster:_getMyPlayer():getContentCommandVariation() <= 49999
end
function ContentCommand.isPartyTarget(A0_28)
  return worldMaster:_getMyPlayer():getContentCommandVariation() ~= nil and worldMaster:_getMyPlayer():getContentCommandVariation() >= 50000 and worldMaster:_getMyPlayer():getContentCommandVariation() <= 59999
end
