require("/World/WorldMaster_event")
function WorldMaster.getServerTimeWithDebugOffset(A0_0)
  do break end
  do return A0_0:_getServerTime() + nil end
  return A0_0:_getServerTime()
end
function WorldMaster.calcJSTWeekAndDay(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L2_3 = 3600
  L3_4 = 9 * L2_3
  L3_4 = A1_2 + L3_4
  L4_5 = _math
  L4_5 = L4_5.floor
  L5_6 = 24 * L2_3
  L5_6 = L3_4 / L5_6
  L4_5 = L4_5(L5_6)
  L4_5 = L4_5 + 3
  L5_6 = _math
  L5_6 = L5_6.fmod
  L6_7 = L4_5
  L7_8 = 7
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = _math
  L6_7 = L6_7.floor
  L7_8 = L4_5 / 7
  L6_7 = L6_7(L7_8)
  L7_8 = L6_7
  return L7_8, L5_6
end
function WorldMaster.getJSTWeekAndDay(A0_9)
  local L1_10
  L1_10 = A0_9.getServerTimeWithDebugOffset
  L1_10 = L1_10(A0_9)
  return A0_9:calcJSTWeekAndDay(L1_10)
end
function WorldMaster.getJSTWeekPastTimes(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16
  L2_13 = A0_11
  L1_12 = A0_11.getServerTimeWithDebugOffset
  L1_12 = L1_12(L2_13)
  L2_13 = 3600
  L3_14 = 9 * L2_13
  L3_14 = L1_12 + L3_14
  L4_15 = _math
  L4_15 = L4_15.fmod
  L5_16 = L3_14
  L4_15 = L4_15(L5_16, 24 * L2_13)
  L5_16 = _math
  L5_16 = L5_16.floor
  L5_16 = L5_16(L3_14 / (24 * L2_13))
  L5_16 = L5_16 + 3
  return _math.fmod(L5_16, 7) * (24 * L2_13) + L4_15
end
function WorldMaster._onInit(A0_17)
  A0_17:_callSuperClassFunc("_onInit")
  A0_17:_loadTextDataPermanently(39, "worldMaster")
  _getStaticActor(310001)
end
function WorldMaster._onReceiveDataPacket(A0_18, A1_19, ...)
end
function WorldMaster.createCutScene(A0_21, A1_22, A2_23)
  return _createActor(nil, "CutScene", false, A1_22, A2_23)
end
