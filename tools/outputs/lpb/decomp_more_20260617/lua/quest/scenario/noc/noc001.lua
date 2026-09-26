require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Noc001", "ScenarioBaseClass")
function Noc001.initText(A0_0)
  A0_0:_loadTextDataPermanently(7648, "noc001")
end
function Noc001.pETaskBoardGuild(A0_1, A1_2, A2_3, A3_4)
  worldMaster:say(A0_1, 20, A3_4)
end
function Noc001.pETaskBoardOrder(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11, A7_12, A8_13)
  worldMaster:say(A0_5, 21, A3_8, A4_9, A5_10, A6_11, A7_12, A8_13)
end
function Noc001.pENPCAskSupplyWelcome(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19
  L5_19 = A2_16
  L4_18 = A2_16.startCliantTalkTurn
  L4_18(L5_19, 2, A1_15)
  L4_18 = 17
  L5_19 = nil
  if A3_17 == 1 then
    L4_18 = 17
    L5_19 = A2_16:doSalute(1, 33)
  elseif A3_17 == 2 then
    L4_18 = 18
    L5_19 = A2_16:doSalute(2, 33)
  elseif A3_17 == 3 then
    L4_18 = 19
    L5_19 = A2_16:doSalute(3, 33)
  end
  A2_16:say(A0_14, L4_18, 0)
end
function Noc001.pENPCAskSupply(A0_20, A1_21, A2_22, A3_23)
  local L4_24, L5_25, L6_26, L7_27
  L4_24 = 1
  L5_25 = worldMaster
  L6_26 = L5_25
  L5_25 = L5_25.askMultipleTextMacro
  L7_27 = A0_20
  L5_25 = L5_25(L6_26, L7_27, A0_20, 1, 1, 5, 0, true, true, true, true, true)
  L6_26 = type
  L7_27 = L5_25
  L6_26 = L6_26(L7_27)
  if L6_26 == "nil" then
    L5_25 = 1
    L7_27 = A2_22
    L6_26 = A2_22.finishCliantTalkTurn
    L6_26(L7_27)
    return L5_25
  end
  if L5_25 == 1 then
    L7_27 = A2_22
    L6_26 = A2_22.finishCliantTalkTurn
    L6_26(L7_27)
    return L5_25
  elseif L5_25 == 2 then
    L4_24 = 1
  elseif L5_25 == 3 then
    L4_24 = 2
  elseif L5_25 == 4 then
    return L5_25
  elseif L5_25 == 5 then
    return L5_25
  end
  L6_26 = 7
  L7_27 = 353984512
  if A3_23 == 1 then
    L6_26 = 7
    L7_27 = 353984512
  elseif A3_23 == 2 then
    L6_26 = 8
    L7_27 = 353984512
  elseif A3_23 == 3 then
    L6_26 = 9
    L7_27 = 353984512
  end
  A2_22:_runCharaScheduler(L7_27)
  A2_22:say(A0_20, L6_26, 0, L4_24)
  return L5_25
end
function Noc001.eventQuestAskExWelcome(A0_28, A1_29, A2_30, A3_31)
  local L4_32
  L4_32 = 38
  if A3_31 == 1 then
    L4_32 = 38
  elseif A3_31 == 2 then
    L4_32 = 39
  elseif A3_31 == 3 then
    L4_32 = 40
  end
  A2_30:_runCharaScheduler(353959936)
  A2_30:say(A0_28, L4_32, 0)
end
function Noc001.eventQuestAskExArea(A0_33, A1_34, A2_35, A3_36)
  local L4_37, L5_38, L6_39, L7_40
  L5_38 = A1_34
  L4_37 = A1_34._getGrandCompanyRank
  L6_39 = A3_36
  L4_37 = L4_37(L5_38, L6_39)
  L5_38 = 63
  if A3_36 == 1 then
    L5_38 = 63
  elseif A3_36 == 2 then
    L5_38 = 64
  elseif A3_36 == 3 then
    L5_38 = 65
  end
  L6_39 = 0
  while true do
    if L6_39 == 0 then
      L7_40 = worldMaster
      L7_40 = L7_40.askMultipleTextMacro
      L7_40 = L7_40(L7_40, A0_33, A0_33, 1, 41, 5, 0, true, true, true, true, true)
      if type(L7_40) == "nil" then
        L7_40 = 1
      end
      if L7_40 == 2 then
        L6_39 = 3
        break
      else
      end
      if L7_40 == 3 then
        if L4_37 < 17 then
          A2_35:_runCharaScheduler(83984384)
          A2_35:say(A0_33, L5_38, 0)
          worldMaster:say(A0_33, 66, A3_36)
          break
        end
        L6_39 = 4
        break
      else
      end
      if L7_40 == 4 then
        if L4_37 < 23 then
          A2_35:_runCharaScheduler(83984384)
          A2_35:say(A0_33, L5_38, 0)
          worldMaster:say(A0_33, 89, A3_36)
          break
        end
        L6_39 = 5
        break
      else
      end
      if L7_40 == 5 then
        L6_39 = 6
        break
      else
        if L7_40 == 1 then
        else
        end
      end
      L6_39 = 1
    end
  end
  return L6_39
end
function Noc001.pENPCAskNowTalk(A0_41, A1_42, A2_43, A3_44)
  local L4_45, L5_46
  L4_45 = 23
  L5_46 = 353976320
  if A3_44 == 1 then
    L5_46 = 353976320
    L4_45 = 22
  elseif A3_44 == 2 then
    L5_46 = 353976320
    L4_45 = 23
  elseif A3_44 == 3 then
    L5_46 = 353976320
    L4_45 = 24
  end
  A2_43:_runCharaScheduler(L5_46)
  A2_43:say(A0_41, L4_45, 0)
end
function Noc001.nowSup(A0_47, A1_48, A2_49, A3_50, A4_51, A5_52, A6_53, A7_54, A8_55, A9_56, A10_57, A11_58)
  worldMaster:say(A0_47, 16, A3_50, A4_51, A5_52, A6_53, A7_54, A8_55, A9_56, A10_57, A11_58)
end
function Noc001.nowSupAddItem(A0_59, A1_60, A2_61, A3_62, A4_63, A5_64)
  worldMaster:say(A0_59, 25, A3_62, A4_63, A5_64)
end
function Noc001.pItem(A0_65, A1_66, A2_67, A3_68, A4_69, A5_70, A6_71, A7_72, A8_73, A9_74, A10_75)
  local L11_76
  L11_76 = 1
  if A9_74 == 0 then
    L11_76 = worldMaster:askMultipleTextMacro(A2_67, A0_65, 1, 27, 4, 2, true, true, true, true, 0, 0, A3_68, A4_69, A5_70, A6_71, A7_72, A8_73)
  else
    L11_76 = worldMaster:askMultipleTextMacro(A2_67, A0_65, 1, 27, 5, 2, true, true, true, true, true, 0, 0, A3_68, A4_69, A5_70, A6_71, A7_72, A8_73, A9_74, A10_75)
  end
  if type(L11_76) == "nil" then
    L11_76 = 1
  end
  return L11_76
end
function Noc001.showSupplyLimit(A0_77, A1_78, A2_79, A3_80, A4_81, A5_82, A6_83)
  desktopWidget:showLog(worldMaster, 40, A0_77, 33, 0, 0, A3_80, A4_81, A5_82, A6_83)
end
function Noc001.eventShowPrizeMessage(A0_84, A1_85, A2_86, A3_87)
  local L4_88
  L4_88 = 13
  if A3_87 == 1 then
    L4_88 = 13
  elseif A3_87 == 2 then
    L4_88 = 14
  elseif A3_87 == 3 then
    L4_88 = 15
  end
  A2_86:_runCharaScheduler(354107392)
  A2_86:_runCharaScheduler(403087360)
  desktopWidget:showLog(A2_86, 38, A0_84, L4_88)
  A0_84:_wait(1)
end
function Noc001.pELimitErr(A0_89, A1_90, A2_91)
  desktopWidget:showLog(worldMaster, 40, A0_89, 10)
  A0_89:_wait(1)
end
function Noc001.pETradeErr(A0_92, A1_93, A2_94)
  worldMaster:say(A0_92, 11)
end
function Noc001.pETradeErrLimit(A0_95, A1_96, A2_97, A3_98, A4_99, A5_100, A6_101)
  worldMaster:say(A0_95, 33, 0, 0, A3_98, A4_99, A5_100, A6_101)
  worldMaster:say(A0_95, 11)
end
function Noc001.pESuppylMaxErrKeyWait(A0_102, A1_103, A2_104, A3_105, A4_106, A5_107, A6_108, A7_109)
  worldMaster:say(A0_102, 26)
  if A3_105 == true then
    worldMaster:say(A0_102, 67, A4_106, A5_107, A6_108, A7_109)
  end
end
function Noc001.pESuppylSealMaxErr(A0_110, A1_111, A2_112)
  worldMaster:say(A0_110, 12)
end
function Noc001.eventQuestCantEx(A0_113, A1_114, A2_115, A3_116)
  local L4_117
  L4_117 = 34
  if A3_116 == 1 then
    L4_117 = 34
  elseif A3_116 == 2 then
    L4_117 = 35
  elseif A3_116 == 3 then
    L4_117 = 36
  end
  A2_115:_runCharaScheduler(83984384)
  A2_115:say(A0_113, L4_117, 0)
  worldMaster:say(A0_113, 37, A3_116)
end
