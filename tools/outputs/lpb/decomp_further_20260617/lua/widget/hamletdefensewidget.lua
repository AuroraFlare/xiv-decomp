require("/Widget/WidgetBaseClass")
_defineClass("HamletDefenseWidget", "WidgetBaseClass")
function HamletDefenseWidget.init(A0_0)
  A0_0.work._temp = {
    {"contentId", "integer32"},
    {"hamletRank", "integer32"},
    {
      "hasGatheringItem",
      "array",
      9,
      "integer8"
    },
    {
      "defenseLineStatus",
      "array",
      3,
      "integer8"
    },
    {
      "goodsStatus",
      "array",
      4,
      "integer8"
    },
    {
      "goodsKindTarget",
      "integer8"
    },
    {"bossStatus", "boolean"},
    {
      "armyBuff",
      "array",
      3,
      "integer8"
    },
    {
      "enemyBuff",
      "array",
      3,
      "integer8"
    }
  }
  A0_0.work.contentId = -1
  A0_0.work.hamletRank = -1
  for _FORV_4_ = 1, 9 do
    A0_0.work.hasGatheringItem[_FORV_4_] = -1
  end
  for _FORV_4_ = 1, 3 do
    A0_0.work.defenseLineStatus[_FORV_4_] = -1
  end
  for _FORV_4_ = 1, 4 do
    A0_0.work.goodsStatus[_FORV_4_] = -1
  end
  _FOR_.goodsKindTarget = -1
  A0_0.work.bossStatus = false
  for _FORV_4_ = 1, 3 do
    A0_0.work.armyBuff[_FORV_4_] = -1
  end
  for _FORV_4_ = 1, 3 do
    A0_0.work.enemyBuff[_FORV_4_] = -1
  end
  _FOR_(_FOR_)
  A0_0:initTimer()
  A0_0:initDefenseLineStatus()
  A0_0:initGoodsStatus()
  A0_0:initArmyBuff()
  A0_0:initEnemyBuff()
  A0_0:initGatheringItem()
end
function HamletDefenseWidget.processTimer(A0_1)
  desktopWidget:closeWidgetDirect(A0_1)
end
function HamletDefenseWidget.cmdShow(A0_2)
  A0_2:show()
end
function HamletDefenseWidget.initTitle(A0_3, A1_4, A2_5)
end
function HamletDefenseWidget.cmdSetTitle(A0_6, A1_7, A2_8)
  if A1_7 ~= A0_6.work.contentId then
    if A1_7 == 8 then
      A0_6:setTitleIcon(988, 991, 994)
      break
    else
    end
    if A1_7 == 9 then
      A0_6:setTitleIcon(989, 992, 995)
      break
    else
    end
    if A1_7 == 10 then
      A0_6:setTitleIcon(990, 993, 996)
      break
    else
    end
  end
  if A2_8 ~= A0_6.work.hamletRank then
    A0_6.work.hamletRank = A2_8
  end
  if true then
    A0_6:setText("TextBlock_ContentsName", 13012, A1_7, A2_8)
  end
end
function HamletDefenseWidget.setTitleIcon(A0_9, A1_10, A2_11, A3_12)
  local L4_13, L5_14
  L5_14 = A0_9
  L4_13 = A0_9.setIcon
  L4_13(L5_14, "IconControl_ArmyFlag", A1_10)
  L5_14 = A0_9
  L4_13 = A0_9.getTemplateControlName
  L4_13 = L4_13(L5_14, "Label_EnemyForces", "IconControl_EnemyForces")
  L5_14 = A0_9.setIcon
  L5_14(A0_9, L4_13, A2_11)
  L5_14 = A0_9.getTemplateControlName
  L5_14 = L5_14(A0_9, "Label_EnemyForces", "IconControl_EnemyForces_Effect")
  A0_9:setIcon(L5_14, A3_12)
