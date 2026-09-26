local L0_0, L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_2)
  A0_2:_callSuperClassFunc("_onInit")
  A0_2.commandDebuggerWork._save = {
    {
      "_assignForChild",
      256
    }
  }
  A0_2.commandDebuggerWork._temp = {
    {
      "_assignForChild",
      768
    }
  }
  if not _isInstanceOf(A0_2, "CommandDebuggerFUNCBaseClass") then
    A0_2:init()
  end
end
L0_0._onInit = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_3)
  local L1_4
end
L0_0.init = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_5, A1_6, ...)
  local L3_8, L4_9, L5_10, L6_11
  L3_8 = false
  L4_9 = nil
  L6_11 = A1_6
  L5_10 = A1_6._getGMRank
  L5_10 = L5_10(L6_11)
  if L5_10 ~= nil then
    L5_10 = {
      [2] = L6_11(A0_5, A1_6, ...)
    }
    L6_11 = A0_5.checkParameter
    L6_11 = L6_11(A0_5, A1_6, ...)
    ;({
      [2] = L6_11(A0_5, A1_6, ...)
    })[1] = L6_11
    L4_9 = L5_10
    L5_10 = L4_9[1]
    if L5_10 == nil then
      L5_10 = L4_9[2]
      if L5_10 ~= nil then
        L5_10 = type
        L6_11 = L4_9[2]
        L5_10 = L5_10(L6_11)
        if L5_10 == "string" then
          L5_10 = L4_9[2]
          return L5_10
        end
      end
    end
    L5_10 = L4_9[1]
    if L5_10 == true then
      L3_8 = true
    else
      L5_10 = L4_9[2]
      if L5_10 == nil then
        L5_10 = "\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\131\135\227\131\144\227\131\131\227\130\176\227\130\179\227\131\158\227\131\179\227\131\137\227\129\140\230\140\135\229\174\154\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130"
        return L5_10
      else
        L5_10 = L4_9[2]
        return L5_10
      end
    end
  end
  if not L3_8 then
    L5_10 = "\232\167\163\233\135\136\227\129\167\227\129\141\227\130\139\227\131\135\227\131\144\227\131\131\227\130\176\227\130\179\227\131\158\227\131\179\227\131\137\227\129\167\227\129\175\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130"
    return L5_10
  end
  L5_10, L6_11 = nil, nil
  if L3_8 then
    L5_10, L6_11 = pcall(function(...)
      local L2_13, L3_14
      L2_13 = _UPVALUE0_
      L3_14 = L2_13
      L2_13 = L2_13.command
      return L2_13(L3_14, ...)
    end, A1_6, "__parsed__", unpack(L4_9, 2))
  end
  if false then
    L5_10, L6_11 = pcall(function(...)
      local L2_16, L3_17
      L2_16 = _UPVALUE0_
      L3_17 = L2_16
      L2_16 = L2_16.command
      return L2_16(L3_17, ...)
    end, A1_6, ...)
  end
  if L5_10 then
    return L6_11
  else
    if L6_11 ~= nil then
      worldMaster:_printLog("\227\131\135\227\131\144\227\131\131\227\130\176\227\130\179\227\131\158\227\131\179\227\131\137\229\135\166\231\144\134\228\184\173\227\129\171\227\130\168\227\131\169\227\131\188\227\129\140\227\129\167\227\129\190\227\129\151\227\129\159\227\129\140\227\128\129\227\129\147\227\129\174\229\160\180\229\144\136\227\129\175\231\137\185\229\136\165\227\129\171\231\182\153\231\182\154\227\129\151\227\129\166\228\189\156\230\165\173\227\129\140\233\128\178\227\130\129\227\130\137\227\130\140\227\129\190\227\129\153\227\128\130")
      worldMaster:_printLog(L6_11)
      L6_11 = "\227\130\179\227\131\158\227\131\179\227\131\137\227\131\135\227\131\144\227\131\131\227\130\172\227\130\168\227\131\169\227\131\188\239\188\154" .. L6_11
      L6_11 = string:_gsub(L6_11, "(stack trace:)(.*)$", "")
      L6_11 = string:_gsub(L6_11, "(Assert!! )", [[
%1
  ]])
      L6_11 = string:_gsub(L6_11, "(\227\128\130)", [[
%1
  ]])
      if _getUTF8StringByteLength(L6_11) > 160 then
        L6_11 = string:_gsub(L6_11, "(\227\128\129)", [[
%1
  ]])
      end
    end
    return L6_11
  end
