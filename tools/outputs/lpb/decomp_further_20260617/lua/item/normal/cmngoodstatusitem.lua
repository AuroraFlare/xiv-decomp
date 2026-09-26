require("/Item/Normal/NormalItemBaseClass")
_defineClass("CmnGoodStatusItem", "NormalItemBaseClass")
function CmnGoodStatusItem.canUseForRelation(A0_0)
  if A0_0:_getCatalogID() == 3020509 or A0_0:_getCatalogID() == 3020510 or A0_0:_getCatalogID() == 3020504 or A0_0:_getCatalogID() == 3020505 then
    return true, false, false
  end
  if A0_0:_getCatalogID() == 3020511 then
    return true, false, false
  end
  if A0_0:_getCatalogID() == 3020410 then
    return true, false, false
  end
  if A0_0:_getCatalogID() == 3020604 or A0_0:_getCatalogID() == 3020605 or A0_0:_getCatalogID() == 3020606 then
    return true, false, false
  end
  if A0_0:_getCatalogID() == 3020506 then
    return true, false, false
  end
  if A0_0:_getCatalogID() == 3020538 then
    return true, false, false
  end
  return true, true, false
end
function CmnGoodStatusItem.canUseDetail(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8, A8_9, A9_10, A10_11)
  local L11_12, L12_13
  L11_12 = true
  L12_13 = 0
  return L11_12, L12_13
end
