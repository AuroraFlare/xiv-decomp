require("/Debug/DebugBaseClass")
_defineClass("OverloadMonitor", "DebugBaseClass")
function OverloadMonitor._onInit(A0_0)
  A0_0:_callSuperClassFunc("_onInit")
  A0_0.work._save = {}
  A0_0.work._temp = {
    {"sleep", "boolean"},
    {"timer", "float"},
    {"counter", "integer32"},
    {"loopTimer", "float"},
    {"skipper", "integer32"},
    {"ranking", "integer8"}
  }
  A0_0.work.sleep = true
  A0_0.work.timer = debug:_getLowResolutionTime()
  A0_0.work.loopTimer = debug:_getLowResolutionTime()
  A0_0.work.ranking = 0
  A0_0:setLoopInterval(0.1)
  debug:_setTimeCostRankingMax(10)
end
function OverloadMonitor._onLoop(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1._callSuperClassFunc
  L2_3(L3_4, "_onLoop", A1_2)
  L2_3 = A0_1.work
  L2_3 = L2_3.sleep
  if L2_3 then
    L2_3 = debug
    L3_4 = L2_3
    L2_3 = L2_3._getAllCharacter
    L2_3 = L2_3(L3_4, "PlayerBaseClass")
    L2_3 = #L2_3
    if L2_3 == 0 then
      return
    else
      L2_3 = A0_1.work
      L2_3.sleep = false
    end
  end
  L2_3 = debug
  L3_4 = L2_3
  L2_3 = L2_3._getLowResolutionTime
  L2_3 = L2_3(L3_4)
  L3_4 = A0_1.work
  L3_4 = L3_4.timer
  L3_4 = L2_3 - L3_4
  L3_4 = L3_4 > 1
  if L3_4 then
    A0_1.work.timer = L2_3
  end
  A0_1.work.counter = A0_1.work.counter + 1
  A0_1:processLoopForLoopInterval(L3_4)
  A0_1:processLoopForTimeCostViewer(L3_4)
end
function OverloadMonitor.processLoopForLoopInterval(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11
  L2_7 = debug
  L3_8 = L2_7
  L2_7 = L2_7._getLowResolutionTime
  L2_7 = L2_7(L3_8)
  if A1_6 then
    L3_8 = ""
    L4_9 = debug
    L5_10 = L4_9
    L4_9 = L4_9._getAllCharacter
    L6_11 = "CharaBaseClass"
    L4_9 = L4_9(L5_10, L6_11)
    L4_9 = #L4_9
    L5_10 = debug
    L6_11 = L5_10
    L5_10 = L5_10._getAllCharacter
    L5_10 = L5_10(L6_11, "DirectorBaseClass")
    L5_10 = #L5_10
    L6_11 = A0_5.work
    L6_11 = L6_11.loopTimer
    L6_11 = L2_7 - L6_11
    L6_11 = L6_11 / 0.1
    if L6_11 >= 3 then
      L3_8 = L3_8 .. "\239\188\129"
    end
    if L6_11 >= 10 then
      L3_8 = L3_8 .. "\239\188\129"
    end
    debug:printDisp(A0_5:getSide(), _string.format("%4d \227\130\173\227\131\163\227\131\169  %3d \231\174\161\231\144\134  onLoop\233\129\133\229\187\182 %7.2f \229\128\141", L4_9, L5_10, L6_11) .. L3_8)
  end
  L3_8 = A0_5.work
  L3_8.loopTimer = L2_7
end
function OverloadMonitor.processLoopForTimeCostViewer(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25
  if not A1_13 then
    return
  end
  L2_14 = A0_12.work
  L2_14 = L2_14.skipper
  L2_14 = L2_14 % 2
  L2_14 = L2_14 ~= 0
  for L6_18 = 1, 5 do
    L7_19 = debug
    L8_20 = L7_19
    L7_19 = L7_19._getTimeCostRanking
    L9_21 = ""
    L10_22 = L6_18
    L10_22 = L7_19(L8_20, L9_21, L10_22)
    if L7_19 ~= nil and L7_19 ~= "Debug" and L7_19 ~= "OverloadMonitor" then
      L11_23 = L9_21 * L10_22
      L11_23 = L11_23 * 1000
      if L11_23 > 100 then
        L11_23 = A0_12.work
        L12_24 = A0_12.work
        L12_24 = L12_24.skipper
        L12_24 = L12_24 % 3
        L12_24 = 3 - L12_24
        L11_23.skipper = L12_24
        L2_14 = false
      end
      L11_23 = L9_21 * L10_22
      L11_23 = L11_23 * 1000
      if L11_23 > 50 then
        L11_23 = debug
        L12_24 = L11_23
        L11_23 = L11_23.printDisp
        L13_25 = "\232\173\166\229\145\138\239\188\154\232\178\160\232\141\183\227\129\140\233\171\152\227\129\153\227\129\142\227\129\190\227\129\153\239\188\129"
        L11_23(L12_24, L13_25, string:_format("%7.2fms (%7.2fms\195\151%4d) %s:%s", L9_21 * L10_22 * 1000, L9_21 * 1000, L10_22, L7_19, L8_20))
        break
      end
    end
  end
  if L3_15 == 0 then
    L2_14 = true
  end
  if not L2_14 then
    for L7_19 = 1, 10 do
      L8_20 = debug
      L9_21 = L8_20
      L8_20 = L8_20._getTimeCostRanking
      L10_22 = ""
      L11_23 = L7_19
      L11_23 = L8_20(L9_21, L10_22, L11_23)
      if L8_20 ~= nil and L8_20 ~= "Debug" and L8_20 ~= "OverloadMonitor" then
        L12_24 = ""
        L13_25 = ""
        if L3_15 == 1 then
          L12_24 = L12_24 .. "  (1\231\167\146\233\150\147\228\184\173)"
        end
        if L10_22 * L11_23 * 1000 >= 100 then
          L13_25 = L13_25 .. "\239\188\129"
        end
        if L10_22 * L11_23 * 1000 >= 300 then
          L13_25 = L13_25 .. "\239\188\129"
        end
        debug:printDisp("\233\171\152\232\178\160\232\141\183" .. L3_15 .. "\228\189\141", _string.format("%6.2fms%s (%6.2fms\195\151%4d) %s:%s" .. L12_24, L10_22 * L11_23 * 1000, L13_25, L10_22 * 1000, L11_23, L8_20, L9_21))
        if L3_15 >= A0_12.work.ranking then
          break
        end
      end
    end
  end
  L3_15.skipper = L4_16
end
function OverloadMonitor.getSide(A0_26)
  local L1_27
  L1_27 = "\227\130\175\227\131\169\227\130\164\227\130\162\227\131\179\227\131\136"
  return L1_27
end
