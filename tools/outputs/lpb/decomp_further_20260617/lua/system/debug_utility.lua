local L0_0, L1_1
L0_0 = Debug
function L1_1(A0_2, A1_3)
  local L2_4, L3_5
  L2_4 = debug
  L3_5 = L2_4
  L2_4 = L2_4._printLog
  L2_4(L3_5, "\226\151\134debug:printWhat() \227\129\174\232\170\191\230\159\187\231\181\144\230\158\156")
  L2_4 = type
  L3_5 = A1_3
  L2_4 = L2_4(L3_5)
  L3_5 = debug
  L3_5 = L3_5._printLog
  L3_5(L3_5, "  \229\158\139             \226\135\146 " .. debug:getRaptureType(A1_3))
  if L2_4 == "actor" or L2_4 == "member" then
    L3_5 = A1_3._isAlive
    L3_5 = L3_5(A1_3)
    if L3_5 then
      L3_5 = debug
      L3_5 = L3_5._printLog
      L3_5(L3_5, "  \227\130\175\227\131\169\227\130\185\229\144\141       \226\135\146 " .. debug:_getClassName(A1_3))
      L3_5 = debug
      L3_5 = L3_5._printLog
      L3_5(L3_5, "  \227\130\164\227\131\179\227\130\185\227\130\191\227\131\179\227\130\185\229\144\141 \226\135\146 " .. debug:_getInstanceName(A1_3))
    end
  elseif L2_4 == "table" then
    L3_5 = debug
    L3_5 = L3_5._printLog
    L3_5(L3_5, "  \232\166\129\231\180\160\230\149\176         \226\135\146 " .. #A1_3)
    L3_5 = ""
    for _FORV_7_ = 1, #A1_3 do
      if L3_5 ~= "" then
        L3_5 = L3_5 .. ", "
      end
      L3_5 = L3_5 .. debug:getDebugName(A1_3[_FORV_7_])
    end
    _FOR_:_printLog("  \229\128\164             \226\135\146 { " .. L3_5 .. " }")
  else
    L3_5 = debug
    L3_5 = L3_5._printLog
    L3_5(L3_5, "  \229\128\164             \226\135\146 " .. debug:getDebugName(A1_3))
  end
end
L0_0.printWhat = L1_1
L0_0 = Debug
function L1_1(A0_6, A1_7)
  local L2_8, L3_9
  L2_8 = type
  L3_9 = A1_7
  L2_8 = L2_8(L3_9)
  if L2_8 == "actor" then
    L3_9 = A1_7._isAlive
    L3_9 = L3_9(A1_7)
    if L3_9 then
      L3_9 = _isInstanceOf
      L3_9 = L3_9(A1_7, "PlayerBaseClass")
      if L3_9 then
        L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188)"
        return L3_9
      else
        L3_9 = _isInstanceOf
        L3_9 = L3_9(A1_7, "NpcBaseClass")
        if L3_9 then
          L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (NPC)"
          return L3_9
        else
          L3_9 = _isInstanceOf
          L3_9 = L3_9(A1_7, "ZoneBaseClass")
          if L3_9 then
            L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\190\227\131\188\227\131\179\227\131\158\227\130\185\227\130\191\227\131\188)"
            return L3_9
          else
            L3_9 = _isInstanceOf
            L3_9 = L3_9(A1_7, "PrivateAreaBaseClass")
            if L3_9 then
              L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\151\227\131\169\227\130\164\227\131\153\227\131\188\227\131\136\227\130\168\227\131\170\227\130\162\227\131\158\227\130\185\227\130\191\227\131\188)"
              return L3_9
            else
              L3_9 = _isInstanceOf
              L3_9 = L3_9(A1_7, "WorldMaster")
              if L3_9 then
                L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\175\227\131\188\227\131\171\227\131\137\227\131\158\227\130\185\227\130\191\227\131\188)"
                return L3_9
              else
                L3_9 = _isInstanceOf
                L3_9 = L3_9(A1_7, "CharaBaseClass")
                if L3_9 then
                  L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\173\227\131\163\227\131\169\227\130\175\227\130\191\227\131\188)"
                  return L3_9
                else
                  L3_9 = _isInstanceOf
                  L3_9 = L3_9(A1_7, "AreaBaseClass")
                  if L3_9 then
                    L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\168\227\131\170\227\130\162\227\131\158\227\130\185\227\130\191\227\131\188)"
                    return L3_9
                  else
                    L3_9 = _isInstanceOf
                    L3_9 = L3_9(A1_7, "WorldBaseClass")
                    if L3_9 then
                      L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\175\227\131\188\227\131\171\227\131\137\231\179\187)"
                      return L3_9
                    else
                      L3_9 = _isInstanceOf
                      L3_9 = L3_9(A1_7, "CommandBaseClass")
                      if L3_9 then
                        L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\179\227\131\158\227\131\179\227\131\137)"
                        return L3_9
                      else
                        L3_9 = _isInstanceOf
                        L3_9 = L3_9(A1_7, "CommandDebuggerBaseClass")
                        if L3_9 then
                          L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\179\227\131\158\227\131\179\227\131\137\227\131\135\227\131\144\227\131\131\227\130\172\227\131\188)"
                          return L3_9
                        else
                          L3_9 = _isInstanceOf
                          L3_9 = L3_9(A1_7, "DebugBaseClass")
                          if L3_9 then
                            L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\135\227\131\144\227\131\131\227\130\176\231\148\168)"
                            return L3_9
                          else
                            L3_9 = _isInstanceOf
                            L3_9 = L3_9(A1_7, "DirectorBaseClass")
                            if L3_9 then
                              L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\231\174\161\231\144\134)"
                              return L3_9
                            else
                              L3_9 = _isInstanceOf
                              L3_9 = L3_9(A1_7, "GameDataBaseClass")
                              if L3_9 then
                                L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\178\227\131\188\227\131\160\227\131\135\227\131\188\227\130\191)"
                                return L3_9
                              else
                                L3_9 = _isInstanceOf
                                L3_9 = L3_9(A1_7, "GroupBaseClass")
                                if L3_9 then
                                  L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\176\227\131\171\227\131\188\227\131\151)"
                                  return L3_9
                                else
                                  L3_9 = _isInstanceOf
                                  L3_9 = L3_9(A1_7, "ItemBaseClass")
                                  if L3_9 then
                                    L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\162\227\130\164\227\131\134\227\131\160)"
                                    return L3_9
                                  else
                                    L3_9 = _isInstanceOf
                                    L3_9 = L3_9(A1_7, "JudgeBaseClass")
                                    if L3_9 then
                                      L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\184\227\131\163\227\131\131\227\130\184)"
                                      return L3_9
                                    else
                                      L3_9 = _isInstanceOf
                                      L3_9 = L3_9(A1_7, "QuestBaseClass")
                                      if L3_9 then
                                        L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\175\227\130\168\227\130\185\227\131\136)"
                                        return L3_9
                                      else
                                        L3_9 = _isInstanceOf
                                        L3_9 = L3_9(A1_7, "StatusBaseClass")
                                        if L3_9 then
                                          L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\185\227\131\134\227\131\188\227\130\191\227\130\185)"
                                          return L3_9
                                        else
                                          L3_9 = _isInstanceOf
                                          L3_9 = L3_9(A1_7, "SystemBaseClass")
                                          if L3_9 then
                                            L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\183\227\130\185\227\131\134\227\131\160)"
                                            return L3_9
                                          else
                                            L3_9 = _isInstanceOf
                                            L3_9 = L3_9(A1_7, "WidgetBaseClass")
                                            if L3_9 then
                                              L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\130\166\227\130\163\227\130\184\227\130\167\227\131\131\227\131\136)"
                                              return L3_9
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
                  end
                end
              end
            end
          end
        end
      end
      L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139"
      return L3_9
    else
      L3_9 = "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139 (\227\131\135\227\131\157\227\131\131\227\131\151\230\184\136\227\129\191)"
      return L3_9
    end
  elseif L2_8 == "member" then
    L3_9 = A1_7._isAlive
    L3_9 = L3_9(A1_7)
    if L3_9 then
      L3_9 = "\227\131\161\227\131\179\227\131\144\227\131\188\229\158\139"
      return L3_9
    else
      L3_9 = "\227\131\161\227\131\179\227\131\144\227\131\188\229\158\139 (\227\131\135\227\131\157\227\131\131\227\131\151\230\184\136\227\129\191)"
      return L3_9
    end
  elseif L2_8 == "table" then
    L3_9 = nil
    for _FORV_7_ = 1, #A1_7 do
      if _FORV_7_ == 1 then
        L3_9 = "actor"
      elseif L3_9 ~= "actor" then
        L3_9 = nil
      end
    end
    if L3_9 == "actor" then
      return "\227\130\162\227\130\175\227\130\191\227\131\188\229\158\139\227\129\174\233\133\141\229\136\151"
    elseif L3_9 == "number" then
      return "\229\174\159\230\149\176\229\158\139\227\129\174\233\133\141\229\136\151"
    elseif L3_9 == "string" then
      return "\230\150\135\229\173\151\229\136\151\229\158\139\227\129\174\233\133\141\229\136\151"
    elseif L3_9 == "boolean" then
      return "\227\131\150\227\131\188\227\131\170\227\130\162\227\131\179\229\158\139\227\129\174\233\133\141\229\136\151"
    else
      return "\230\183\183\229\144\136\229\158\139\227\129\174\233\133\141\229\136\151 (Rapture \227\129\167\227\129\175\232\166\143\231\180\132\233\129\149\229\143\141)"
    end
  elseif L2_8 == "nil" then
    L3_9 = "nil"
    return L3_9
  elseif L2_8 == "number" then
    L3_9 = "\229\174\159\230\149\176\229\158\139"
    return L3_9
  elseif L2_8 == "string" then
    L3_9 = "\230\150\135\229\173\151\229\136\151\229\158\139"
    return L3_9
  elseif L2_8 == "boolean" then
    L3_9 = "\227\131\150\227\131\188\227\131\170\227\130\162\227\131\179\229\158\139"
    return L3_9
  else
    L3_9 = L2_8
    L3_9 = L3_9 .. " (Rapture \227\129\167\227\129\175\232\166\143\231\180\132\233\129\149\229\143\141)"
    return L3_9
  end
