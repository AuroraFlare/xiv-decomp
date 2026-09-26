require("/Command/Game/Ability/AbilityBaseClass")
_defineClass("MonsterSubStatAbility", "AbilityBaseClass")
function MonsterSubStatAbility.getPartsDamageAdjust(A0_0)
  if A0_0:getCommandId() == 23324 or A0_0:getCommandId() == 23323 or A0_0:getCommandId() == 23410 or A0_0:getCommandId() == 23411 or A0_0:getCommandId() == 23412 then
    return 1, 0
  end
  return 1, 1
end
