require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceLinkshellManager", "NpcBaseClass")
function PopulaceLinkshellManager.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(2221, "populaceLinkshellManager")
end
function PopulaceLinkshellManager.eventTalkStep1(A0_1, A1_2)
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
      elseif L3_4 == 2 then
        L4_5 = 4
      else
        L4_5 = -1
        do break end
        else
        end
        if L4_5 == 2 then
          L3_4 = A0_1:eventTalkStep12()
          L4_5 = 4
          break
        else
        end
        if L4_5 == 3 then
          A0_1:eventTalkStep13(true)
        else
        end
        if L4_5 == 4 then
          L3_4 = 1
          do return L3_4 end
          break
        else
        end
      end
  until L4_5 < 1
  if L4_5 < 0 then
    A0_1:eventTalkStepBreak()
    return -1
  end
  return L3_4
end
function PopulaceLinkshellManager.eventTalkStep11(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  L1_8 = 0
  L2_9 = 0
  L3_10 = 0
  L4_11 = A0_7.getActorClassId
  L4_11 = L4_11(A0_7)
  if L4_11 == 1001183 then
    L1_8 = 78
    L2_9 = 79
    L3_10 = 82
    break
  else
  end
  if L4_11 == 1001182 then
    L1_8 = 40
    L2_9 = 41
    L3_10 = 44
    break
  else
    if L4_11 == 1000078 then
    else
    end
  end
  L1_8 = 2
  L2_9 = 3
  L3_10 = 6
  do break end
  L4_11 = 0
  A0_7:say(A0_7, L1_8, 0)
  A0_7:say(A0_7, L2_9, 0)
  L4_11 = A0_7:ask(A0_7, L3_10, 2)
  return L4_11
end
function PopulaceLinkshellManager.eventTalkStep12(A0_12)
  local L1_13, L2_14, L3_15
  L1_13 = 0
  L2_14 = 0
  L3_15 = 0
  if A0_12:getActorClassId() == 1001183 then
    L1_13 = 80
    L2_14 = 81
    L3_15 = 82
    break
  else
  end
  if A0_12:getActorClassId() == 1001182 then
    L1_13 = 42
    L2_14 = 43
    L3_15 = 44
    break
  else
    if A0_12:getActorClassId() == 1000078 then
    else
    end
  end
  L1_13 = 4
  L2_14 = 5
  L3_15 = 6
  do break end
  A0_12:say(A0_12, L1_13, 0)
  A0_12:say(A0_12, L2_14, 0)
  return 0
end
function PopulaceLinkshellManager.eventTalkStep13(A0_16, A1_17)
  if A0_16:getActorClassId() == 1001183 then
    A0_16:say(A0_16, 85, 0)
    A0_16:say(A0_16, 86, 0)
    A0_16:say(A0_16, 87, 0)
    if A1_17 == true then
      A0_16:say(A0_16, 88, 0)
      do break end
      else
      end
      if A0_16:getActorClassId() == 1001182 then
        A0_16:say(A0_16, 47, 0)
        A0_16:say(A0_16, 48, 0)
        A0_16:say(A0_16, 49, 0)
        if A1_17 == true then
          A0_16:say(A0_16, 50, 0)
          do break end
          else
            if A0_16:getActorClassId() == 1000078 then
            else
            end
          end
          A0_16:say(A0_16, 9, 0)
          A0_16:say(A0_16, 10, 0)
          A0_16:say(A0_16, 11, 0)
          if A1_17 == true then
            A0_16:say(A0_16, 12, 0)
          end
        else
        end
    else
    end
end
function PopulaceLinkshellManager.eventTalkStep2(A0_18, A1_19)
  local L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L2_20 = 1
  L3_21 = 0
  L4_22 = 1
  L5_23 = ""
  L6_24 = 0
  L7_25 = worldMaster
  L8_26 = L7_25
  L7_25 = L7_25._getMyPlayer
  L7_25 = L7_25(L8_26)
  if A1_19 == true then
    L4_22 = 1
  else
    L4_22 = 2
  end
  L9_27 = A0_18
  L8_26 = A0_18.updateGroupMemberRank
  L8_26(L9_27)
  repeat
    L8_26 = L4_22
    if L8_26 == 1 then
      L9_27 = A0_18.eventTalkStep21
      L9_27 = L9_27(A0_18)
      L3_21 = L9_27
      if L3_21 == 1 then
        L4_22 = 3
      elseif L3_21 == 2 then
        L4_22 = 10
      else
        L4_22 = -1
        do break end
        else
        end
        if L8_26 == 2 then
          L9_27 = A0_18.eventTalkStep22
          L9_27 = L9_27(A0_18)
          L3_21 = L9_27
          if L3_21 == 1 then
            L4_22 = 6
          elseif L3_21 == 2 then
            L4_22 = 3
          elseif L3_21 == 3 then
            L4_22 = 4
          elseif L3_21 == 4 then
            L4_22 = 5
          elseif L3_21 == 5 then
            L4_22 = 10
          else
            L4_22 = -1
            do break end
            else
            end
            if L8_26 == 3 then
              L9_27 = A0_18.eventTalkStep231
              L9_27 = L9_27(A0_18)
              L5_23 = L9_27
              if L5_23 == "" then
                if A1_19 == true then
                  L4_22 = 1
                else
                  L4_22 = 2
                end
              else
                L9_27 = _getLanguage
                L9_27 = L9_27()
                if L9_27 ~= 4 then
                  L9_27 = _getLanguage
                  L9_27 = L9_27()
                else
                  if L9_27 == 5 then
                    L9_27 = A0_18.checkLinkshellNameChinese
                    L9_27 = L9_27(A0_18, L5_23)
                    if L9_27 == false then
                      L9_27 = worldMaster
                      L9_27 = L9_27.say
                      L9_27(L9_27, worldMaster, 25122, 1)
                      L4_22 = 3
                    else
                      else
                        L9_27 = A0_18.checkLinkshellName
                        L9_27 = L9_27(A0_18, L5_23)
                        if L9_27 == false then
                          L9_27 = worldMaster
                          L9_27 = L9_27.say
                          L9_27(L9_27, worldMaster, 25122, 1)
                          L4_22 = 3
                      end
                      else
                        else
                        end
                        if L8_26 == 31 then
                          L9_27 = A0_18.eventTalkStep232
                          L9_27 = L9_27(A0_18)
                          L6_24 = L9_27
                          if L6_24 < 0 then
                            if A1_19 == true then
                              L4_22 = 1
                            else
                              L4_22 = 2
                              do break end
                              else
                                if L6_24 == 0 then
                                  L4_22 = 3
                              end
                              else
                                L9_27 = A0_18.eventTalkStep233
                                L9_27 = L9_27(A0_18, L5_23, L6_24)
                                L3_21 = L9_27
                                if L3_21 < 0 then
                                  if A1_19 == true then
                                    L4_22 = 1
                                  else
                                    L4_22 = 2
                                    do break end
                                    else
                                      if L3_21 == 0 then
                                        L4_22 = 31
                                    end
                                    else
                                      L3_21 = 3
                                      L9_27 = L3_21
                                      do return L9_27, L5_23, L6_24 end
                                      else
                                      end
                                      if L8_26 == 4 then
                                        L9_27 = A0_18.eventTalkStep24
                                        L6_24, L9_27 = A0_18, L9_27(A0_18)
                                        L5_23 = L9_27
                                        if L5_23 == "" then
                                          L4_22 = 2
                                        elseif L6_24 < 1 then
                                          L4_22 = 2
                                        else
                                          L3_21 = 4
                                          L9_27 = L3_21
                                          do return L9_27, L5_23, L6_24 end
                                          do break end
                                          else
                                          end
                                          if L8_26 == 5 then
                                            L9_27 = A0_18.eventTalkStep25
                                            L9_27 = L9_27(A0_18)
                                            if L9_27 == "" then
                                              L4_22 = 2
                                            else
                                              L3_21 = 5
                                              do return L3_21, L9_27, 0 end
                                              do break end
                                              else
                                              end
                                              if L8_26 == 6 then
                                                L9_27 = A0_18.eventTalkStep13
                                                L9_27(A0_18, false)
                                                L4_22 = 2
                                                break
                                              else
                                              end
                                              if L8_26 == 10 then
                                                L9_27 = A0_18.eventTalkStepBreak
                                                L9_27(A0_18)
                                                L9_27 = L4_22
                                                do return L9_27, L5_23, L6_24 end
                                                break
                                              else
                                              end
                                            end
                                        end
                                    end
                                  end
                              end
                            end
                      end
                    end
                end
              end
          end
      end
  until L4_22 < 1
  if L4_22 < 0 then
    L9_27 = A0_18
    L8_26 = A0_18.eventTalkStepBreak
    L8_26(L9_27)
    L8_26 = -1
    L9_27 = L5_23
    return L8_26, L9_27, L6_24
  end
  L8_26 = L3_21
  L9_27 = L5_23
  return L8_26, L9_27, L6_24
end
function PopulaceLinkshellManager.eventTalkStep21(A0_28)
  local L1_29, L2_30
  L1_29 = 0
  L2_30 = A0_28.getActorClassId
  L2_30 = L2_30(A0_28)
  if L2_30 == 1001183 then
    L1_29 = 89
    break
  else
  end
  if L2_30 == 1001182 then
    L1_29 = 51
    break
  else
    if L2_30 == 1000078 then
    else
    end
  end
  L1_29 = 13
  do break end
  L2_30 = 0
  L2_30 = A0_28:ask(A0_28, L1_29, 2)
  return L2_30
end
function PopulaceLinkshellManager.eventTalkStep22(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  L1_32 = worldMaster
  L2_33 = L1_32
  L1_32 = L1_32._getMyPlayer
  L1_32 = L1_32(L2_33)
  L2_33 = 0
  L4_35 = A0_31
  L3_34 = A0_31.getActorClassId
  L3_34 = L3_34(L4_35)
  if L3_34 == 1001183 then
    L2_33 = 128
    break
  else
  end
  if L3_34 == 1001182 then
    L2_33 = 122
    break
  else
    if L3_34 == 1000078 then
    else
    end
  end
  L2_33 = 116
  do break end
  L3_34 = {
    L4_35,
    true,
    true,
    true,
    true
  }
  L4_35 = true
  L4_35 = L1_32.countCommunityGroup
  L4_35 = L4_35(L1_32, 20002)
  if L4_35 >= 8 then
    L3_34[2] = false
  end
  L4_35 = 0
  L4_35 = worldMaster:askRestrictChoices(A0_31, A0_31, L2_33, unpack(L3_34))
  if type(L4_35) == "nil" then
    L4_35 = 5
  end
  return L4_35
end
function PopulaceLinkshellManager.eventTalkStep231(A0_36)
  local L1_37
  L1_37 = 0
  if A0_36:getActorClassId() == 1001183 then
    L1_37 = 97
    break
  else
  end
  if A0_36:getActorClassId() == 1001182 then
    L1_37 = 59
    break
  else
    if A0_36:getActorClassId() == 1000078 then
    else
    end
  end
  L1_37 = 21
  do break end
  A0_36:say(A0_36, L1_37, 0)
  if desktopWidget:askLinkshellNamingWidget() == true and desktopWidget:askLinkshellNamingWidget() == 1 then
    return desktopWidget:askLinkshellNamingWidget()
  else
  end
  return ""
end
function PopulaceLinkshellManager.eventTalkStep232(A0_38)
  local L1_39
  L1_39 = 0
  if A0_38:getActorClassId() == 1001183 then
    L1_39 = 98
    break
  else
  end
  if A0_38:getActorClassId() == 1001182 then
    L1_39 = 60
    break
  else
    if A0_38:getActorClassId() == 1000078 then
    else
    end
  end
  L1_39 = 22
  do break end
  A0_38:say(A0_38, L1_39, 0)
  if desktopWidget:askLinkshellSelectIconWidget(1, nil) == true then
    if desktopWidget:askLinkshellSelectIconWidget(1, nil) == 1 then
      return desktopWidget:askLinkshellSelectIconWidget(1, nil)
    elseif desktopWidget:askLinkshellSelectIconWidget(1, nil) == 2 then
      return 0
    end
    return -1
  else
    return -1
  end
end
function PopulaceLinkshellManager.eventTalkStep233(A0_40, A1_41, A2_42)
  local L3_43, L4_44, L5_45, L6_46
  L3_43 = 0
  L4_44 = 0
  L6_46 = A0_40
  L5_45 = A0_40.getActorClassId
  L5_45 = L5_45(L6_46)
  if L5_45 == 1001183 then
    L3_43 = 100
    L4_44 = 101
    break
  else
  end
  if L5_45 == 1001182 then
    L3_43 = 62
    L4_44 = 63
    break
  else
    if L5_45 == 1000078 then
    else
    end
  end
  L3_43 = 24
  L4_44 = 25
  do break end
  L6_46 = A0_40
  L5_45 = A0_40.say
  L5_45(L6_46, A0_40, L3_43, 0)
  L5_45 = 0
  L6_46 = 0
  L5_45, L6_46 = desktopWidget:askLinkshellConfirmWidget(1, A1_41, A2_42)
  if L5_45 == true then
    if L6_46 == 1 then
      return L6_46
    elseif L6_46 == 2 then
      return 0
    end
    return -1
  else
    return -1
  end
end
function PopulaceLinkshellManager.eventTalkStep24(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54, L8_55, L9_56
  L1_48 = worldMaster
  L2_49 = L1_48
  L1_48 = L1_48._getMyPlayer
  L1_48 = L1_48(L2_49)
  L2_49 = 0
  L3_50 = ""
  L4_51 = 0
  L5_52 = 0
  L6_53 = 0
  L7_54 = 0
  L8_55 = 0
  L9_56 = 0
  if A0_47:getActorClassId() == 1001183 then
    L2_49 = 99
    break
  else
  end
  if A0_47:getActorClassId() == 1001182 then
    L2_49 = 61
    break
  else
    if A0_47:getActorClassId() == 1000078 then
    else
    end
  end
  L2_49 = 23
  do break end
  A0_47:say(A0_47, L2_49, 0)
  if desktopWidget:askLinkshellListWidget(2) == false then
    return L3_50, L4_51
  end
  if 0 < desktopWidget:askLinkshellListWidget(2) and desktopWidget:askLinkshellListWidget(2) <= #L1_48:_getAllGroup(20002) then
    if L1_48:_getAllGroup(20002)[desktopWidget:askLinkshellListWidget(2)]:_isAlive() == true then
      L3_50 = L1_48:_getAllGroup(20002)[desktopWidget:askLinkshellListWidget(2)]:getUniqueIdentifier()
      L4_51, L5_52, L6_53, L7_54 = L1_48:_getAllGroup(20002)[desktopWidget:askLinkshellListWidget(2)]:getCrestIcon()
    else
      return L3_50, L4_51
    end
  else
    return L3_50, L4_51
  end
  L8_55, L9_56, L4_51 = desktopWidget:askLinkshellSelectIconWidget(2, L4_51)
  if L8_55 == true then
    if L9_56 == 1 then
      return L3_50, L4_51
    elseif L9_56 == 2 then
      return L3_50, 0
    end
    return L3_50, -1
  else
    return L3_50, -1
  end
end
function PopulaceLinkshellManager.eventTalkStep25(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66, L10_67, L11_68, L12_69, L13_70
  L1_58 = worldMaster
  L2_59 = L1_58
  L1_58 = L1_58._getMyPlayer
  L1_58 = L1_58(L2_59)
  L2_59 = 0
  L3_60 = 0
  L4_61 = ""
  L5_62 = 0
  L6_63 = 0
  L7_64 = 0
  L8_65 = 0
  L10_67 = A0_57
  L9_66 = A0_57.getActorClassId
  L9_66 = L9_66(L10_67)
  if L9_66 == 1001183 then
    L2_59 = 111
    L3_60 = 112
    break
  else
  end
  if L9_66 == 1001182 then
    L2_59 = 73
    L3_60 = 74
    break
  else
    if L9_66 == 1000078 then
    else
    end
  end
  L2_59 = 35
  L3_60 = 36
  do break end
  L10_67 = A0_57
  L9_66 = A0_57.say
  L11_68 = A0_57
  L12_69 = L2_59
  L13_70 = 0
  L9_66(L10_67, L11_68, L12_69, L13_70)
  L9_66 = desktopWidget
  L10_67 = L9_66
  L9_66 = L9_66.askLinkshellListWidget
  L11_68 = 3
  L10_67 = L9_66(L10_67, L11_68)
  if L9_66 == false then
    return L4_61
  end
  L12_69 = L1_58
  L11_68 = L1_58._getAllGroup
  L13_70 = 20002
  L11_68 = L11_68(L12_69, L13_70)
  if L10_67 > 0 then
    L12_69 = #L11_68
    if L10_67 <= L12_69 then
      L12_69 = L11_68[L10_67]
      L13_70 = L12_69
      L12_69 = L12_69._isAlive
      L12_69 = L12_69(L13_70)
      if L12_69 == true then
        L12_69 = L11_68[L10_67]
        L13_70 = L12_69
        L12_69 = L12_69.getUniqueIdentifier
        L12_69 = L12_69(L13_70)
        L4_61 = L12_69
        L12_69 = L11_68[L10_67]
        L13_70 = L12_69
        L12_69 = L12_69.getCrestIcon
        L7_64, L8_65, L12_69 = nil, nil, L12_69(L13_70)
        L7_64, L8_65, L13_70 = nil, nil, L12_69(L13_70)
        L6_63 = L13_70
        L5_62 = L12_69
      else
        return L4_61
      end
    end
  else
    return L4_61
  end
  L12_69 = 0
  L13_70 = 0
  L12_69, L13_70 = desktopWidget:askLinkshellConfirmWidget(3, L4_61, L5_62)
  if L12_69 == true then
    if L13_70 == 1 then
      if L4_61 ~= "" then
        if A0_57:askExtendWidget(A0_57, L3_60, 2, 0, 2) ~= 1 then
          L4_61 = ""
        else
          if A0_57:getActorClassId() == 1001183 then
            L2_59 = 115
            break
          else
          end
          if A0_57:getActorClassId() == 1001182 then
            L2_59 = 77
            break
          else
            if A0_57:getActorClassId() == 1000078 then
            else
            end
          end
          L2_59 = 39
          do break end
          A0_57:say(A0_57, L2_59, 0)
        end
      end
    else
      L4_61 = ""
    end
  else
    L4_61 = ""
  end
  return L4_61
end
function PopulaceLinkshellManager.eventTalkStepMakeupDone(A0_71)
  local L1_72, L2_73
  L1_72 = worldMaster
  L2_73 = L1_72
  L1_72 = L1_72._getMyPlayer
  L1_72 = L1_72(L2_73)
  L2_73 = 0
  A0_71:updateGroupMemberRank()
  if A0_71:getActorClassId() == 1001183 then
    L2_73 = 104
    break
  else
  end
  if A0_71:getActorClassId() == 1001182 then
    L2_73 = 66
    break
  else
    if A0_71:getActorClassId() == 1000078 then
    else
    end
  end
  L2_73 = 28
  do break end
  A0_71:say(A0_71, L2_73, 0)
  A0_71:finishCliantTalkTurn()
end
function PopulaceLinkshellManager.eventTalkStepModifyDone(A0_74)
  local L1_75, L2_76
  L1_75 = worldMaster
  L2_76 = L1_75
  L1_75 = L1_75._getMyPlayer
  L1_75 = L1_75(L2_76)
  L2_76 = 0
  A0_74:updateGroupMemberRank()
  if A0_74:getActorClassId() == 1001183 then
    L2_76 = 109
    break
  else
  end
  if A0_74:getActorClassId() == 1001182 then
    L2_76 = 71
    break
  else
    if A0_74:getActorClassId() == 1000078 then
    else
    end
  end
  L2_76 = 33
  do break end
  A0_74:say(A0_74, L2_76, 0)
  A0_74:finishCliantTalkTurn()
end
function PopulaceLinkshellManager.eventTalkStepBreakDone(A0_77)
  A0_77:updateGroupMemberRank()
  A0_77:finishCliantTalkTurn()
end
function PopulaceLinkshellManager.eventTalkStepBreak(A0_78)
  A0_78:finishCliantTalkTurn()
end
function PopulaceLinkshellManager.checkLinkshellName(A0_79, A1_80)
  local L2_81, L3_82
  L2_81 = ""
  L3_82 = true
  if #A1_80 > 31 or #A1_80 < 3 then
    L3_82 = false
  end
  L2_81 = "[^a-zA-Z0-9 ]"
  if _string.match(A1_80, L2_81, 1) ~= nil then
    L3_82 = false
  end
  L2_81 = "[^a-zA-Z0-9][^a-zA-Z0-9]"
  if _string.match(A1_80, L2_81, 1) ~= nil then
    L3_82 = false
  end
  L2_81 = "^[ ]"
  if _string.match(A1_80, L2_81, 1) ~= nil then
    L3_82 = false
  end
  L2_81 = "[ ]$"
  if _string.match(A1_80, L2_81, 1) ~= nil then
    L3_82 = false
  end
  return L3_82
end
function PopulaceLinkshellManager.checkLinkshellNameChinese(A0_83, A1_84)
  local L2_85, L3_86
  L2_85 = ""
  L3_86 = true
  if #A1_84 > 31 or #A1_84 < 3 then
    L3_86 = false
  end
  L2_85 = "^[ ]"
  if _string.match(A1_84, L2_85, 1) ~= nil then
    L3_86 = false
  end
  L2_85 = "[ ]$"
  if _string.match(A1_84, L2_85, 1) ~= nil then
    L3_86 = false
  end
  return L3_86
end
function PopulaceLinkshellManager.updateGroupMemberRank(A0_87)
  local L1_88, L2_89, L3_90, L4_91, L5_92, L6_93
  L1_88 = worldMaster
  L2_89 = L1_88
  L1_88 = L1_88._getMyPlayer
  L1_88 = L1_88(L2_89)
  L2_89 = L1_88.countCommunityGroup
  L2_89 = L2_89(L3_90, L4_91)
  for L6_93 = 1, L2_89 do
    if L1_88:getCommunityGroup(20002, L6_93) ~= nil and L1_88:getCommunityGroup(20002, L6_93):_isAlive() == true then
      L1_88:getCommunityGroup(20002, L6_93):updateMemberInformation()
      L1_88:getCommunityGroup(20002, L6_93):updateRankInGroup()
    end
  end
end