end
function HamletDefenseWidget.initTimer(A0_15)
  local L1_16, L2_17
  L2_17 = A0_15
  L1_16 = A0_15.cmdSetTimer
  L1_16(L2_17, worldMaster:_getServerTime())
end
function HamletDefenseWidget.cmdSetTimer(A0_18, A1_19)
  local L2_20, L3_21, L4_22
  L2_20 = worldMaster
  L3_21 = L2_20
  L2_20 = L2_20._getServerTime
  L2_20 = L2_20(L3_21)
  L2_20 = A1_19 - L2_20
  L3_21 = 0
  L4_22 = 300
  A0_18:setCustomTimerProperty("IntData.Value0", 1)
  A0_18:setCustomTimerProperty("FloatData.Value0", L2_20)
  A0_18:setCustomTimerProperty("FloatData.Value1", L3_21)
  A0_18:setCustomTimerProperty("FloatData.Value2", L4_22)
  A0_18:setCustomTimerProperty("IntData.Value1", 300)
  A0_18:setCustomTimerProperty("IntData.Value2", 120)
end
function HamletDefenseWidget.setCustomTimerProperty(A0_23, A1_24, A2_25)
  A0_23:setControlProperty("CustomControl_TimerLabel", A1_24, A2_25)
end
function HamletDefenseWidget.initDefenseLineStatus(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  for L4_30 = 1, 3 do
    A0_26:cmdSetDefenseLineStatus(L4_30, 1)
  end
end
function HamletDefenseWidget.cmdSetDefenseLineStatus(A0_31, A1_32, A2_33)
  local L3_34, L4_35
  L3_34 = A0_31.work
  L3_34 = L3_34.defenseLineStatus
  L3_34 = L3_34[A1_32]
  if L3_34 == A2_33 then
    return
  end
  L4_35 = A0_31
  L3_34 = A0_31.getIndexControlName
  L3_34 = L3_34(L4_35, "Label_LineOfDefense_", A1_32)
  L4_35 = nil
  if A2_33 == 1 then
    L4_35 = "UILuaCommands.StatusNormal"
    break
  else
  end
  if A2_33 == 2 then
    L4_35 = "UILuaCommands.StatusDanger"
    break
  else
  end
  if A2_33 == 3 then
    L4_35 = "UILuaCommands.LineOfDefenseFall"
    do break end
    break
  else
  end
  A0_31:sendControlCommand(L3_34, L4_35)
  A0_31.work.defenseLineStatus[A1_32] = A2_33
end
function HamletDefenseWidget.cmdSetWarPotentialValue(A0_36, A1_37, A2_38)
  if A0_36:isShow() then
    A0_36:setMaximum("ProgressBar_WarPotential", A2_38)
    A0_36:setValue("ProgressBar_WarPotential", A1_37)
    A0_36:sendControlCommand("ProgressBar_WarPotential", "UILuaCommands.StartTargetHp")
  else
    A0_36:sendControlCommand("ProgressBar_WarPotential", "UILuaCommands.StopTargetHp")
    A0_36:setMaximum("ProgressBar_WarPotential:StatusBar", A2_38)
    A0_36:setValue("ProgressBar_WarPotential:StatusBar", A1_37)
  end
end
function HamletDefenseWidget.initGoodsStatus(A0_39)
  local L1_40, L2_41, L3_42, L4_43
  for L4_43 = 1, 4 do
    A0_39:cmdSetGoodsStatus(L4_43, 1)
  end
  L1_40(L2_41)
  L1_40(L2_41, L3_42)
end
function HamletDefenseWidget.cmdSetGoodsStatus(A0_44, A1_45, A2_46)
  local L3_47, L4_48
  L3_47 = A0_44.work
  L3_47 = L3_47.goodsStatus
  L3_47 = L3_47[A1_45]
  if L3_47 == A2_46 then
    return
  end
  L4_48 = A0_44
  L3_47 = A0_44.getIndexControlName
  L3_47 = L3_47(L4_48, "Label_Goods_", A1_45)
  L4_48 = nil
  if A2_46 == 1 then
    L4_48 = "UILuaCommands.StatusNormal"
    break
  else
  end
  if A2_46 == 2 then
    L4_48 = "UILuaCommands.StatusDanger"
    break
  else
  end
  if A2_46 == 3 then
    L4_48 = "UILuaCommands.GoodsLost"
    break
  else
  end
  A0_44:sendControlCommand(L3_47, L4_48)
  A0_44.work.goodsStatus[A1_45] = A2_46
end
function HamletDefenseWidget.cmdSetBossStatus(A0_49, A1_50)
  local L2_51
  L2_51 = A0_49.work
  L2_51 = L2_51.bossStatus
  if L2_51 == A1_50 then
    return A1_50
  end
  L2_51 = nil
  if A1_50 == true then
    L2_51 = "UILuaCommands.BossPopEffectOn"
  else
    L2_51 = "UILuaCommands.BossPopEffectOff"
  end
  A0_49:sendControlCommand("Label_EnemyForces", L2_51)
  A0_49.work.bossStatus = A1_50
end
function HamletDefenseWidget.cmdSetTargetGoods(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59
  if A1_53 == nil then
    A1_53 = 0
  end
  if L2_54 == A1_53 then
    return
  end
  for L5_57 = 1, 4 do
    L6_58 = nil
    if L5_57 == A1_53 then
      L6_58 = "UILuaCommands.GoodsTargetOn"
    else
      L6_58 = "UILuaCommands.GoodsTargetOff"
    end
    L7_59 = A0_52.getIndexControlName
    L7_59 = L7_59(A0_52, "Label_Goods_", L5_57)
    A0_52:sendControlCommand(L7_59, L6_58)
  end
  L2_54.goodsKindTarget = A1_53
end
function HamletDefenseWidget.initArmyBuff(A0_60)
  local L1_61, L2_62, L3_63, L4_64
  for L4_64 = 1, 3 do
    A0_60:cmdSetArmyBuff(L4_64, 2, 0)
  end
end
function HamletDefenseWidget.cmdSetArmyBuff(A0_65, A1_66, A2_67, A3_68)
  local L4_69, L5_70, L6_71, L7_72
  L4_69 = A0_65.work
  L4_69 = L4_69.armyBuff
  L4_69 = L4_69[A1_66]
  if L4_69 == A2_67 then
    return
  end
  L5_70 = A0_65
  L4_69 = A0_65.getIndexControlName
  L6_71 = "Label_ArmyBuff_"
  L7_72 = A1_66
  L4_69 = L4_69(L5_70, L6_71, L7_72)
  L6_71 = A0_65
  L5_70 = A0_65.getTemplateControlName
  L7_72 = L4_69
  L5_70 = L5_70(L6_71, L7_72, "IconControl_Buff")
  L6_71 = 0
  L7_72 = nil
  if A1_66 == 1 then
    if A2_67 == 1 then
      L6_71 = 1014
      L7_72 = "UILuaCommands.BuffDown"
    else
      if A2_67 == 3 then
        L6_71 = 1013
        L7_72 = "UILuaCommands.BuffUp"
        do break end
        else
        end
        if A1_66 == 2 then
          if A2_67 == 1 then
            L6_71 = 1016
            L7_72 = "UILuaCommands.BuffDown"
          else
            if A2_67 == 3 then
              L6_71 = 1018
              L7_72 = "UILuaCommands.BuffUp"
              do break end
              else
              end
              if A1_66 == 3 and A2_67 ~= 2 then
                L6_71 = 1017
              else
              end
            else
            end
          end
      else
      end
    end
  A0_65:setBuffIcon(L5_70, L6_71)
  if L7_72 ~= nil then
    A0_65:sendControlCommand(L4_69, L7_72)
  end
  A0_65.work.armyBuff[A1_66] = A2_67
end
function HamletDefenseWidget.initEnemyBuff(A0_73)
  local L1_74, L2_75, L3_76, L4_77
  for L4_77 = 1, 3 do
    A0_73:cmdSetEnemyBuff(L4_77, 2, 0)
  end
end
function HamletDefenseWidget.cmdSetEnemyBuff(A0_78, A1_79, A2_80, A3_81)
  local L4_82, L5_83, L6_84, L7_85
  L4_82 = A0_78.work
  L4_82 = L4_82.enemyBuff
  L4_82 = L4_82[A1_79]
  if L4_82 == A2_80 then
    return
  end
  L5_83 = A0_78
  L4_82 = A0_78.getIndexControlName
  L6_84 = "Label_EnemyBuff_"
  L7_85 = A1_79
  L4_82 = L4_82(L5_83, L6_84, L7_85)
  L6_84 = A0_78
  L5_83 = A0_78.getTemplateControlName
  L7_85 = L4_82
  L5_83 = L5_83(L6_84, L7_85, "IconControl_Buff")
  L6_84 = 0
  L7_85 = nil
  if A1_79 == 1 then
    if A2_80 == 1 then
      L6_84 = 1019
      L7_85 = "UILuaCommands.BuffDown"
    else
      if A2_80 == 3 then
        L6_84 = 1018
        L7_85 = "UILuaCommands.BuffUp"
        do break end
        else
        end
        if A1_79 == 2 then
          if A2_80 == 1 then
            L6_84 = 1091
            L7_85 = "UILuaCommands.BuffDown"
          else
            if A2_80 == 3 then
              L6_84 = 1020
              L7_85 = "UILuaCommands.BuffUp"
              do break end
              else
              end
              if A1_79 == 3 and A2_80 ~= 2 then
                L6_84 = 1022
              else
              end
            else
            end
          end
      else
      end
    end
  A0_78:setBuffIcon(L5_83, L6_84)
  if L7_85 ~= nil then
    A0_78:sendControlCommand(L4_82, L7_85)
  end
  A0_78.work.enemyBuff[A1_79] = A2_80
end
function HamletDefenseWidget.setBuffIcon(A0_86, A1_87, A2_88)
  if A2_88 > 0 then
    A0_86:setIcon(A1_87, A2_88)
    A0_86:setVisibility(A1_87, true)
  else
    A0_86:setVisibility(A1_87, false)
  end
end
function HamletDefenseWidget.initGatheringItem(A0_89)
  local L1_90, L2_91, L3_92, L4_93
  for L4_93 = 1, 9 do
    A0_89:setGatheringItem(L4_93, 0)
  end
  for L4_93 = 1, 4 do
    A0_89:setBingoReachEffect(L4_93, false)
  end
end
function HamletDefenseWidget.cmdSetGatheringItem(A0_94, A1_95)
  A0_94:setGatheringItem(A1_95, 1)
end
function HamletDefenseWidget.cmdResetGatheringItem(A0_96)
  local L1_97, L2_98, L3_99, L4_100, L5_101
  L1_97 = 0
  for L5_101 = 1, 4 do
    if A0_96:countGatheringItemInBingoLabel(L5_101) == 3 then
      L1_97 = L5_101
      break
    end
  end
  L2_98(L3_99)
  if L1_97 > 0 then
    L2_98(L3_99, L4_100)
  end
end
function HamletDefenseWidget.setGatheringItem(A0_102, A1_103, A2_104)
  local L3_105, L4_106, L5_107, L6_108, L7_109
  L3_105 = A0_102.work
  L3_105 = L3_105.hasGatheringItem
  L3_105 = L3_105[A1_103]
  if L3_105 == A2_104 then
    L3_105 = false
    return L3_105
  end
  L3_105 = A0_102.getGatheringItemName
  L3_105 = L3_105(L4_106, L5_107)
  if A2_104 == 1 then
    L7_109 = true
    L4_106(L5_107, L6_108, L7_109)
  else
    L7_109 = false
    L4_106(L5_107, L6_108, L7_109)
  end
  L4_106[A1_103] = A2_104
  for L7_109 = 1, 4 do
    if A0_102:countGatheringItemInBingoLabel(L7_109) >= 2 then
      A0_102:setBingoReachEffect(L7_109, true)
    end
  end
  return L4_106
end
function HamletDefenseWidget.countGatheringItemInBingoLabel(A0_110, A1_111)
  for _FORV_7_ = 1, #A0_110:getBingoItemIndexTable(A1_111) do
  end
  return 0 + 1
end
function HamletDefenseWidget.setBingoReachEffect(A0_112, A1_113, A2_114)
  local L3_115
  L3_115 = A0_112.getIndexControlName
  L3_115 = L3_115(A0_112, "Label_Bar_", A1_113)
  if A2_114 then
    A0_112:sendControlCommand(A0_112:getBingoLabelName(A1_113), "UILuaCommands.BarReachEffectOn")
    for _FORV_8_ = 1, #A0_112:getBingoItemIndexTable(A1_113) do
      A0_112:sendControlCommand(A0_112:getGatheringItemName(A0_112:getBingoItemIndexTable(A1_113)[_FORV_8_]), "UILuaCommands.IconReachEffectOn")
    end
  else
    A0_112:sendControlCommand(L3_115, "UILuaCommands.BarReachEffectOff")
    for _FORV_8_ = 1, #A0_112:getBingoItemIndexTable(A1_113) do
      A0_112:sendControlCommand(A0_112:getGatheringItemName(A0_112:getBingoItemIndexTable(A1_113)[_FORV_8_]), "UILuaCommands.IconReachEffectOff")
    end
  end
end
function HamletDefenseWidget.setBingoEffect(A0_116, A1_117)
  local L2_118, L3_119, L4_120, L5_121, L6_122, L7_123, L8_124
  L3_119 = A0_116
  L2_118 = A0_116.getIndexControlName
  L2_118 = L2_118(L3_119, L4_120, L5_121)
  L3_119 = A0_116.getBingoItemIndexTable
  L3_119 = L3_119(L4_120, L5_121)
  L7_123 = A0_116
  L8_124 = A1_117
  L7_123 = "UILuaCommands.BarActivatedEffectStart"
  L4_120(L5_121, L6_122, L7_123)
  for L7_123 = 1, #L3_119 do
    L8_124 = A0_116.getGatheringItemName
    L8_124 = L8_124(A0_116, L3_119[L7_123])
    A0_116:setVisibility(L8_124, true)
    A0_116:sendControlCommand(L8_124, "UILuaCommands.IconActivatedEffectStart")
  end
end
function HamletDefenseWidget.getBingoItemIndexTable(A0_125, A1_126)
  return ({
    {
      1,
      2,
      3
    },
    {
      4,
      5,
      6
    },
    {
      7,
      8,
      9
    },
    {
      1,
      4,
      7
    }
  })[A1_126]
end
function HamletDefenseWidget.getGatheringItemName(A0_127, A1_128)
  local L2_129
  L2_129 = A0_127.getIndexControlName
  L2_129 = L2_129(A0_127, "Label_GatheringItem_", A1_128)
  return (A0_127:getTemplateControlName(L2_129, "IconControl_GatheringItem"))
end
function HamletDefenseWidget.getBingoLabelName(A0_130, A1_131)
  return A0_130:getIndexControlName("Label_Bar_", A1_131)
end
function HamletDefenseWidget.getTemplateControlName(A0_132, A1_133, A2_134)
  return A1_133 .. ":" .. A2_134
end
function HamletDefenseWidget.getIndexControlName(A0_135, A1_136, A2_137)
  return A1_136 .. tostring(A2_137)
end