end
L0_0.getRaptureType = L1_1
L0_0 = Debug
function L1_1(A0_10, A1_11, ...)
  local L4_13, L6_14, L7_15, L8_16
  L4_13 = debug
  L6_14 = L4_13
  L4_13 = L4_13._printLog
  L7_15 = string
  L8_16 = L7_15
  L7_15 = L7_15._format
  L8_16 = L7_15(L8_16, A1_11, ...)
  L4_13(L6_14, L7_15, L8_16, L7_15(L8_16, A1_11, ...))
end
L0_0.printFormat = L1_1
L0_0 = Debug
function L1_1(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22
  L5_22 = debug
  L5_22 = L5_22.getDebugName
  L5_22 = L5_22(L5_22, A1_18)
  L2_19(L3_20, L4_21)
  if A1_18 == nil then
    L2_19(L3_20, L4_21)
  else
    L5_22 = debug
    L5_22 = L5_22._getInstanceName
    L5_22 = L5_22(L5_22, A1_18)
    L2_19(L3_20, L4_21)
    L5_22 = tostring
    L5_22 = L5_22(A1_18:_isAlive())
    L2_19(L3_20, L4_21)
    if L2_19 then
      L5_22 = tostring
      L5_22 = L5_22(A1_18:_countMember())
      L2_19(L3_20, L4_21)
      for L5_22 = 1, L3_20(L4_21) do
        if A1_18:_isExistInClientMember(L5_22) then
          debug:_printLog("  _getMember(" .. L5_22 .. ")  = " .. debug:_getInstanceName(A1_18:_getMember(L5_22)))
        elseif not A1_18:_isExistInWorldMember(L5_22) then
          debug:_printLog("  _getMember(" .. L5_22 .. ")  = offline")
        else
          debug:_printLog("  _getMember(" .. L5_22 .. ")  = not exist")
        end
      end
    end
  end
end
L0_0.printGroup = L1_1
L0_0 = Debug
function L1_1(A0_23, A1_24, A2_25, A3_26)
  local L4_27, L5_28, L6_29, L7_30, L8_31
  if L4_27 ~= "table" then
    L7_30 = A1_24
    L8_31 = L6_29(L7_30)
    L4_27(L5_28, L6_29, L7_30, L8_31, L6_29(L7_30))
    return
  end
  if A3_26 == nil then
    A3_26 = 1
  end
  if A3_26 == 1 then
    L7_30 = L6_29
    L8_31 = "\t"
    L7_30 = "{"
    L4_27(L5_28, L6_29)
  end
  for L7_30, L8_31 in L4_27(L5_28) do
    if type(L8_31) == "string" then
      debug:_printLog(string:_rep("\t", A3_26) .. tostring(L7_30) .. " = \"" .. tostring(L8_31) .. "\",")
    elseif type(L8_31) ~= "table" then
      debug:_printLog(string:_rep("\t", A3_26) .. tostring(L7_30) .. " = " .. tostring(L8_31) .. ",")
    elseif A2_25 == true then
      debug:_printLog(string:_rep("\t", A3_26) .. tostring(L7_30) .. " = " .. "{")
      debug:printTable(L8_31, A2_25, A3_26 + 1)
    else
      debug:_printLog(string:_rep("\t", A3_26) .. tostring(L7_30) .. " = " .. debug:getDebugName(L8_31) .. ",")
    end
  end
  L7_30 = string
  L8_31 = L7_30
  L7_30 = L7_30._rep
  L7_30 = L7_30(L8_31, "\t", A3_26 - 1)
  L8_31 = "}"
  L7_30 = L7_30 .. L8_31 .. L4_27
  L5_28(L6_29, L7_30)
end
L0_0.printTable = L1_1
L0_0 = Debug
function L1_1(A0_32)
  for _FORV_5_ = 1, #debug:_getAllCharacter("CharaBaseClass") do
    debug:_printLog(debug:getDebugName(debug:_getAllCharacter("CharaBaseClass")[_FORV_5_]))
  end
end
L0_0.printCharacterList = L1_1
L0_0 = Debug
function L1_1(A0_33, A1_34, A2_35)
  return debug:_commandDebug(A1_34, "test", "get", A2_35)
end
L0_0.getDebugFlag = L1_1
L0_0 = Debug
function L1_1(A0_36, A1_37, A2_38, A3_39)
  debug:_commandDebug(A1_37, "test", "set", A2_38, A3_39)
end
L0_0.setDebugFlag = L1_1
L0_0 = Debug
function L1_1(A0_40, A1_41)
  A0_40.work.serverTimeOffset = A1_41
end
L0_0.setServerTimeOffset = L1_1
L0_0 = Debug
function L1_1(A0_42)
  return A0_42.work.serverTimeOffset
end
L0_0.getServerTimeOffset = L1_1
L0_0 = Debug
function L1_1(A0_43, A1_44)
  local L3_45, L4_46, L5_47
  L3_45 = debug
  L4_46 = L3_45
  L3_45 = L3_45._printText
  L5_47 = debug
  L3_45(L4_46, L5_47, 20005, A1_44:_getCatalogID(), A1_44:_getNameIndex())
end
L0_0.printItemName = L1_1
L0_0 = Debug
function L1_1(A0_48, A1_49)
  local L3_50, L4_51, L5_52
  L3_50 = debug
  L4_51 = L3_50
  L3_50 = L3_50._printText
  L5_52 = debug
  L3_50(L4_51, L5_52, 20007, A1_49:getCommandId())
end
L0_0.printCommandName = L1_1
L0_0 = Debug
function L1_1(A0_53, A1_54)
  local L3_55, L4_56, L5_57
  L3_55 = debug
  L4_56 = L3_55
  L3_55 = L3_55._printText
  L5_57 = debug
  L3_55(L4_56, L5_57, 20008, A1_54:getStatusId())
end
L0_0.printStatusName = L1_1
L0_0 = Debug
function L1_1(A0_58, A1_59)
  local L3_60, L4_61, L5_62
  L3_60 = debug
  L4_61 = L3_60
  L3_60 = L3_60._printText
  L5_62 = debug
  L3_60(L4_61, L5_62, 20009, A1_59:getQuestId())
end
L0_0.printQuestName = L1_1
L0_0 = Debug
function L1_1(A0_63, A1_64, A2_65)
  local L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73
  L4_67 = debug
  L5_68 = L4_67
  L4_67 = L4_67._printLog
  L6_69 = "\227\130\171\227\131\131\227\131\136\227\130\183\227\131\188\227\131\179\227\131\151\227\131\172\227\131\147\227\131\165\227\131\188\227\131\162\227\131\188\227\131\137\227\129\167\227\129\153"
  L4_67(L5_68, L6_69)
  L3_66 = 64
  L4_67 = worldMaster
  L5_68 = L4_67
  L4_67 = L4_67.createCutScene
  L6_69 = A1_64
  L7_70 = nil
  L4_67 = L4_67(L5_68, L6_69, L7_70)
  L5_68 = 0
  L6_69 = "badegon"
  L7_70 = 1070001
  L8_71 = 1
  L9_72 = 1
  L10_73 = 3
  if A1_64 ~= -1 then
    debug:_printLog("snpc\231\179\187\230\131\133\229\160\177\226\151\134\227\131\135\227\131\144\227\131\131\227\130\176\230\153\130\227\129\171\229\133\165\227\130\140\227\130\137\227\130\140\227\130\139\230\131\133\229\160\177\226\151\134")
    debug:_printLog("B-reg(snpcActorClassID)" .. tostring(L7_70))
    debug:_printLog("C-reg(snpcRace)" .. tostring(L10_73))
    debug:_printLog("D-reg(snpcPersonality)" .. tostring(L8_71))
    debug:_printLog("E-reg(gnpc)" .. tostring(L9_72))
    debug:_printLog("X-reg(snpcName)" .. tostring(L6_69))
  end
  L4_67:startCutScene(1, 64, 2, L5_68, L7_70, L10_73, L8_71, L9_72, 1, 1, 1, L6_69)
  L4_67:_delete()
  worldMaster:_getMyPlayer():_fadeIn(1)
end
L0_0._onCutScenePreview = L1_1
L0_0 = Debug
function L1_1(A0_74, A1_75, A2_76, ...)
  require("/Widget/" .. A1_75)
  if A2_76 == nil then
    A2_76 = desktopWidget
  end
  _createActor(nil, _string.gsub(A1_75, ".+/", ""), false, A1_75, A2_76, 1, false, ...):show()
  if _createActor(nil, _string.gsub(A1_75, ".+/", ""), false, A1_75, A2_76, 1, false, ...):isShow() then
    debug:_printLog(A1_75 .. "\227\130\146\231\148\159\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130\227\131\134\227\130\185\227\131\136\229\174\140\228\186\134\229\190\140\227\129\175\227\129\147\227\129\174\233\150\162\230\149\176\227\129\174\228\189\191\231\148\168\231\174\135\230\137\128\227\130\146\233\128\159\227\130\132\227\129\139\227\129\171\229\137\138\233\153\164\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\227\128\130")
  end
  return (_createActor(nil, _string.gsub(A1_75, ".+/", ""), false, A1_75, A2_76, 1, false, ...))
end
L0_0.createTestWidget = L1_1
