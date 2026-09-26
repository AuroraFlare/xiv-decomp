require("/Widget/WidgetBaseClass")
_defineClass("StatusWidget", "WidgetBaseClass")
function StatusWidget.init(A0_0, A1_1, A2_2)
  A0_0.work._temp = {
    {"index", "integer16"},
    {"focus", "integer16"},
    {"pointMaxL", "integer32"},
    {"pointMaxG", "integer32"},
    {"pointMaxU", "integer32"},
    {"rankL", "integer8"},
    {"rankG", "integer8"},
    {"rankU", "integer8"},
    {
      "isPrebelongL",
      "boolean"
    },
    {
      "isPrebelongG",
      "boolean"
    },
    {
      "isPrebelongU",
      "boolean"
    },
    {
      "currentTitle",
      "integer32"
    },
    {"newTitle", "integer32"}
  }
  A0_0.work.index = 0
  A0_0.work.focus = 0
  A0_0:initForm()
  A0_0:setModal(true)
  A0_0.work.pointMaxL = worldMaster:_getMyPlayer():getGrandCompanySealMax(1)
  A0_0.work.pointMaxG = worldMaster:_getMyPlayer():getGrandCompanySealMax(2)
  A0_0.work.pointMaxU = worldMaster:_getMyPlayer():getGrandCompanySealMax(3)
  A0_0.work.rankL, A0_0.work.isPrebelongL = worldMaster:_getMyPlayer():getGrandCompanyRank(1)
  A0_0.work.rankG, A0_0.work.isPrebelongG = worldMaster:_getMyPlayer():getGrandCompanyRank(2)
  A0_0.work.rankU, A0_0.work.isPrebelongU = worldMaster:_getMyPlayer():getGrandCompanyRank(3)
  A0_0:updateMainSkillHeader()
  A0_0:updatePcParameter()
  A0_0:updateGameParameter()
  A0_0:updateBattleParameter()
  A0_0:updateGrandCompany()
  A0_0:updateContents(true)
  A0_0:updateMoneyList(101)
  desktopWidget:demandPlayerExpInfomation()
  if A1_1 ~= nil then
    A0_0:setSelectedIndex("TabControl_Status", A1_1)
  end
end
function StatusWidget.initForm(A0_3)
  A0_3:setCloseCondition()
  A0_3:setCancelCondition()
  A0_3:setConfirmCondition("Button_ChangeAchieve")
  A0_3.work.currentTitle = worldMaster:_getMyPlayer():_getAchievementTitle()
  A0_3.work.newTitle = A0_3.work.currentTitle
  if worldMaster:_getMyPlayer():_countEnableAchievementTitle() == 0 then
    A0_3:setControlProperty("TextBlock_SkillRankTitle", "IsTabStop", "True")
    A0_3:setEnable("Button_ChangeAchieve", false)
    A0_3:setHelpParameter("Button_ChangeAchieve", 1, 79510)
  else
    A0_3:setControlProperty("TextBlock_SkillRankTitle", "IsTabStop", "False")
    A0_3:setControlProperty("TextBlock_SkillRankTitle", "Focusable", "False")
    A0_3:setHelpParameter("Button_ChangeAchieve", 1, 79509)
  end
  A0_3:initParameter()
  A0_3:initImportantList()
  A0_3:setControlCommandCondition("TabControl_Status", "UILuaCommands.TabChanged")
  A0_3:setText("TextBlock_NoContents", 3140)
end
function StatusWidget.initParameter(A0_4)
  A0_4:setText("TextBlock_Title_HP", 214, 110)
  A0_4:setText("TextBlock_Title_MP", 214, 120)
  A0_4:setText("TextBlock_Title_TP", 214, 130)
  A0_4:setText(A0_4:getTemplateControl("Label_STR", "TextBlock_Title"), 214, 1)
  A0_4:setText(A0_4:getTemplateControl("Label_VIT", "TextBlock_Title"), 214, 2)
  A0_4:setText(A0_4:getTemplateControl("Label_DEX", "TextBlock_Title"), 214, 3)
  A0_4:setText(A0_4:getTemplateControl("Label_INT", "TextBlock_Title"), 214, 4)
  A0_4:setText(A0_4:getTemplateControl("Label_MND", "TextBlock_Title"), 214, 5)
  A0_4:setText(A0_4:getTemplateControl("Label_PIE", "TextBlock_Title"), 214, 6)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_STR", "TextBlock_Title"), 1, 70001)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_VIT", "TextBlock_Title"), 1, 70002)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_DEX", "TextBlock_Title"), 1, 70003)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_INT", "TextBlock_Title"), 1, 70004)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MND", "TextBlock_Title"), 1, 70005)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_PIE", "TextBlock_Title"), 1, 70006)
  A0_4:setText("TextBlock_FIRE", 214, 7)
  A0_4:setText("TextBlock_WATER", 214, 12)
  A0_4:setText("TextBlock_THUNDER", 214, 11)
  A0_4:setText("TextBlock_WIND", 214, 9)
  A0_4:setText("TextBlock_EARTH", 214, 10)
  A0_4:setText("TextBlock_ICE", 214, 8)
  A0_4:setText(A0_4:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_Title"), 214, 15018)
  A0_4:setText(A0_4:getTemplateControl("Label_MainPhysicsHit", "TextBlock_Title"), 214, 15016)
  A0_4:setText(A0_4:getTemplateControl("Label_PhysicsDefense", "TextBlock_Title"), 214, 15019)
  A0_4:setText(A0_4:getTemplateControl("Label_Avoidance", "TextBlock_Title"), 214, 15017)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_Title"), 1, 70018)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MainPhysicsHit", "TextBlock_Title"), 1, 70016)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_PhysicsDefense", "TextBlock_Title"), 1, 70019)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_Avoidance", "TextBlock_Title"), 1, 70017)
  A0_4:setText(A0_4:getTemplateControl("Label_AttackMagic", "TextBlock_Title"), 214, 15024)
  A0_4:setText(A0_4:getTemplateControl("Label_WeakMagic", "TextBlock_Title"), 214, 15027)
  A0_4:setText(A0_4:getTemplateControl("Label_HealMagic", "TextBlock_Title"), 214, 15025)
  A0_4:setText(A0_4:getTemplateControl("Label_ReinforceMagic", "TextBlock_Title"), 214, 15026)
  A0_4:setText(A0_4:getTemplateControl("Label_MagicHit", "TextBlock_Title"), 214, 15028)
  A0_4:setText(A0_4:getTemplateControl("Label_MagicEvasion", "TextBlock_Title"), 214, 15029)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_AttackMagic", "TextBlock_Title"), 1, 70024)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_WeakMagic", "TextBlock_Title"), 1, 70027)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_HealMagic", "TextBlock_Title"), 1, 70025)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_ReinforceMagic", "TextBlock_Title"), 1, 70026)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MagicHit", "TextBlock_Title"), 1, 70028)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MagicEvasion", "TextBlock_Title"), 1, 70029)
  A0_4:setText(A0_4:getTemplateControl("Label_PhysicalProcessing", "TextBlock_Title"), 214, 400)
  A0_4:setText(A0_4:getTemplateControl("Label_MagicProcessing", "TextBlock_Title"), 214, 410)
  A0_4:setText(A0_4:getTemplateControl("Label_AlteredControl", "TextBlock_Title"), 214, 420)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_PhysicalProcessing", "TextBlock_Title"), 1, 70400)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_MagicProcessing", "TextBlock_Title"), 1, 70410)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_AlteredControl", "TextBlock_Title"), 1, 70420)
  A0_4:setText(A0_4:getTemplateControl("Label_GatheringAbility", "TextBlock_Title"), 214, 500)
  A0_4:setText(A0_4:getTemplateControl("Label_GatheringResistance", "TextBlock_Title"), 214, 510)
  A0_4:setText(A0_4:getTemplateControl("Label_GatheringInspiration", "TextBlock_Title"), 214, 520)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_GatheringAbility", "TextBlock_Title"), 1, 70500)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_GatheringResistance", "TextBlock_Title"), 1, 70510)
  A0_4:setHelpParameter(A0_4:getTemplateControl("Label_GatheringInspiration", "TextBlock_Title"), 1, 70520)
  A0_4:setVisibility("Grid_Physics", true)
  A0_4:setVisibility("Grid_Magic", true)
  if worldMaster:_getMyPlayer():getStateMainSkill() <= 28 then
    A0_4:setVisibility("Grid_Production", false)
    A0_4:setVisibility("Grid_Production", false)
    A0_4:setVisibility("Grid_Gathering", false)
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() >= 29 and worldMaster:_getMyPlayer():getStateMainSkill() <= 38 then
    A0_4:setVisibility("Grid_Production", true)
    A0_4:setVisibility("Grid_Gathering", false)
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() >= 39 and worldMaster:_getMyPlayer():getStateMainSkill() <= 44 then
    A0_4:setVisibility("Grid_Production", false)
    A0_4:setVisibility("Grid_Gathering", true)
  end
  A0_4:setHp(0)
  A0_4:setMp(0)
  A0_4:setTp(0)
  A0_4:setStr(0)
  A0_4:setVit(0)
  A0_4:setDex(0)
  A0_4:setInt(0)
  A0_4:setMnd(0)
  A0_4:setPie(0)
  A0_4:setFire(0)
  A0_4:setIce(0)
  A0_4:setWind(0)
  A0_4:setEarth(0)
  A0_4:setThunder(0)
  A0_4:setWater(0)
  A0_4:setMainAttack(0)
  A0_4:setMainRate(0)
  A0_4:setDefence(0)
  A0_4:setEvasion(0)
  A0_4:setAttackMagic(0)
  A0_4:setWeakMagic(0)
  A0_4:setHealMagic(0)
  A0_4:setReinforceMagic(0)
  A0_4:setMagicHit(0)
  A0_4:setMagicEvasion(0)
  A0_4:setSkillRankList()
  A0_4:setText("TextBlock_BirthDayTitle", 10044, 10027)
  A0_4:setText("TextBlock_GuardianNameTitle", 10044, 10026)
  A0_4:setPlayerName("")
  A0_4:setRace(0, 0)
  A0_4:setCity(1)
  A0_4:setBirthDay(1, 1)
  A0_4:setGuardian("", 0)
