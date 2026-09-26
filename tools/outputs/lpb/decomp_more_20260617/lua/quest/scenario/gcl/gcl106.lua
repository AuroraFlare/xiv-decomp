require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcl106", "ScenarioBaseClass")
function Gcl106.initText(A0_0)
  A0_0:_loadTextDataPermanently(10352, "gcl106")
end
function Gcl106.processEvent_LimsaHint_Guincum_01(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(1, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 208, 0)
  A2_3:say(A0_1, 209, 0)
  A2_3:say(A0_1, 210, 0)
  A2_3:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaHint_Fulke_01(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(2, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 211, 0)
  A2_6:say(A0_4, 212, 0)
  A2_6:say(A0_4, 213, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahHint_Aubray_01(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(3, 33) == 0 then
    A2_9:_runCharaScheduler(353959936)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 214, 0)
  A2_9:say(A0_7, 215, 0)
  A2_9:say(A0_7, 216, 0)
  A2_9:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonStart_Jakys_01(A0_10, A1_11, A2_12, A3_13)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A2_12:doSalute(3, 45) == 0 then
    A2_12:_runCharaScheduler(354066432)
  end
  A0_10:_wait(1)
  A2_12:say(A0_10, 134, 0)
  A2_12:say(A0_10, 135, 0)
  A2_12:say(A0_10, 136, 0)
  A2_12:say(A0_10, 137, 0)
  A2_12:_runCharaScheduler(354066432)
  A2_12:say(A0_10, 138, 0)
  A0_10:_wait(0.5)
  desktopWidget:openEventModeWidgetYield("CastrumNovumMapWidget")
  A0_10:_wait(1)
  A2_12:say(A0_10, 139, 0)
  A2_12:say(A0_10, 140, 0)
  A2_12:say(A0_10, 141, 0)
  A2_12:say(A0_10, 142, 0)
  A0_10:_wait(0.5)
  desktopWidget:closeEventModeWidget("CastrumNovumMapWidget")
  A0_10:_wait(1)
  A2_12:_runCharaScheduler(354082816)
  A2_12:say(A0_10, 143, 0, A3_13)
  A2_12:say(A0_10, 144, 0)
  A2_12:say(A0_10, 145, 0)
  A2_12:_runCharaScheduler(354103296)
  A2_12:say(A0_10, 204, 0)
  if A0_10:showQuestInfomation() == 1 then
    A2_12:say(A0_10, 147, 0)
  else
    A2_12:say(A0_10, 146, 0)
  end
  A2_12:finishCliantTalkTurn()
  return (A0_10:showQuestInfomation())
end
function Gcl106.processEvent_CommonFollow_Jakys_01(A0_14, A1_15, A2_16, A3_17)
  A2_16:startCliantTalkTurn(2, A1_15)
  if A2_16:doSalute(3, 45) == 0 then
    A2_16:_runCharaScheduler(354066432)
  end
  A0_14:_wait(1)
  A2_16:say(A0_14, 148, 0)
  A2_16:say(A0_14, 149, 0)
  A2_16:say(A0_14, 150, 0)
  if A2_16:ask(A0_14, 151, 2) == 1 then
    desktopWidget:openEventModeWidgetYield("CastrumNovumMapWidget")
    A2_16:say(A0_14, 139, 0)
    A2_16:_runCharaScheduler(354103296)
    A2_16:say(A0_14, 140, 0)
    A2_16:say(A0_14, 141, 0)
    A2_16:say(A0_14, 142, 0)
    desktopWidget:closeEventModeWidget("CastrumNovumMapWidget")
    A2_16:say(A0_14, 154, 0, A3_17)
  else
  end
  A2_16:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonInfo_Vevina_01(A0_18, A1_19, A2_20, A3_21, A4_22)
  A2_20:startCliantTalkTurn(2, A1_19)
  if A2_20:doSalute(2, 33) == 0 then
    A2_20:_runCharaScheduler(353959936)
  end
  A0_18:_wait(1)
  if A3_21 == 2 then
    A2_20:say(A0_18, 81, 0)
  else
    A2_20:say(A0_18, 82, 0)
  end
  A2_20:say(A0_18, 205, 0)
  A2_20:say(A0_18, 83, 0)
  worldMaster:say(A0_18, 84, A4_22)
  worldMaster:say(A0_18, 85, A4_22)
  A2_20:say(A0_18, 86, 0)
  worldMaster:say(A0_18, 87, A4_22)
  A2_20:say(A0_18, 88, 0)
  A2_20:say(A0_18, 206, 0)
  worldMaster:say(A0_18, 89, A4_22)
  worldMaster:say(A0_18, 90, A4_22)
  A2_20:say(A0_18, 91, 0)
  worldMaster:say(A0_18, 92, A4_22)
  A2_20:say(A0_18, 93, 0)
  A2_20:say(A0_18, 94, 0)
  A2_20:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonNavi_Rashaht_01(A0_23, A1_24, A2_25, A3_26)
  A2_25:startCliantTalkTurn(2, A1_24)
  if A3_26 == 1 then
    A0_23:_wait(1)
    A2_25:say(A0_23, 2, 0)
    A2_25:say(A0_23, 3, 0)
    A2_25:say(A0_23, 4, 0)
  else
    A2_25:say(A0_23, 5, 0)
    A2_25:_runCharaScheduler(354103296)
    A2_25:say(A0_23, 6, 0, A3_26)
  end
  A2_25:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonNavi_Quinquerol_01(A0_27, A1_28, A2_29, A3_30)
  A2_29:startCliantTalkTurn(2, A1_28)
  if A3_30 == 2 then
    A0_27:_wait(1)
    A2_29:say(A0_27, 95, 0)
    A2_29:say(A0_27, 96, 0)
    A2_29:say(A0_27, 97, 0)
    A2_29:say(A0_27, 98, 0)
  else
    A2_29:_runCharaScheduler(353972224)
    A2_29:say(A0_27, 99, 0)
    A2_29:say(A0_27, 100, 0, A3_30)
  end
  A2_29:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonNavi_Jakys_01(A0_31, A1_32, A2_33, A3_34)
  A2_33:startCliantTalkTurn(2, A1_32)
  if A3_34 == 3 then
    A0_31:_wait(1)
    A2_33:say(A0_31, 155, 0)
    A2_33:say(A0_31, 156, 0)
    A2_33:say(A0_31, 157, 0)
    A2_33:say(A0_31, 158, 0)
  else
    A2_33:_runCharaScheduler(354082816)
    A2_33:say(A0_31, 159, 0)
    A2_33:say(A0_31, 160, 0, A3_34)
  end
  A2_33:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaWarp_Zanthael_01(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 7, 0)
  if A2_37:ask(A0_35, 8, 2) == 1 then
    A0_35:startFadeOutCutSceneDefault(A1_36)
    A0_35:startNQCutScene("elv0l110", 1, 0)
    A0_35:startFadeInCutSceneAfterWarp(A1_36)
  else
    A2_37:say(A0_35, 11, 0)
  end
  A2_37:finishCliantTalkTurn()
  return (A2_37:ask(A0_35, 8, 2))
end
function Gcl106.processEvent_GridaniaWarp_Kinnison_01(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 194, 0)
  if A2_40:ask(A0_38, 195, 2) == 1 then
  else
    A2_40:say(A0_38, 198, 0)
  end
  A2_40:finishCliantTalkTurn()
  return (A2_40:ask(A0_38, 195, 2))
end
function Gcl106.processEvent_UldahWarp_Mumutano_01(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 199, 0)
  if A2_43:ask(A0_41, 200, 2) == 1 then
  else
    A2_43:say(A0_41, 203, 0)
  end
  A2_43:finishCliantTalkTurn()
  return (A2_43:ask(A0_41, 200, 2))
end
function Gcl106.processEvent_CommonInstance_Cid_01(A0_44, A1_45, A2_46, A3_47, A4_48)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 37, 0)
  A0_44:startFadeOut(A1_45, 1)
  A0_44:_wait(1)
  A0_44:startFadeIn(A1_45, 1)
  if A4_48 == 3 then
    A2_46:_runCharaScheduler(365137920)
  else
    A2_46:_runCharaScheduler(365260800)
  end
  A2_46:say(A0_44, 38, 0)
  A2_46:say(A0_44, 39, 0)
  A2_46:say(A0_44, 40, 0)
  A2_46:say(A0_44, 41, 0)
  A2_46:say(A0_44, 42, 0)
  A2_46:say(A0_44, 62, 0)
  if A4_48 == 3 then
    A2_46:_runCharaScheduler(365133824)
  else
    A2_46:_runCharaScheduler(80052224)
  end
  A2_46:say(A0_44, 63, 0)
  A2_46:say(A0_44, 64, 0)
  A2_46:say(A0_44, 66, 0)
  if A4_48 == 3 then
    A2_46:_runCharaScheduler(79986688)
  else
    A2_46:_runCharaScheduler(365260800)
  end
  if A3_47 == 1 then
    A2_46:say(A0_44, 69, 0, A4_48)
    A2_46:say(A0_44, 70, 0)
  else
    A2_46:say(A0_44, 67, 0, A4_48)
    A2_46:say(A0_44, 68, 0)
  end
  A2_46:finishCliantTalkTurn()
end
function Gcl106.processEvent_CommonInstance_Cid_02(A0_49, A1_50, A2_51, A3_52)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 71, 0)
  if A3_52 == 3 then
    A2_51:_runCharaScheduler(365137920)
  else
    A2_51:_runCharaScheduler(80052224)
  end
  A2_51:say(A0_49, 72, 0)
  A2_51:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Merlwyb_01(A0_53, A1_54, A2_55, A3_56)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:say(A0_53, 17, 0)
  A0_53:startFadeOut(A1_54, 1)
  A2_55:_runCharaScheduler(365105152)
  A0_53:_wait(1)
  A0_53:startFadeIn(A1_54, 1)
  A2_55:say(A0_53, 18, 0)
  A2_55:say(A0_53, 19, 0)
  A2_55:say(A0_53, 20, 0)
  A2_55:say(A0_53, 21, 0)
  A2_55:say(A0_53, 22, 0)
  A2_55:say(A0_53, 23, 0)
  A2_55:_runCharaScheduler(365101056)
  A2_55:say(A0_53, 24, 0)
  if A3_56 == 1 then
    A2_55:say(A0_53, 27, 0)
    A2_55:say(A0_53, 28, 0)
    A2_55:say(A0_53, 29, 0)
  else
    A2_55:say(A0_53, 25, 0)
    A2_55:say(A0_53, 26, 0)
  end
  A2_55:_runCharaScheduler(365105152)
  A2_55:say(A0_53, 30, 0)
  A2_55:say(A0_53, 31, 0)
  A2_55:say(A0_53, 32, 0)
  A2_55:say(A0_53, 33, 0)
  A2_55:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Merlwyb_02(A0_57, A1_58, A2_59, A3_60)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:say(A0_57, 34, 0)
  A2_59:_runCharaScheduler(365101056)
  A2_59:say(A0_57, 35, 0)
  if A3_60 == 1 then
    A2_59:say(A0_57, 36, 0)
  end
  A2_59:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Reyner_01(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 14, 0)
  A2_63:say(A0_61, 15, 0)
  A2_63:say(A0_61, 16, 0)
  A2_63:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Reyner_02(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 73, 0)
  A2_66:say(A0_64, 74, 0)
  A2_66:say(A0_64, 75, 0)
  A2_66:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Eynzahr_01(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A0_67:_wait(1)
  A2_69:say(A0_67, 12, 0)
  A2_69:say(A0_67, 13, 0)
  A2_69:finishCliantTalkTurn()
end
function Gcl106.processEvent_LimsaInstance_Eynzahr_02(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A0_70:_wait(1)
  A2_72:say(A0_70, 76, 0)
  A2_72:say(A0_70, 77, 0)
  A2_72:say(A0_70, 78, 0)
  A2_72:say(A0_70, 79, 0)
  A2_72:_runCharaScheduler(354107392)
  A0_70:_wait(2.5)
  A2_72:say(A0_70, 80, 0)
  A2_72:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Shinkan_01(A0_73, A1_74, A2_75, A3_76)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:say(A0_73, 106, 0)
  A0_73:startFadeOut(A1_74, 1)
  A2_75:_runCharaScheduler(79503360)
  A0_73:_wait(1)
  A0_73:startFadeIn(A1_74, 1)
  A2_75:say(A0_73, 107, 0)
  A2_75:say(A0_73, 108, 0)
  A2_75:say(A0_73, 109, 0)
  A2_75:_runCharaScheduler(79482880)
  A2_75:say(A0_73, 110, 0)
  A2_75:say(A0_73, 112, 0)
  A2_75:say(A0_73, 113, 0)
  A2_75:_runCharaScheduler(79486976)
  if A3_76 == 1 then
    A2_75:say(A0_73, 116, 0)
    A2_75:say(A0_73, 117, 0)
    A2_75:say(A0_73, 118, 0)
  else
    A2_75:say(A0_73, 114, 0)
    A2_75:say(A0_73, 115, 0)
  end
  A2_75:say(A0_73, 119, 0)
  A2_75:_runCharaScheduler(79503360)
  A2_75:say(A0_73, 120, 0)
  A2_75:say(A0_73, 121, 0)
  A2_75:say(A0_73, 122, 0)
  A2_75:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Shinkan_02(A0_77, A1_78, A2_79, A3_80)
  A2_79:startCliantTalkTurn(2, A1_78)
  A2_79:say(A0_77, 123, 0)
  A2_79:say(A0_77, 124, 0)
  if A3_80 == 1 then
    A2_79:_runCharaScheduler(364691456)
    A2_79:say(A0_77, 125, 0)
  end
  A2_79:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Pesi_01(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(1, A1_82)
  A2_83:say(A0_81, 103, 0)
  A2_83:say(A0_81, 104, 0)
  A2_83:_runCharaScheduler(354099200)
  A2_83:say(A0_81, 105, 0)
  A2_83:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Pesi_02(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(1, A1_85)
  A2_86:_runCharaScheduler(353959936)
  A2_86:say(A0_84, 126, 0)
  A2_86:say(A0_84, 127, 0)
  A2_86:_runCharaScheduler(353964032)
  A2_86:say(A0_84, 128, 0)
  A2_86:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Swethryk_01(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A0_87:_wait(1)
  A2_89:say(A0_87, 101, 0)
  A2_89:say(A0_87, 102, 0)
  A2_89:finishCliantTalkTurn()
end
function Gcl106.processEvent_GridaniaInstance_Swethryk_02(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A0_90:_wait(1)
  A2_92:say(A0_90, 129, 0)
  A2_92:say(A0_90, 130, 0)
  A2_92:startCliantTalkTurn(1, A1_91)
  A0_90:_wait(1)
  A2_92:say(A0_90, 131, 0)
  A2_92:say(A0_90, 132, 0)
  A2_92:_runCharaScheduler(354107392)
  A0_90:_wait(2.5)
  A2_92:say(A0_90, 133, 0)
  A2_92:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Raubahn_01(A0_93, A1_94, A2_95, A3_96)
  A2_95:startCliantTalkTurn(1, A1_94)
  A2_95:say(A0_93, 166, 0)
  A0_93:startFadeOut(A1_94, 1)
  A2_95:_runCharaScheduler(354082816)
  A0_93:_wait(1)
  A0_93:startFadeIn(A1_94, 1)
  A2_95:say(A0_93, 167, 0)
  A2_95:say(A0_93, 168, 0)
  A2_95:say(A0_93, 169, 0)
  A2_95:_runCharaScheduler(353959936)
  A2_95:say(A0_93, 170, 0)
  A2_95:say(A0_93, 171, 0)
  A2_95:say(A0_93, 172, 0)
  A2_95:say(A0_93, 173, 0)
  A2_95:_runCharaScheduler(353968128)
  if A3_96 == 1 then
    A2_95:say(A0_93, 176, 0)
    A2_95:say(A0_93, 177, 0)
    A2_95:say(A0_93, 178, 0)
  else
    A2_95:say(A0_93, 174, 0)
    A2_95:say(A0_93, 175, 0)
  end
  A2_95:say(A0_93, 179, 0)
  A2_95:say(A0_93, 180, 0)
  A2_95:_runCharaScheduler(354103296)
  A2_95:say(A0_93, 181, 0)
  A2_95:say(A0_93, 182, 0)
  A2_95:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Raubahn_02(A0_97, A1_98, A2_99, A3_100)
  A2_99:startCliantTalkTurn(1, A1_98)
  A2_99:_runCharaScheduler(354082816)
  A2_99:say(A0_97, 183, 0)
  A2_99:say(A0_97, 184, 0)
  if A3_100 == 1 then
    A2_99:say(A0_97, 185, 0)
  end
  A2_99:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Teledji_01(A0_101, A1_102, A2_103)
  A2_103:startCliantTalkTurn(2, A1_102)
  A2_103:say(A0_101, 163, 0)
  A2_103:say(A0_101, 164, 0)
  A2_103:_runCharaScheduler(354041856)
  A2_103:say(A0_101, 165, 0)
  A2_103:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Teledji_02(A0_104, A1_105, A2_106)
  A2_106:startCliantTalkTurn(2, A1_105)
  A2_106:say(A0_104, 186, 0)
  A2_106:say(A0_104, 187, 0)
  A2_106:_runCharaScheduler(354058240)
  A2_106:say(A0_104, 188, 0)
  A2_106:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Eline_01(A0_107, A1_108, A2_109)
  A2_109:startCliantTalkTurn(1, A1_108)
  A2_109:say(A0_107, 161, 0)
  A2_109:say(A0_107, 162, 0)
  A2_109:finishCliantTalkTurn()
end
function Gcl106.processEvent_UldahInstance_Eline_02(A0_110, A1_111, A2_112)
  A2_112:startCliantTalkTurn(2, A1_111)
  A0_110:_wait(1)
  A2_112:say(A0_110, 189, 0)
  A2_112:say(A0_110, 190, 0)
  A2_112:startCliantTalkTurn(1, A1_111)
  A0_110:_wait(1)
  A2_112:say(A0_110, 191, 0)
  A2_112:say(A0_110, 192, 0)
  A2_112:_runCharaScheduler(354107392)
  A0_110:_wait(2.5)
  A2_112:say(A0_110, 193, 0)
  A2_112:finishCliantTalkTurn()
end
