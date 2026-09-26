local L0_0, L1_1
L0_0 = CommandDebuggerTEST
function L1_1(A0_2)
  local L1_3
  L1_3 = {}
  A0_2:initWork(nil, L1_3)
end
L0_0.init = L1_1
L0_0 = CommandDebuggerTEST
function L1_1(A0_4, A1_5, A2_6, ...)
  local L4_8, L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24
  if A2_6 == "bazaar" then
    L4_8 = nil
    return L4_8
  elseif A2_6 == "dbzr" then
    L4_8 = desktopWidget
    L5_9 = L4_8
    L4_8 = L4_8.isTargetBazaar
    L4_8 = L4_8(L5_9)
    L5_9 = debug
    L5_9 = L5_9._printLog
    L9_13 = L4_8
    L5_9(L6_10, L7_11)
    L5_9 = nil
    return L5_9
  elseif A2_6 == "retainer" or A2_6 == "rtn" then
    L5_9 = ...
    L9_13 = A2_6
    L10_14 = _string
    L10_14 = L10_14.lower
    L11_15 = L4_8
    L10_14 = L10_14(L11_15)
    if L10_14 == "list" then
      L12_16 = A1_5
      L11_15 = A1_5._getGroup
      L11_15 = L11_15(L12_16, L13_17)
      if L11_15 == nil then
        L12_16 = debug
        L12_16 = L12_16._printLog
        L12_16(L13_17, L14_18)
        L12_16 = nil
        return L12_16
      end
      L12_16 = debug
      L12_16 = L12_16._printLog
      L12_16(L13_17, L14_18)
      L12_16 = debug
      L12_16 = L12_16._printLog
      L12_16(L13_17, L14_18)
      L12_16 = L11_15._countMember
      L12_16 = L12_16(L13_17)
      for L16_20 = 1, L12_16 do
        L18_22 = L11_15
        L17_21 = L11_15.getMemberWorkCoordinateId
        L19_23 = L16_20
        L17_21 = L17_21(L18_22, L19_23)
        L19_23 = L11_15
        L18_22 = L11_15.getMemberWorkEmploymentState
        L20_24 = L16_20
        L18_22 = L18_22(L19_23, L20_24)
        L20_24 = L11_15
        L19_23 = L11_15._isExistInWorldMember
        L19_23 = L19_23(L20_24, L16_20)
        if L19_23 == false then
          L20_24 = L11_15
          L19_23 = L11_15._getMemberLocalizedDisplayName
          L20_24 = L19_23(L20_24, L16_20)
          debug:_printLog("  LOGOUT:[" .. L19_23 .. "](" .. tostring(L19_23) .. ") / layoutID[LOGOUT]" .. " cd:" .. tostring(L17_21) .. " st:" .. tostring(L18_22))
        else
          L20_24 = L11_15
          L19_23 = L11_15._isExistInClientMember
          L19_23 = L19_23(L20_24, L16_20)
          if L19_23 == false then
            L20_24 = L11_15
            L19_23 = L11_15._getMemberLocalizedDisplayName
            L20_24 = L19_23(L20_24, L16_20)
            debug:_printLog("  OutOfClient:[" .. L19_23 .. "](" .. tostring(L20_24) .. ")" .. " cd:" .. tostring(L17_21) .. " st:" .. tostring(L18_22))
          else
            L20_24 = L11_15
            L19_23 = L11_15._getMember
            L19_23 = L19_23(L20_24, L16_20)
            L20_24 = debug
            L20_24 = L20_24._printLog
            L20_24(L20_24, "\227\128\128" .. debug:getDebugName(L19_23) .. " cd:" .. tostring(L17_21) .. " st:" .. tostring(L18_22))
          end
        end
      end
      L13_17(L14_18, L15_19)
      return L13_17
    end
    L11_15 = nil
    return L11_15
  elseif A2_6 == "npcls" then
    L4_8 = tonumber
    L5_9 = select
    L20_24 = ...
    L20_24 = L5_9(L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L5_9(L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...))
    L5_9 = A1_5.hasNpcLinkshell
    L5_9 = L5_9(L6_10, L7_11)
    if L5_9 == false then
      L5_9 = debug
      L5_9 = L5_9._printLog
      L5_9(L6_10, L7_11)
    else
      L5_9 = A1_5.isNpcLinkshellChatCalling
      L5_9 = L5_9(L6_10, L7_11)
      if L5_9 == false then
        L5_9 = debug
        L5_9 = L5_9._printLog
        L5_9(L6_10, L7_11)
      else
        L5_9 = A1_5.getSystemCommand
        L5_9 = L5_9(L6_10, L7_11)
        L9_13 = L4_8
        L6_10(L7_11, L8_12, L9_13)
      end
    end
  elseif A2_6 == "sit" then
    L5_9 = A1_5
    L4_8 = A1_5.getSystemCommand
    L4_8 = L4_8(L5_9, L6_10)
    L5_9 = A1_5.getEmoteSitCommandVariation
    L5_9 = L5_9(L6_10)
    if L6_10 then
      L5_9 = nil
    end
    if L4_8 ~= nil then
      L9_13 = L5_9
      L10_14, L11_15, L12_16 = nil, nil, nil
      L6_10(L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17)
    end
    return L6_10
  elseif A2_6 == "myCommand" or A2_6 == "mc" then
    return
  elseif A2_6 == "isexistclass" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    L5_9 = _G
    L5_9 = L5_9[L4_8]
    if L5_9 == nil then
      L5_9 = debug
      L5_9 = L5_9._printLog
      L9_13 = " \227\129\175\227\130\175\227\131\169\227\130\164\227\130\162\227\131\179\227\131\136Lua\231\146\176\229\162\131\227\129\171\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147\227\128\130"
      L5_9(L6_10, L7_11)
    else
      L5_9 = debug
      L5_9 = L5_9._printLog
      L9_13 = " \227\129\175\227\130\175\227\131\169\227\130\164\227\130\162\227\131\179\227\131\136Lua\231\146\176\229\162\131\227\129\171\229\173\152\229\156\168\227\129\151\227\129\190\227\129\153\227\128\130"
      L5_9(L6_10, L7_11)
    end
  elseif A2_6 == "uiEffect" then
    L4_8 = {
      [17] = ...
    }
    L20_24 = ...
    ;({
      [17] = ...
    })[1] = L5_9
    ;({
      [17] = ...
    })[2] = L6_10
    ;({
      [17] = ...
    })[3] = L7_11
    ;({
      [17] = ...
    })[4] = L8_12
    ;({
      [17] = ...
    })[5] = L9_13
    ;({
      [17] = ...
    })[6] = L10_14
    ;({
      [17] = ...
    })[7] = L11_15
    ;({
      [17] = ...
    })[8] = L12_16
    ;({
      [17] = ...
    })[9] = L13_17
    ;({
      [17] = ...
    })[10] = L14_18
    ;({
      [17] = ...
    })[11] = L15_19
    ;({
      [17] = ...
    })[12] = L16_20
    ;({
      [17] = ...
    })[13] = L17_21
    ;({
      [17] = ...
    })[14] = L18_22
    ;({
      [17] = ...
    })[15] = L19_23
    ;({
      [17] = ...
    })[16] = L20_24
    L5_9 = tostring
    L5_9 = L5_9(L6_10)
    if L8_12 == "pub" then
      L9_13 = desktopWidget
      L10_14 = L9_13
      L9_13 = L9_13.openPublicEffectWidget
      L11_15 = L6_10
      L9_13(L10_14, L11_15)
      break
    else
    end
    if L8_12 == "gcrank" then
      L9_13 = desktopWidget
      L10_14 = L9_13
      L9_13 = L9_13.openGrandCompanyJoinEffectWidget
      L11_15 = L6_10
      L12_16 = L7_11
      L9_13(L10_14, L11_15, L12_16)
      break
    else
    end
    if L8_12 == "cutshow" then
      L9_13 = desktopWidget
      L10_14 = L9_13
      L9_13 = L9_13.openCutSceneEffectWidget
      L11_15 = L6_10
      L9_13(L10_14, L11_15)
      break
    else
    end
    if L8_12 == "cuthide" then
      L9_13 = desktopWidget
      L10_14 = L9_13
      L9_13 = L9_13.closeCutSceneEffectWidget
      L9_13(L10_14)
      break
    else
    end
  elseif A2_6 == "help" then
    L4_8 = {
      [17] = ...
    }
    L20_24 = ...
    ;({
      [17] = ...
    })[1] = L5_9
    ;({
      [17] = ...
    })[2] = L6_10
    ;({
      [17] = ...
    })[3] = L7_11
    ;({
      [17] = ...
    })[4] = L8_12
    ;({
      [17] = ...
    })[5] = L9_13
    ;({
      [17] = ...
    })[6] = L10_14
    ;({
      [17] = ...
    })[7] = L11_15
    ;({
      [17] = ...
    })[8] = L12_16
    ;({
      [17] = ...
    })[9] = L13_17
    ;({
      [17] = ...
    })[10] = L14_18
    ;({
      [17] = ...
    })[11] = L15_19
    ;({
      [17] = ...
    })[12] = L16_20
    ;({
      [17] = ...
    })[13] = L17_21
    ;({
      [17] = ...
    })[14] = L18_22
    ;({
      [17] = ...
    })[15] = L19_23
    ;({
      [17] = ...
    })[16] = L20_24
    L5_9 = tostring
    L5_9 = L5_9(L6_10)
    if L5_9 == nil then
      L9_13 = L8_12
      L10_14 = 33
      L9_13 = L8_12
      L10_14 = 33
      L11_15 = L7_11
      L8_12(L9_13, L10_14, L11_15)
    elseif L5_9 == "display" then
      L9_13 = L8_12
      L10_14 = L7_11
      L8_12(L9_13, L10_14)
    end
  elseif A2_6 == "printDisp" then
    L4_8 = true
    L5_9 = debug
    L5_9 = L5_9.isPrintDisp
    L5_9 = L5_9(L6_10)
    if L5_9 == true then
      L4_8 = false
    end
    L5_9 = debug
    L5_9 = L5_9.setPrintDisp
    L5_9(L6_10, L7_11)
    L5_9 = debug
    L5_9 = L5_9.printFormat
    L9_13 = L4_8
    L20_24 = L8_12(L9_13)
    L5_9(L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L8_12(L9_13))
  elseif A2_6 == "reloadxtx" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    L5_9 = debug
    L5_9 = L5_9._reloadXtx
    L5_9(L6_10, L7_11)
    L5_9 = debug
    L5_9 = L5_9._printLog
    L5_9(L6_10, L7_11)
  elseif A2_6 == "npcsay" then
    L4_8 = {
      [17] = ...
    }
    L20_24 = ...
    ;({
      [17] = ...
    })[1] = L5_9
    ;({
      [17] = ...
    })[2] = L6_10
    ;({
      [17] = ...
    })[3] = L7_11
    ;({
      [17] = ...
    })[4] = L8_12
    ;({
      [17] = ...
    })[5] = L9_13
    ;({
      [17] = ...
    })[6] = L10_14
    ;({
      [17] = ...
    })[7] = L11_15
    ;({
      [17] = ...
    })[8] = L12_16
    ;({
      [17] = ...
    })[9] = L13_17
    ;({
      [17] = ...
    })[10] = L14_18
    ;({
      [17] = ...
    })[11] = L15_19
    ;({
      [17] = ...
    })[12] = L16_20
    ;({
      [17] = ...
    })[13] = L17_21
    ;({
      [17] = ...
    })[14] = L18_22
    ;({
      [17] = ...
    })[15] = L19_23
    ;({
      [17] = ...
    })[16] = L20_24
    L5_9 = tostring
    L5_9 = L5_9(L6_10)
    if L5_9 == "on" then
    else
    end
    L9_13 = 14
    L9_13 = L6_10
    L7_11(L8_12, L9_13)
  elseif A2_6 == "tutorial" then
    L4_8 = {
      [17] = ...
    }
    L20_24 = ...
    ;({
      [17] = ...
    })[1] = L5_9
    ;({
      [17] = ...
    })[2] = L6_10
    ;({
      [17] = ...
    })[3] = L7_11
    ;({
      [17] = ...
    })[4] = L8_12
    ;({
      [17] = ...
    })[5] = L9_13
    ;({
      [17] = ...
    })[6] = L10_14
    ;({
      [17] = ...
    })[7] = L11_15
    ;({
      [17] = ...
    })[8] = L12_16
    ;({
      [17] = ...
    })[9] = L13_17
    ;({
      [17] = ...
    })[10] = L14_18
    ;({
      [17] = ...
    })[11] = L15_19
    ;({
      [17] = ...
    })[12] = L16_20
    ;({
      [17] = ...
    })[13] = L17_21
    ;({
      [17] = ...
    })[14] = L18_22
    ;({
      [17] = ...
    })[15] = L19_23
    ;({
      [17] = ...
    })[16] = L20_24
    L5_9 = tostring
    L5_9 = L5_9(L6_10)
    if L5_9 == "on" then
      L9_13 = L8_12
      L8_12(L9_13)
      return L8_12
    elseif L5_9 == "off" then
      L9_13 = L8_12
      L8_12(L9_13)
      return L8_12
    elseif L5_9 == "open" then
      L9_13 = L8_12
      L8_12(L9_13)
      L9_13 = L8_12
      L10_14 = L6_10
      L8_12(L9_13, L10_14)
      L9_13 = L8_12
      L10_14 = L6_10
      L11_15 = L7_11
      L8_12(L9_13, L10_14, L11_15)
      return L8_12
    elseif L5_9 == "close" then
      L9_13 = L8_12
      L8_12(L9_13)
      return L8_12
    end
  elseif A2_6 == "chocobo" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    if L4_8 == "on" then
      L5_9 = _getStaticActor
      L5_9 = L5_9(L6_10)
      L6_10(L7_11, L8_12)
    elseif L4_8 == "off" then
      L5_9 = _getStaticActor
      L5_9 = L5_9(L6_10)
      L6_10(L7_11, L8_12)
    elseif L4_8 == "goobbue" then
      L5_9 = select
      L20_24 = ...
      L5_9 = L5_9(L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
      if L5_9 == "on" then
        L9_13 = L6_10
        L10_14 = true
        L7_11(L8_12, L9_13, L10_14)
      elseif L5_9 == "off" then
        L9_13 = L6_10
        L7_11(L8_12, L9_13)
      end
    else
      L5_9 = "on \227\129\139 off \227\130\146\230\140\135\229\174\154\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132"
      return L5_9
    end
  elseif A2_6 == "offsetservertime" then
    L4_8 = (...)
    L5_9 = 0
    if L4_8 == nil then
      L9_13 = L8_12
      L20_24 = L8_12(L9_13)
      return L6_10
    else
      L5_9 = L6_10
    end
    L6_10(L7_11, L8_12)
    L9_13 = L8_12
    L20_24 = L8_12(L9_13)
    return L6_10
  elseif A2_6 == "targetbydn" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L5_9 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    if L4_8 == nil then
      return L6_10
    end
    if L5_9 ~= nil then
      L9_13 = L5_9
    end
    L9_13 = 1
    L10_14 = L6_10
    L7_11(L8_12, L9_13, L10_14)
  elseif A2_6 == "lookat" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    L5_9 = "Target\227\130\146\230\140\135\229\174\154\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\227\128\130"
    if L4_8 ~= nil then
      L9_13 = " \227\129\175\232\170\176\227\130\130\232\166\139\227\129\166\227\129\132\227\129\170\227\129\132\226\128\166\227\128\130"
      L5_9 = L8_12 .. L9_13
      if L7_11 ~= nil then
        L9_13 = L7_11
        L9_13 = L6_10
        L10_14 = " \227\129\175 "
        L11_15 = L8_12
        L12_16 = " \227\130\146\232\166\139\227\129\166\227\129\132\227\130\139\239\188\129"
        L5_9 = L9_13 .. L10_14 .. L11_15 .. L12_16
      end
    end
    return L5_9
  elseif A2_6 == "metvisor" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    if L4_8 == nil or L4_8 ~= "show" and L4_8 ~= "hide" then
      L5_9 = "usage: //testc metvisor [show|hide]"
      return L5_9
    end
    if L4_8 == "show" then
      L5_9 = desktopWidget
      L5_9 = L5_9.executePlayerCommand
      L9_13 = 0
      L5_9(L6_10, L7_11, L8_12, L9_13)
      L5_9 = debug
      L5_9 = L5_9._printLog
      L5_9(L6_10, L7_11)
    else
      L5_9 = desktopWidget
      L5_9 = L5_9.executePlayerCommand
      L9_13 = 1
      L5_9(L6_10, L7_11, L8_12, L9_13)
      L5_9 = debug
      L5_9 = L5_9._printLog
      L5_9(L6_10, L7_11)
    end
  elseif A2_6 == "hamlet" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    if L4_8 == "supplyranking" then
      L5_9 = A0_4._getCurrentAreaMaster
      L5_9 = L5_9(L6_10)
      for L9_13 = 1, L7_11(L8_12) do
        L11_15 = L5_9
        L10_14 = L5_9._getHamletSupplyRanking
        L12_16 = L9_13
        L17_21 = L10_14(L11_15, L12_16)
        if L13_17 == nil then
          L18_22 = debug
          L19_23 = L18_22
          L18_22 = L18_22._printLog
          L20_24 = tostring
          L20_24 = L20_24(L9_13)
          L20_24 = L20_24 .. ":" .. L10_14 .. "," .. L11_15 .. "," .. L12_16
          L18_22(L19_23, L20_24)
        else
          L18_22 = debug
          L19_23 = L18_22
          L18_22 = L18_22._printLog
          L20_24 = tostring
          L20_24 = L20_24(L9_13)
          L20_24 = L20_24 .. ":" .. L10_14 .. "," .. L11_15 .. "," .. L12_16 .. "," .. L13_17 .. "," .. L14_18 .. "," .. L15_19
          L18_22(L19_23, L20_24)
        end
      end
    end
  elseif A2_6 == "showWidget" or A2_6 == "hideWidget" then
    L4_8 = select
    L5_9 = 1
    L20_24 = ...
    L4_8 = L4_8(L5_9, L6_10, L7_11, L8_12, L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, ...)
    if L4_8 == nil then
      L5_9 = "\227\130\166\227\130\163\227\130\184\227\130\167\227\131\131\227\131\136\229\144\141\227\129\175 DesktopWidget.h \227\130\146\229\143\130\231\133\167\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\227\128\130"
      L5_9 = L5_9 .. L6_10 .. L7_11
      return L5_9
    end
    L5_9 = desktopWidget
    L5_9 = L5_9.getWidgetByName
    L5_9 = L5_9(L6_10, L7_11, L8_12)
    if L5_9 == nil then
      return L6_10
    end
    if A2_6 == "showWidget" then
      L6_10(L7_11)
      return L6_10
    else
      L6_10(L7_11)
      return L6_10
    end
  elseif A2_6 == "currentlinkshell" then
    L4_8 = "\227\130\171\227\131\172\227\131\179\227\131\136\227\131\170\227\131\179\227\130\175\227\130\183\227\130\167\227\131\171\229\136\135\227\130\138\230\155\191\227\129\136\229\164\177\230\149\151\226\128\166"
    L5_9 = desktopWidget
    L5_9 = L5_9.executePlayerSetCurrentLinkshellInOrder
    L5_9 = L5_9(L6_10)
    if L5_9 == true then
      L4_8 = "\227\130\171\227\131\172\227\131\179\227\131\136\227\131\170\227\131\179\227\130\175\227\130\183\227\130\167\227\131\171\229\136\135\227\130\138\230\155\191\227\129\136\230\136\144\229\138\159\239\188\129"
    end
    return L4_8
  end
end
L0_0.command = L1_1
