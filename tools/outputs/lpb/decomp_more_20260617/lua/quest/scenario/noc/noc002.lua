require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Noc002", "ScenarioBaseClass")
function Noc002.initText(A0_0)
  A0_0:_loadTextDataPermanently(10128, "noc002")
end
function Noc002.processTaskBoardOrder(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6
  L5_6 = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
  itemHamletSupplySheet:_loadKeyTemporarily(A4_5, A4_5 + #L5_6 - 1)
  for _FORV_11_ = 1, #L5_6 do
    L5_6[_FORV_11_] = itemHamletSupplySheet:_getData(A4_5 + _FORV_11_ - 1, 0)
    ;({
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    })[_FORV_11_] = itemHamletSupplySheet:_getData(A4_5 + _FORV_11_ - 1, 1)
    ;({
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    })[_FORV_11_] = itemHamletSupplySheet:_getData(A4_5 + _FORV_11_ - 1, 2)
  end
  _FOR_:say(A0_1, 81, A3_4)
  worldMaster:say(A0_1, 82, L5_6[1], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[1], L5_6[2], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[2], L5_6[3], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[3])
  worldMaster:say(A0_1, 82, L5_6[4], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[4], L5_6[5], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[5], L5_6[6], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[6])
  worldMaster:say(A0_1, 82, L5_6[7], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[7], L5_6[8], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[8], L5_6[9], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[9])
  worldMaster:say(A0_1, 87, L5_6[10], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[10], L5_6[11], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[11])
end
function Noc002.processCaptainAskWhatBefore(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13)
  local L7_14, L8_15
  L8_15 = A2_9
  L7_14 = A2_9.startCliantTalkTurn
  L7_14(L8_15, 2, A1_8)
  L8_15 = A2_9
  L7_14 = A2_9.getActorClassId
  L7_14 = L7_14(L8_15)
  L8_15 = L7_14
  if L8_15 == 1500315 then
    A2_9:_runCharaScheduler(353959936)
    break
  else
  end
  if L8_15 == 1500319 then
    A2_9:_runCharaScheduler(353959936)
    break
  else
  end
  if L8_15 == 1500317 then
    A2_9:_runCharaScheduler(353959936)
    break
  else
  end
  L8_15 = L7_14
  if L8_15 == 1500315 then
    if A3_10 == false then
      A2_9:say(A0_7, 96, 0, A6_13, A2_9)
    elseif A4_11 == true then
      A2_9:say(A0_7, 113, 0)
    else
      A2_9:say(A0_7, 112, 0)
      do break end
      else
      end
      if L8_15 == 1500319 then
        if A3_10 == false then
          A2_9:say(A0_7, 1, 0, A6_13, A2_9)
        elseif A4_11 == true then
          A2_9:say(A0_7, 25, 0, A5_12)
        else
          A2_9:say(A0_7, 93, 0, A5_12)
          do break end
          else
          end
          if L8_15 == 1500317 then
            if A3_10 == false then
              A2_9:say(A0_7, 97, 0, A6_13, A2_9)
            elseif A4_11 == true then
              A2_9:say(A0_7, 115, 0)
            else
              A2_9:say(A0_7, 114, 0)
              break
            end
          else
          end
        end
    end
end
function Noc002.processCaptainAskWhat(A0_16, A1_17, A2_18, A3_19)
  local L4_20
  L4_20 = {
    3,
    4,
    5,
    7,
    8
  }
  return A2_18:askForCustomizeOption(A0_16, A3_19, false, true, 2, L4_20)
end
function Noc002.processCaptainAskWhatA01(A0_21, A1_22, A2_23, A3_24, A4_25)
  local L5_26, L6_27
  L6_27 = A2_23
  L5_26 = A2_23.getActorClassId
  L5_26 = L5_26(L6_27)
  L6_27 = L5_26
  if L6_27 == 1500315 then
    A2_23:_runCharaScheduler(353968128)
    break
  else
  end
  if L6_27 == 1500319 then
    A2_23:_runCharaScheduler(354041856)
    break
  else
  end
  if L6_27 == 1500317 then
    A2_23:_runCharaScheduler(354041856)
    break
  else
  end
  L6_27 = L5_26
  if L6_27 == 1500315 then
    A2_23:say(A0_21, 98, 0)
    A2_23:say(A0_21, 99, 0)
    break
  else
  end
  if L6_27 == 1500319 then
    A2_23:say(A0_21, 10, 0, A3_24)
    A2_23:say(A0_21, 11, 0)
    break
  else
  end
  if L6_27 == 1500317 then
    A2_23:say(A0_21, 100, 0)
    A2_23:say(A0_21, 101, 0)
    break
  else
  end
  L6_27 = desktopWidget
  L6_27 = L6_27.askEventModeWidgetYield
  L6_27(L6_27, "Ask/HamletDefenseTutorialWidget", 1, A4_25)
end
function Noc002.processCaptainAskWhatA02(A0_28, A1_29, A2_30)
  local L3_31, L4_32
  L4_32 = A2_30
  L3_31 = A2_30.getActorClassId
  L3_31 = L3_31(L4_32)
  L4_32 = L3_31
  if L4_32 == 1500315 then
    A2_30:_runCharaScheduler(353959936)
    break
  else
  end
  if L4_32 == 1500319 then
    A2_30:_runCharaScheduler(353959936)
    break
  else
  end
  if L4_32 == 1500317 then
    A2_30:_runCharaScheduler(354168832)
    break
  else
  end
  L4_32 = L3_31
  if L4_32 == 1500315 then
    A2_30:say(A0_28, 102, 0)
    A2_30:say(A0_28, 103, 0)
    break
  else
  end
  if L4_32 == 1500319 then
    A2_30:say(A0_28, 12, 0)
    A2_30:say(A0_28, 13, 0)
    break
  else
  end
  if L4_32 == 1500317 then
    A2_30:say(A0_28, 104, 0)
    A2_30:say(A0_28, 105, 0)
    break
  else
  end
  L4_32 = worldMaster
  L4_32 = L4_32.say
  L4_32(L4_32, A0_28, 14)
  L4_32 = worldMaster
  L4_32 = L4_32.say
  L4_32(L4_32, A0_28, 94)
  L4_32 = worldMaster
  L4_32 = L4_32.say
  L4_32(L4_32, A0_28, 15)
  L4_32 = worldMaster
  L4_32 = L4_32.say
  L4_32(L4_32, A0_28, 16, 15)
end
function Noc002.processCaptainAskWhatA03(A0_33, A1_34, A2_35, A3_36)
  local L4_37, L5_38
  L5_38 = A2_35
  L4_37 = A2_35.getActorClassId
  L4_37 = L4_37(L5_38)
  L5_38 = L4_37
  if L5_38 == 1500315 then
    A2_35:_runCharaScheduler(83959808)
    break
  else
  end
  if L5_38 == 1500319 then
    A2_35:_runCharaScheduler(354103296)
    break
  else
  end
  if L5_38 == 1500317 then
    A2_35:_runCharaScheduler(354103296)
    break
  else
  end
  L5_38 = L4_37
  if L5_38 == 1500315 then
    A2_35:say(A0_33, 106, 0)
    A2_35:say(A0_33, 107, 0)
    break
  else
  end
  if L5_38 == 1500319 then
    A2_35:say(A0_33, 17, 0, A3_36)
    A2_35:say(A0_33, 18, 0)
    break
  else
  end
  if L5_38 == 1500317 then
    A2_35:say(A0_33, 108, 0)
    A2_35:say(A0_33, 109, 0)
    break
  else
  end
  L5_38 = worldMaster
  L5_38 = L5_38.say
  L5_38(L5_38, A0_33, 19)
  L5_38 = worldMaster
  L5_38 = L5_38.say
  L5_38(L5_38, A0_33, 20)
  L5_38 = worldMaster
  L5_38 = L5_38.say
  L5_38(L5_38, A0_33, 88, 20)
  L5_38 = worldMaster
  L5_38 = L5_38.say
  L5_38(L5_38, A0_33, 21)
end
function Noc002.processCaptainAskWhatA04A(A0_39, A1_40, A2_41, A3_42, A4_43)
  local L5_44, L6_45
  L6_45 = A2_41
  L5_44 = A2_41.getActorClassId
  L5_44 = L5_44(L6_45)
  L6_45 = L5_44
  if L6_45 == 1500315 then
    A2_41:_runCharaScheduler(353959936)
    break
  else
  end
  if L6_45 == 1500319 then
    A2_41:_runCharaScheduler(353959936)
    break
  else
  end
  if L6_45 == 1500317 then
    A2_41:_runCharaScheduler(353959936)
    break
  else
  end
  L6_45 = L5_44
  if L6_45 == 1500315 then
    A2_41:say(A0_39, 110, 0)
    break
  else
  end
  if L6_45 == 1500319 then
    A2_41:say(A0_39, 22, 0)
    break
  else
  end
  if L6_45 == 1500317 then
    A2_41:say(A0_39, 111, 0)
    break
  else
  end
end
function Noc002.processCaptainAskWhatA04B(A0_46, A1_47, A2_48)
  local L3_49, L4_50
  L4_50 = A2_48
  L3_49 = A2_48.getActorClassId
  L3_49 = L3_49(L4_50)
  L4_50 = L3_49
  if L4_50 == 1500315 then
    A2_48:_runCharaScheduler(353959936)
    break
  else
  end
  if L4_50 == 1500319 then
    A2_48:_runCharaScheduler(353959936)
    break
  else
  end
  if L4_50 == 1500317 then
    A2_48:_runCharaScheduler(353959936)
    break
  else
  end
  L4_50 = L3_49
  if L4_50 == 1500315 then
    A2_48:say(A0_46, 116, 0)
    break
  else
  end
  if L4_50 == 1500319 then
    A2_48:say(A0_46, 91, 0)
    break
  else
  end
  if L4_50 == 1500317 then
    A2_48:say(A0_46, 119, 0)
    break
  else
  end
end
function Noc002.processCaptainAskWhatA04C(A0_51, A1_52, A2_53)
  local L3_54, L4_55
  L4_55 = A2_53
  L3_54 = A2_53.getActorClassId
  L3_54 = L3_54(L4_55)
  L4_55 = L3_54
  if L4_55 == 1500315 then
    A2_53:_runCharaScheduler(353972224)
    break
  else
  end
  if L4_55 == 1500319 then
    A2_53:_runCharaScheduler(354066432)
    break
  else
  end
  if L4_55 == 1500317 then
    A2_53:_runCharaScheduler(354066432)
    break
  else
  end
  L4_55 = L3_54
  if L4_55 == 1500315 then
    A2_53:say(A0_51, 117, 0)
    break
  else
  end
  if L4_55 == 1500319 then
    A2_53:say(A0_51, 26, 0)
    break
  else
  end
  if L4_55 == 1500317 then
    A2_53:say(A0_51, 120, 0)
    break
  else
  end
end
function Noc002.processCaptainDelItem(A0_56, A1_57, A2_58)
  local L3_59, L4_60
  L4_60 = A2_58
  L3_59 = A2_58.getActorClassId
  L3_59 = L3_59(L4_60)
  L4_60 = L3_59
  if L4_60 == 1500315 then
    A2_58:say(A0_56, 118, 0)
    break
  else
  end
  if L4_60 == 1500319 then
    A2_58:say(A0_56, 83, 0)
    break
  else
  end
  if L4_60 == 1500317 then
    A2_58:say(A0_56, 121, 0)
    break
  else
  end
end
function Noc002.processSupplyAskWhatBeforeFirst(A0_61, A1_62, A2_63, A3_64, A4_65)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:_runCharaScheduler(353980416)
  A2_63:say(A0_61, 29, 0, A4_65, A2_63)
  A2_63:say(A0_61, 30, 0, A3_64)
end
function Noc002.processSupplyAskWhatBeforeNormal(A0_66, A1_67, A2_68, A3_69, A4_70, A5_71)
  A2_68:startCliantTalkTurn(2, A1_67)
  A2_68:_runCharaScheduler(353980416)
  A2_68:say(A0_66, 85, 0, A3_69, A2_68)
  worldMaster:say(A0_66, 86, A4_70, A5_71)
end
function Noc002.processSupplyAskWhatBeforeCanNotSupplay(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:_runCharaScheduler(353959936)
  A2_74:say(A0_72, 78, 0)
end
function Noc002.processSupplyAskWhat(A0_75, A1_76, A2_77, A3_78)
  local L4_79
  L4_79 = {
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39
  }
  return A2_77:askForCustomizeOption(A0_75, A3_78, false, true, 31, L4_79)
end
function Noc002.processSupplyAskWhatNotSupply(A0_80, A1_81, A2_82, A3_83)
  local L4_84
  L4_84 = {
    34,
    35,
    36,
    37,
    38,
    39
  }
  return A2_82:askForCustomizeOption(A0_80, A3_83, false, true, 31, L4_84)
end
function Noc002.processSupplyAskWhatA01(A0_85, A1_86, A2_87)
  A2_87:_runCharaScheduler(353980416)
  A2_87:say(A0_85, 41, 0)
end
function Noc002.processSupplyAskWhatA02(A0_88, A1_89, A2_90)
  A2_90:_runCharaScheduler(353980416)
  A2_90:say(A0_88, 59, 0)
  worldMaster:say(A0_88, 60)
end
function Noc002.processSupplyAskWhatA03(A0_91, A1_92, A2_93, A3_94, A4_95)
  local L5_96
  L5_96 = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
  itemHamletSupplySheet:_loadKeyTemporarily(A4_95, A4_95 + #L5_96 - 1)
  for _FORV_11_ = 1, #L5_96 do
    L5_96[_FORV_11_] = itemHamletSupplySheet:_getData(A4_95 + _FORV_11_ - 1, 0)
    ;({
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    })[_FORV_11_] = itemHamletSupplySheet:_getData(A4_95 + _FORV_11_ - 1, 1)
    ;({
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    })[_FORV_11_] = itemHamletSupplySheet:_getData(A4_95 + _FORV_11_ - 1, 2)
  end
  A2_93:_runCharaScheduler(353959936)
  A2_93:say(A0_91, 92, 0, A3_94)
  worldMaster:say(A0_91, 82, L5_96[1], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[1], L5_96[2], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[2], L5_96[3], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[3])
  worldMaster:say(A0_91, 82, L5_96[4], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[4], L5_96[5], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[5], L5_96[6], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[6])
  worldMaster:say(A0_91, 82, L5_96[7], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[7], L5_96[8], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[8], L5_96[9], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[9])
  worldMaster:say(A0_91, 87, L5_96[10], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[10], L5_96[11], ({
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  })[11])
end
function Noc002.processSupplyAskWhatA04(A0_97, A1_98, A2_99, A3_100, A4_101, A5_102, A6_103, A7_104)
  A2_99:_runCharaScheduler(353959936)
  A2_99:say(A0_97, 62, 0)
  desktopWidget:askHamletDefenseRankingWidget(A3_100, A4_101, A5_102, A6_103, A7_104)
end
function Noc002.processSupplyAskWhatA05(A0_105, A1_106, A2_107, A3_108)
  A2_107:_runCharaScheduler(354041856)
  A2_107:say(A0_105, 64, 0, A3_108)
  A2_107:say(A0_105, 65, 0)
  A2_107:_runCharaScheduler(354103296)
  A2_107:say(A0_105, 66, 0)
  A2_107:say(A0_105, 67, 0)
  worldMaster:say(A0_105, 68)
end
function Noc002.processSupplyAskWhatA06(A0_109, A1_110, A2_111, A3_112, A4_113, A5_114)
  A2_111:_runCharaScheduler(353959936)
  A2_111:say(A0_109, 69, 0, A3_112)
  A2_111:say(A0_109, 70, 0, A3_112)
  A2_111:_runCharaScheduler(354066432)
  A2_111:say(A0_109, 71, 0)
  worldMaster:say(A0_109, 95, A4_113, A5_114)
end
function Noc002.processSupplyAskWhatA07(A0_115, A1_116, A2_117)
  A2_117:_runCharaScheduler(353959936)
  A2_117:say(A0_115, 72, 0)
  worldMaster:say(A0_115, 73)
  A2_117:_runCharaScheduler(354103296)
  A2_117:say(A0_115, 74, 0)
  worldMaster:say(A0_115, 75)
  worldMaster:say(A0_115, 76, 20)
  worldMaster:say(A0_115, 77, 20)
end
function Noc002.processSupplyNormal(A0_118, A1_119, A2_120)
  A2_120:_runCharaScheduler(353959936)
  A2_120:say(A0_118, 57, 0)
end
function Noc002.processSupplyFirst(A0_121, A1_122, A2_123)
  A2_123:_runCharaScheduler(353959936)
  A2_123:say(A0_121, 54, 0)
end
function Noc002.processTalkEnd(A0_124, A1_125, A2_126)
  A2_126:finishCliantTalkTurn()
end
function Noc002.processPointUp(A0_127, A1_128, A2_129, A3_130, A4_131, A5_132, A6_133)
  worldMaster:say(A0_127, 55, A3_130, A4_131)
end
function Noc002.processModItem(A0_134, A1_135, A2_136)
  worldMaster:say(worldMaster, 52081)
end
function Noc002.processAddAnima(A0_137, A1_138, A2_139, A3_140, A4_141)
  A1_138:_runCharaScheduler(67108920)
  worldMaster:say(worldMaster, 52084, A3_140, A4_141)
end
function Noc002.processSupplyRinkingRankIn(A0_142, A1_143, A2_144)
  worldMaster:say(worldMaster, 52090)
end
function Noc002.processSupplyInsufficientError(A0_145, A1_146, A2_147)
  worldMaster:say(worldMaster, 52078)
end
function Noc002.processSupplyInvalidError(A0_148, A1_149, A2_150)
  worldMaster:say(worldMaster, 52083)
end
function Noc002.processSupplyNotHaveError(A0_151, A1_152, A2_153)
  worldMaster:say(worldMaster, 52077)
end
function Noc002.processSupplyLifeNotMaxError(A0_154, A1_155, A2_156)
  worldMaster:say(worldMaster, 52079)
end
function Noc002.processSupplyContentStartError(A0_157, A1_158, A2_159)
  worldMaster:say(worldMaster, 52082)
end
