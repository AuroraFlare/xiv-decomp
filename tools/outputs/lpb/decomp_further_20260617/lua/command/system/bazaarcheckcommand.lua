require("/Command/System/SystemCommandBaseClass")
_defineClass("BazaarCheckCommand", "SystemCommandBaseClass")
function BazaarCheckCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPlayer() then
    return false
  end
  if not A1_1:isMyPlayer() then
    return false
  end
  if A6_6 == nil then
    return false
  end
  if A6_6:_isAlive() == false then
    return false
  end
  if A1_1:isLiving() == false then
    return false
  end
  if A6_6:isPlayer() and A6_6:isLiving() == false then
    return false
  end
  if A1_1:isActiveMode() == true then
    return false
  end
  return true
end
function BazaarCheckCommand.processChackBazaar(A0_11, A1_12)
  return (desktopWidget:orderBazaarWidget(1))
end
function BazaarCheckCommand.processSetupBazaar(A0_13, A1_14)
  return (desktopWidget:orderBazaarWidget(2))
end
function BazaarCheckCommand.processSetupRetainerBazaar(A0_15, A1_16)
  return (desktopWidget:orderBazaarWidget(2))
end