end
function StatusWidget.updateMainSkillHeader(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20
  L1_6 = worldMaster
  L2_7 = L1_6
  L1_6 = L1_6._getMyPlayer
  L1_6 = L1_6(L2_7)
  L2_7 = desktopWidget
  L3_8 = L2_7
  L2_7 = L2_7.getPlayerName
  L2_7 = L2_7(L3_8)
  L4_9 = L1_6
  L3_8 = L1_6.getNation
  L3_8 = L3_8(L4_9)
  L5_10 = L1_6
  L4_9 = L1_6.getTribe
  L4_9 = L4_9(L5_10)
  L6_11 = L1_6
  L5_10 = L1_6.getBirthday
  L6_11 = L5_10(L6_11)
  L8_13 = L1_6
  L7_12 = L1_6.getInitialTown
  L7_12 = L7_12(L8_13)
  L9_14 = L1_6
  L8_13 = L1_6.getGuardian
  L8_13 = L8_13(L9_14)
  L10_15 = L1_6
  L9_14 = L1_6.getMoneyOnHand
  L9_14 = L9_14(L10_15)
  L11_16 = L1_6
  L10_15 = L1_6.getStateMainSkill
  L10_15 = L10_15(L11_16)
  L12_17 = L1_6
  L11_16 = L1_6.getSkillLevel
  L13_18 = L10_15
  L11_16 = L11_16(L12_17, L13_18)
  L13_18 = L1_6
  L12_17 = L1_6.getMainClassOrJob
  L12_17 = L12_17(L13_18)
  if L12_17 == L10_15 then
    L12_17 = 0
  end
  L14_19 = A0_5
  L13_18 = A0_5.getGuardianResource
  L15_20 = L8_13
  L14_19 = L13_18(L14_19, L15_20)
  if L8_13 <= 0 then
    L8_13 = 1
  end
  L15_20 = L1_6._getAchievementTitle
  L15_20 = L15_20(L1_6)
  A0_5:previewAchievementTitle(L15_20)
  A0_5:setRace(L3_8, L4_9)
  A0_5:setJob(L10_15, L11_16, L12_17)
  A0_5:setCity(L7_12)
  A0_5:setBirthDay(L5_10, L6_11)
  A0_5:setGuardian(L13_18, L14_19)
end
function StatusWidget.updatePcParameter(A0_21)
  local L1_22, L2_23, L3_24, L4_25
  L1_22 = worldMaster
  L2_23 = L1_22
  L1_22 = L1_22._getMyPlayer
  L1_22 = L1_22(L2_23)
  L3_24 = L1_22
  L2_23 = L1_22.getHPMax
  L2_23 = L2_23(L3_24)
  L4_25 = L1_22
  L3_24 = L1_22.getMPMax
  L3_24 = L3_24(L4_25)
  L4_25 = L1_22.getTPMax
  L4_25 = L4_25(L1_22)
  A0_21:setHp(L2_23)
  A0_21:setMp(L3_24)
  A0_21:setTp(L4_25)
end
function StatusWidget.updateGameParameter(A0_26)
  local L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39
  L1_27 = worldMaster
  L2_28 = L1_27
  L1_27 = L1_27._getMyPlayer
  L1_27 = L1_27(L2_28)
  L3_29 = L1_27
  L2_28 = L1_27.getPhysicalParameter
  L4_30 = 1
  L2_28 = L2_28(L3_29, L4_30)
  L4_30 = L1_27
  L3_29 = L1_27.getPhysicalParameter
  L5_31 = 2
  L3_29 = L3_29(L4_30, L5_31)
  L5_31 = L1_27
  L4_30 = L1_27.getPhysicalParameter
  L6_32 = 3
  L4_30 = L4_30(L5_31, L6_32)
  L6_32 = L1_27
  L5_31 = L1_27.getPhysicalParameter
  L7_33 = 4
  L5_31 = L5_31(L6_32, L7_33)
  L7_33 = L1_27
  L6_32 = L1_27.getPhysicalParameter
  L8_34 = 5
  L6_32 = L6_32(L7_33, L8_34)
  L8_34 = L1_27
  L7_33 = L1_27.getPhysicalParameter
  L9_35 = 6
  L7_33 = L7_33(L8_34, L9_35)
  L9_35 = L1_27
  L8_34 = L1_27.getPhysicalParameter
  L10_36 = 7
  L8_34 = L8_34(L9_35, L10_36)
  L10_36 = L1_27
  L9_35 = L1_27.getPhysicalParameter
  L11_37 = 8
  L9_35 = L9_35(L10_36, L11_37)
  L11_37 = L1_27
  L10_36 = L1_27.getPhysicalParameter
  L12_38 = 9
  L10_36 = L10_36(L11_37, L12_38)
  L12_38 = L1_27
  L11_37 = L1_27.getPhysicalParameter
  L13_39 = 10
  L11_37 = L11_37(L12_38, L13_39)
  L13_39 = L1_27
  L12_38 = L1_27.getPhysicalParameter
  L12_38 = L12_38(L13_39, 11)
  L13_39 = L1_27.getPhysicalParameter
  L13_39 = L13_39(L1_27, 12)
  A0_26:setStr(L2_28)
  A0_26:setVit(L3_29)
  A0_26:setDex(L4_30)
  A0_26:setInt(L5_31)
  A0_26:setMnd(L6_32)
  A0_26:setPie(L7_33)
  A0_26:setFire(L8_34)
  A0_26:setIce(L9_35)
  A0_26:setWind(L10_36)
  A0_26:setEarth(L11_37)
  A0_26:setThunder(L12_38)
  A0_26:setWater(L13_39)
end
function StatusWidget.updateBattleParameter(A0_40)
  A0_40:setMainAttack(worldMaster:_getMyPlayer():getAttack())
  A0_40:setMainRate(worldMaster:_getMyPlayer():getAttackRate())
  A0_40:setDefence(worldMaster:_getMyPlayer():getNormalDefence())
  A0_40:setEvasion(worldMaster:_getMyPlayer():getEvasion())
  A0_40:setAttackMagic(worldMaster:_getMyPlayer():getAttackMagic())
  A0_40:setWeakMagic(worldMaster:_getMyPlayer():getWeekMagic())
  A0_40:setHealMagic(worldMaster:_getMyPlayer():getHealMagic())
  A0_40:setReinforceMagic(worldMaster:_getMyPlayer():getReinforceMagic())
  A0_40:setMagicHit(worldMaster:_getMyPlayer():getMagicRate())
  A0_40:setMagicEvasion(worldMaster:_getMyPlayer():getMagicEvasion())
  A0_40:setCraftProcessing(worldMaster:_getMyPlayer():getCraftProcessing(1))
  A0_40:setCraftProcessControl(worldMaster:_getMyPlayer():getCraftProcessControl(1))
  A0_40:setCraftMagicProcessing(worldMaster:_getMyPlayer():getCraftMagicProcessing(1))
  A0_40:setHarvestPotency(worldMaster:_getMyPlayer():getHarvestPotency(1))
  A0_40:setHarvestLimit(worldMaster:_getMyPlayer():getHarvestLimit(1))
  A0_40:setHarvestRate(worldMaster:_getMyPlayer():getHarvestRate(1))
  if desktopWidget:getPlayerMainSkillNumber() <= 28 then
    A0_40:setVisibility("Grid_Magic", true)
    A0_40:setVisibility("Grid_Production", false)
    A0_40:setVisibility("Grid_Gathering", false)
  end
  if desktopWidget:getPlayerMainSkillNumber() >= 29 and desktopWidget:getPlayerMainSkillNumber() <= 38 then
    A0_40:setVisibility("Grid_Magic", false)
    A0_40:setVisibility("Grid_Production", true)
    A0_40:setVisibility("Grid_Gathering", false)
  end
  if desktopWidget:getPlayerMainSkillNumber() >= 39 and desktopWidget:getPlayerMainSkillNumber() <= 44 then
    A0_40:setVisibility("Grid_Magic", false)
    A0_40:setVisibility("Grid_Production", false)
    A0_40:setVisibility("Grid_Gathering", true)
  end
end
function StatusWidget.getTemplateControl(A0_41, A1_42, A2_43)
  return A1_42 .. ":" .. A2_43
end
function StatusWidget.setHp(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49
  L4_48 = A0_44
  L3_47 = A0_44.setText
  L5_49 = "TextBlock_BaseParameter_HP"
  L3_47(L4_48, L5_49, tostring(A1_45))
end
function StatusWidget.setMp(A0_50, A1_51, A2_52)
  local L3_53, L4_54, L5_55
  L4_54 = A0_50
  L3_53 = A0_50.setText
  L5_55 = "TextBlock_BaseParameter_MP"
  L3_53(L4_54, L5_55, tostring(A1_51))
end
function StatusWidget.setTp(A0_56, A1_57, A2_58)
  local L3_59, L4_60, L5_61
  L4_60 = A0_56
  L3_59 = A0_56.setText
  L5_61 = "TextBlock_BaseParameter_TP"
  L3_59(L4_60, L5_61, tostring(A1_57))
end
function StatusWidget.setStr(A0_62, A1_63, A2_64)
  local L3_65, L4_66
  L4_66 = A0_62
  L3_65 = A0_62.setText
  L3_65(L4_66, A0_62:getTemplateControl("Label_STR", "TextBlock_BaseParameter"), tostring(A1_63))
end
function StatusWidget.setVit(A0_67, A1_68, A2_69)
  local L3_70, L4_71
  L4_71 = A0_67
  L3_70 = A0_67.setText
  L3_70(L4_71, A0_67:getTemplateControl("Label_VIT", "TextBlock_BaseParameter"), tostring(A1_68))
end
function StatusWidget.setDex(A0_72, A1_73, A2_74)
  local L3_75, L4_76
  L4_76 = A0_72
  L3_75 = A0_72.setText
  L3_75(L4_76, A0_72:getTemplateControl("Label_DEX", "TextBlock_BaseParameter"), tostring(A1_73))
end
function StatusWidget.setInt(A0_77, A1_78, A2_79)
  local L3_80, L4_81
  L4_81 = A0_77
  L3_80 = A0_77.setText
  L3_80(L4_81, A0_77:getTemplateControl("Label_INT", "TextBlock_BaseParameter"), tostring(A1_78))
end
function StatusWidget.setMnd(A0_82, A1_83, A2_84)
  local L3_85, L4_86
  L4_86 = A0_82
  L3_85 = A0_82.setText
  L3_85(L4_86, A0_82:getTemplateControl("Label_MND", "TextBlock_BaseParameter"), tostring(A1_83))
end
function StatusWidget.setPie(A0_87, A1_88, A2_89)
  local L3_90, L4_91
  L4_91 = A0_87
  L3_90 = A0_87.setText
  L3_90(L4_91, A0_87:getTemplateControl("Label_PIE", "TextBlock_BaseParameter"), tostring(A1_88))
end
function StatusWidget.setFire(A0_92, A1_93)
  local L2_94, L3_95, L4_96
  L3_95 = A0_92
  L2_94 = A0_92.setText
  L4_96 = "TextBlock_ElementValue_FIRE"
  L2_94(L3_95, L4_96, tostring(A1_93))
end
function StatusWidget.setWater(A0_97, A1_98)
  local L2_99, L3_100, L4_101
  L3_100 = A0_97
  L2_99 = A0_97.setText
  L4_101 = "TextBlock_ElementValue_WATER"
  L2_99(L3_100, L4_101, tostring(A1_98))
end
function StatusWidget.setThunder(A0_102, A1_103)
  local L2_104, L3_105, L4_106
  L3_105 = A0_102
  L2_104 = A0_102.setText
  L4_106 = "TextBlock_ElementValue_THUNDER"
  L2_104(L3_105, L4_106, tostring(A1_103))
end
function StatusWidget.setWind(A0_107, A1_108)
  local L2_109, L3_110, L4_111
  L3_110 = A0_107
  L2_109 = A0_107.setText
  L4_111 = "TextBlock_ElementValue_WIND"
  L2_109(L3_110, L4_111, tostring(A1_108))
end
function StatusWidget.setEarth(A0_112, A1_113)
  local L2_114, L3_115, L4_116
  L3_115 = A0_112
  L2_114 = A0_112.setText
  L4_116 = "TextBlock_ElementValue_EARTH"
  L2_114(L3_115, L4_116, tostring(A1_113))
end
function StatusWidget.setIce(A0_117, A1_118)
  local L2_119, L3_120, L4_121
  L3_120 = A0_117
  L2_119 = A0_117.setText
  L4_121 = "TextBlock_ElementValue_ICE"
  L2_119(L3_120, L4_121, tostring(A1_118))
end
function StatusWidget.setMainAttack(A0_122, A1_123)
  local L2_124, L3_125
  L3_125 = A0_122
  L2_124 = A0_122.setText
  L2_124(L3_125, A0_122:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_BaseParameter"), tostring(A1_123))
end
function StatusWidget.setMainRate(A0_126, A1_127)
  local L2_128, L3_129
  L3_129 = A0_126
  L2_128 = A0_126.setText
  L2_128(L3_129, A0_126:getTemplateControl("Label_MainPhysicsHit", "TextBlock_BaseParameter"), tostring(A1_127))
end
function StatusWidget.setDefence(A0_130, A1_131)
  local L2_132, L3_133
  L3_133 = A0_130
  L2_132 = A0_130.setText
  L2_132(L3_133, A0_130:getTemplateControl("Label_PhysicsDefense", "TextBlock_BaseParameter"), tostring(A1_131))
end
function StatusWidget.setEvasion(A0_134, A1_135)
  local L2_136, L3_137
  L3_137 = A0_134
  L2_136 = A0_134.setText
  L2_136(L3_137, A0_134:getTemplateControl("Label_Avoidance", "TextBlock_BaseParameter"), tostring(A1_135))
end
function StatusWidget.setAttackMagic(A0_138, A1_139)
  local L2_140, L3_141
  L3_141 = A0_138
  L2_140 = A0_138.setText
  L2_140(L3_141, A0_138:getTemplateControl("Label_AttackMagic", "TextBlock_BaseParameter"), tostring(A1_139))
end
function StatusWidget.setWeakMagic(A0_142, A1_143)
  local L2_144, L3_145
  L3_145 = A0_142
  L2_144 = A0_142.setText
  L2_144(L3_145, A0_142:getTemplateControl("Label_WeakMagic", "TextBlock_BaseParameter"), tostring(A1_143))
end
function StatusWidget.setHealMagic(A0_146, A1_147)
  local L2_148, L3_149
  L3_149 = A0_146
  L2_148 = A0_146.setText
  L2_148(L3_149, A0_146:getTemplateControl("Label_HealMagic", "TextBlock_BaseParameter"), tostring(A1_147))
end
function StatusWidget.setReinforceMagic(A0_150, A1_151)
  local L2_152, L3_153
  L3_153 = A0_150
  L2_152 = A0_150.setText
  L2_152(L3_153, A0_150:getTemplateControl("Label_ReinforceMagic", "TextBlock_BaseParameter"), tostring(A1_151))
end
function StatusWidget.setMagicHit(A0_154, A1_155)
  local L2_156, L3_157
  L3_157 = A0_154
  L2_156 = A0_154.setText
  L2_156(L3_157, A0_154:getTemplateControl("Label_MagicHit", "TextBlock_BaseParameter"), tostring(A1_155))
end
function StatusWidget.setMagicEvasion(A0_158, A1_159)
  local L2_160, L3_161
  L3_161 = A0_158
  L2_160 = A0_158.setText
  L2_160(L3_161, A0_158:getTemplateControl("Label_MagicEvasion", "TextBlock_BaseParameter"), tostring(A1_159))
end
function StatusWidget.setCraftProcessing(A0_162, A1_163)
  local L2_164, L3_165
  L3_165 = A0_162
  L2_164 = A0_162.setText
  L2_164(L3_165, A0_162:getTemplateControl("Label_PhysicalProcessing", "TextBlock_BaseParameter"), tostring(A1_163))
end
function StatusWidget.setCraftProcessControl(A0_166, A1_167)
  local L2_168, L3_169
  L3_169 = A0_166
  L2_168 = A0_166.setText
  L2_168(L3_169, A0_166:getTemplateControl("Label_AlteredControl", "TextBlock_BaseParameter"), tostring(A1_167))
end
function StatusWidget.setCraftMagicProcessing(A0_170, A1_171)
  local L2_172, L3_173
  L3_173 = A0_170
  L2_172 = A0_170.setText
  L2_172(L3_173, A0_170:getTemplateControl("Label_MagicProcessing", "TextBlock_BaseParameter"), tostring(A1_171))
end
function StatusWidget.setHarvestPotency(A0_174, A1_175)
  local L2_176, L3_177
  L3_177 = A0_174
  L2_176 = A0_174.setText
  L2_176(L3_177, A0_174:getTemplateControl("Label_GatheringAbility", "TextBlock_BaseParameter"), tostring(A1_175))
end
function StatusWidget.setHarvestLimit(A0_178, A1_179)
  local L2_180, L3_181
  L3_181 = A0_178
  L2_180 = A0_178.setText
  L2_180(L3_181, A0_178:getTemplateControl("Label_GatheringResistance", "TextBlock_BaseParameter"), tostring(A1_179))
end
function StatusWidget.setHarvestRate(A0_182, A1_183)
  local L2_184, L3_185
  L3_185 = A0_182
  L2_184 = A0_182.setText
  L2_184(L3_185, A0_182:getTemplateControl("Label_GatheringInspiration", "TextBlock_BaseParameter"), tostring(A1_183))
end
function StatusWidget.setPlayerName(A0_186, A1_187)
  if A1_187 ~= "" then
    A0_186:setText("TextBlock_PlayerName", 230, A1_187)
  else
    A0_186:setText("TextBlock_PlayerName", "")
  end
end
function StatusWidget.setRace(A0_188, A1_189, A2_190)
  if A1_189 > 0 or A2_190 > 0 then
    A0_188:setVisibility("TextBlock_Race", true)
    A0_188:setText("TextBlock_Race", 221, A1_189, A2_190)
  else
    A0_188:setVisibility("TextBlock_Race", false)
  end
end
function StatusWidget.setJob(A0_191, A1_192, A2_193, A3_194)
  A0_191:setText("TextBlock_SkillRankTitle", 231, A1_192, A2_193, A3_194)
  if A3_194 ~= 0 then
    A0_191:setIcon("IconControl_SkillIcon", desktopWidget:getSkillIcon(A3_194))
  else
    A0_191:setIcon("IconControl_SkillIcon", desktopWidget:getSkillIcon(A1_192))
  end
end
function StatusWidget.setCity(A0_195, A1_196)
  local L2_197
  L2_197 = A1_196
  if L2_197 == 1 then
    A0_195:setIcon("IconControl_StateIcon", 527)
    break
  else
  end
  if L2_197 == 2 then
    A0_195:setIcon("IconControl_StateIcon", 528)
    break
  else
  end
  if L2_197 == 3 then
    A0_195:setIcon("IconControl_StateIcon", 529)
    do break end
    break
  else
  end
end
function StatusWidget.setBirthDay(A0_198, A1_199, A2_200)
  local L3_201, L4_202
  L3_201 = 1
  L4_202 = 1
  if A1_199 >= 1 and A1_199 <= 12 then
    L3_201 = A1_199
  end
  if A2_200 >= 1 and A2_200 <= 32 then
    L4_202 = A2_200
  end
  A0_198:setText("TextBlock_BirthDay", 2118, L3_201, L4_202)
end
function StatusWidget.setGuardian(A0_203, A1_204, A2_205)
  A0_203:setText("TextBlock_GuardianName", A1_204)
  A0_203:setIcon("IconControl_GuardianIcon", A2_205)
end
function StatusWidget.getGuardianResource(A0_206, A1_207)
  local L2_208, L3_209, L4_210, L5_211
  L2_208 = 347
  L3_209 = 100838
  L4_210 = A1_207
  if L4_210 == 1 then
    L2_208 = 347
    L3_209 = 100838
    break
  else
  end
  if L4_210 == 2 then
    L2_208 = 348
    L3_209 = 100839
    break
  else
  end
  if L4_210 == 3 then
    L2_208 = 349
    L3_209 = 100840
    break
  else
  end
  if L4_210 == 4 then
    L2_208 = 350
    L3_209 = 100841
    break
  else
  end
  if L4_210 == 5 then
    L2_208 = 351
    L3_209 = 100842
    break
  else
  end
  if L4_210 == 6 then
    L2_208 = 352
    L3_209 = 100843
    break
  else
  end
  if L4_210 == 7 then
    L2_208 = 353
    L3_209 = 100844
    break
  else
  end
  if L4_210 == 8 then
    L2_208 = 354
    L3_209 = 100845
    break
  else
  end
  if L4_210 == 9 then
    L2_208 = 355
    L3_209 = 100846
    break
  else
  end
  if L4_210 == 10 then
    L2_208 = 356
    L3_209 = 100847
    break
  else
  end
  if L4_210 == 11 then
    L2_208 = 357
    L3_209 = 100848
    break
  else
  end
  if L4_210 == 12 then
    L2_208 = 358
    L3_209 = 100849
    do break end
    break
  else
  end
  L4_210 = L3_209
  L5_211 = L2_208
  return L4_210, L5_211
end
function StatusWidget.setSkillRankList(A0_212)
  A0_212:setSkill("Pugilist", 2)
  A0_212:setSkill("Gladiator", 3)
  A0_212:setSkill("Marauder", 4)
  A0_212:setSkill("Archer", 7)
  A0_212:setSkill("Lancer", 8)
  A0_212:setSkill("Conjurer", 23)
  A0_212:setSkill("Thaumaturge", 22)
  A0_212:setSkill("Miner", 39)
  A0_212:setSkill("Botanist", 40)
  A0_212:setSkill("Fisher", 41)
  A0_212:setSkill("Carpenter", 29)
  A0_212:setSkill("Blacksmith", 30)
  A0_212:setSkill("Armorer", 31)
  A0_212:setSkill("Goldsmith", 32)
  A0_212:setSkill("Leatherworker", 33)
  A0_212:setSkill("Weaver", 34)
  A0_212:setSkill("Alchemist", 35)
  A0_212:setSkill("Culinarian", 36)
  A0_212:setSkill("Paladin", 16)
  A0_212:setSkill("Monk", 15)
  A0_212:setSkill("Warrior", 17)
  A0_212:setSkill("Dragoon", 19)
  A0_212:setSkill("Bard", 18)
  A0_212:setSkill("WhiteMage", 27)
  A0_212:setSkill("BlackMage", 26)
end
function StatusWidget.setSkill(A0_213, A1_214, A2_215)
  local L3_216, L4_217, L5_218, L6_219, L7_220, L8_221, L9_222
  L3_216 = "TextBlock_Rank_"
  L4_217 = A1_214
  L3_216 = L3_216 .. L4_217
  L4_217 = "Grid_"
  L5_218 = A1_214
  L4_217 = L4_217 .. L5_218
  L5_218 = "Border_"
  L6_219 = A1_214
  L5_218 = L5_218 .. L6_219
  L6_219 = worldMaster
  L7_220 = L6_219
  L6_219 = L6_219._getMyPlayer
  L6_219 = L6_219(L7_220)
  L8_221 = L6_219
  L7_220 = L6_219.getSkillLevel
  L9_222 = A2_215
  L7_220 = L7_220(L8_221, L9_222)
  L9_222 = L6_219
  L8_221 = L6_219.getMainClassOrJob
  L8_221 = L8_221(L9_222)
  L9_222 = desktopWidget
  L9_222 = L9_222.isJob
  L9_222 = L9_222(L9_222, A2_215)
  if L9_222 == true then
    L9_222 = "IconControl_"
    L9_222 = L9_222 .. A1_214
    if L6_219:hasJobStone(A2_215) == false then
      A0_213:setVisualOpacityColor(L9_222, 0.5)
    end
  else
    L9_222 = L6_219.isSkillEnabled
    L9_222 = L9_222(L6_219, A2_215)
    if L9_222 == false then
      L9_222 = A0_213.setHidden
      L9_222(A0_213, L3_216)
      L9_222 = A0_213.setVisualOpacityColor
      L9_222(A0_213, L4_217, 0.5)
    else
      L9_222 = L6_219.getStateMainSkill
      L9_222 = L9_222(L6_219)
      if A2_215 == L9_222 then
        L9_222 = A0_213.setStyle
        L9_222(A0_213, L3_216, "TBL_equippedItem")
      else
        L9_222 = A0_213.setStyle
        L9_222(A0_213, L3_216, "TBL_null")
      end
      L9_222 = A0_213.setVisibility
      L9_222(A0_213, L3_216, true)
      L9_222 = A0_213.setText
      L9_222(A0_213, L3_216, tostring(L7_220))
      L9_222 = A0_213.setVisualOpacityColor
      L9_222(A0_213, L4_217, 1)
    end
  end
  if A2_215 == L8_221 then
    L9_222 = A0_213.setVisibility
    L9_222(A0_213, L5_218, true)
  else
    L9_222 = A0_213.setVisibility
    L9_222(A0_213, L5_218, false)
  end
end
function StatusWidget.setVisualOpacityColor(A0_223, A1_224, A2_225)
  A0_223:setControlProperty(A1_224, "VisualOpacityBlue", A2_225)
  A0_223:setControlProperty(A1_224, "VisualOpacityGreen", A2_225)
  A0_223:setControlProperty(A1_224, "VisualOpacityRed", A2_225)
end
function StatusWidget.initMoneyList(A0_226)
  local L1_227, L2_228, L3_229, L4_230, L5_231
  for L4_230 = 1, 25 do
    L5_231 = "ListBoxItem_"
    L5_231 = L5_231 .. tostring(L4_230)
    A0_226:setVisibility(L5_231, false)
  end
end
function StatusWidget.updateMoneyList(A0_232, A1_233)
  if A1_233 == 101 then
    A0_232:updateImportantList()
    if A0_232:getSelectedIndex("TabControl_Status") == 2 then
      if A0_232:focusToIndex(A0_232.work.focus) >= 0 then
        A0_232.work.index = A0_232:focusToIndex(A0_232.work.focus)
      else
        A0_232.work.index = 0
      end
      A0_232:displayFocusedItemHelp()
    end
  end
  if A1_233 == 100 then
    A0_232:updateGrandCompanyPoint()
  end
end
function StatusWidget.initImportantList(A0_234)
  local L1_235, L2_236
  L2_236 = A0_234
  L1_235 = A0_234.initListBox
  L1_235(L2_236)
  L2_236 = A0_234
  L1_235 = A0_234.resetListBox
  L1_235(L2_236)
  L2_236 = A0_234
  L1_235 = A0_234.setControlProperty
  L1_235(L2_236, A0_234:getListPropertyName(), "FilteredSortKey", "sorttype")
  L2_236 = A0_234
  L1_235 = A0_234.setControlProperty
  L1_235(L2_236, A0_234:getListBoxName(), "SourceFirstIndex", 0)
  L1_235 = worldMaster
  L2_236 = L1_235
  L1_235 = L1_235._getMyPlayer
  L1_235 = L1_235(L2_236)
  L2_236 = L1_235._getItemPackageCapacity
  L2_236 = L2_236(L1_235, 101)
  A0_234:setControlProperty(A0_234:getListBoxName(), "SourceCount", L2_236)
end
function StatusWidget.updateImportantList(A0_237)
  local L1_238, L2_239, L3_240, L4_241, L5_242, L6_243, L7_244, L8_245, L9_246, L10_247
  L1_238 = worldMaster
  L2_239 = L1_238
  L1_238 = L1_238._getMyPlayer
  L1_238 = L1_238(L2_239)
  L2_239 = 0
  L4_241 = A0_237
  L3_240 = A0_237.getListPropertyName
  L3_240 = L3_240(L4_241)
  L5_242 = A0_237
  L4_241 = A0_237.getListBoxItemNum
  L4_241 = L4_241(L5_242)
  L5_242 = 0
  L6_243 = L1_238._getItemPackageCapacity
  L6_243 = L6_243(L7_244, L8_245)
  for L10_247 = 1, L6_243 do
    if A0_237:setItemToXml(L3_240, L5_242, 101, L10_247) == true then
      L5_242 = L5_242 + 1
    else
      break
    end
  end
  if L4_241 > L5_242 then
    for L10_247 = L5_242, L4_241 - 1 do
      L4_241 = L4_241 - 1
      A0_237:deleteListProperty(L3_240, L4_241)
    end
  end
  L7_244(L8_245, L9_246)
  if L7_244 > 0 then
    L10_247 = A0_237
    L10_247 = L9_246(L10_247, 2001002)
    L7_244(L8_245, L9_246, L10_247, L9_246(L10_247, 2001002))
  end
  if L7_244 > 0 then
    L10_247 = A0_237
    L10_247 = L9_246(L10_247, 2001004)
    L7_244(L8_245, L9_246, L10_247, L9_246(L10_247, 2001004))
    L10_247 = A0_237
    L10_247 = L9_246(L10_247, 2001005)
    L7_244(L8_245, L9_246, L10_247, L9_246(L10_247, 2001005))
    L10_247 = A0_237
    L10_247 = L9_246(L10_247, 2001006)
    L7_244(L8_245, L9_246, L10_247, L9_246(L10_247, 2001006))
  end
  L7_244(L8_245, L9_246)
  if L7_244 == 2 then
    L7_244(L8_245)
  end
end
function StatusWidget.hasImportantItem(A0_248, A1_249)
  local L2_250, L3_251, L4_252, L5_253, L6_254, L7_255, L8_256, L9_257, L10_258, L11_259, L12_260
  L2_250 = 0
  L3_251, L4_252, L5_253, L6_254 = nil, nil, nil, nil
  L7_255 = worldMaster
  L8_256 = L7_255
  L7_255 = L7_255._getMyPlayer
  L7_255 = L7_255(L8_256)
  L8_256 = L7_255._getItemPackageCapacity
  L8_256 = L8_256(L9_257, L10_258)
  for L12_260 = 1, L8_256 do
    L3_251, L4_252, L5_253, L6_254 = desktopWidget:getPlayerItemInPackage(101, L12_260)
    if L3_251 == A1_249 then
      L2_250 = L12_260
      break
    end
  end
  return L2_250
end
function StatusWidget.maskImportantItem(A0_261, A1_262)
  local L2_263
  if A1_262 == 0 then
    return
  end
  L2_263 = A0_261.getListPropertyName
  L2_263 = L2_263(A0_261)
  A0_261:setListPropertyVisibility(L2_263, A1_262 - 1, false)
end
function StatusWidget.getMoneyListIndex(A0_264, A1_265)
  local L2_266, L3_267
  L2_266 = 2
  if A1_265 == 1000102 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000101 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000103 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000107 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000106 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000104 then
    L3_267 = -1
    return L3_267
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000108 then
    L3_267 = -1
    return L3_267
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000109 then
    L3_267 = -1
    return L3_267
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000105 then
    L3_267 = -1
    return L3_267
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000111 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000110 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000112 then
    L3_267 = -1
    return L3_267
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000113 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000114 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000115 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000116 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000117 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000118 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000119 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000120 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000121 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000122 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  if A1_265 == 1000123 then
    return L2_266
  else
    L2_266 = L2_266 + 1
  end
  L3_267 = -1
  return L3_267
end
function StatusWidget.updateGrandCompany(A0_268)
  if A0_268:setGrandCompany(1, "Label_1") then
  end
  if A0_268:setGrandCompany(2, "Label_2") then
  end
  if A0_268:setGrandCompany(3, "Label_3") then
  end
  if true == false then
    A0_268:setVisibility("TextBlock_NotJoined", true)
  else
    A0_268:setVisibility("TextBlock_NotJoined", false)
  end
end
function StatusWidget.updateGrandCompanyPoint(A0_269)
  local L1_270, L2_271
  L1_270, L2_271 = A0_269:getGrandCompanyPoint(1)
  A0_269:setText(A0_269:getTemplateControl("Label_1", "TextBlock_CompanyPoint"), 3551, L1_270, L2_271)
  L1_270, L2_271 = A0_269:getGrandCompanyPoint(2)
  A0_269:setText(A0_269:getTemplateControl("Label_2", "TextBlock_CompanyPoint"), 3551, L1_270, L2_271)
  L1_270, L2_271 = A0_269:getGrandCompanyPoint(3)
  A0_269:setText(A0_269:getTemplateControl("Label_3", "TextBlock_CompanyPoint"), 3551, L1_270, L2_271)
end
function StatusWidget.setGrandCompany(A0_272, A1_273, A2_274)
  local L3_275, L4_276, L5_277, L6_278, L7_279, L8_280, L9_281, L10_282, L11_283, L12_284
  L3_275 = false
  L4_276 = worldMaster
  L5_277 = L4_276
  L4_276 = L4_276._getMyPlayer
  L4_276 = L4_276(L5_277)
  L5_277 = 1
  L7_279 = L4_276
  L6_278 = L4_276.isMale
  L6_278 = L6_278(L7_279)
  if L6_278 == true then
    L5_277 = 1
  else
    L7_279 = L4_276
    L6_278 = L4_276.isFemale
    L6_278 = L6_278(L7_279)
    if L6_278 == true then
      L5_277 = 2
    end
  end
  L7_279 = L4_276
  L6_278 = L4_276.getGrandCompanyRank
  L8_280 = A1_273
  L7_279 = L6_278(L7_279, L8_280)
  if L6_278 > 0 then
    L3_275 = true
    L9_281 = A0_272
    L8_280 = A0_272.getTemplateControl
    L10_282 = A2_274
    L11_283 = "IconControl_CompanyStatus"
    L8_280 = L8_280(L9_281, L10_282, L11_283)
    L9_281 = 1
    L11_283 = A0_272
    L10_282 = A0_272.setControlProperty
    L12_284 = L8_280
    L10_282(L11_283, L12_284, "VisualOpacity", L9_281)
    L11_283 = A0_272
    L10_282 = A0_272.setControlProperty
    L12_284 = L8_280
    L10_282(L11_283, L12_284, "VisualOpacityRed", L9_281)
    L11_283 = A0_272
    L10_282 = A0_272.setControlProperty
    L12_284 = L8_280
    L10_282(L11_283, L12_284, "VisualOpacityGreen", L9_281)
    L11_283 = A0_272
    L10_282 = A0_272.setControlProperty
    L12_284 = L8_280
    L10_282(L11_283, L12_284, "VisualOpacityBlue", L9_281)
  elseif L7_279 == true then
    L3_275 = true
    L6_278 = 0
    L8_280, L9_281 = nil, nil
    L10_282 = A1_273
    if L10_282 == 1 then
      L11_283 = A0_272.work
      L11_283 = L11_283.rankG
      L12_284 = A0_272.work
      L9_281 = L12_284.rankU
      L8_280 = L11_283
      break
    else
    end
    if L10_282 == 2 then
      L11_283 = A0_272.work
      L11_283 = L11_283.rankL
      L12_284 = A0_272.work
      L9_281 = L12_284.rankU
      L8_280 = L11_283
      break
    else
    end
    if L10_282 == 3 then
      L11_283 = A0_272.work
      L11_283 = L11_283.rankL
      L12_284 = A0_272.work
      L9_281 = L12_284.rankG
      L8_280 = L11_283
      do break end
      break
    else
    end
    if L8_280 > 0 or L9_281 > 0 then
      L11_283 = A0_272
      L10_282 = A0_272.setVisibility
      L12_284 = A2_274
      L10_282(L11_283, L12_284, false)
    end
  else
    L3_275 = false
    L9_281 = A0_272
    L8_280 = A0_272.setVisibility
    L10_282 = A2_274
    L11_283 = false
    L8_280(L9_281, L10_282, L11_283)
  end
  if L3_275 == true then
    L8_280 = L6_278
    if L7_279 == true then
      L8_280 = 127
    end
    L9_281 = 0
    L11_283 = L4_276
    L10_282 = L4_276._getBelongGrandCompany
    L10_282 = L10_282(L11_283)
    if L6_278 == 0 then
      L12_284 = A0_272
      L11_283 = A0_272.setHidden
      L11_283(L12_284, A0_272:getTemplateControl(A2_274, "IconControl_CompanyStatus"))
    else
      L12_284 = A0_272
      L11_283 = A0_272.getGrandCompanyStatusIcon
      L11_283 = L11_283(L12_284, A1_273, L8_280)
      L9_281 = L11_283
      L12_284 = A0_272
      L11_283 = A0_272.setVisibility
      L11_283(L12_284, A0_272:getTemplateControl(A2_274, "IconControl_CompanyStatus"), true)
      L12_284 = A0_272
      L11_283 = A0_272.setIcon
      L11_283(L12_284, A0_272:getTemplateControl(A2_274, "IconControl_CompanyStatus"), L9_281)
    end
    L12_284 = A0_272
    L11_283 = A0_272.setText
    L11_283(L12_284, A0_272:getTemplateControl(A2_274, "TextBlock_CompanyRankName"), 8079 + A1_273, L8_280, L5_277)
    L12_284 = A0_272
    L11_283 = A0_272.getGrandCompanyPoint
    L12_284 = L11_283(L12_284, A1_273)
    A0_272:setText(A0_272:getTemplateControl(A2_274, "TextBlock_CompanyPoint"), 3551, L11_283, L12_284)
  end
  return L3_275
end
function StatusWidget.getGrandCompanyPoint(A0_285, A1_286)
  local L2_287, L3_288, L4_289, L5_290, L6_291, L7_292, L8_293, L9_294, L10_295, L11_296, L12_297
  L3_288 = 0
  L4_289 = A1_286
  if L4_289 == 1 then
    L2_287 = 1000201
    L5_290 = A0_285.work
    L3_288 = L5_290.pointMaxL
    break
  else
  end
  if L4_289 == 2 then
    L2_287 = 1000202
    L5_290 = A0_285.work
    L3_288 = L5_290.pointMaxG
    break
  else
  end
  if L4_289 == 3 then
    L2_287 = 1000203
    L5_290 = A0_285.work
    L3_288 = L5_290.pointMaxU
    do break end
    break
  else
  end
  L4_289 = 100
  L5_290 = 0
  L6_291 = worldMaster
  L7_292 = L6_291
  L6_291 = L6_291._getMyPlayer
  L6_291 = L6_291(L7_292)
  L8_293 = L6_291
  L7_292 = L6_291._getItemPackageCapacity
  L7_292 = L7_292(L8_293, L9_294)
  L8_293 = L6_291._getItemPackageFreeSpace
  L8_293 = L8_293(L9_294, L10_295)
  for L12_297 = 1, L7_292 - L8_293 do
    if desktopWidget:getPlayerItemInPackage(L4_289, L12_297) == L2_287 then
      L5_290 = desktopWidget:getPlayerItemInPackage(L4_289, L12_297)
      break
    end
  end
  return L9_294, L10_295
end
function StatusWidget.getGrandCompanyStatusIcon(A0_298, A1_299, A2_300)
  gcRankSheet:_loadKeyTemporarily(A2_300, A2_300)
  return (gcRankSheet:_getData(A2_300, A1_299 + 6 - 1))
end
function StatusWidget.updateContents(A0_301, A1_302)
  local L2_303
  L2_303 = 1
  L2_303 = A0_301:setContentsListItem(L2_303, -1, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, -2, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, -3, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 1, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 2, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 4, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 3, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 5, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 6, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 7, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 8, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 9, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 10, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 12, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 11, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 13, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 14, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 15, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, 16, A1_302)
  L2_303 = A0_301:setContentsListItem(L2_303, -4, A1_302)
  if L2_303 > 1 then
    A0_301:setVisibility("ListBox_Contents", true)
    A0_301:setVisibility("TextBlock_NoAccount", false)
  else
    A0_301:setVisibility("ListBox_Contents", false)
    A0_301:setVisibility("TextBlock_NoAccount", true)
  end
end
function StatusWidget.setContentsListItem(A0_304, A1_305, A2_306, A3_307)
  local L4_308, L5_309, L6_310, L7_311, L8_312, L9_313, L10_314, L11_315, L12_316, L13_317, L14_318, L15_319, L16_320, L17_321
  L4_308 = "ListBoxItem_Contents"
  L5_309 = tostring
  L6_310 = A1_305
  L5_309 = L5_309(L6_310)
  L4_308 = L4_308 .. L5_309
  if A3_307 == true then
    L6_310 = A0_304
    L5_309 = A0_304._addItem
    L7_311 = nil
    L8_312 = "ListBox_Contents"
    L9_313 = "ControlTemplate_Contents"
    L10_314 = L4_308
    L5_309(L6_310, L7_311, L8_312, L9_313, L10_314)
  end
  L5_309 = false
  L6_310, L7_311, L8_312, L9_313 = nil, nil, nil, nil
  L10_314 = worldMaster
  L11_315 = L10_314
  L10_314 = L10_314._getMyPlayer
  L10_314 = L10_314(L11_315)
  if A2_306 == -1 then
    L6_310 = 10052
    L11_315 = worldMaster
    L12_316 = L11_315
    L11_315 = L11_315.getGuildleveTime
    L11_315 = L11_315(L12_316)
    L7_311 = L11_315
    L8_312 = 10053
    L9_313 = 10054
  elseif A2_306 == -2 then
    L6_310 = 10049
    L12_316 = L10_314
    L11_315 = L10_314._getNormalBehestTime
    L11_315 = L11_315(L12_316)
    L7_311 = L11_315
    L8_312 = 10055
    L9_313 = 10056
  elseif A2_306 == -3 then
    L6_310 = 10050
    L12_316 = L10_314
    L11_315 = L10_314._getCompanyBehestTime
    L11_315 = L11_315(L12_316)
    L7_311 = L11_315
    L8_312 = 10055
    L9_313 = 10056
  elseif A2_306 == -4 then
    L6_310 = 10059
    L12_316 = L10_314
    L11_315 = L10_314._getNMRushUpdateTime
    L11_315 = L11_315(L12_316)
    L7_311 = L11_315
    L8_312 = 10047
    L9_313 = 10048
  else
    L6_310 = 10051
    L12_316 = L10_314
    L11_315 = L10_314._getOccupancyContentsTime
    L13_317 = A2_306
    L11_315 = L11_315(L12_316, L13_317)
    L7_311 = L11_315
    L8_312 = 10047
    L9_313 = 10048
  end
  L11_315 = nil
  L12_316 = A2_306
  if L12_316 == 8 then
    L11_315 = 2
    break
  else
  end
  if L12_316 == 9 then
    L11_315 = 1
    break
  else
  end
  if L12_316 == 10 then
    L11_315 = 3
    break
  else
  end
  if L11_315 ~= nil then
    L13_317 = A0_304
    L12_316 = A0_304.isHamletDefenceBegin
    L14_318 = L11_315
    L12_316 = L12_316(L13_317, L14_318)
    if L12_316 == false and L7_311 > 0 then
      L13_317 = A0_304
      L12_316 = A0_304.getHamletDefenceBeginTime
      L14_318 = L11_315
      L12_316 = L12_316(L13_317, L14_318)
      L7_311 = L12_316
      L8_312 = 10058
    end
  end
  if L7_311 > 0 then
    L12_316 = worldMaster
    L13_317 = L12_316
    L12_316 = L12_316._getServerTime
    L12_316 = L12_316(L13_317)
    if L6_310 == 10051 then
      L14_318 = A0_304
      L13_317 = A0_304.setItemText
      L15_319 = L4_308
      L16_320 = "TextBlock_ContentsTitle"
      L17_321 = L6_310
      L13_317(L14_318, L15_319, L16_320, L17_321, A2_306)
    else
      L14_318 = A0_304
      L13_317 = A0_304.setItemText
      L15_319 = L4_308
      L16_320 = "TextBlock_ContentsTitle"
      L17_321 = L6_310
      L13_317(L14_318, L15_319, L16_320, L17_321)
    end
    if L7_311 <= L12_316 then
      L14_318 = A0_304
      L13_317 = A0_304.setItemText
      L15_319 = L4_308
      L16_320 = "TextBlock_ContentsStatus"
      L17_321 = L9_313
      L13_317(L14_318, L15_319, L16_320, L17_321)
    else
      L13_317 = L7_311 - L12_316
      L14_318, L15_319, L16_320, L17_321 = nil, nil, nil, nil
      L14_318, L17_321 = math:_modf(L13_317 / 86400)
      L13_317 = math:_fmod(L13_317, 86400)
      L15_319, L17_321 = math:_modf(L13_317 / 3600)
      L13_317 = math:_fmod(L13_317, 3600)
      L16_320, L17_321 = math:_modf(L13_317 / 60)
      A0_304:setItemText(L4_308, "TextBlock_ContentsStatus", L8_312, L14_318, L15_319, L16_320, L7_311)
    end
    L5_309 = true
  end
  L13_317 = A0_304
  L12_316 = A0_304.setVisibility
  L14_318 = L4_308
  L15_319 = L5_309
  L12_316(L13_317, L14_318, L15_319)
  L12_316 = A1_305 + 1
  return L12_316
end
function StatusWidget.getServerBiasTime(A0_322)
  return worldMaster:_getServerTime() + 97200
end
function StatusWidget.getHamletDefenceBeginTime(A0_323, A1_324)
  return (_math.floor(worldMaster:_getServerTime() / 60) + (1500 * A1_324 - _math.floor(A0_323:getServerBiasTime() / 60) % 4500 + 3000) % 4500) * 60
end
function StatusWidget.isHamletDefenceBegin(A0_325, A1_326)
  local L2_327
  L2_327 = false
  for _FORV_10_ = 1, 3 do
    if _FORV_10_ == A1_326 and _math.floor(A0_325:getServerBiasTime() / 60) % 4500 >= 1500 * (_FORV_10_ - 1) and _math.floor(A0_325:getServerBiasTime() / 60) % 4500 < 1500 * _FORV_10_ then
      L2_327 = true
    end
  end
  return L2_327
end
function StatusWidget.setButtonEvents(A0_328, A1_329)
  local L2_330
  L2_330 = A0_328.getControlProperty
  L2_330 = L2_330(A0_328, A1_329, "Command")
  A0_328:setControlCommandCondition(A1_329, L2_330)
  A0_328:setControlCommandCondition(A1_329, "UILuaCommands.ButtonFocused")
  A0_328:setCancelCondition(A1_329)
end
function StatusWidget.setWindowFocus(A0_331, A1_332)
  if A1_332 ~= nil and A1_332 ~= "" then
    A0_331:setLogicalFocus(A1_332)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_331 then
      A0_331:setKeyboardFocusedControl(A1_332)
    end
  end
end
function StatusWidget.processUICommandCancel(A0_333, A1_334, A2_335, A3_336, A4_337)
  if A0_333.work.currentTitle ~= A0_333.work.newTitle then
    worldMaster:_getMyPlayer():_setAchievementTitle(A0_333.work.newTitle)
  end
  desktopWidget:closeWidgetDirect(A0_333)
end
function StatusWidget.processUICommandClose(A0_338, A1_339, A2_340, A3_341, A4_342)
  if A0_338.work.currentTitle ~= A0_338.work.newTitle then
    worldMaster:_getMyPlayer():_setAchievementTitle(A0_338.work.newTitle)
  end
  desktopWidget:closeWidgetDirect(A0_338)
end
function StatusWidget.processUICommandOperate(A0_343, A1_344, A2_345, A3_346, A4_347)
  local L5_348
  if A2_345 == "Button_ChangeAchieve" then
    L5_348 = false
    L5_348 = desktopWidget:openChildWidget("AchievementTitleListWidget", A0_343, true, A0_343.work.newTitle)
    return L5_348
  end
end
function StatusWidget.processUICommandDefault(A0_349, A1_350, A2_351, A3_352, A4_353, A5_354)
  if A3_352 == "UILuaCommands.TabChanged" then
    if A0_349:getSelectedIndex("TabControl_Status") == 2 then
      A0_349.work.focus = 0
      if 0 <= A0_349:focusToIndex(A0_349.work.focus) then
        A0_349.work.index = A0_349:focusToIndex(A0_349.work.focus)
      else
        A0_349.work.index = 0
      end
      A0_349:displayFocusedItemHelp()
    elseif A0_349:getSelectedIndex("TabControl_Status") == 4 then
      A0_349:updateContents()
    elseif A0_349:getSelectedIndex("TabControl_Status") == 0 then
      if worldMaster:_getMyPlayer():_countEnableAchievementTitle() == 0 then
        A0_349:setWindowFocus("TextBlock_SkillRankTitle")
      else
        A0_349:setWindowFocus("Button_ChangeAchieve")
      end
    end
  elseif A3_352 == "UILuaCommands.MouseEnteredItem" or A3_352 == "UILuaCommands.AnchoredItem" then
    if A4_353 == nil or A4_353 < 0 then
      return
    end
    A0_349.work.focus = A4_353
    if 0 <= A0_349:focusToIndex(A0_349.work.focus) then
      A0_349.work.index = A0_349:focusToIndex(A0_349.work.focus)
    else
      return
    end
    A0_349:displayFocusedItemHelp()
  end
end
function StatusWidget.update(A0_355, A1_356)
  if A1_356 == nil then
    A0_355:updatePcParameter()
    A0_355:updateGameParameter()
    A0_355:updateBattleParameter()
    A0_355:updateGrandCompany()
    A0_355:updateContents()
  end
  A0_355:updateMainSkillHeader()
  A0_355:setSkillRankList()
  if A1_356 == "stateAtQuicklyForAll" then
    A0_355:updatePcParameter()
    A0_355:updateGameParameter()
    A0_355:updateBattleParameter()
  end
  if A1_356 == "gameParameter" then
    A0_355:updatePcParameter()
    A0_355:updateGameParameter()
    A0_355:updateBattleParameter()
    desktopWidget:demandPlayerExpInfomation()
  end
  if A1_356 == "battleParameter" then
    A0_355:updatePcParameter()
    A0_355:updateBattleParameter()
    A0_355:updateGameParameter()
    desktopWidget:demandPlayerExpInfomation()
  end
  if A1_356 == "exp" then
    A0_355:updatePcParameter()
    A0_355:updateBattleParameter()
    A0_355:updateGameParameter()
  end
end
function StatusWidget.initListBox(A0_357)
  local L1_358, L2_359
  L2_359 = A0_357
  L1_358 = A0_357.getListBoxName
  L1_358 = L1_358(L2_359)
  if L1_358 ~= "" then
    L2_359 = A0_357.setControlProperty
    L2_359(A0_357, L1_358, "IntData.Value0", 1)
    L2_359 = A0_357.setControlCommandCondition
    L2_359(A0_357, L1_358, "UILuaCommands.MouseEnteredItem")
    L2_359 = A0_357.setControlCommandCondition
    L2_359(A0_357, L1_358, "UILuaCommands.AnchoredItem")
    L2_359 = A0_357.setControlCommandCondition
    L2_359(A0_357, L1_358, "UILuaCommands.Selection")
    L2_359 = A0_357.setCancelCondition
    L2_359(A0_357, L1_358)
    L2_359 = A0_357.setVisibility
    L2_359(A0_357, L1_358, true)
    L2_359 = "TextBlock_NoContents"
    A0_357:setControlProperty(L2_359, "IsTabStop", true)
    A0_357:setVisibility(L2_359, false)
    A0_357:setCancelCondition(L2_359)
    A0_357:setControlCommandCondition(L1_358, "UILuaCommands.Previous")
    A0_357:setControlCommandCondition(L1_358, "UILuaCommands.Next")
  end
end
function StatusWidget.resetListBox(A0_360)
  local L1_361, L2_362
  L2_362 = A0_360
  L1_361 = A0_360.getListBoxItemNum
  L1_361 = L1_361(L2_362)
  L2_362 = A0_360.getListPropertyName
  L2_362 = L2_362(A0_360)
  if L1_361 == 0 then
    return
  else
    for _FORV_6_ = 1, L1_361 do
      L1_361 = L1_361 - 1
      A0_360:deleteListProperty(L2_362, L1_361)
    end
    A0_360:updateListProperty(L2_362)
  end
end
function StatusWidget.getListBoxName(A0_363)
  local L1_364
  L1_364 = "ListBox_Important"
  return L1_364
end
function StatusWidget.getListBoxItemNum(A0_365)
  local L1_366, L2_367
  L2_367 = A0_365
  L1_366 = A0_365.getListPropertyCount
  return L1_366(L2_367, A0_365:getListPropertyName())
end
function StatusWidget.getListPropertyName(A0_368)
  local L1_369
  L1_369 = "Important_Maker"
  return L1_369
end
function StatusWidget.getListBoxFocusNum(A0_370)
  local L1_371, L2_372, L3_373, L4_374
  L2_372 = A0_370
  L1_371 = A0_370.getListBoxItemNum
  L1_371 = L1_371(L2_372)
  L3_373 = A0_370
  L2_372 = A0_370.getListPropertyName
  L2_372 = L2_372(L3_373)
  if L1_371 == 0 then
    L3_373 = 0
    L4_374 = 0
    return L3_373, L4_374, 0, 0
  end
  L4_374 = A0_370
  L3_373 = A0_370.getControlProperty
  L3_373 = L3_373(L4_374, L2_372, "FilteredCount")
  L4_374 = A0_370.work
  L4_374 = L4_374.focus
  if L3_373 < A0_370.work.focus then
    L4_374 = L3_373 - 1
  end
  return L3_373, L3_373 - 1, 0, L4_374
end
function StatusWidget.setItemToXml(A0_375, A1_376, A2_377, A3_378, A4_379)
  local L5_380, L6_381, L7_382, L8_383, L9_384, L10_385, L11_386
  L9_384 = worldMaster
  L10_385 = L9_384
  L9_384 = L9_384._getMyPlayer
  L9_384 = L9_384(L10_385)
  L10_385 = nil
  L11_386 = L9_384._getItem
  L11_386 = L11_386(L9_384, A3_378, A4_379)
  L10_385 = L11_386
  if L10_385 == nil then
    L11_386 = false
    return L11_386
  end
  L11_386 = desktopWidget
  L11_386 = L11_386.getPlayerItemInPackage
  L6_381, L7_382, L8_383, L11_386 = L11_386, A3_378, A4_379, L11_386(L11_386, A3_378, A4_379)
  L5_380 = L11_386
  L11_386 = L10_385._getNameIndex
  L11_386 = L11_386(L10_385)
  A0_375:setListProperty(A1_376, A2_377, "icon", L6_381)
  A0_375:setListProperty(A1_376, A2_377, "catalog", L5_380)
  if L7_382 == true then
    A0_375:setListText(A1_376, A2_377, "stack", 225, L8_383)
  else
    A0_375:setListProperty(A1_376, A2_377, "stack", "")
  end
  A0_375:setListText(A1_376, A2_377, "name", 3202, L5_380, L11_386)
  A0_375:setSortType(A1_376, A2_377, L10_385, 91)
  A0_375:setListPropertyVisibility(A1_376, A2_377, true)
  A0_375:setSortType(A1_376, A2_377, L10_385)
  return true
end
function StatusWidget.setSortType(A0_387, A1_388, A2_389, A3_390, A4_391)
  local L5_392, L6_393, L7_394, L8_395, L9_396
  L5_392 = worldMaster
  L6_393 = L5_392
  L5_392 = L5_392._getMyPlayer
  L5_392 = L5_392(L6_393)
  L6_393 = A3_390
  if A3_390 == nil then
    L8_395 = L5_392
    L7_394 = L5_392._getItem
    L9_396 = 101
    L7_394 = L7_394(L8_395, L9_396, A2_389 + 1)
    L6_393 = L7_394
  end
  if L6_393 == nil then
    L7_394 = false
    return L7_394
  end
  L7_394 = A4_391
  if L7_394 == 0 then
    L8_395 = "A"
    L9_396 = ""
    if A2_389 < 10 then
      L9_396 = "00"
    elseif A2_389 < 100 then
      L9_396 = "0"
    end
    A0_387:setListProperty(A1_388, A2_389, "sorttype", L8_395 .. L9_396 .. tostring(A2_389))
  elseif L7_394 == 91 then
    L8_395 = "A"
    L9_396 = ""
    if 10 > L6_393:_getCatalogID() then
      L9_396 = "000000000"
    elseif 100 > L6_393:_getCatalogID() then
      L9_396 = "00000000"
    elseif L6_393:_getCatalogID() < 1000 then
      L9_396 = "0000000"
    elseif L6_393:_getCatalogID() < 10000 then
      L9_396 = "000000"
    elseif L6_393:_getCatalogID() < 100000 then
      L9_396 = "00000"
    elseif L6_393:_getCatalogID() < 1000000 then
      L9_396 = "0000"
    elseif L6_393:_getCatalogID() < 10000000 then
      L9_396 = "000"
    elseif L6_393:_getCatalogID() < 100000000 then
      L9_396 = "00"
    elseif L6_393:_getCatalogID() < 1000000000 then
      L9_396 = "0"
    end
    A0_387:setListProperty(A1_388, A2_389, "sorttype", L8_395 .. L9_396 .. tostring(L6_393:_getCatalogID() * 10 + L6_393:_getNameIndex()))
  end
end
function StatusWidget.updateSortType(A0_397)
  local L1_398
  L1_398 = A0_397.getListPropertyName
  L1_398 = L1_398(A0_397)
  for _FORV_5_ = 1, A0_397:getListBoxItemNum() do
    A0_397:setSortType(_FORV_5_ - 1)
  end
  A0_397:updateListProperty(L1_398)
end
function StatusWidget.displayFocusedItemHelp(A0_399)
  local L1_400
  L1_400 = A0_399.getListBoxItemNum
  L1_400 = L1_400(A0_399)
  if L1_400 > 0 then
    L1_400 = A0_399.setVisibility
    L1_400(A0_399, "TextBlock_NoContents", false)
    L1_400 = A0_399.getListProperty
    L1_400 = L1_400(A0_399, A0_399:getListPropertyName(), A0_399.work.index, "catalog")
    A0_399:setWindowFocus(A0_399:getListBoxName())
    A0_399:setControlProperty(A0_399:getListBoxName(), "SqwtFocusedIndex", A0_399.work.focus)
    A0_399:setFocusedIndex(A0_399:getListBoxName(), A0_399.work.focus)
    A0_399:setText("TextBlock_Importanthelp", 3203, L1_400)
  else
    L1_400 = A0_399.setVisibility
    L1_400(A0_399, "TextBlock_NoContents", true)
    L1_400 = A0_399.setWindowFocus
    L1_400(A0_399, "TextBlock_NoContents")
  end
end
function StatusWidget.focusToIndex(A0_401, A1_402)
  local L2_403
  L2_403 = A0_401.getListPropertyName
  L2_403 = L2_403(A0_401)
  if A0_401:getListBoxFocusNum() == 0 or A1_402 >= A0_401:getListBoxFocusNum() then
    return -1
  else
    A0_401:setControlProperty(L2_403, "FilteredIndex", A1_402)
    return A0_401:getControlProperty(L2_403, "Index")
  end
end
function StatusWidget.previewAchievementTitle(A0_404, A1_405)
  A0_404:setText("TextBlock_PlayerName", 12034, A1_405)
end
function StatusWidget.setAchievementTitle(A0_406, A1_407)
  A0_406.work.newTitle = A1_407
end
