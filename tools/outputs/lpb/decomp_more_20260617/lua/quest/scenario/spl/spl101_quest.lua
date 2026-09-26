require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl101", "ScenarioBaseClass")
function Spl101.processEventEASTER_G1Start(A0_0, A1_1, A2_2)
  A2_2:startCliantTalkTurn(2, A1_1)
  A2_2:_runCharaScheduler(84054016)
  A0_0:_wait(0.5)
  A2_2:say(A0_0, 2, 0)
  A0_0:_wait(0.5)
  A2_2:_runCharaScheduler(84058112)
  A2_2:say(A0_0, 3, 0)
  A2_2:_runCharaScheduler(353972224)
  A0_0:_wait(0.5)
  A2_2:say(A0_0, 4, 0)
  A2_2:say(A0_0, 5, 0)
  if A0_0:showQuestInfomation() == 1 then
    A2_2:_runCharaScheduler(83959808)
    A0_0:_wait(0.5)
    A2_2:say(A0_0, 7, 0)
  else
    A2_2:_runCharaScheduler(84054016)
    A0_0:_wait(0.5)
    A2_2:say(A0_0, 6, 0)
  end
  A2_2:finishCliantTalkTurn()
  return (A0_0:showQuestInfomation())
end
function Spl101.processEventEASTER_G2Start(A0_3, A1_4, A2_5)
  A2_5:startCliantTalkTurn(2, A1_4)
  A2_5:_runCharaScheduler(353968128)
  A0_3:_wait(0.5)
  A2_5:say(A0_3, 26, 0)
  A2_5:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_SP2Start(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(67111907)
  A2_8:say(A0_6, 41, 0)
  A2_8:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_EGStart(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(67111907)
  A2_11:say(A0_9, 48, 0)
  A2_11:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_G_JStart(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(67111906)
  A2_14:say(A0_12, 49, 0)
  A2_14:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_EGG_POD_GStart(A0_15, A1_16, A2_17)
  worldMaster:say(A0_15, 203, 0)
end
function Spl101.processEvent000(A0_18, A1_19, A2_20, A3_21)
  A2_20:startCliantTalkTurn(2, A1_19)
  while true do
    if A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == 1 then
      A2_20:_runCharaScheduler(353959936)
      A2_20:say(A0_18, 8, 0)
      A2_20:say(A0_18, 9, 0)
      A0_18:_wait(0.5)
      A2_20:_runCharaScheduler(84058112)
      A2_20:say(A0_18, 10, 0)
    elseif A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == 2 then
      A2_20:_runCharaScheduler(353976320)
      A0_18:_wait(0.5)
      A2_20:say(A0_18, 11, 0)
      A2_20:say(A0_18, 12, 0)
      A2_20:_runCharaScheduler(353968128)
      A0_18:_wait(0.5)
      A2_20:say(A0_18, 13, 0)
    elseif A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == 3 then
      return (A2_20:askExtendWidget(A0_18, 158, 5, 1, 1))
    elseif A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == 4 then
      return (A2_20:askExtendWidget(A0_18, 158, 5, 1, 1))
    elseif A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == 5 then
      A2_20:finishCliantTalkTurn()
      return (A2_20:askExtendWidget(A0_18, 158, 5, 1, 1))
    elseif A2_20:askExtendWidget(A0_18, 158, 5, 1, 1) == -3 then
      A2_20:finishCliantTalkTurn()
      return (A2_20:askExtendWidget(A0_18, 158, 5, 1, 1))
    end
  end
  A2_20:finishCliantTalkTurn()
end
function Spl101.processEvent000_1(A0_22, A1_23, A2_24, A3_25, A4_26)
  A2_24:startCliantTalkTurn(2, A1_23)
  if A3_25 >= 3 and A4_26 == 1 then
    A2_24:_runCharaScheduler(353968128)
    A0_22:_wait(0.5)
    A2_24:say(A0_22, 39, 0)
    A2_24:say(A0_22, 40, 0)
  else
    A2_24:_runCharaScheduler(353968128)
    A0_22:_wait(0.5)
    A2_24:say(A0_22, 27, 0)
    A2_24:say(A0_22, 28, 0)
    while true do
      if A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == 1 then
        A2_24:_runCharaScheduler(353972224)
        A2_24:say(A0_22, 29, 0)
      elseif A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == 2 then
        A2_24:_runCharaScheduler(353976320)
        A2_24:say(A0_22, 30, 0)
        worldMaster:say(A0_22, 194, 0)
      elseif A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == 3 then
        A2_24:_runCharaScheduler(353968128)
        A0_22:_wait(0.5)
        A2_24:say(A0_22, 31, 0)
        A2_24:say(A0_22, 32, 0)
        A2_24:_runCharaScheduler(70815744)
        A2_24:say(A0_22, 33, 0)
      elseif A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == 4 then
        if A4_26 == 1 then
          A2_24:_runCharaScheduler(353980416)
          A2_24:say(A0_22, 34, 0)
          A2_24:say(A0_22, 35, 0)
          A2_24:_runCharaScheduler(353972224)
          A2_24:say(A0_22, 36, 0)
          A2_24:say(A0_22, 37, 0)
          A2_24:say(A0_22, 38, 0)
        elseif A4_26 == 2 then
          A2_24:_runCharaScheduler(353976320)
          A2_24:say(A0_22, 195, 0)
        end
      elseif A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == 5 then
        A2_24:finishCliantTalkTurn()
        return (A2_24:askExtendWidget(A0_22, 164, 5, 1, 1))
      elseif A2_24:askExtendWidget(A0_22, 164, 5, 1, 1) == -3 then
        A2_24:finishCliantTalkTurn()
        return (A2_24:askExtendWidget(A0_22, 164, 5, 1, 1))
      end
    end
  end
  A2_24:finishCliantTalkTurn()
end
function Spl101.processEvent000_2(A0_27, A1_28, A2_29, A3_30)
  A2_29:startCliantTalkTurn(2, A1_28)
  if A3_30 <= 3 then
    A2_29:_runCharaScheduler(67111907)
    A2_29:say(A0_27, 42, 0)
  elseif A3_30 <= 5 then
    A2_29:_runCharaScheduler(67111907)
    A2_29:say(A0_27, 43, 0)
  elseif A3_30 <= 7 then
    A2_29:_runCharaScheduler(67111907)
    A2_29:say(A0_27, 44, 0)
  elseif A3_30 <= 9 then
    A2_29:_runCharaScheduler(67111907)
    A2_29:say(A0_27, 45, 0)
  elseif A3_30 <= 100 then
    A2_29:_runCharaScheduler(67111907)
    A2_29:say(A0_27, 46, 0)
  end
  A2_29:finishCliantTalkTurn()
end
function Spl101.processEvent000_3(A0_31, A1_32, A2_33, A3_34)
  A2_33:startCliantTalkTurn(2, A1_32)
  if A3_34 == 2 then
    A2_33:_runCharaScheduler(67111906)
    A2_33:say(A0_31, 47, 0)
  else
    A2_33:_runCharaScheduler(67111906)
    A2_33:say(A0_31, 204, 0)
  end
  A2_33:finishCliantTalkTurn()
end
function Spl101.processEvent000_4(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A1_36:_runCharaScheduler(67111907)
  A2_37:say(A0_35, 48, 0)
  A2_37:finishCliantTalkTurn()
end
function Spl101.processEvent000_5(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43)
  A2_40:startCliantTalkTurn(2, A1_39)
  if A3_41 == 0 then
    A2_40:_runCharaScheduler(67111906)
    A2_40:say(A0_38, 50, 0)
    A0_38:startFadeOut(A1_39, 1)
    A0_38:_wait(1)
    A0_38:startFadeIn(A1_39, 1)
    A2_40:_runCharaScheduler(67111906)
    A2_40:say(A0_38, 51, 0)
  elseif A4_42 == 2 and A5_43 == 1 then
    A2_40:_runCharaScheduler(67111906)
    A2_40:say(A0_38, 50, 0)
    A0_38:startFadeOut(A1_39, 1)
    A0_38:_wait(1)
    A0_38:startFadeIn(A1_39, 1)
    A2_40:_runCharaScheduler(67111906)
    A2_40:say(A0_38, 51, 0)
  else
    A2_40:_runCharaScheduler(67111906)
    A2_40:say(A0_38, 52, 0)
  end
  A2_40:finishCliantTalkTurn()
end
function Spl101.processEvent000_6(A0_44, A1_45, A2_46, A3_47)
  if A3_47 == true then
    worldMaster:say(A0_44, 53, 0)
  else
    worldMaster:say(A0_44, 203, 0)
  end
end
function Spl101.processEvent003(A0_48, A1_49, A2_50, A3_51, A4_52)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:_runCharaScheduler(353980416)
  A0_48:_wait(0.5)
  A2_50:say(A0_48, 14, 0)
  if A3_51 == 0 or A4_52 == 2 then
    A2_50:_runCharaScheduler(70881280)
    A2_50:say(A0_48, 15, 0)
    worldMaster:say(A0_48, 17, 0)
    A2_50:finishCliantTalkTurn()
    return
  else
    A2_50:say(A0_48, 16, 0)
    worldMaster:say(A0_48, 17, 0)
    A2_50:finishCliantTalkTurn()
    return
  end
  A2_50:finishCliantTalkTurn()
end
function Spl101.processEvent005(A0_53, A1_54, A2_55)
  A2_55:_runCharaScheduler(84004864)
  A2_55:say(A0_53, 18, 0)
  A0_53:_wait(1.5)
end
function Spl101.processEvent005_1(A0_56, A1_57, A2_58)
  A2_58:_runCharaScheduler(83959808)
  A0_56:_wait(0.5)
  A2_58:say(A0_56, 19, 0)
  A2_58:finishCliantTalkTurn()
end
function Spl101.processEvent005_2(A0_59, A1_60, A2_61, A3_62)
  if A3_62 == true then
    A2_61:_runCharaScheduler(353972224)
    A2_61:say(A0_59, 20, 0)
  elseif A3_62 == -1 then
    A2_61:_runCharaScheduler(353976320)
    A0_59:_wait(0.5)
    A2_61:say(A0_59, 11, 0)
  end
  A2_61:finishCliantTalkTurn()
end
function Spl101.processEvent005_3(A0_63, A1_64, A2_65)
  A2_65:_runCharaScheduler(83914752)
  A0_63:_wait(0.5)
  A2_65:say(A0_63, 21, 0)
  A0_63:_wait(1)
  A2_65:_runCharaScheduler(353964032)
  A0_63:_wait(0.5)
  A2_65:say(A0_63, 22, 0)
  A0_63:_wait(0.5)
  A2_65:finishCliantTalkTurn()
end
function Spl101.processEvent005_4(A0_66, A1_67, A2_68)
  A2_68:_runCharaScheduler(354115584)
  A0_66:_wait(3)
  A2_68:say(A0_66, 23, 0)
  A2_68:say(A0_66, 24, 0)
  A2_68:_runCharaScheduler(354050048)
  A2_68:say(A0_66, 25, 0)
  A2_68:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_L1Start(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(2, A1_70)
  A2_71:_runCharaScheduler(83910656)
  A0_69:_wait(0.5)
  A2_71:say(A0_69, 54, 0)
  A2_71:say(A0_69, 55, 0)
  A2_71:_runCharaScheduler(354099200)
  A2_71:say(A0_69, 56, 0)
  A2_71:_runCharaScheduler(354082816)
  A0_69:_wait(0.5)
  A2_71:say(A0_69, 57, 0)
  A0_69:_wait(0.5)
  if A0_69:showQuestInfomation() == 1 then
    A2_71:_runCharaScheduler(83918848)
    A2_71:say(A0_69, 59, 0)
  else
    A2_71:_runCharaScheduler(83910656)
    A0_69:_wait(0.5)
    A2_71:say(A0_69, 58, 0)
  end
  A2_71:finishCliantTalkTurn()
  return (A0_69:showQuestInfomation())
end
function Spl101.processEventEASTER_L2Start(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:_runCharaScheduler(353972224)
  A2_74:say(A0_72, 78, 0)
  A0_72:_wait(0.5)
  A2_74:finishCliantTalkTurn()
end
function Spl101.processEventL_EASTER_SP2Start(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(2, A1_76)
  A2_77:_runCharaScheduler(67111907)
  A2_77:say(A0_75, 93, 0)
  A2_77:finishCliantTalkTurn()
end
function Spl101.processEventL_EASTER_EGStart(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(2, A1_79)
  A2_80:_runCharaScheduler(67111907)
  A2_80:say(A0_78, 100, 0)
  A2_80:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_L_JStart(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:_runCharaScheduler(67111906)
  A2_83:say(A0_81, 101, 0)
  A2_83:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_EGG_POD_LStart(A0_84, A1_85, A2_86)
  worldMaster:say(A0_84, 203, 0)
end
function Spl101.processEvent000_L(A0_87, A1_88, A2_89, A3_90)
  A2_89:startCliantTalkTurn(2, A1_88)
  while true do
    if A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == 1 then
      A2_89:_runCharaScheduler(353976320)
      A0_87:_wait(0.5)
      A2_89:say(A0_87, 60, 0)
      A2_89:say(A0_87, 61, 0)
      A2_89:_runCharaScheduler(353980416)
      A2_89:say(A0_87, 62, 0)
    elseif A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == 2 then
      A2_89:_runCharaScheduler(353972224)
      A2_89:say(A0_87, 63, 0)
      A2_89:say(A0_87, 64, 0)
      A2_89:say(A0_87, 65, 0)
    elseif A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == 3 then
      return (A2_89:askExtendWidget(A0_87, 158, 5, 1, 1))
    elseif A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == 4 then
      return (A2_89:askExtendWidget(A0_87, 158, 5, 1, 1))
    elseif A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == 5 then
      A2_89:finishCliantTalkTurn()
      return (A2_89:askExtendWidget(A0_87, 158, 5, 1, 1))
    elseif A2_89:askExtendWidget(A0_87, 158, 5, 1, 1) == -3 then
      A2_89:finishCliantTalkTurn()
      return (A2_89:askExtendWidget(A0_87, 158, 5, 1, 1))
    end
  end
  A2_89:finishCliantTalkTurn()
end
function Spl101.processEvent000_1_L(A0_91, A1_92, A2_93, A3_94, A4_95)
  A2_93:startCliantTalkTurn(2, A1_92)
  if A3_94 >= 3 and A4_95 == 1 then
    A2_93:_runCharaScheduler(354054144)
    A2_93:say(A0_91, 91, 0)
    A2_93:say(A0_91, 92, 0)
  else
    A2_93:_runCharaScheduler(353972224)
    A2_93:say(A0_91, 79, 0)
    A2_93:say(A0_91, 80, 0)
    while true do
      if A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == 1 then
        A2_93:_runCharaScheduler(353976320)
        A2_93:say(A0_91, 81, 0)
      elseif A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == 2 then
        A2_93:_runCharaScheduler(353968128)
        A2_93:say(A0_91, 82, 0)
        worldMaster:say(A0_91, 196, 0)
      elseif A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == 3 then
        A2_93:_runCharaScheduler(354103296)
        A2_93:say(A0_91, 83, 0)
        A2_93:say(A0_91, 84, 0)
        A2_93:_runCharaScheduler(354041856)
        A2_93:say(A0_91, 85, 0)
      elseif A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == 4 then
        if A4_95 == 1 then
          A2_93:_runCharaScheduler(70881280)
          A2_93:say(A0_91, 86, 0)
          A2_93:say(A0_91, 87, 0)
          A2_93:_runCharaScheduler(354099200)
          A2_93:say(A0_91, 88, 0)
          A2_93:say(A0_91, 89, 0)
          A2_93:say(A0_91, 90, 0)
        elseif A4_95 == 2 then
          A2_93:_runCharaScheduler(354099200)
          A2_93:say(A0_91, 197, 0)
        end
      elseif A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == 5 then
        A2_93:finishCliantTalkTurn()
        return (A2_93:askExtendWidget(A0_91, 164, 5, 1, 1))
      elseif A2_93:askExtendWidget(A0_91, 164, 5, 1, 1) == -3 then
        A2_93:finishCliantTalkTurn()
        return (A2_93:askExtendWidget(A0_91, 164, 5, 1, 1))
      end
    end
  end
  A2_93:finishCliantTalkTurn()
end
function Spl101.processEvent000_2_L(A0_96, A1_97, A2_98, A3_99)
  A2_98:startCliantTalkTurn(2, A1_97)
  if A3_99 <= 3 then
    A2_98:_runCharaScheduler(67111907)
    A2_98:say(A0_96, 94, 0)
  elseif A3_99 <= 5 then
    A2_98:_runCharaScheduler(67111907)
    A2_98:say(A0_96, 95, 0)
  elseif A3_99 <= 7 then
    A2_98:_runCharaScheduler(67111907)
    A2_98:say(A0_96, 96, 0)
  elseif A3_99 <= 9 then
    A2_98:_runCharaScheduler(67111907)
    A2_98:say(A0_96, 97, 0)
  elseif A3_99 <= 100 then
    A2_98:_runCharaScheduler(67111907)
    A2_98:say(A0_96, 98, 0)
  end
  A2_98:finishCliantTalkTurn()
end
function Spl101.processEvent000_4_L(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A1_101:_runCharaScheduler(67111907)
  A2_102:say(A0_100, 100, 0)
  A2_102:finishCliantTalkTurn()
end
function Spl101.processEvent000_5_L(A0_103, A1_104, A2_105, A3_106, A4_107, A5_108)
  A2_105:startCliantTalkTurn(2, A1_104)
  if A3_106 == 0 then
    A2_105:_runCharaScheduler(67111906)
    A2_105:say(A0_103, 102, 0)
    A0_103:startFadeOut(A1_104, 1)
    A0_103:_wait(1)
    A0_103:startFadeIn(A1_104, 1)
    A2_105:_runCharaScheduler(67111906)
    A2_105:say(A0_103, 103, 0)
  elseif A4_107 == 2 and A5_108 == 1 then
    A2_105:_runCharaScheduler(67111906)
    A2_105:say(A0_103, 102, 0)
    A0_103:startFadeOut(A1_104, 1)
    A0_103:_wait(1)
    A0_103:startFadeIn(A1_104, 1)
    A2_105:_runCharaScheduler(67111906)
    A2_105:say(A0_103, 103, 0)
  else
    A2_105:_runCharaScheduler(67111906)
    A2_105:say(A0_103, 104, 0)
  end
  A2_105:finishCliantTalkTurn()
end
function Spl101.processEvent000_6_L(A0_109, A1_110, A2_111, A3_112)
  if A3_112 == true then
    worldMaster:say(A0_109, 105, 0)
  else
    worldMaster:say(A0_109, 203, 0)
  end
end
function Spl101.processEvent003_L(A0_113, A1_114, A2_115, A3_116, A4_117)
  A2_115:startCliantTalkTurn(2, A1_114)
  A2_115:_runCharaScheduler(353980416)
  A2_115:say(A0_113, 66, 0)
  if A3_116 == 0 or A4_117 == 2 then
    A2_115:say(A0_113, 67, 0)
    worldMaster:say(A0_113, 69, 0)
    A2_115:finishCliantTalkTurn()
    return
  else
    A2_115:_runCharaScheduler(354041856)
    A2_115:say(A0_113, 68, 0)
    worldMaster:say(A0_113, 69, 0)
    A2_115:finishCliantTalkTurn()
    return
  end
  A2_115:finishCliantTalkTurn()
end
function Spl101.processEvent005_L(A0_118, A1_119, A2_120)
  A2_120:_runCharaScheduler(84054016)
  A2_120:say(A0_118, 70, 0)
  A0_118:_wait(1.5)
end
function Spl101.processEvent005_1_L(A0_121, A1_122, A2_123)
  A2_123:_runCharaScheduler(354099200)
  A2_123:say(A0_121, 71, 0)
  A2_123:finishCliantTalkTurn()
end
function Spl101.processEvent005_2_L(A0_124, A1_125, A2_126, A3_127)
  if A3_127 == true then
    A2_126:_runCharaScheduler(353964032)
    A2_126:say(A0_124, 72, 0)
  elseif A3_127 == -1 then
    A2_126:_runCharaScheduler(353972224)
    A2_126:say(A0_124, 63, 0)
  end
  A2_126:finishCliantTalkTurn()
end
function Spl101.processEvent005_3_L(A0_128, A1_129, A2_130)
  A2_130:_runCharaScheduler(84062208)
  A0_128:_wait(0.5)
  A2_130:say(A0_128, 73, 0)
  A0_128:_wait(0.5)
  A2_130:_runCharaScheduler(83968000)
  A2_130:say(A0_128, 74, 0)
  A2_130:finishCliantTalkTurn()
end
function Spl101.processEvent005_4_L(A0_131, A1_132, A2_133)
  A2_133:_runCharaScheduler(354115584)
  A0_131:_wait(4)
  A2_133:say(A0_131, 75, 0)
  A2_133:say(A0_131, 76, 0)
  A2_133:_runCharaScheduler(354000896)
  A2_133:say(A0_131, 77, 0)
  A2_133:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_U1Start(A0_134, A1_135, A2_136)
  A2_136:startCliantTalkTurn(2, A1_135)
  A2_136:_runCharaScheduler(83931136)
  A2_136:say(A0_134, 106, 0)
  A2_136:say(A0_134, 107, 0)
  A2_136:say(A0_134, 108, 0)
  A2_136:say(A0_134, 109, 0)
  if A0_134:showQuestInfomation() == 1 then
    A2_136:say(A0_134, 111, 0)
  else
    A2_136:_runCharaScheduler(83931136)
    A2_136:say(A0_134, 110, 0)
  end
  A2_136:finishCliantTalkTurn()
  return (A0_134:showQuestInfomation())
end
function Spl101.processEventEASTER_U2Start(A0_137, A1_138, A2_139)
  A2_139:startCliantTalkTurn(2, A1_138)
  A2_139:_runCharaScheduler(70795264)
  A2_139:say(A0_137, 130, 0)
  A2_139:finishCliantTalkTurn()
end
function Spl101.processEventU_EASTER_SP2Start(A0_140, A1_141, A2_142)
  A2_142:startCliantTalkTurn(2, A1_141)
  A2_142:_runCharaScheduler(67111907)
  A2_142:say(A0_140, 145, 0)
  A2_142:finishCliantTalkTurn()
end
function Spl101.processEventU_EASTER_EGStart(A0_143, A1_144, A2_145)
  A2_145:startCliantTalkTurn(2, A1_144)
  A2_145:_runCharaScheduler(67111907)
  A2_145:say(A0_143, 152, 0)
  A2_145:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_U_JStart(A0_146, A1_147, A2_148)
  A2_148:startCliantTalkTurn(2, A1_147)
  A2_148:_runCharaScheduler(67111906)
  A2_148:say(A0_146, 153, 0)
  A2_148:finishCliantTalkTurn()
end
function Spl101.processEventEASTER_EGG_POD_UStart(A0_149, A1_150, A2_151)
  worldMaster:say(A0_149, 203, 0)
end
function Spl101.processEvent000_U(A0_152, A1_153, A2_154, A3_155)
  A2_154:startCliantTalkTurn(2, A1_153)
  while true do
    if A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == 1 then
      A2_154:_runCharaScheduler(84054016)
      A2_154:say(A0_152, 112, 0)
      A2_154:say(A0_152, 113, 0)
      A2_154:_runCharaScheduler(354103296)
      A2_154:say(A0_152, 114, 0)
    elseif A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == 2 then
      A2_154:_runCharaScheduler(83910656)
      A2_154:say(A0_152, 115, 0)
      A2_154:say(A0_152, 116, 0)
      A2_154:_runCharaScheduler(354103296)
      A2_154:say(A0_152, 117, 0)
    elseif A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == 3 then
      return (A2_154:askExtendWidget(A0_152, 158, 5, 1, 1))
    elseif A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == 4 then
      return (A2_154:askExtendWidget(A0_152, 158, 5, 1, 1))
    elseif A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == 5 then
      A2_154:finishCliantTalkTurn()
      return (A2_154:askExtendWidget(A0_152, 158, 5, 1, 1))
    elseif A2_154:askExtendWidget(A0_152, 158, 5, 1, 1) == -3 then
      A2_154:finishCliantTalkTurn()
      return (A2_154:askExtendWidget(A0_152, 158, 5, 1, 1))
    end
  end
  A2_154:finishCliantTalkTurn()
end
function Spl101.processEvent000_1_U(A0_156, A1_157, A2_158, A3_159, A4_160)
  A2_158:startCliantTalkTurn(2, A1_157)
  if A3_159 >= 3 and A4_160 == 1 then
    A2_158:_runCharaScheduler(70795264)
    A2_158:say(A0_156, 143, 0)
    A2_158:_runCharaScheduler(353959936)
    A2_158:say(A0_156, 144, 0)
  else
    A2_158:_runCharaScheduler(70795264)
    A2_158:say(A0_156, 131, 0)
    A2_158:_runCharaScheduler(70881280)
    A2_158:say(A0_156, 132, 0)
    while true do
      if A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == 1 then
        A2_158:_runCharaScheduler(353964032)
        A2_158:say(A0_156, 133, 0)
      elseif A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == 2 then
        A2_158:_runCharaScheduler(70799360)
        A2_158:say(A0_156, 134, 0)
        worldMaster:say(A0_156, 198, 0)
      elseif A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == 3 then
        A2_158:_runCharaScheduler(353959936)
        A2_158:say(A0_156, 135, 0)
        A2_158:say(A0_156, 136, 0)
        A2_158:_runCharaScheduler(353984512)
        A2_158:say(A0_156, 137, 0)
      elseif A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == 4 then
        if A4_160 == 1 then
          A2_158:_runCharaScheduler(353984512)
          A2_158:say(A0_156, 138, 0)
          A2_158:say(A0_156, 139, 0)
          A2_158:say(A0_156, 140, 0)
          A2_158:_runCharaScheduler(70881280)
          A2_158:say(A0_156, 141, 0)
          A2_158:_runCharaScheduler(70795264)
          A2_158:say(A0_156, 142, 0)
        elseif A4_160 == 2 then
          A2_158:_runCharaScheduler(353959936)
          A2_158:say(A0_156, 199, 0)
        end
      elseif A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == 5 then
        A2_158:finishCliantTalkTurn()
        return (A2_158:askExtendWidget(A0_156, 164, 5, 1, 1))
      elseif A2_158:askExtendWidget(A0_156, 164, 5, 1, 1) == -3 then
        A2_158:finishCliantTalkTurn()
        return (A2_158:askExtendWidget(A0_156, 164, 5, 1, 1))
      end
    end
  end
  A2_158:finishCliantTalkTurn()
end
function Spl101.processEvent000_2_U(A0_161, A1_162, A2_163, A3_164)
  A2_163:startCliantTalkTurn(2, A1_162)
  if A3_164 <= 3 then
    A2_163:_runCharaScheduler(67111907)
    A2_163:say(A0_161, 146, 0)
  elseif A3_164 <= 5 then
    A2_163:_runCharaScheduler(67111907)
    A2_163:say(A0_161, 147, 0)
  elseif A3_164 <= 7 then
    A2_163:_runCharaScheduler(67111907)
    A2_163:say(A0_161, 148, 0)
  elseif A3_164 <= 9 then
    A2_163:_runCharaScheduler(67111907)
    A2_163:say(A0_161, 149, 0)
  elseif A3_164 <= 100 then
    A2_163:_runCharaScheduler(67111907)
    A2_163:say(A0_161, 150, 0)
  end
  A2_163:finishCliantTalkTurn()
end
function Spl101.processEvent000_4_U(A0_165, A1_166, A2_167)
  A2_167:startCliantTalkTurn(2, A1_166)
  A1_166:_runCharaScheduler(67111907)
  A2_167:say(A0_165, 152, 0)
  A2_167:finishCliantTalkTurn()
end
function Spl101.processEvent000_5_U(A0_168, A1_169, A2_170, A3_171, A4_172, A5_173)
  A2_170:startCliantTalkTurn(2, A1_169)
  if A3_171 == 0 then
    A2_170:_runCharaScheduler(67111906)
    A2_170:say(A0_168, 154, 0)
    A0_168:startFadeOut(A1_169, 1)
    A0_168:_wait(1)
    A0_168:startFadeIn(A1_169, 1)
    A2_170:_runCharaScheduler(67111906)
    A2_170:say(A0_168, 155, 0)
  elseif A4_172 == 2 and A5_173 == 1 then
    A2_170:_runCharaScheduler(67111906)
    A2_170:say(A0_168, 154, 0)
    A0_168:startFadeOut(A1_169, 1)
    A0_168:_wait(1)
    A0_168:startFadeIn(A1_169, 1)
    A2_170:_runCharaScheduler(67111906)
    A2_170:say(A0_168, 155, 0)
  else
    A2_170:_runCharaScheduler(67111906)
    A2_170:say(A0_168, 156, 0)
  end
  A2_170:finishCliantTalkTurn()
end
function Spl101.processEvent000_6_U(A0_174, A1_175, A2_176, A3_177)
  if A3_177 == true then
    worldMaster:say(A0_174, 157, 0)
  else
    worldMaster:say(A0_174, 203, 0)
  end
end
function Spl101.processEvent003_U(A0_178, A1_179, A2_180, A3_181, A4_182)
  A2_180:startCliantTalkTurn(2, A1_179)
  A2_180:_runCharaScheduler(354045952)
  A2_180:say(A0_178, 118, 0)
  if A3_181 == 0 or A4_182 == 2 then
    A2_180:say(A0_178, 119, 0)
    worldMaster:say(A0_178, 121, 0)
    A2_180:finishCliantTalkTurn()
    return
  else
    A2_180:say(A0_178, 120, 0)
    worldMaster:say(A0_178, 17, 0)
    A2_180:finishCliantTalkTurn()
    return
  end
  A2_180:finishCliantTalkTurn()
end
function Spl101.processEvent005_U(A0_183, A1_184, A2_185)
  A2_185:_runCharaScheduler(84004864)
  A2_185:say(A0_183, 122, 0)
  A0_183:_wait(1.5)
end
function Spl101.processEvent005_1_U(A0_186, A1_187, A2_188)
  A2_188:_runCharaScheduler(353972224)
  A2_188:say(A0_186, 123, 0)
  A2_188:finishCliantTalkTurn()
end
function Spl101.processEvent005_2_U(A0_189, A1_190, A2_191, A3_192)
  if A3_192 == true then
    A2_191:_runCharaScheduler(353976320)
    A2_191:say(A0_189, 124, 0)
  elseif A3_192 == -1 then
    A2_191:_runCharaScheduler(83910656)
    A2_191:say(A0_189, 115, 0)
  end
  A2_191:finishCliantTalkTurn()
end
function Spl101.processEvent005_3_U(A0_193, A1_194, A2_195)
  A2_195:_runCharaScheduler(354000896)
  A0_193:_wait(0.5)
  A2_195:say(A0_193, 125, 0)
  A2_195:_runCharaScheduler(353959936)
  A2_195:say(A0_193, 126, 0)
  A2_195:finishCliantTalkTurn()
end
function Spl101.processEvent005_4_U(A0_196, A1_197, A2_198)
  A2_198:_runCharaScheduler(354115584)
  A0_196:_wait(4)
  A2_198:_runCharaScheduler(70881280)
  A2_198:say(A0_196, 127, 0)
  A2_198:say(A0_196, 128, 0)
  A2_198:_runCharaScheduler(354103296)
  A2_198:say(A0_196, 129, 0)
  A2_198:finishCliantTalkTurn()
end
function Spl101.processEvent005_S(A0_199, A1_200, A2_201)
  worldMaster:say(A0_199, 200, 0)
  A2_201:finishCliantTalkTurn()
end