end
L0_0._onCommand = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_18, A1_19, ...)
end
L0_0.command = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_21)
  A0_21:processLoop()
end
L0_0._onLoop = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_22)
  local L1_23
end
L0_0.processLoop = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_24, A1_25, A2_26)
  local L3_27, L4_28
  L3_27 = A0_24.work
  L4_28 = A1_25 or {}
  L3_27._save = L4_28
  L3_27 = A0_24.work
  L4_28 = A2_26 or {}
  L3_27._temp = L4_28
end
L0_0.initWork = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_29, A1_30)
  return A0_29.work[A1_30]
end
L0_0.getTempWork = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_31, A1_32)
  return A0_31.work[A1_32]
end
L0_0.getSaveWork = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_33, A1_34, A2_35)
  A0_33.work[A1_34] = A2_35
end
L0_0.setTempWork = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_36, A1_37, A2_38)
  A0_36.work[A1_37] = A2_38
end
L0_0.setSaveWork = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_39, A1_40, ...)
  local L3_42, L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65
  L4_43 = _isInstanceOf
  L4_43 = L4_43(L5_44, L6_45)
  if L4_43 then
    L3_42 = "//dev"
  else
    L4_43 = _isInstanceOf
    L4_43 = L4_43(L5_44, L6_45)
    if L4_43 then
      L3_42 = "//gm"
    else
      L4_43 = _isInstanceOf
      L4_43 = L4_43(L5_44, L6_45)
      if L4_43 then
        L3_42 = "//test"
      else
        L4_43 = false
        return L4_43, L5_44
      end
    end
  end
  L4_43 = select
  L26_65 = ...
  L4_43 = L4_43(L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, ...)
  if L4_43 == 0 then
    L4_43 = false
    return L4_43, L5_44
  end
  L4_43 = select
  L26_65 = ...
  L4_43 = L4_43(L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, ...)
  if L4_43 == "__parsed__" then
    L4_43 = true
    L26_65 = ...
    L26_65 = L5_44(L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, ...)
    return L4_43, L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L5_44(L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, ...)
  end
  L4_43 = L3_42
  L4_43 = L5_44 .. L6_45
  L26_65 = ...
  for L8_47 = 1, L6_45(L7_46, L8_47, L9_48, L10_49, L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, ...) do
    L9_48 = L4_43
    L10_49 = " "
    L14_53 = L8_47
    L26_65 = ...
    L4_43 = L9_48 .. L10_49 .. L11_50
  end
  L8_47 = nil
  L9_48 = 0
  L10_49 = debugCommandSheet
  L10_49 = L10_49._getAllKey
  L10_49 = L10_49(L11_50)
  for L14_53 = 1, #L10_49, 2 do
    for L18_57 = L10_49[L14_53], L16_55 - 1, 8 do
      L19_58 = _math
      L19_58 = L19_58.min
      L19_58 = L19_58(L20_59, L21_60)
      L23_62 = L19_58
      L20_59(L21_60, L22_61, L23_62)
      for L23_62 = L18_57, L19_58 do
        L24_63 = debugCommandSheet
        L25_64 = L24_63
        L24_63 = L24_63._getData
        L26_65 = L23_62
        L24_63 = L24_63(L25_64, L26_65, 0)
        L25_64 = debugCommandSheet
        L26_65 = L25_64
        L25_64 = L25_64._getData
        L25_64 = L25_64(L26_65, L23_62, 2)
        if L25_64 then
          L26_65 = string
          L26_65 = L26_65.startsWith
          L26_65 = L26_65(L26_65, L24_63, L3_42 .. " ")
          if L26_65 then
            L26_65 = {
              A0_39:parseParameter(A1_40, string:_sub(L24_63, #L3_42 + 2), ...)
            }
            if L26_65[1] == nil then
              if L26_65[2] ~= nil and type(L26_65[2]) == "string" then
                return nil, L26_65[2]
              end
            else
              if L26_65[1] then
                if not debugCommandSheet:_getData(L23_62, 4) then
                end
              end
              if "\229\144\136\232\135\180\227\129\151\227\129\166\227\129\190\227\129\153\227\129\140\227\128\129\227\130\175\227\131\169\227\130\164\227\130\162\227\131\179\227\131\136\229\129\180\227\129\167\227\129\175\228\189\191\227\129\136\227\129\190\227\129\155\227\130\147\227\128\130" ~= nil then
                L26_65[2], L26_65[1] = "\229\144\136\232\135\180\227\129\151\227\129\166\227\129\190\227\129\153\227\129\140\227\128\129\227\130\175\227\131\169\227\130\164\227\130\162\227\131\179\227\131\136\229\129\180\227\129\167\227\129\175\228\189\191\227\129\136\227\129\190\227\129\155\227\130\147\227\128\130", false
                L26_65[3] = 0
              end
              if L26_65[1] then
                if L6_45 ~= nil and L9_48 < L26_65[2] then
                  L9_48 = L26_65[2]
                elseif L6_45 == nil then
                  L9_48 = L26_65[2]
                end
              elseif (L8_47 == nil or L8_47 >= L26_65[3]) and nil == nil then
                L8_47 = L26_65[3]
              end
            end
          end
        end
      end
      L23_62 = L19_58
      L20_59(L21_60, L22_61, L23_62)
    end
  end
  if L7_46 ~= "" then
  end
  if L6_45 ~= nil then
    L26_65 = L12_51(L13_52)
    return L11_50, L12_51, L13_52, L14_53, L15_54, L16_55, L17_56, L18_57, L19_58, L20_59, L21_60, L22_61, L23_62, L24_63, L25_64, L26_65, L12_51(L13_52)
  elseif L7_46 ~= "" then
    return L11_50, L12_51
  else
    L14_53 = " \227\129\140\230\140\135\229\174\154\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130"
    return L11_50, L12_51
  end
end
L0_0.checkParameter = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_66, A1_67, A2_68, ...)
  local L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77, L12_78, L13_79, L14_80, L15_81, L16_82, L17_83, L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L26_92, L27_93
  L4_70 = string
  L5_71 = L4_70
  L4_70 = L4_70.split
  L6_72 = A2_68
  L7_73 = " "
  L4_70 = L4_70(L5_71, L6_72, L7_73)
  L5_71 = {}
  L6_72 = 0
  L7_73 = false
  L8_74 = ""
  L9_75 = {}
  L10_76 = 0
  L11_77 = false
  L12_78 = false
  L16_82 = "#"
  L27_93 = ...
  L16_82 = #L4_70
  for L16_82 = 1, L14_80(L15_81, L16_82) do
    L17_83 = select
    L18_84 = L16_82
    L27_93 = ...
    L17_83 = L17_83(L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L26_92, L27_93, ...)
    L18_84 = L4_70[L16_82]
    if L16_82 == 1 and L17_83 ~= L18_84 then
      L19_85 = nil
      return L19_85
    end
    L19_85 = false
    L20_86 = _string
    L20_86 = L20_86.match
    L21_87 = L18_84
    L22_88 = "^([^%(%)]+%.)(%([^%)]+%).*)$"
    L21_87 = L20_86(L21_87, L22_88)
    if L20_86 ~= nil then
      L22_88 = type
      L23_89 = L17_83
      L22_88 = L22_88(L23_89)
      if L22_88 == "string" then
        L22_88 = string
        L23_89 = L22_88
        L22_88 = L22_88.startsWith
        L22_88 = L22_88(L23_89, L24_90, L25_91)
        if L22_88 then
          L22_88 = _string
          L22_88 = L22_88.sub
          L23_89 = L17_83
          L22_88 = L22_88(L23_89, L24_90)
          L17_83 = L22_88
          L18_84 = L21_87
        end
      else
        L18_84 = ""
      end
    end
    L22_88 = _string
    L22_88 = L22_88.match
    L23_89 = L18_84
    L23_89 = L22_88(L23_89, L24_90)
    if L23_89 ~= nil then
      if L24_90 == "string" then
        L27_93 = L23_89
        if L24_90 then
          L27_93 = #L23_89
          L27_93 = -L27_93
          L27_93 = L27_93 - 1
          L17_83 = L24_90
          L18_84 = L22_88
        end
      else
        L18_84 = ""
      end
    end
    if L18_84 == "..." then
      L27_93 = ...
      for L27_93 = L16_82, L25_91(L26_92, L27_93, ...) do
        _table.insert(L5_71, (select(L27_93, ...)))
      end
      L7_73 = true
      break
    elseif L18_84 == "(chara)" then
      L19_85 = L24_90
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(otherChara)" then
      L19_85 = L24_90 and L17_83 ~= A1_67
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(player)" then
      L19_85 = L24_90
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(myPlayer)" then
      L19_85 = L24_90 and L17_83 == A1_67
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(otherPlayer)" then
      L19_85 = L24_90 and L17_83 ~= A1_67
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(retainer)" then
      L19_85 = L24_90 and L24_90
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(monster)" then
      L19_85 = L24_90
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(number)" then
      L17_83 = L24_90
      L19_85 = L24_90 == "number"
      if L19_85 and (L17_83 > 2147483647 or L17_83 < -2147483647) then
        L19_85 = false
        L12_78 = true
      end
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(integer)" then
      L17_83 = L24_90
      L19_85 = L24_90 == "number" and L17_83 == L24_90
      if L19_85 and (L17_83 > 2147483647 or L17_83 < -2147483647) then
        L19_85 = false
        L12_78 = true
      end
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(natural)" then
      L17_83 = L24_90
      L19_85 = L24_90 == "number" and L17_83 == L24_90 and L17_83 >= 1
      if L19_85 and L17_83 > 2147483647 then
        L19_85 = false
        L12_78 = true
      end
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(string)" then
      L19_85 = L24_90 == "string" and L24_90
      L24_90(L25_91, L26_92)
    elseif L18_84 == "(boolean)" then
      if L17_83 == "true" or L17_83 == "yes" or L17_83 == "on" or L17_83 == "1" then
        L17_83 = true
        L19_85 = true
      elseif L17_83 == "false" or L17_83 == "no" or L17_83 == "off" or L17_83 == "0" then
        L17_83 = false
        L19_85 = true
      end
      L24_90(L25_91, L26_92)
    elseif L24_90 then
      L27_93 = "Sheet"
      L27_93 = L17_83
      L17_83 = L26_92
      L19_85 = L25_91 ~= nil and L17_83 ~= nil and L17_83 == L26_92 and L17_83 >= 0 and L17_83 <= 2147483647 and L26_92
      L27_93 = L5_71
      L26_92(L27_93, L17_83)
    else
      L19_85 = L17_83 == L18_84
      if not L19_85 then
        L24_90(L25_91, L26_92)
      end
    end
    if L16_82 == 1 and L19_85 then
      L11_77 = true
    end
    if not L19_85 then
      L6_72 = L6_72 + 1
      L27_93 = "\231\149\170\231\155\174"
      L24_90(L25_91, L26_92)
    else
      L10_76 = L10_76 + 1
    end
  end
  if L13_79 > 0 then
    L16_82 = ", "
    L8_74 = L13_79 .. L14_80 .. L15_81
  end
  if L7_73 then
  else
    L27_93 = ...
    if L13_79 < L14_80 then
      L6_72 = L6_72 + 0.5
      L8_74 = L13_79 .. L14_80
    else
      L27_93 = ...
      if L13_79 > L14_80 and L10_76 < 1 then
        L6_72 = L6_72 + 0.5
        L8_74 = L13_79 .. L14_80
      end
    end
  end
  L27_93 = ...
  for L16_82 = L13_79 + 1, L14_80(L15_81, L16_82, L17_83, L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L26_92, L27_93, ...) do
    L17_83 = _table
    L17_83 = L17_83.insert
    L18_84 = L5_71
    L19_85 = select
    L20_86 = L16_82
    L27_93 = ...
    L19_85 = L19_85(L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L26_92, L27_93, ...)
    L17_83(L18_84, L19_85)
  end
  if L6_72 == 0 and L11_77 then
    L16_82 = L5_71
    L27_93 = L15_81(L16_82)
    return L13_79, L14_80, L15_81, L16_82, L17_83, L18_84, L19_85, L20_86, L21_87, L22_88, L23_89, L24_90, L25_91, L26_92, L27_93, L15_81(L16_82)
  elseif L12_78 then
    return L13_79, L14_80
  else
    return L13_79, L14_80, L15_81
  end
end
L0_0.parseParameter = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_94, A1_95, A2_96, A3_97)
  return debug:_commandDebug(A1_95, "gm", "__parsed__", 20003, A2_96, A3_97)
end
L0_0.delegateGetWorkCommandForRelease = L1_1
L0_0 = CommandDebuggerBaseClass
function L1_1(A0_98, A1_99, A2_100, A3_101, A4_102)
  if tonumber(A4_102) ~= nil then
    return debug:_commandDebug(A1_99, "gm", "__parsed__", 20004, A2_100, A3_101, tonumber(A4_102))
  else
    return debug:_commandDebug(A1_99, "gm", "__parsed__", 20005, A2_100, A3_101, A4_102)
  end
end
L0_0.delegateSetWorkCommandForRelease = L1_1
