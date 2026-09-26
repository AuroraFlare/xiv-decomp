require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyOfficer", "NpcBaseClass")
function PopulaceCompanyOfficer.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 6797, "populaceCompanyOfficer")
  L1_1 = {
    {"townNumber", "integer8"},
    {
      "companyRank",
      "integer8"
    }
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500199 then
    A0_0.work.townNumber = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500200 then
    A0_0.work.townNumber = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1500198 then
    A0_0.work.townNumber = 3
    break
  else
  end
  A0_0.work.townNumber = 0
  do break end
  A0_0.work.companyRank = 33
  A0_0:_setGroundOn(false)
end
function PopulaceCompanyOfficer.eventTalkWelcome(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = 2
  L3_5 = 3
  L4_6 = worldMaster
  L4_6 = L4_6._getMyPlayer
  L4_6 = L4_6(L4_6)
  if A0_2:getActorClassId() == 1500199 then
    L2_4 = 2
    L3_5 = 3
    break
  else
  end
  if A0_2:getActorClassId() == 1500200 then
    L2_4 = 5
    L3_5 = 6
    break
  else
  end
  if A0_2:getActorClassId() == 1500198 then
    L2_4 = 8
    L3_5 = 9
    do break end
    break
  else
  end
  A0_2:startCliantTalkTurn(2, L4_6)
  A0_2:_runCharaScheduler(353959936)
  A0_2:say(A0_2, L2_4, 0)
  if A1_3 == true then
    A0_2:say(A0_2, L3_5, 0)
    if 0 < A0_2.work.townNumber then
      worldMaster:say(A0_2, 91, A0_2.work.townNumber)
    end
  end
  return 0
end
function PopulaceCompanyOfficer.eventTalkWelcomeQuest(A0_7)
  local L1_8, L2_9
  L1_8 = 4
  L2_9 = worldMaster
  L2_9 = L2_9._getMyPlayer
  L2_9 = L2_9(L2_9)
  if A0_7:getActorClassId() == 1500199 then
    L1_8 = 4
    break
  else
  end
  if A0_7:getActorClassId() == 1500200 then
    L1_8 = 7
    break
  else
  end
  if A0_7:getActorClassId() == 1500198 then
    L1_8 = 10
    do break end
    break
  else
  end
  A0_7:startCliantTalkTurn(2, L2_9)
  A0_7:_runCharaScheduler(353959936)
  A0_7:say(A0_7, L1_8, 0)
  return 0
end
function PopulaceCompanyOfficer.eventTalkPreJoin(A0_10)
  local L1_11, L2_12
  L1_11 = 11
  L2_12 = worldMaster
  L2_12 = L2_12._getMyPlayer
  L2_12 = L2_12(L2_12)
  if A0_10:getActorClassId() == 1500199 then
    L1_11 = 11
    break
  else
  end
  if A0_10:getActorClassId() == 1500200 then
    L1_11 = 12
    break
  else
  end
  if A0_10:getActorClassId() == 1500198 then
    L1_11 = 13
    do break end
    break
  else
  end
  A0_10:startCliantTalkTurn(2, L2_12)
  A0_10:_runCharaScheduler(353959936)
  A0_10:say(A0_10, L1_11, 0)
  return 0
end
function PopulaceCompanyOfficer.eventTalkExclusive(A0_13)
  local L1_14, L2_15
  L1_14 = 14
  L2_15 = worldMaster
  L2_15 = L2_15._getMyPlayer
  L2_15 = L2_15(L2_15)
  if A0_13:getActorClassId() == 1500199 then
    L1_14 = 14
    break
  else
  end
  if A0_13:getActorClassId() == 1500200 then
    L1_14 = 15
    break
  else
  end
  if A0_13:getActorClassId() == 1500198 then
    L1_14 = 16
    do break end
    break
  else
  end
  A0_13:startCliantTalkTurn(2, L2_15)
  A0_13:_runCharaScheduler(353959936)
  A0_13:say(A0_13, L1_14, 0)
  return 0
end
function PopulaceCompanyOfficer.eventTalkJoinedOnly(A0_16)
  local L1_17, L2_18, L3_19
  L1_17 = 17
  L2_18 = worldMaster
  L3_19 = L2_18
  L2_18 = L2_18._getMyPlayer
  L2_18 = L2_18(L3_19)
  L3_19 = A0_16.getActorClassId
  L3_19 = L3_19(A0_16)
  if L3_19 == 1500199 then
    L1_17 = 17
    break
  else
  end
  if L3_19 == 1500200 then
    L1_17 = 18
    break
  else
  end
  if L3_19 == 1500198 then
    L1_17 = 19
    do break end
    break
  else
  end
  L3_19 = A0_16.startCliantTalkTurn
  L3_19(A0_16, 2, L2_18)
  L3_19 = A0_16.doSalute
  L3_19 = L3_19(A0_16, A0_16.work.townNumber, A0_16.work.companyRank)
  A0_16:say(A0_16, L1_17, 0)
  if L3_19 ~= 0 then
    A0_16:_waitForCharaSchedulerFinished(L3_19)
  end
end
function PopulaceCompanyOfficer.eventTalkJoined(A0_20, A1_21, A2_22, A3_23, A4_24)
  local L5_25, L6_26, L7_27, L8_28
  L5_25 = 27
  L6_26 = worldMaster
  L7_27 = L6_26
  L6_26 = L6_26._getMyPlayer
  L6_26 = L6_26(L7_27)
  L8_28 = A0_20
  L7_27 = A0_20.getActorClassId
  L7_27 = L7_27(L8_28)
  if L7_27 == 1500199 then
    L5_25 = 27
    break
  else
  end
  if L7_27 == 1500200 then
    L5_25 = 28
    break
  else
  end
  if L7_27 == 1500198 then
    L5_25 = 29
    do break end
    break
  else
  end
  L8_28 = A0_20
  L7_27 = A0_20.startCliantTalkTurn
  L7_27(L8_28, 2, L6_26)
  L8_28 = A0_20
  L7_27 = A0_20.doSalute
  L7_27 = L7_27(L8_28, A0_20.work.townNumber, A0_20.work.companyRank)
  L8_28 = A0_20.say
  L8_28(A0_20, A0_20, L5_25, 0)
  if L7_27 ~= 0 then
    L8_28 = A0_20._waitForCharaSchedulerFinished
    L8_28(A0_20, L7_27)
  end
  L8_28 = 0
  repeat
    L8_28 = worldMaster:askMultipleTextMacro(A0_20, A0_20, 3, 66, 3, 0, A4_24, true, true)
    if L8_28 == 1 then
      if A0_20:eventRankUpChoice(A1_21, A2_22, A3_23) == true then
        return L8_28
      end
    elseif L8_28 == 2 then
      A0_20:eventInformationRankUp(A1_21, A2_22)
    else
      return 0
    end
  until L8_28 < 1
  return 0
end
function PopulaceCompanyOfficer.eventInformationRankUp(A0_29, A1_30, A2_31)
  local L3_32, L4_33, L5_34
  L3_32 = 45
  L4_33 = 46
  L5_34 = 48
  if A0_29:getActorClassId() == 1500199 then
    L3_32 = 45
    L4_33 = 46
    L5_34 = 48
    break
  else
  end
  if A0_29:getActorClassId() == 1500200 then
    L3_32 = 49
    L4_33 = 50
    L5_34 = 52
    break
  else
  end
  if A0_29:getActorClassId() == 1500198 then
    L3_32 = 53
    L4_33 = 54
    L5_34 = 56
    do break end
    break
  else
  end
  A0_29:_runCharaScheduler(353959936)
  A0_29:say(A0_29, L3_32, 0, A2_31, A1_30)
  A0_29:_runCharaScheduler(353976320)
  A0_29:say(A0_29, L4_33, 0)
  A0_29:_runCharaScheduler(353959936)
  A0_29:say(A0_29, L5_34, 0)
end
function PopulaceCompanyOfficer.eventRankUpChoice(A0_35, A1_36, A2_37, A3_38)
  local L4_39, L5_40, L6_41, L7_42, L8_43, L9_44
  L4_39 = 30
  L5_40 = 39
  L6_41 = 42
  L7_42 = worldMaster
  L8_43 = L7_42
  L7_42 = L7_42._getMyPlayer
  L7_42 = L7_42(L8_43)
  L9_44 = A0_35
  L8_43 = A0_35.getActorClassId
  L8_43 = L8_43(L9_44)
  if L8_43 == 1500199 then
    L4_39 = 30
    L6_41 = 42
    L5_40 = 39
    break
  else
  end
  if L8_43 == 1500200 then
    L4_39 = 31
    L6_41 = 43
    L5_40 = 40
    break
  else
  end
  if L8_43 == 1500198 then
    L4_39 = 32
    L6_41 = 44
    L5_40 = 41
    do break end
    break
  else
  end
  L9_44 = A0_35
  L8_43 = A0_35._runCharaScheduler
  L8_43(L9_44, 353959936)
  L9_44 = A0_35
  L8_43 = A0_35.say
  L8_43(L9_44, A0_35, L4_39, 0, 0, A1_36)
  L9_44 = L7_42
  L8_43 = L7_42._getBelongGrandCompany
  L8_43 = L8_43(L9_44)
  L9_44 = L7_42.getGrandCompanySealCount
  L9_44 = L9_44(L7_42, L8_43)
  if worldMaster:askMultipleTextMacro(A0_35, A0_35, 2, 70, 2, 1, true, true, 0, A1_36, L9_44, L8_43, 0, 0) == 1 then
    if A3_38 == true then
      return true
    else
      A0_35:_runCharaScheduler(353959936)
      A0_35:say(A0_35, L5_40, 0)
    end
  else
    A0_35:_runCharaScheduler(354041856)
    A0_35:say(A0_35, L6_41, 0)
  end
  return false
end
function PopulaceCompanyOfficer.eventDoRankUp(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50
  L3_48 = 33
  L4_49 = 34
  L5_50 = 84090880
  if A0_45:getActorClassId() == 1500199 then
    L3_48 = 33
    L4_49 = 34
    L5_50 = 84090880
    break
  else
  end
  if A0_45:getActorClassId() == 1500200 then
    L3_48 = 35
    L4_49 = 36
    L5_50 = 84094976
    break
  else
  end
  if A0_45:getActorClassId() == 1500198 then
    L3_48 = 37
    L4_49 = 38
    L5_50 = 84099072
    do break end
    break
  else
  end
  A0_45:_runCharaScheduler(353959936)
  A0_45:say(A0_45, L3_48, 0)
  A0_45:_runCharaScheduler(L5_50)
  A0_45:say(A0_45, L4_49, 0, A2_47)
  A0_45:_waitForCharaSchedulerFinished(L5_50)
  desktopWidget:openGrandCompanyJoinEffectWidget(A0_45.work.townNumber, A2_47)
  A0_45:_wait(4.7)
  desktopWidget:openGrandCompanyStatusWidgetYield(A0_45.work.townNumber)
  desktopWidget:setGrandCompanyStatusWidgetJoinStatus(A1_46)
  A0_45:_wait(2.7)
end
function PopulaceCompanyOfficer.eventRankUpDone(A0_51, A1_52, A2_53)
  local L3_54
  L3_54 = 84090880
  if A0_51:getActorClassId() == 1500199 then
    L3_54 = 84090880
    break
  else
  end
  if A0_51:getActorClassId() == 1500200 then
    L3_54 = 84094976
    break
  else
  end
  if A0_51:getActorClassId() == 1500198 then
    L3_54 = 84099072
    do break end
    break
  else
  end
  desktopWidget:setGrandCompanyStatusWidgetJoinStatus(A1_52)
  desktopWidget:setGrandCompanyStatusWidgetPoint(A2_53)
  A0_51:_wait(2)
  worldMaster:_getMyPlayer():_runCharaScheduler(L3_54)
  worldMaster:_getMyPlayer():_waitForCharaSchedulerFinished(L3_54)
  A0_51:finishCliantTalkTurn()
  desktopWidget:closeGrandCompanyStatusWidget()
end
function PopulaceCompanyOfficer.eventRankCategoryUpBefore(A0_55, A1_56)
  local L2_57, L3_58, L4_59, L5_60
  L2_57 = 57
  L3_58 = 0
  L4_59 = 58
  L5_60 = 73
  if A0_55:getActorClassId() == 1500199 then
    if A1_56 == 21 then
      L2_57 = 57
      L5_60 = 73
      L4_59 = 58
    else
      if A1_56 == 31 then
        L2_57 = 92
        L3_58 = 93
        L5_60 = 94
        L4_59 = 58
        do break end
        else
        end
        if A0_55:getActorClassId() == 1500200 then
          if A1_56 == 21 then
            L2_57 = 59
            L5_60 = 74
            L4_59 = 60
          else
            if A1_56 == 31 then
              L2_57 = 95
              L3_58 = 96
              L5_60 = 97
              L4_59 = 60
              do break end
              else
              end
              if A0_55:getActorClassId() == 1500198 then
                if A1_56 == 21 then
                  L2_57 = 61
                  L5_60 = 75
                  L4_59 = 62
                else
                  if A1_56 == 31 then
                    L2_57 = 98
                    L3_58 = 99
                    L5_60 = 100
                    L4_59 = 62
                  else
                  end
                end
              else
              end
            else
            end
          end
      else
      end
    end
  A0_55:_runCharaScheduler(354086912)
  A0_55:say(A0_55, L2_57, 0)
  if L3_58 ~= 0 then
    A0_55:say(A0_55, L3_58, 0)
  end
  worldMaster:say(A0_55, L5_60)
  A0_55:_runCharaScheduler(68378624)
  A0_55:say(A0_55, L4_59, 0)
end
function PopulaceCompanyOfficer.eventRankCategoryUpAfter(A0_61)
  local L1_62
  L1_62 = 63
  if A0_61:getActorClassId() == 1500199 then
    L1_62 = 63
    break
  else
  end
  if A0_61:getActorClassId() == 1500200 then
    L1_62 = 64
    break
  else
  end
  if A0_61:getActorClassId() == 1500198 then
    L1_62 = 65
    do break end
    break
  else
  end
  A0_61:_runCharaScheduler(70803456)
  A0_61:say(A0_61, L1_62, 0)
end
function PopulaceCompanyOfficer.eventTalkQuestUncomplete(A0_63)
  local L1_64, L2_65
  L1_64 = 101
  L2_65 = 102
  if A0_63:getActorClassId() == 1500199 then
    L1_64 = 101
    L2_65 = 102
    break
  else
  end
  if A0_63:getActorClassId() == 1500200 then
    L1_64 = 103
    L2_65 = 102
    break
  else
  end
  if A0_63:getActorClassId() == 1500198 then
    L1_64 = 104
    L2_65 = 102
    do break end
    break
  else
  end
  A0_63:_runCharaScheduler(83984384)
  A0_63:say(A0_63, L1_64, 0)
  worldMaster:say(A0_63, L2_65)
end
function PopulaceCompanyOfficer.eventTalkFestival(A0_66)
  local L1_67, L2_68
  L1_67 = 20
  L2_68 = worldMaster
  L2_68 = L2_68._getMyPlayer
  L2_68 = L2_68(L2_68)
  if A0_66:getActorClassId() == 1500199 then
    L1_67 = 20
    break
  else
  end
  if A0_66:getActorClassId() == 1500200 then
    L1_67 = 21
    break
  else
  end
  if A0_66:getActorClassId() == 1500198 then
    L1_67 = 22
    do break end
    break
  else
  end
  A0_66:startCliantTalkTurn(2, L2_68)
  A0_66:_runCharaScheduler(353959936)
  A0_66:say(A0_66, L1_67, 0)
  return 0
end
function PopulaceCompanyOfficer.eventTalkFestival2(A0_69)
  local L1_70, L2_71
  L1_70 = 24
  L2_71 = worldMaster
  L2_71 = L2_71._getMyPlayer
  L2_71 = L2_71(L2_71)
  if A0_69:getActorClassId() == 1500199 then
    L1_70 = 24
    break
  else
  end
  if A0_69:getActorClassId() == 1500200 then
    L1_70 = 25
    break
  else
  end
  if A0_69:getActorClassId() == 1500198 then
    L1_70 = 26
    do break end
    break
  else
  end
  A0_69:startCliantTalkTurn(2, L2_71)
  A0_69:_runCharaScheduler(353959936)
  A0_69:say(A0_69, L1_70, 0)
  return 0
end
function PopulaceCompanyOfficer.eventTalkFestival2012(A0_72, A1_73)
  local L2_74, L3_75
  L2_74 = 20
  L3_75 = worldMaster
  L3_75 = L3_75._getMyPlayer
  L3_75 = L3_75(L3_75)
  if A0_72:getActorClassId() == 1500199 then
    L2_74 = 105
    break
  else
  end
  if A0_72:getActorClassId() == 1500200 then
    L2_74 = 106
    break
  else
  end
  if A0_72:getActorClassId() == 1500198 then
    L2_74 = 107
    do break end
    break
  else
  end
  A0_72:startCliantTalkTurn(2, L3_75)
  A0_72:_runCharaScheduler(353959936)
  A0_72:say(A0_72, L2_74, 0, A1_73)
  return 0
end
function PopulaceCompanyOfficer.eventTalkStepBreak(A0_76)
  A0_76:finishCliantTalkTurn()
  return 0
end
