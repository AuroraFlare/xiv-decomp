local L0_0, L1_1
L0_0 = CommandBaseClass
function L1_1(A0_2)
  return A0_2:_getStaticActorID()
end
L0_0.getCommandId = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_3, A1_4)
  return commandSheet:_getData(A0_3:getCommandId(), A1_4)
end
L0_0.getCommandData = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_5)
  return A0_5:getCommandData(30)
end
L0_0.isJudgedAtCommonJudge = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_6)
  return A0_6:getCommandData(31)
end
L0_0.isJudgedAtBattleJudge = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_7)
  return A0_7:getCommandData(32)
end
L0_0.isJudgedAtCraftJudge = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_8)
  return A0_8:getCommandData(33)
end
L0_0.isJudgedAtHarvestJudge = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_9)
  return A0_9:getCommandData(34)
end
L0_0.isJudgedAtNegotiationJudge = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_10)
  return A0_10:getCommandData(26)
end
L0_0.isOnlyServer = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_11)
  return A0_11:getCommandData(27)
end
L0_0.needsAcquired = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_12)
  return A0_12:getCommandData(28)
end
L0_0.needsEquipped = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_13)
  return A0_13:getCommandData(29)
end
L0_0.getPriority = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_14)
  local L1_15
  L1_15 = false
  return L1_15
end
L0_0.isBattleCommand = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_16)
  local L1_17
  L1_17 = false
  return L1_17
end
L0_0.isHostilityCommand = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_18)
  local L1_19
  L1_19 = false
  return L1_19
end
L0_0.isDesktopCommandMode = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_20)
  local L1_21
  do break end
  L1_21 = A0_20._callSuperClassFunc
  L1_21(A0_20, "_onInit")
  do return end
  L1_21 = A0_20._callSuperClassFunc
  L1_21(A0_20, "_onInit")
  L1_21 = A0_20._getStaticActorID
  L1_21 = L1_21(A0_20)
  commandSheet:_loadKeySemipermanently(L1_21, L1_21)
  A0_20:init()
end
L0_0._onInit = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_22)
  local L1_23
end
L0_0.init = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_24)
  local L1_25
  L1_25 = A0_24._callSuperClassFunc
  L1_25(A0_24, "_onFinalize")
  L1_25 = A0_24._getStaticActorID
  L1_25 = L1_25(A0_24)
  commandSheet:_unloadKey(L1_25, L1_25)
  A0_24:processFinalize()
end
L0_0._onFinalize = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_26)
  local L1_27
end
L0_0.processFinalize = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34, A7_35, A8_36, A9_37, A10_38)
  local L11_39
  L11_39 = false
  return L11_39
end
L0_0.canFire = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45, A6_46, A7_47, A8_48, A9_49, A10_50)
  local L11_51
  L11_51 = false
  return L11_51
end
L0_0.fire = L1_1
L0_0 = CommandBaseClass
function L1_1(A0_52, A1_53, ...)
  local L3_55
  L3_55 = false
  return L3_55
end
L0_0.command = L1_1
