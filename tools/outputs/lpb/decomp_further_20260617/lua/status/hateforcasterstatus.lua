require("/Status/StatusBaseClass")
_defineClass("HateForCasterStatus", "StatusBaseClass")
function HateForCasterStatus.isBadStatus(A0_0)
  local L1_1
  L1_1 = A0_0.getStatusId
  L1_1 = L1_1(A0_0)
  if L1_1 == 223192 then
    break
  else
  end
  do break end
  return false
end
function HateForCasterStatus.isGoodStatus(A0_2)
  local L1_3
  L1_3 = A0_2.getStatusId
  L1_3 = L1_3(A0_2)
  if L1_3 == 223087 then
    break
  else
  end
  do break end
  return false
end
