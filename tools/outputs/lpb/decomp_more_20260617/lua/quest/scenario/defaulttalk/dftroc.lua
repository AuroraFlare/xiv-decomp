require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftRoc", "ScenarioBaseClass")
function DftRoc.initText(A0_0)
  A0_0:_loadTextDataPermanently(1470, "dftRoc")
end
function DftRoc.defaultTalkWithSidonia_001(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A4_5 == true then
    A2_3:say(A0_1, 73, 0)
  else
    A2_3:say(A0_1, 2, 0)
  end
  A2_3:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithTarokmagurok_001(A0_6, A1_7, A2_8, A3_9, A4_10)
  A2_8:startCliantTalkTurn(2, A1_7)
  if A4_10 == true then
    A2_8:say(A0_6, 74, 0)
  else
    A2_8:say(A0_6, 3, 0)
  end
  A2_8:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithDyrstweitz_001(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 4, 0)
  A2_13:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithPaul_001(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(354168832)
  A2_16:say(A0_14, 5, 0)
  A2_16:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithLiflingulin_001(A0_17, A1_18, A2_19, A3_20, A4_21)
  A2_19:startCliantTalkTurn(2, A1_18)
  if A2_19:doSalute(2, 27) == 0 then
    A2_19:_runCharaScheduler(353968128)
  end
  A0_17:_wait(1)
  if A4_21 == true then
    if A2_19:isUpperRank(2, 27) == true then
      A2_19:say(A0_17, 75, 0)
    else
      A2_19:say(A0_17, 76, 0)
    end
  elseif A2_19:isUpperRank(2, 27) == true then
    A2_19:say(A0_17, 55, 0)
    A2_19:say(A0_17, 56, 0)
  else
    A2_19:say(A0_17, 63, 0)
    A2_19:say(A0_17, 64, 0)
  end
  A2_19:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithLadislas_001(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 6, 0)
  A2_24:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithBubudoga_001(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 7, 0)
end
function DftRoc.defaultTalkWithWowotazi_001(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(354177024)
  A2_30:say(A0_28, 8, 0)
  A2_30:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithPuroro_001(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(354172928)
  A2_33:say(A0_31, 9, 0)
  A2_33:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithMhustym_001(A0_34, A1_35, A2_36, A3_37, A4_38)
  A2_36:startCliantTalkTurn(1, A1_35)
  A2_36:_runCharaScheduler(353964032)
  if A3_37 == 20 then
    A2_36:say(A0_34, 77, 0)
  else
    A2_36:say(A0_34, 10, 0)
  end
  A2_36:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithHersande_001(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(1, A1_40)
  A2_41:_runCharaScheduler(353964032)
  A2_41:say(A0_39, 11, 0)
  A2_41:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithTheophilain_001(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(1, A1_43)
  A2_44:_runCharaScheduler(353964032)
  A2_44:say(A0_42, 12, 0)
  A2_44:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithWidigast_001(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(1, A1_46)
  A2_47:_runCharaScheduler(353964032)
  A2_47:say(A0_45, 13, 0)
  A2_47:say(A0_45, 14, 0)
  A2_47:say(A0_45, 65, 0)
  A2_47:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithAmianne_001(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:_runCharaScheduler(354168832)
  A2_50:say(A0_48, 15, 0)
  A2_50:say(A0_48, 16, 0)
  A2_50:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithJanlenoux_001(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:_runCharaScheduler(354172928)
  A2_53:say(A0_51, 17, 0)
  A2_53:say(A0_51, 18, 0)
  A2_53:say(A0_51, 66, 0)
  A2_53:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithFyrloug_001(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(1, A1_55)
  A2_56:_runCharaScheduler(353964032)
  A2_56:say(A0_54, 19, 0)
  A2_56:say(A0_54, 20, 0)
  A2_56:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithPatrick_001(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(1, A1_58)
  A2_59:_runCharaScheduler(353964032)
  A2_59:say(A0_57, 21, 0)
  A2_59:say(A0_57, 22, 0)
  A2_59:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithElde_001(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:_runCharaScheduler(354177024)
  A2_62:say(A0_60, 23, 0)
  A2_62:say(A0_60, 24, 0)
  A2_62:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithOdeve_001(A0_63, A1_64, A2_65)
  A2_65:startCliantTalkTurn(1, A1_64)
  A2_65:_runCharaScheduler(353964032)
  A2_65:say(A0_63, 25, 0)
  A2_65:say(A0_63, 67, 0)
  A2_65:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithEmerissel_001(A0_66, A1_67, A2_68)
  A2_68:startCliantTalkTurn(1, A1_67)
  A2_68:_runCharaScheduler(353964032)
  A2_68:say(A0_66, 26, 0)
  A2_68:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithRawawa_001(A0_69, A1_70, A2_71)
  A2_71:startCliantTalkTurn(1, A1_70)
  A2_71:_runCharaScheduler(353964032)
  A2_71:say(A0_69, 27, 0)
  A2_71:say(A0_69, 28, 0)
  A2_71:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithErmiance_001(A0_72, A1_73, A2_74)
  A2_74:startCliantTalkTurn(2, A1_73)
  A2_74:_runCharaScheduler(354172928)
  A2_74:say(A0_72, 29, 0)
  A2_74:say(A0_72, 30, 0)
  A2_74:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithRickeman_001(A0_75, A1_76, A2_77)
  A2_77:startCliantTalkTurn(1, A1_76)
  A2_77:_runCharaScheduler(353964032)
  A2_77:say(A0_75, 31, 0)
  A2_77:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithQuenburga_001(A0_78, A1_79, A2_80)
  A2_80:startCliantTalkTurn(1, A1_79)
  A2_80:_runCharaScheduler(353964032)
  A2_80:say(A0_78, 32, 0)
  A2_80:say(A0_78, 69, 0)
  A2_80:say(A0_78, 33, 0)
  A2_80:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithGaetelle_001(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(1, A1_82)
  A2_83:_runCharaScheduler(353964032)
  A2_83:say(A0_81, 34, 0)
  A2_83:say(A0_81, 35, 0)
  A2_83:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithHubairtien_001(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:_runCharaScheduler(354172928)
  A2_86:say(A0_84, 36, 0)
  A2_86:say(A0_84, 37, 0)
  A2_86:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithArmantel_001(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(1, A1_88)
  A2_89:_runCharaScheduler(353964032)
  A2_89:say(A0_87, 38, 0)
  A2_89:say(A0_87, 72, 0)
  A2_89:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithIliette_001(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(1, A1_91)
  A2_92:_runCharaScheduler(353964032)
  A2_92:say(A0_90, 39, 0)
  A2_92:say(A0_90, 70, 0)
  A2_92:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithArscelin_001(A0_93, A1_94, A2_95)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:_runCharaScheduler(353964032)
  A2_95:say(A0_93, 42, 0)
  A2_95:say(A0_93, 68, 0)
  A2_95:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithOrtefauchel_001(A0_96, A1_97, A2_98)
  A2_98:startCliantTalkTurn(2, A1_97)
  A2_98:say(A0_96, 71, 0)
  A2_98:say(A0_96, 40, 0)
  A2_98:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithHourlinet_001(A0_99, A1_100, A2_101)
  A2_101:startCliantTalkTurn(2, A1_100)
  A2_101:say(A0_99, 41, 0)
  A2_101:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithYvelont_001(A0_102, A1_103, A2_104)
  A2_104:startCliantTalkTurn(2, A1_103)
  A2_104:say(A0_102, 43, 0)
  A2_104:say(A0_102, 44, 0)
  A2_104:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithRaenhyml_001(A0_105, A1_106, A2_107)
  A2_107:startCliantTalkTurn(2, A1_106)
  A2_107:say(A0_105, 45, 0)
  A2_107:say(A0_105, 46, 0)
  A2_107:finishCliantTalkTurn()
end
function DftRoc.defaultTalkWithLeleyo_001(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:_runCharaScheduler(354172928)
  A2_110:say(A0_108, 47, 0)
  A2_110:say(A0_108, 48, 0)
  A2_110:finishCliantTalkTurn()
end
function DftRoc.defaultTalkRoger_001(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 57, 0)
  A2_113:say(A0_111, 58, 0)
  A2_113:finishCliantTalkTurn()
end
function DftRoc.defaultTalkRoger_002(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:_runCharaScheduler(354058240)
  A2_116:say(A0_114, 79, 0)
  A2_116:finishCliantTalkTurn()
end
function DftRoc.defaultTalkJRhoomale_001(A0_117, A1_118, A2_119, A3_120)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:_runCharaScheduler(353980416)
  if A3_120 ~= 20 then
    A2_119:say(A0_117, 78, 0)
  else
    A2_119:say(A0_117, 59, 0)
  end
  A2_119:finishCliantTalkTurn()
end
function DftRoc.defaultTalkCoultenet_001(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 60, 0)
  A2_123:say(A0_121, 62, 0)
  A2_123:finishCliantTalkTurn()
end
function DftRoc.defaultTalkAlberic_001(A0_124, A1_125, A2_126)
  A2_126:startCliantTalkTurn(2, A1_125)
  A2_126:_runCharaScheduler(354082816)
  A2_126:say(A0_124, 61, 0)
  A2_126:finishCliantTalkTurn()
end
