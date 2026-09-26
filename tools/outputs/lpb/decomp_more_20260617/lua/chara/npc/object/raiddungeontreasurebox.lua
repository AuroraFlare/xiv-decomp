require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonTreasureBox", "NpcBaseClass")
function RaidDungeonTreasureBox.processOpenDzemaelEpicQuestType(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6
  L3_3 = A0_0
  L2_2 = A0_0.getTempWork
  L4_4 = "dropID"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = true
  L5_5 = A1_1
  L4_4 = A1_1.getOfferingQuest
  L6_6 = 110868
  L4_4 = L4_4(L5_5, L6_6)
  if L4_4 ~= nil then
    L6_6 = L4_4
    L5_5 = L4_4.isDropDzemael
    L5_5 = L5_5(L6_6, A1_1)
    if L5_5 == true then
      L5_5 = {L6_6}
      L6_6 = {10011244, 1}
      L6_6 = A1_1._hasItem
      L6_6 = L6_6(A1_1, 1, L5_5)
      if L6_6 ~= true then
        L6_6 = A0_0.getDropItem
        L6_6 = L6_6(A0_0)
        L3_3 = false
        if A0_0:addDropItemForPlayer(A1_1, L6_6, 1, true) ~= #L6_6 then
        else
        end
      else
      end
    else
    end
  else
  end
  if L3_3 == true then
    L6_6 = A1_1
    L5_5 = A1_1.printSystemMessage
    L5_5(L6_6, 60027)
  end
  L6_6 = A0_0
  L5_5 = A0_0._runCharaScheduler
  L5_5(L6_6, A1_1, 67932160)
end
function RaidDungeonTreasureBox.getDropItem(A0_7)
  return A0_7:getDropItemDirect(A0_7.work.dropID)
end
function RaidDungeonTreasureBox.getDropItemDirect(A0_8, A1_9)
  local L2_10, L3_11, L4_12
  if A1_9 == 0 then
    L2_10 = nil
    return L2_10
  end
  L3_11 = A0_8
  L2_10 = A0_8.getDropData
  L4_12 = A1_9
  L2_10 = L2_10(L3_11, L4_12, 0)
  L4_12 = A0_8
  L3_11 = A0_8.getDropData
  L3_11 = L3_11(L4_12, A1_9, 1)
  L4_12 = A0_8.getDropData
  L4_12 = L4_12(A0_8, A1_9, 7)
  return L2_10, L3_11, L4_12
end
function RaidDungeonTreasureBox.getDropData(A0_13, A1_14, A2_15)
  local L3_16
  L3_16 = dropSheet
  L3_16 = L3_16._getData
  L3_16 = L3_16(L3_16, A1_14, A2_15)
  if A2_15 == 0 then
  elseif A2_15 == 1 then
  else
  end
  if A2_15 == 7 then
    return A0_13:getDropTable(L3_16)
  else
  end
  do return nil end
  return nil
end
function RaidDungeonTreasureBox.getDropTable(A0_17, A1_18)
  local L2_19, L3_20
  if A1_18 == 0 then
    L2_19 = nil
    return L2_19
  end
  L2_19 = dropTableSheet
  L3_20 = L2_19
  L2_19 = L2_19._getData
  L2_19 = L2_19(L3_20, A1_18, 0)
  L3_20 = {}
  if L2_19 == 0 then
    L3_20 = A0_17:getDropTableIndevidual(A1_18)
    break
  else
  end
  if L2_19 == 1 then
    L3_20 = A0_17:getDropTableSelectOne(A1_18)
    break
  else
  end
  do return nil end
  return L3_20
end
function RaidDungeonTreasureBox.getDropTableIndevidual(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
  L2_23 = {}
  L3_24 = 0
  L4_25 = true
  for L8_29 = 1, 8 do
    L3_24 = A0_21:addDropItemLocal(L2_23, L3_24, A1_22, L8_29, L4_25)
  end
  return L2_23
end
function RaidDungeonTreasureBox.getDropTableSelectOne(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35
  L2_32 = {}
  L3_33 = {}
  L4_34 = 0
  for _FORV_8_ = 1, 8 do
    L3_33[_FORV_8_] = dropTableSheet:_getData(A1_31, L4_34 + 3)
    L4_34 = L4_34 + 6
  end
  if L5_35 ~= nil then
    A0_30:addDropItemLocal(L2_32, 0, A1_31, L5_35, false)
  end
  return L2_32
end
function RaidDungeonTreasureBox.addDropItemLocal(A0_36, A1_37, A2_38, A3_39, A4_40, A5_41)
  local L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48
  L6_42 = false
  L7_43 = 0
  L9_45 = A0_36
  L8_44 = A0_36.getDropTableData2
  L10_46 = A3_39
  L11_47 = A4_40
  L12_48 = L8_44(L9_45, L10_46, L11_47)
  if L8_44 ~= nil and L8_44 > 1 then
    if A5_41 == true then
      L7_43 = math:_randomInteger(1, 100)
    else
      L9_45 = 100
    end
    if L7_43 <= L9_45 then
      A2_38 = A2_38 + 1
      A1_37[A2_38] = {
        L8_44,
        L10_46,
        L11_47,
        L12_48
      }
    end
  end
  return A2_38
end
function RaidDungeonTreasureBox.getDropTableData2(A0_49, A1_50, A2_51)
  local L3_52, L4_53, L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61
  L3_52 = A2_51 - 1
  L3_52 = L3_52 * 6
  L4_53 = dropTableSheet
  L5_54 = L4_53
  L4_53 = L4_53._getData
  L6_55 = A1_50
  L7_56 = L3_52 + 2
  L4_53 = L4_53(L5_54, L6_55, L7_56)
  L5_54 = dropTableSheet
  L6_55 = L5_54
  L5_54 = L5_54._getData
  L7_56 = A1_50
  L8_57 = L3_52 + 3
  L5_54 = L5_54(L6_55, L7_56, L8_57)
  L6_55 = dropTableSheet
  L7_56 = L6_55
  L6_55 = L6_55._getData
  L8_57 = A1_50
  L9_58 = L3_52 + 4
  L6_55 = L6_55(L7_56, L8_57, L9_58)
  L7_56 = dropTableSheet
  L8_57 = L7_56
  L7_56 = L7_56._getData
  L9_58 = A1_50
  L10_59 = L3_52 + 5
  L7_56 = L7_56(L8_57, L9_58, L10_59)
  L8_57 = dropTableSheet
  L9_58 = L8_57
  L8_57 = L8_57._getData
  L10_59 = A1_50
  L8_57 = L8_57(L9_58, L10_59, L11_60)
  L9_58 = dropTableSheet
  L10_59 = L9_58
  L9_58 = L9_58._getData
  L9_58 = L9_58(L10_59, L11_60, L12_61)
  if L4_53 == nil then
    return
  end
  if L5_54 == nil then
    return
  end
  if L6_55 == nil then
    return
  end
  if L7_56 == nil then
    return
  end
  if L8_57 < 1 then
    return
  end
  if L8_57 > L9_58 then
    return
  end
  L10_59 = {}
  for _FORV_14_ = 1, 4 do
    L10_59[_FORV_14_] = dropQualitySheet:_getData(L6_55, 0 + _FORV_14_ - 1)
  end
  if L11_60 == nil then
    return
  end
  return L4_53, L5_54, L7_56, L11_60, L12_61
end
function RaidDungeonTreasureBox.addDropItemForPlayer(A0_62, A1_63, A2_64, A3_65, A4_66)
  local L5_67, L6_68, L7_69, L8_70, L9_71, L10_72, L11_73, L12_74, L13_75
  if A2_64 == nil then
    L5_67 = 0
    return L5_67
  end
  L5_67 = 0
  for L9_71 = 1, #A2_64 do
    L10_72 = A2_64[L9_71]
    L10_72 = L10_72[1]
    L11_73 = A2_64[L9_71]
    L11_73 = L11_73[2]
    L12_74 = A2_64[L9_71]
    L12_74 = L12_74[3]
    L13_75 = A2_64[L9_71]
    L13_75 = L13_75[4]
    if L10_72 ~= 0 then
      if L11_73 == 0 then
        for _FORV_17_ = 1, L13_75 do
          if A0_62:canAddItemLocal(A1_63, A3_65, L10_72, L12_74, 1, A4_66) == true then
            A1_63:addItem(A3_65, L10_72, L12_74, 1)
          else
            L5_67 = L5_67 + 1
          end
        end
      elseif A0_62:canAddItemLocal(A1_63, A3_65, L10_72, L12_74, L13_75, A4_66) == true then
        A1_63:addItem(A3_65, L10_72, L12_74, L13_75)
      else
        L5_67 = L5_67 + 1
      end
    end
  end
  return L5_67
end
function RaidDungeonTreasureBox.canAddItemLocal(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81, A6_82)
  local L7_83
  L7_83 = A1_77._createItem
  L7_83 = L7_83(A1_77, A3_79, A5_81)
  if A4_80 ~= nil then
    L7_83:setSimpleQuality(A4_80)
  end
  if A1_77:_canAddItem(A2_78, L7_83) == false and A6_82 == true then
    A1_77:printSystemMessage(25262, L7_83)
  end
  return A1_77:_canAddItem(A2_78, L7_83)
end
function RaidDungeonTreasureBox.initForEvent(A0_84, A1_85)
  local L2_86
  L2_86 = A0_84.work
  L2_86._temp = {
    {
      "mapMarkerVisible",
      "boolean"
    }
  }
  L2_86 = A0_84.work
  L2_86.mapMarkerVisible = A1_85
end
function RaidDungeonTreasureBox.eventTalkStep0(A0_87)
  local L1_88
end
function RaidDungeonTreasureBox.isMapMarkerVisibleForTalkable(A0_89)
  return A0_89.work.mapMarkerVisible
end
