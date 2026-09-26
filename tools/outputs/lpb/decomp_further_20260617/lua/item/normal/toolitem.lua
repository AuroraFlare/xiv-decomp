require("/Item/Normal/NormalItemBaseClass")
_defineClass("ToolItem", "NormalItemBaseClass")
function ToolItem.getWeaponActionGaugeTime(A0_0)
  if A0_0:getEquipmentEquipPoint() == 39 then
    return 5
  else
    return -1
  end
end
