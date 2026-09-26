require("/Status/StatusBaseClass")
_defineClass("InstantEffectStatus", "StatusBaseClass")
function InstantEffectStatus.isRemovedAtChangeMainSkill(A0_0)
  if A0_0:getStatusId() == 223116 then
    return true
  end
  return false
end
function InstantEffectStatus.isGoodStatus(A0_1)
  if A0_1:getStatusId() == 223116 then
    return false
  end
  return true
end
