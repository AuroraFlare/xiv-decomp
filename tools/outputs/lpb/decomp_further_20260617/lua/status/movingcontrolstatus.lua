require("/Status/StatusBaseClass")
_defineClass("MovingControlStatus", "StatusBaseClass")
function MovingControlStatus.isBadStatus(A0_0)
  local L1_1
  L1_1 = A0_0.getStatusId
  L1_1 = L1_1(A0_0)
  if L1_1 == 228021 then
    break
  else
  end
  do break end
  return false
end
function MovingControlStatus.isGoodStatus(A0_2)
  local L1_3
  L1_3 = A0_2.getStatusId
  L1_3 = L1_3(A0_2)
  if L1_3 == 223001 then
  elseif L1_3 == 223189 then
  else
  end
  if L1_3 == 223224 then
    break
  else
  end
  do break end
  return false
end
function MovingControlStatus.isRemovedFromDeath(A0_4)
  local L1_5
  L1_5 = A0_4.getStatusId
  L1_5 = L1_5(A0_4)
  if L1_5 == 223189 then
    break
  else
  end
  do break end
  return true
end
