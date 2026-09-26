require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceRetainerManager", "NpcBaseClass")
function PopulaceRetainerManager.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(545, "populaceRetainerManager")
  A0_0:_setGroundOn(false)
end
function PopulaceRetainerManager.eventTalkStep1(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6
  L2_3 = 1
  L3_4 = 0
  L4_5 = 1
  L5_6 = worldMaster
  L5_6 = L5_6._getMyPlayer
  L5_6 = L5_6(L5_6)
  if L5_6 ~= nil then
    A0_1:startCliantTalkTurn(2, L5_6)
  end
  if A1_2 == true then
    L4_5 = 1
  else
    L4_5 = 2
  end
  repeat
    if L4_5 == 1 then
      L3_4 = A0_1:eventTalkStep11()
      if L3_4 == 1 then
        L4_5 = 3
      else
        L4_5 = -1
        do break end
        else
        end
        if L4_5 == 2 then
          A0_1:eventTalkStep12()
        else
        end
        if L4_5 == 21 then
          L3_4 = A0_1:eventTalkStep121()
          if L3_4 == 1 then
            L4_5 = 22
          elseif L3_4 == 2 then
            L3_4 = 1
            L4_5 = 0
          else
            L4_5 = -1
            do break end
            else
            end
            if L4_5 == 22 then
              L3_4 = 1
              L3_4 = A0_1:eventTalkStep14(L3_4)
              if L3_4 < 1 then
                L4_5 = -1
              elseif L3_4 < 4 then
                L4_5 = 22
              else
                L4_5 = 21
                do break end
                else
                end
                if L4_5 == 3 then
                  if A1_2 == true then
                    L2_3 = 1
                  else
                    L2_3 = 2
                  end
                  L3_4 = A0_1:eventTalkStep13(L2_3)
                  if L3_4 == 1 then
                    L4_5 = 4
                  else
                    L3_4 = 1
                    L4_5 = 0
                    do break end
                    else
                    end
                    if L4_5 == 4 then
                      L3_4 = 1
                      L3_4 = A0_1:eventTalkStep14(L3_4)
                      if L3_4 < 1 then
                        L4_5 = -1
                      elseif L3_4 < 4 then
                        L4_5 = 4
                      else
                        L4_5 = 5
                        do break end
                        else
                        end
                        if L4_5 == 5 then
                          L3_4 = A0_1:eventTalkStep15()
                          if L3_4 == 1 then
                            L3_4 = 1
                            L4_5 = 0
                          else
                            L4_5 = -1
                            do break end
                            break
                          end
                        else
                        end
                      end
                  end
              end
          end
      end
  until L4_5 < 1
  if L4_5 < 0 then
    A0_1:eventTalkStepBreak()
    return -1
  end
  return L3_4
end
function PopulaceRetainerManager.eventTalkStep11(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = 0
  L2_9 = 0
  L3_10 = A0_7.getActorClassId
  L3_10 = L3_10(A0_7)
  if L3_10 == 1001184 then
    L1_8 = 60
    L2_9 = 61
    break
  elseif L3_10 == 1000166 then
  else
    if L3_10 == 1000865 then
    else
    end
  end
  L1_8 = 1
  L2_9 = 2
  do break end
  L3_10 = 0
  A0_7:say(A0_7, L1_8, 0)
  L3_10 = A0_7:askExtendWidget(A0_7, L2_9, 2, 1, 1)
  return L3_10
end
function PopulaceRetainerManager.eventTalkStep12(A0_11)
  local L1_12
  L1_12 = 0
  if A0_11:getActorClassId() == 1001184 then
    L1_12 = 64
    break
  elseif A0_11:getActorClassId() == 1000166 then
  else
    if A0_11:getActorClassId() == 1000865 then
    else
    end
  end
  L1_12 = 5
  do break end
  A0_11:say(A0_11, L1_12, 0)
  return
end
function PopulaceRetainerManager.eventTalkStep121(A0_13)
  local L1_14, L2_15
  L1_14 = 0
  L2_15 = A0_13.getActorClassId
  L2_15 = L2_15(A0_13)
  if L2_15 == 1001184 then
    L1_14 = 145
    break
  elseif L2_15 == 1000166 then
  else
    if L2_15 == 1000865 then
    else
    end
  end
  L1_14 = 141
  do break end
  L2_15 = 0
  L2_15 = A0_13:askExtendWidget(A0_13, L1_14, 3, 1, 1, 0, A0_13, 0, 0)
  return L2_15
end
function PopulaceRetainerManager.eventTalkStep13(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22
  L2_18 = 0
  L3_19 = 0
  L4_20 = 0
  L5_21 = nil
  L6_22 = A0_16.getActorClassId
  L6_22 = L6_22(A0_16)
  if L6_22 == 1001184 then
    L2_18 = 68
    L4_20 = 69
    L3_19 = 77
    L5_21 = {
      78,
      79,
      80,
      81
    }
    break
  elseif L6_22 == 1000166 then
  else
    if L6_22 == 1000865 then
    else
    end
  end
  L2_18 = 9
  L4_20 = 10
  L3_19 = 18
  L5_21 = {
    19,
    20,
    21,
    22
  }
  do break end
  L6_22 = 0
  A0_16:say(A0_16, L2_18, 0)
  L6_22 = A0_16:askExtendWidget(A0_16, L4_20, 2, 1, A1_17, A0_16, 0, 0)
  if L6_22 == 1 then
    A0_16:say(A0_16, L3_19, 0)
    for _FORV_10_ = 1, #L5_21 do
      A0_16:say(A0_16, L5_21[_FORV_10_], 0)
    end
  end
  return L6_22
end
function PopulaceRetainerManager.eventTalkStep14(A0_23, A1_24)
  local L2_25, L3_26, L4_27, L5_28
  L2_25 = 0
  L3_26, L4_27 = nil, nil
  L5_28 = A0_23.getActorClassId
  L5_28 = L5_28(A0_23)
  if L5_28 == 1001184 then
    L2_25 = 72
    L3_26 = {
      73,
      74,
      76
    }
    L4_27 = {
      82,
      83,
      84,
      85,
      86,
      87,
      88,
      89,
      90
    }
    break
  elseif L5_28 == 1000166 then
  else
    if L5_28 == 1000865 then
    else
    end
  end
  L2_25 = 13
  L3_26 = {
    14,
    15,
    17
  }
  L4_27 = {
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    59,
    30
  }
  if A0_23:getActorClassId() == 1000865 then
    L4_27[5] = 119
  else
  end
  L5_28 = 0
  L5_28 = A0_23:askForCustomizeOption(A0_23, A1_24, false, true, L2_25, L3_26)
  if L5_28 == 1 then
    A0_23:say(A0_23, L4_27[1], 0)
    A0_23:say(A0_23, L4_27[2], 0)
    A0_23:say(A0_23, L4_27[3], 0)
    break
  else
  end
  if L5_28 == 2 then
    A0_23:say(A0_23, L4_27[4], 0)
    A0_23:say(A0_23, L4_27[5], 0)
    break
  else
  end
  if L5_28 == 3 then
    L5_28 = 4
    break
  else
    if L5_28 == 4 then
    else
    end
  end
  L5_28 = 4
  do break end
  return L5_28
end
function PopulaceRetainerManager.eventTalkStep15(A0_29)
  local L1_30, L2_31, L3_32
  L1_30 = 0
  L2_31 = 0
  L3_32 = A0_29.getActorClassId
  L3_32 = L3_32(A0_29)
  if L3_32 == 1001184 then
    L1_30 = 91
    L2_31 = 92
    break
  elseif L3_32 == 1000166 then
  else
    if L3_32 == 1000865 then
    else
    end
  end
  L1_30 = 31
  L2_31 = 32
  do break end
  L3_32 = 0
  A0_29:say(A0_29, L1_30, 0)
  L3_32 = A0_29:askExtendWidget(A0_29, L2_31, 2, 1, 1)
  return L3_32
end
function PopulaceRetainerManager.eventTalkStep2(A0_33)
  local L1_34, L2_35
  L1_34 = 0
  L2_35 = 1
  repeat
    if L2_35 == 1 then
      L1_34 = A0_33:eventTalkStep21()
      if L1_34 == 1 then
        L2_35 = 2
      elseif L1_34 == 2 then
        L2_35 = 0
        L1_34 = 0
      else
        L2_35 = -1
        do break end
        else
        end
        if L2_35 == 2 then
          L1_34 = A0_33:eventTalkStep22()
          if L1_34 < 1 or L1_34 > 15 then
            L2_35 = 1
          else
            L2_35 = 0
            do break end
            break
          end
        else
        end
      end
  until L2_35 < 1
  if L2_35 < 0 then
    A0_33:eventTalkStepBreak()
    return -1
  end
  return L1_34
end
function PopulaceRetainerManager.eventTalkStep21(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = 0
  L2_38 = 0
  L3_39 = A0_36.getActorClassId
  L3_39 = L3_39(A0_36)
  if L3_39 == 1001184 then
    L1_37 = 95
    L2_38 = 96
    break
  elseif L3_39 == 1000166 then
  else
    if L3_39 == 1000865 then
    else
    end
  end
  L1_37 = 35
  L2_38 = 36
  do break end
  L3_39 = 0
  A0_36:say(A0_36, L1_37, 0)
  L3_39 = A0_36:askExtendWidget(A0_36, L2_38, 3, 1, 1)
  return L3_39
end
function PopulaceRetainerManager.eventTalkStep22(A0_40)
  local L1_41, L2_42
  L1_41 = {
    L2_42,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    0
  }
  L2_42 = 0
  L2_42 = 0
  L2_42 = A0_40:askExtendWidget(A0_40, 124, 16, 1, 1, unpack(L1_41))
  return L2_42
end
function PopulaceRetainerManager.eventTalkStep4(A0_43, A1_44, A2_45)
  local L3_46
  L3_46 = desktopWidget
  L3_46 = L3_46.askRetainerNamingWidget
  L3_46 = L3_46(L3_46, A0_43, A1_44)
  if type(L3_46) ~= "string" then
    return ""
  end
  return L3_46
end
function PopulaceRetainerManager.eventTalkStepFinalAnswer(A0_47, A1_48)
  local L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56, L10_57
  L2_49 = 0
  L4_51 = A0_47
  L3_50 = A0_47.getActorClassId
  L3_50 = L3_50(L4_51)
  if L3_50 == 1001184 then
    L2_49 = 108
    break
  elseif L3_50 == 1000166 then
  else
    if L3_50 == 1000865 then
    else
    end
  end
  L2_49 = 48
  do break end
  L4_51 = A0_47
  L3_50 = A0_47._wait
  L5_52 = 1
  L3_50(L4_51, L5_52)
  L3_50 = worldMaster
  L4_51 = L3_50
  L3_50 = L3_50._getMyPlayer
  L3_50 = L3_50(L4_51)
  L5_52 = L3_50
  L4_51 = L3_50._getGroup
  L6_53 = 50003
  L4_51 = L4_51(L5_52, L6_53)
  if L4_51 ~= nil then
    L5_52 = nil
    L6_53 = 1
    for L10_57 = 1, L8_55(L9_56) do
      if L4_51:_isExistInClientMember(L10_57) and L4_51:_getMember(L10_57) ~= L3_50 then
        L5_52 = L4_51:_getMember(L10_57)
        break
      end
    end
    if L5_52 ~= nil then
      if L7_54 == true then
        L10_57 = 1
        L7_54(L8_55, L9_56, L10_57)
      end
    end
  end
  L5_52 = 0
  L6_53 = worldMaster
  L6_53 = L6_53.askRestrictChoices
  L10_57 = L2_49
  L6_53 = L6_53(L7_54, L8_55, L9_56, L10_57, true, false, true, true, A1_48, 0, A1_48, 0, 0)
  L5_52 = L6_53
  L6_53 = type
  L6_53 = L6_53(L7_54)
  if L6_53 == "nil" then
    L5_52 = 3
  end
  if L5_52 == 4 then
    L6_53 = A0_47.eventTalkStepBreak
    L6_53(L7_54)
  end
  return L5_52
end
function PopulaceRetainerManager.eventTalkStepBreak(A0_58)
  if A0_58:getActorClassId() == 1001184 then
    A0_58:say(A0_58, 116, 0)
    break
  elseif A0_58:getActorClassId() == 1000166 then
  else
    if A0_58:getActorClassId() == 1000865 then
    else
    end
  end
  A0_58:say(A0_58, 56, 0)
  do break end
  A0_58:finishCliantTalkTurn()
end
function PopulaceRetainerManager.eventTalkStepError(A0_59, A1_60)
  if A1_60 == 1 then
    if A0_59:getActorClassId() == 1001184 then
      A0_59:say(A0_59, 117, 0)
    else
      A0_59:say(A0_59, 57, 0)
    end
    A0_59:finishCliantTalkTurn()
    break
  else
  end
  if A1_60 == 2 then
    if A0_59:getActorClassId() == 1001184 then
      A0_59:say(A0_59, 118, 0)
    else
      A0_59:say(A0_59, 58, 0)
    end
    A0_59:finishCliantTalkTurn()
    break
  else
  end
  A0_59:eventTalkStepBreak()
  do break end
  A0_59:finishCliantTalkTurn()
end
function PopulaceRetainerManager.eventTalkStepFinish(A0_61)
  if A0_61:getActorClassId() == 1001184 then
    A0_61:say(A0_61, 115, 0)
  else
    A0_61:say(A0_61, 55, 0)
  end
  A0_61:finishCliantTalkTurn()
end
function PopulaceRetainerManager.eventTaklSelectCutSeane(A0_62, A1_63, ...)
  local L3_65
  L3_65 = 1
  worldMaster:_getMyPlayer():_fadeOut(L3_65)
  worldMaster:_getMyPlayer():_waitForFading()
  worldMaster:createCutScene(A1_63, A0_62):_delete()
  worldMaster:_getMyPlayer():_fadeIn(L3_65)
  worldMaster:_getMyPlayer():_waitForFading()
  if 0 > worldMaster:createCutScene(A1_63, A0_62):startCutScene(1, 61, 2, 0, select(1, ...), select(2, ...), select(3, ...), select(4, ...), select(5, ...)) then
    A0_62:finishCliantTalkTurn()
  end
  return worldMaster:createCutScene(A1_63, A0_62):startCutScene(1, 61, 2, 0, select(1, ...), select(2, ...), select(3, ...), select(4, ...), select(5, ...))
end
function PopulaceRetainerManager.eventTalkTutorialCutsceneNone(A0_66)
  local L1_67
  L1_67 = worldMaster
  L1_67 = L1_67._getMyPlayer
  L1_67 = L1_67(L1_67)
  if L1_67 ~= nil then
    A0_66:startCliantTalkTurn(2, L1_67)
  end
  if A0_66:getActorClassId() == 1000166 then
    A0_66:say(A0_66, 149, 0)
    A0_66:say(A0_66, 150, 0, 1)
    break
  else
  end
  if A0_66:getActorClassId() == 1001184 then
    A0_66:say(A0_66, 167, 0)
    A0_66:say(A0_66, 168, 0)
    break
  else
  end
  if A0_66:getActorClassId() == 1000865 then
    A0_66:say(A0_66, 149, 0)
    A0_66:say(A0_66, 150, 0, 2)
    do break end
    break
  else
  end
  A0_66:finishCliantTalkTurn()
end
function PopulaceRetainerManager.eventTalkTutorialFirst(A0_68)
  A0_68:eventTalkTutorialExplainNone()
end
function PopulaceRetainerManager.eventTalkTutorialExplainNone(A0_69)
  local L1_70
  L1_70 = worldMaster
  L1_70 = L1_70._getMyPlayer
  L1_70 = L1_70(L1_70)
  if L1_70 ~= nil then
    A0_69:startCliantTalkTurn(2, L1_70)
  end
  if A0_69:getActorClassId() == 1000166 then
    A0_69:say(A0_69, 151, 0)
    A0_69:say(A0_69, 152, 0)
    A0_69:say(A0_69, 153, 0)
    break
  else
  end
  if A0_69:getActorClassId() == 1001184 then
    A0_69:say(A0_69, 169, 0)
    A0_69:say(A0_69, 170, 0)
    A0_69:say(A0_69, 171, 0)
    break
  else
  end
  if A0_69:getActorClassId() == 1000865 then
    A0_69:say(A0_69, 151, 0)
    A0_69:say(A0_69, 152, 0)
    A0_69:say(A0_69, 153, 0)
    do break end
    break
  else
  end
end
function PopulaceRetainerManager.newEventTalkStep1(A0_71, A1_72)
  local L2_73, L3_74
  L2_73 = worldMaster
  L3_74 = L2_73
  L2_73 = L2_73._getMyPlayer
  L2_73 = L2_73(L3_74)
  if L2_73 ~= nil then
    L3_74 = A0_71.startCliantTalkTurn
    L3_74(A0_71, 2, L2_73)
  end
  if A1_72 == false then
    L3_74 = A0_71.getActorClassId
    L3_74 = L3_74(A0_71)
    if L3_74 == 1000166 then
      A0_71:say(A0_71, 149, 0)
      break
    else
    end
    if L3_74 == 1001184 then
      A0_71:say(A0_71, 167, 0)
      break
    else
    end
    if L3_74 == 1000865 then
      A0_71:say(A0_71, 149, 0)
      break
    else
    end
  else
  end
  L3_74 = nil
  while true do
    L3_74 = A0_71:askExtendWidget(A0_71, 154, 3, 1, 1)
    if L3_74 == 1 then
      A0_71:subRetainerExplainAsk()
    elseif L3_74 == 2 then
      return 1
    else
      A0_71:eventTalkStepBreak()
      return -1
    end
  end
end
function PopulaceRetainerManager.subRetainerExplainAsk(A0_75)
  local L1_76
  L1_76 = A0_75.eventTalkTutorialExplainNone
  L1_76(A0_75)
  L1_76 = A0_75.getActorClassId
  L1_76 = L1_76(A0_75)
  if L1_76 == 1000166 then
    A0_75:say(A0_75, 158, 0)
    break
  else
  end
  if L1_76 == 1001184 then
    A0_75:say(A0_75, 172, 0)
    break
  else
  end
  if L1_76 == 1000865 then
    A0_75:say(A0_75, 158, 0)
    do break end
    break
  else
  end
  L1_76 = nil
  while true do
    L1_76 = A0_75:askExtendWidget(A0_75, 159, 3, 1, 1)
    if L1_76 == 1 then
      A0_75:subRetainerExplain001()
    elseif L1_76 == 2 then
      A0_75:subRetainerExplain002()
    else
      return
    end
  end
end
function PopulaceRetainerManager.subRetainerExplain001(A0_77)
  if A0_77:getActorClassId() == 1000166 then
    A0_77:say(A0_77, 163, 0)
    A0_77:say(A0_77, 164, 0)
    break
  else
  end
  if A0_77:getActorClassId() == 1001184 then
    A0_77:say(A0_77, 173, 0)
    A0_77:say(A0_77, 174, 0)
    break
  else
  end
  if A0_77:getActorClassId() == 1000865 then
    A0_77:say(A0_77, 163, 0)
    A0_77:say(A0_77, 177, 0)
    do break end
    break
  else
  end
end
function PopulaceRetainerManager.subRetainerExplain002(A0_78)
  if A0_78:getActorClassId() == 1000166 then
    A0_78:say(A0_78, 165, 0)
    A0_78:say(A0_78, 166, 0)
    break
  else
  end
  if A0_78:getActorClassId() == 1001184 then
    A0_78:say(A0_78, 175, 0)
    A0_78:say(A0_78, 176, 0)
    break
  else
  end
  if A0_78:getActorClassId() == 1000865 then
    A0_78:say(A0_78, 178, 0)
    A0_78:say(A0_78, 166, 0)
    do break end
    break
  else
  end
end
