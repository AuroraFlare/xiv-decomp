local L0_0, L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_2)
  local L1_3, L2_4, L3_5
  L1_3 = A0_2.playerWork
  L1_3 = L1_3.variableCommandConfirmRaise
  if L1_3 == 0 then
    L1_3 = nil
    return L1_3
  end
  L1_3 = A0_2.playerWork
  L1_3 = L1_3.variableCommandConfirmRaiseSenderByID
  if L1_3 == 0 then
    L2_4 = A0_2.playerWork
    L1_3 = L2_4.variableCommandConfirmRaiseSender
  end
  L2_4 = A0_2.playerWork
  L2_4 = L2_4.variableCommandConfirmRaise
  L3_5 = L1_3
  return L2_4, L3_5, A0_2.playerWork.variableCommandConfirmRaiseSenderSex
end
L0_0.getConfirmRaiseCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = A0_6.playerWork
  L1_7 = L1_7.variableCommandConfirmWarp
  if L1_7 == 0 then
    L1_7 = nil
    return L1_7
  end
  L1_7 = A0_6.playerWork
  L1_7 = L1_7.variableCommandConfirmWarpSenderByID
  if L1_7 == 0 then
    L2_8 = A0_6.playerWork
    L1_7 = L2_8.variableCommandConfirmWarpSender
  end
  L2_8 = A0_6.playerWork
  L2_8 = L2_8.variableCommandConfirmWarp
  L3_9 = L1_7
  return L2_8, L3_9, A0_6.playerWork.variableCommandConfirmWarpSenderSex, A0_6.playerWork.variableCommandConfirmWarpPlace
end
L0_0.getConfirmWarpCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_10)
  if A0_10:_getGroup(50001) == nil or A0_10:_getGroup(50001):isHost(A0_10) then
    return nil
  else
    return A0_10:_getGroup(50001):getCommandVariation()
  end
end
L0_0.getConfirmGroupCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_11)
  if A0_11:_getGroup(50002) == nil or A0_11:_getGroup(50002):isHost(A0_11) then
    return nil
  else
    return A0_11:_getGroup(50002):getCommandVariation()
  end
end
L0_0.getConfirmTradeCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_12)
  local L1_13
  L1_13 = A0_12.playerWork
  L1_13 = L1_13.variableCommandContent
  if L1_13 == 0 then
    L1_13 = nil
    return L1_13
  end
  L1_13 = A0_12.playerWork
  L1_13 = L1_13.variableCommandContent
  return L1_13, A0_12.playerWork.variableCommandContentSub
end
L0_0.getContentCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19
  if A1_15 == nil then
    A1_15 = 1
  end
  L2_16 = A0_14.playerWork
  L2_16 = L2_16.variableCommandPlaceDriven
  L2_16 = #L2_16
  if A1_15 > L2_16 then
    L2_16 = nil
    return L2_16
  end
  L2_16 = A0_14.playerWork
  L2_16 = L2_16.variableCommandPlaceDriven
  L2_16 = L2_16[A1_15]
  if L2_16 == 0 then
    L2_16 = nil
    return L2_16
  end
  L2_16 = A0_14.playerWork
  L2_16 = L2_16.variableCommandPlaceDriven
  L2_16 = L2_16[A1_15]
  L3_17 = A0_14.playerWork
  L3_17 = L3_17.variableCommandPlaceDrivenSub
  L3_17 = L3_17[A1_15]
  L4_18 = A0_14.playerWork
  L4_18 = L4_18.variableCommandPlaceDrivenTarget
  L4_18 = L4_18[A1_15]
  L5_19 = A0_14.playerWork
  L5_19 = L5_19.variableCommandPlaceDrivenPriority
  L5_19 = L5_19[A1_15]
  return L2_16, L3_17, L4_18, L5_19
end
L0_0.getPlaceDrivenCommandVariation = L1_1
L0_0 = PlayerBaseClass
function L1_1(A0_20)
  local L1_21
  L1_21 = A0_20.playerWork
  L1_21 = L1_21.variableCommandEmoteSit
  if L1_21 == 0 then
    L1_21 = 10001
    return L1_21
  end
  L1_21 = A0_20.playerWork
  L1_21 = L1_21.variableCommandEmoteSit
  return L1_21
end
L0_0.getEmoteSitCommandVariation = L1_1
