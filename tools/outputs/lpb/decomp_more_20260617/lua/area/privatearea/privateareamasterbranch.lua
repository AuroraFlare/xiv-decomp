require("/Area/PrivateArea/PrivateAreaBaseClass")
_defineClass("PrivateAreaMasterBranch", "PrivateAreaBaseClass")
function PrivateAreaMasterBranch.init(A0_0, A1_1, A2_2)
end
function PrivateAreaMasterBranch.cueAttentionOnClient(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = 1519
  L3_6 = A0_3
  L2_5 = A0_3._getRegion
  L2_5 = L2_5(L3_6)
  L3_6 = L2_5
  if L3_6 == 202 then
    L1_4 = 1519
    break
  else
  end
  if L3_6 == 204 then
    L1_4 = 2534
    break
  else
  end
  if L3_6 == 205 then
    L1_4 = 3533
    do break end
    break
  else
  end
  L3_6 = desktopWidget
  L3_6 = L3_6.processUpdatePublicInformationDialog
  L3_6(L3_6, worldMaster, "0", 60003, L1_4)
end
