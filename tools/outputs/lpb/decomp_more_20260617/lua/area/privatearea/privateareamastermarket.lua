require("/Area/PrivateArea/PrivateAreaBaseClass")
_defineClass("PrivateAreaMasterMarket", "PrivateAreaBaseClass")
function PrivateAreaMasterMarket.init(A0_0, A1_1, A2_2)
end
function PrivateAreaMasterMarket.cueAttentionOnClient(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  L1_4 = 1087
  L2_5 = 1261
  L3_6 = L1_4
  L5_8 = A0_3
  L4_7 = A0_3._getRegion
  L4_7 = L4_7(L5_8)
  L5_8 = L4_7
  if L5_8 == 202 then
    L1_4 = 1087
    L2_5 = 1261
    break
  else
    if L5_8 == 203 then
      break
    else
    end
    if L5_8 == 204 then
      L1_4 = 2091
      L2_5 = 2261
      break
    else
    end
    if L5_8 == 205 then
      L1_4 = 3091
      L2_5 = 3261
      do break end
      break
    else
    end
  end
  L5_8 = A0_3._getAreaType
  L5_8 = L5_8(A0_3)
  L3_6 = L2_5 + L5_8(A0_3) - 1
  desktopWidget:processUpdatePublicInformationDialog(worldMaster, "0", 60003, L3_6)
end
