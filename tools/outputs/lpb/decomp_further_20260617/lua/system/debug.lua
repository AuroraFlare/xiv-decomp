require("/System/Debug_utility")
function Debug.isDebug(A0_0)
  return A0_0.work.debug
end
function Debug.callFunctionProtected(A0_1, A1_2, A2_3, ...)
  local L4_5, L5_6
  L4_5 = {
    [2] = L5_6(function(...)
      local L2_8, L3_9, L4_10
      L2_8 = _UPVALUE0_
      L3_9 = L2_8
      L2_8 = L2_8._callFunction
      L4_10 = _UPVALUE1_
      return L2_8(L3_9, L4_10, ...)
    end, ...)
  }
  L5_6 = pcall
  L5_6 = L5_6(function(...)
    local L2_12, L3_13, L4_14
    L2_12 = _UPVALUE0_
    L3_13 = L2_12
    L2_12 = L2_12._callFunction
    L4_14 = _UPVALUE1_
    return L2_12(L3_13, L4_14, ...)
  end, ...)
  ;({
    [2] = L5_6(function(...)
      local L2_16, L3_17, L4_18
      L2_16 = _UPVALUE0_
      L3_17 = L2_16
      L2_16 = L2_16._callFunction
      L4_18 = _UPVALUE1_
      return L2_16(L3_17, L4_18, ...)
    end, ...)
  })[1] = L5_6
  L5_6 = L4_5[1]
  if L5_6 == false then
    L5_6 = L4_5[2]
    L5_6 = string:_gsub(L5_6, "^([a-zA-Z_%.%/%-]+:%d+: )", "")
    L5_6 = string:_gsub(L5_6, "[\r\n]*(stack trace:)(.*)$", "")
    return false, L5_6
  else
    L5_6 = true
    return L5_6, select(2, unpack(L4_5))
  end
end
function Debug.getDebugName(A0_19, ...)
  local L2_21, L3_22, L4_23, L5_24, L6_25
  L2_21 = select
  L6_25 = ...
  L2_21 = L2_21(L3_22, L4_23, L5_24, L6_25, ...)
  if L2_21 ~= 1 then
    L2_21 = ""
    L6_25 = ...
    for L6_25 = 1, L4_23(L5_24, L6_25, ...) do
      if L2_21 ~= "" then
        L2_21 = L2_21 .. ","
      end
      L2_21 = L2_21 .. debug:getDebugName((select(L6_25, ...)))
    end
    return L2_21
  end
  L2_21 = (...)
  if L2_21 == nil then
    return L3_22
  else
    if L3_22 ~= "actor" then
    else
      if L3_22 == "member" then
        if not L3_22 then
          return L3_22
        end
    end
    elseif L3_22 == "number" then
      return L3_22(L4_23)
    elseif L3_22 then
      if L4_23 == "string" then
        return L3_22
      else
        L6_25 = L2_21
        return L4_23(L5_24, L6_25)
      end
    elseif L3_22 then
      if L4_23 then
        L6_25 = L2_21
      end
      L6_25 = L2_21
      if L5_24 == nil then
        L6_25 = "Catalog"
      end
      L6_25 = L5_24
      L6_25 = L6_25 .. L3_22
      return L6_25
    elseif L3_22 then
      return L3_22(L4_23, L5_24)
    else
      return L3_22(L4_23)
    end
  end
end
function Debug.getWorkValues(A0_26, A1_27, A2_28, A3_29, ...)
  local L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73
  L5_31 = {}
  L6_32 = {}
  L7_33 = {}
  L8_34 = {}
  if A2_28 == "*" then
    L9_35 = debug
    L9_35 = L9_35._getAllWorkNamespace
    L9_35 = L9_35(L10_36, L11_37)
    for L13_39 = 1, #L9_35 do
      L14_40 = debug
      L15_41 = L14_40
      L14_40 = L14_40.getWorkValues
      L47_73 = ...
      L15_41 = L14_40(L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...)
      for L21_47 = 1, #L14_40 do
        L22_48 = _table
        L22_48 = L22_48.insert
        L23_49 = L5_31
        L24_50 = L14_40[L21_47]
        L22_48(L23_49, L24_50)
        L22_48 = _table
        L22_48 = L22_48.insert
        L23_49 = L6_32
        L24_50 = L15_41[L21_47]
        L22_48(L23_49, L24_50)
        L22_48 = _table
        L22_48 = L22_48.insert
        L23_49 = L7_33
        L24_50 = L16_42[L21_47]
        L22_48(L23_49, L24_50)
        L22_48 = _table
        L22_48 = L22_48.insert
        L23_49 = L8_34
        L24_50 = L17_43[L21_47]
        L22_48(L23_49, L24_50)
      end
    end
    return L10_36, L11_37, L12_38, L13_39
  end
  L9_35 = {
    L10_36,
    L11_37,
    L12_38
  }
  L47_73 = ...
  for L14_40 = 1, L12_38(L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...) do
    L15_41 = type
    L47_73 = ...
    L47_73 = L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...)
    L15_41 = L15_41(L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...))
    if L15_41 == "number" then
      L15_41 = L10_36
      L47_73 = ...
    else
      L15_41 = type
      L47_73 = ...
      L47_73 = L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...)
      L15_41 = L15_41(L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L37_63, L38_64, L39_65, L40_66, L41_67, L42_68, L43_69, L44_70, L45_71, L46_72, L47_73, ...))
      if L15_41 == "string" then
        L15_41 = L10_36
        L47_73 = ...
      end
    end
  end
  L14_40 = "%%%1"
  L14_40 = ".*"
  for L14_40 = 1, #L9_35 do
    L15_41 = nil
    if L16_42 == "save" then
      L15_41 = L16_42
    elseif L16_42 == "temp" then
      L15_41 = L16_42
    else
      if L16_42 == "sync" then
        L15_41 = L16_42
      else
      end
    end
    if L15_41 == nil then
      L15_41 = L16_42
    end
    for L19_45 = 1, #L15_41 do
      L21_47, L22_48, L23_49 = nil, nil, nil
      L24_50 = A2_28
      L25_51 = "."
      L26_52 = L15_41[L19_45]
      L26_52 = L26_52[1]
      L21_47 = L24_50 .. L25_51 .. L26_52
      L24_50 = {}
      L25_51 = {}
      L26_52 = 2
      if L27_53 == "array" then
        for L31_57 = 1, L27_53 do
          L32_58(L33_59, L34_60)
        end
        L26_52 = L26_52 + 2
      elseif L27_53 == "2Darray" then
        for L30_56 = 1, L28_54[L29_55] do
          for L34_60 = 1, L32_58[L33_59] do
            L37_63 = {L38_64, L39_65}
            L38_64 = L30_56
            L35_61(L36_62, L37_63)
          end
        end
        L26_52 = L26_52 + 3
      else
        L27_53(L28_54, L29_55)
      end
      if L27_53 ~= "reserve" then
      elseif L27_53 == "nesting" then
        L24_50 = L28_54
        for L31_57 = 1, #L27_53 do
          for L36_62 = 1, #L34_60 do
            L37_63 = L27_53[L31_57]
            L37_63 = L37_63[L36_62]
          end
          L33_59(L34_60, L35_61)
          L33_59(L34_60, L35_61)
          if L34_60 == "reserve" then
            if L34_60 ~= nil then
              L37_63 = L15_41[L19_45]
              L37_63 = L37_63[1]
              L38_64 = unpack
              L47_73 = L38_64(L39_65)
            end
          elseif L34_60 == "nesting" then
            if L34_60 ~= nil then
              L37_63 = L15_41[L19_45]
              L37_63 = L37_63[1]
              L38_64 = unpack
              L47_73 = L38_64(L39_65)
            end
          end
          if L33_59 ~= nil then
            for L37_63 = 1, #L33_59 do
              L38_64 = {
                [10] = L39_65(L40_66)
              }
              L47_73 = L39_65(L40_66)
              ;({
                [10] = L39_65(L40_66)
              })[1] = L39_65
              ;({
                [10] = L39_65(L40_66)
              })[2] = L40_66
              ;({
                [10] = L39_65(L40_66)
              })[3] = L41_67
              ;({
                [10] = L39_65(L40_66)
              })[4] = L42_68
              ;({
                [10] = L39_65(L40_66)
              })[5] = L43_69
              ;({
                [10] = L39_65(L40_66)
              })[6] = L44_70
              ;({
                [10] = L39_65(L40_66)
              })[7] = L45_71
              ;({
                [10] = L39_65(L40_66)
              })[8] = L46_72
              ;({
                [10] = L39_65(L40_66)
              })[9] = L47_73
              L39_65(L40_66, L41_67)
              if L39_65 == "array" then
                for L42_68 = 1, L40_66[3] do
                  L47_73 = L44_70(L45_71)
                  ;({
                    [5] = L44_70(L45_71)
                  })[1] = L44_70
                  ;({
                    [5] = L44_70(L45_71)
                  })[2] = L45_71
                  ;({
                    [5] = L44_70(L45_71)
                  })[3] = L46_72
                  ;({
                    [5] = L44_70(L45_71)
                  })[4] = L47_73
                  L46_72 = L42_68
                  L44_70(L45_71, L46_72)
                  L46_72 = L43_69
                  L44_70(L45_71, L46_72)
                  L46_72 = L33_59[L37_63]
                  L44_70(L45_71, L46_72)
                end
              elseif L39_65 == "2Darray" then
                for L42_68 = 1, L40_66[3] do
                  for L46_72 = 1, L44_70[4] do
                    L47_73 = {
                      unpack(L38_64)
                    }
                    _table.insert(L47_73, L42_68)
                    _table.insert(L47_73, L46_72)
                    _table.insert(L24_50, L47_73)
                    _table.insert(L25_51, L33_59[L37_63])
                  end
                end
              else
                L39_65(L40_66, L41_67)
                L39_65(L40_66, L41_67)
              end
            end
          end
        end
      end
      for L30_56 = 1, #L24_50 do
        for L34_60 = 1, #L32_58 do
          if L35_61 == "number" then
            L37_63 = L24_50[L30_56]
            L37_63 = L37_63[L34_60]
            L38_64 = "]"
          elseif L35_61 == "string" then
            L37_63 = L24_50[L30_56]
            L37_63 = L37_63[L34_60]
          end
        end
        if L31_57 ~= nil then
          if L31_57 ~= "_assignForChild" then
            L37_63 = L24_50[L30_56]
            L47_73 = L36_62(L37_63)
            if L31_57 then
              L37_63 = L24_50[L30_56]
              L47_73 = L36_62(L37_63)
              L22_48 = L31_57
              if L31_57 == "string" then
                L22_48 = L31_57 .. L32_58 .. L33_59
              elseif L31_57 == "member" then
                for L35_61 = 1, L33_59(L34_60) do
                  L37_63 = A1_27
                  L38_64 = L22_48
                  if L36_62 then
                  end
                end
                if L31_57 == nil then
                  L22_48 = L32_58 .. L33_59
                elseif not L32_58 then
                  L22_48 = L32_58 .. L33_59 .. L34_60 .. L35_61
                elseif not L32_58 then
                  L22_48 = L32_58 .. L33_59 .. L34_60 .. L35_61
                else
                  L22_48 = L32_58 .. L33_59 .. L34_60 .. L35_61
                end
              else
                L22_48 = L31_57
              end
            else
              for L35_61 = 1, #L33_59 do
              end
              if L32_58 == "reserve" then
                if L32_58 == nil then
                  L22_48 = "nil"
                else
                  L22_48 = "{}"
                end
              else
                if L32_58 == "nesting" then
                  if L32_58 == nil then
                    L22_48 = "nil"
                  else
                    L22_48 = "{}"
                    else
                      L22_48 = nil
                    end
                  end
                else
                end
              end
            end
          L23_49 = L33_59
          if L32_58 ~= nil then
            if L32_58 == "table" then
              L23_49 = L33_59 .. L34_60 .. L35_61
            end
          end
          if L32_58 ~= "_assignForChild" then
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
          else
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
            L32_58(L33_59, L34_60)
          end
        end
      end
    end
  end
  L14_40 = L8_34
  return L11_37, L12_38, L13_39, L14_40
end
function Debug.formatWorkDefinition(A0_74, A1_75)
  local L2_76, L3_77, L4_78
  L4_78 = 2
  if A1_75[L4_78] == "array" then
    L3_77 = "[" .. A1_75[L4_78 + 1] .. "]"
    L4_78 = L4_78 + 2
  elseif A1_75[L4_78] == "2Darray" then
    L3_77 = "[" .. A1_75[L4_78 + 1] .. "]" .. "[" .. A1_75[L4_78 + 2] .. "]"
    L4_78 = L4_78 + 3
  else
    L3_77 = ""
  end
  if A1_75[L4_78] == "string" or A1_75[L4_78] == "reserve" or A1_75[L4_78] == "nesting" then
    L2_76 = A1_75[L4_78] .. "_" .. tostring(A1_75[L4_78 + 1])
  elseif string:startsWith(A1_75[1], "_") then
    L2_76 = tostring(A1_75[2])
  else
    L2_76 = A1_75[L4_78]
  end
  return A1_75[1], L2_76 .. L3_77
end
function Debug.getWorkType(A0_79, A1_80, A2_81, A3_82, ...)
  local L5_84, L6_85, L7_86, L8_87, L9_88, L10_89
  L6_85 = {}
  L7_86 = 1
  while true do
    L8_87 = debug
    L9_88 = L8_87
    L8_87 = L8_87._getWorkDefinition
    L10_89 = A1_80[A2_81]
    L8_87 = L8_87(L9_88, L10_89, A3_82, unpack(L6_85))
    if L8_87 == nil then
      L9_88 = nil
      return L9_88
    else
      L9_88 = L8_87[2]
      if L9_88 == "array" then
        L5_84 = L8_87[4]
        L9_88 = select
        L10_89 = L7_86
        L9_88 = L9_88(L10_89, ...)
        L10_89 = _table
        L10_89 = L10_89.insert
        L10_89(L6_85, L9_88)
        L7_86 = L7_86 + 1
      else
        L9_88 = L8_87[2]
        if L9_88 == "2Darray" then
          L5_84 = L8_87[5]
          L9_88 = select
          L10_89 = L7_86
          L10_89 = L9_88(L10_89, ...)
          _table.insert(L6_85, L9_88)
          _table.insert(L6_85, L10_89)
          L7_86 = L7_86 + 2
        else
          L5_84 = L8_87[2]
        end
      end
    end
    if L5_84 ~= "reserve" and L5_84 ~= "nesting" then
      return L5_84
    end
    L9_88 = select
    L10_89 = L7_86
    L9_88 = L9_88(L10_89, ...)
    L10_89 = _table
    L10_89 = L10_89.insert
    L10_89(L6_85, L9_88)
    L7_86 = L7_86 + 1
    L10_89 = select
    L10_89 = L10_89("#", ...)
    L10_89 = L10_89 + 1
    if L7_86 > L10_89 then
      L10_89 = nil
      return L10_89
    end
  end
end
function Debug.countWorkSyncID(A0_90, A1_91, A2_92)
  local L3_93, L4_94, L5_95, L6_96, L7_97, L8_98, L9_99, L10_100, L11_101
  L3_93 = 0
  L4_94 = 0
  L5_95 = 0
  L6_96 = 0
  for L10_100 = 1, #A2_92 do
    L11_101 = 2
    while type(A2_92[L10_100][L11_101]) ~= "table" do
      L11_101 = L11_101 + 1
    end
    if L11_101 > 2 then
      for _FORV_17_ = L11_101, #A2_92[L10_100] do
        if debug:_getWorkDefinition(A1_91, unpack(A2_92[L10_100][_FORV_17_]))[2] == "array" then
          if type(A2_92[L10_100][_FORV_17_][#A2_92[L10_100][_FORV_17_]]) ~= "number" then
          else
          end
        elseif debug:_getWorkDefinition(A1_91, unpack(A2_92[L10_100][_FORV_17_]))[2] == "nesting" then
        elseif debug:_getWorkDefinition(A1_91, unpack(A2_92[L10_100][_FORV_17_]))[2] == "actor" then
        elseif debug:_getWorkDefinition(A1_91, unpack(A2_92[L10_100][_FORV_17_]))[2] == "reserve" then
        else
        end
        if not (L11_101 > 3) then
          L5_95 = L5_95 + 1
        end
        L6_96 = L6_96 + 1
      end
    else
      if not (L11_101 > 3) then
        L3_93 = L3_93 + (#A2_92[L10_100] - L11_101 + 1)
      end
      L4_94 = L4_94 + (#A2_92[L10_100] - L11_101 + 1)
    end
  end
  L10_100 = L6_96
  return L7_97, L8_98, L9_99, L10_100
end
function Debug.startMeasureTimeCost(A0_102)
  debug:_setTimeCostRankingMax(10)
  debug:_measureTimeCost(true)
end
function Debug.endMeasureTimeCost(A0_103, A1_104)
  local L2_105, L3_106, L4_107, L5_108, L6_109, L7_110, L8_111, L9_112, L10_113, L11_114, L12_115, L13_116, L14_117, L15_118, L16_119, L17_120
  L2_105 = debug
  L3_106 = L2_105
  L2_105 = L2_105._measureTimeCost
  L4_107 = false
  L2_105(L3_106, L4_107)
  L2_105 = debug
  L3_106 = L2_105
  L2_105 = L2_105._sortTimeCostRanking
  L4_107 = false
  L2_105(L3_106, L4_107)
  L2_105 = debug
  L3_106 = L2_105
  L2_105 = L2_105._printLog
  L4_107 = "\233\150\162\230\149\176\229\145\188\227\129\179\229\135\186\227\129\151\232\178\160\232\141\183\232\168\136\230\184\172"
  L2_105(L3_106, L4_107)
  L2_105 = 1
  L3_106 = 1
  L4_107 = 1
  while L2_105 <= 10 do
    L5_108, L6_109, L7_110, L8_111 = nil, nil, nil, nil
    L9_112 = debug
    L10_113 = L9_112
    L9_112 = L9_112._getTimeCostRanking
    L11_114 = "_"
    L12_115 = L3_106
    L12_115 = L9_112(L10_113, L11_114, L12_115)
    L13_116 = debug
    L14_117 = L13_116
    L13_116 = L13_116._getTimeCostRanking
    L15_118 = ""
    L16_119 = L4_107
    L16_119 = L13_116(L14_117, L15_118, L16_119)
    if A1_104 == false then
      L13_116 = nil
    end
    if A1_104 == true then
      L9_112 = nil
    end
    if L9_112 == nil and L13_116 == nil then
      break
    end
    if L9_112 == nil then
      L12_115 = -1
    end
    if L13_116 == nil then
      L16_119 = -1
    end
    if L12_115 >= L16_119 then
      L17_120 = L9_112
      L6_109, L7_110, L8_111 = L10_113, L11_114, L12_115
      L5_108 = L17_120
      L3_106 = L3_106 + 1
    else
      L17_120 = L13_116
      L6_109, L7_110, L8_111 = L14_117, L15_118, L16_119
      L5_108 = L17_120
      L4_107 = L4_107 + 1
    end
    L17_120 = nil
    if L5_108 == "Global" then
      L17_120 = L6_109 .. "()"
    else
      L17_120 = L5_108 .. ":" .. L6_109 .. "()"
    end
    L17_120 = _string.gsub(_string.gsub(L17_120, "_cpp", ""), "_lua", "")
    debug:_printLog(string:_format("  %2d\228\189\141\239\188\154%4d\195\151%7.3fms %s", L2_105, L8_111, L7_110 * 1000, L17_120))
    L2_105 = L2_105 + 1
  end
end
function Debug._onInit(A0_121, A1_122, A2_123)
  A0_121:_callSuperClassFunc("_onInit")
  A0_121.work._temp = {
    {"test", "boolean"},
    {"debug", "boolean"},
    {
      "enableWidget",
      "boolean"
    },
    {
      "printProcessing",
      "boolean"
    },
    {
      "printProcessingLog",
      "float"
    },
    {"printDisp", "boolean"},
    {
      "printDispFront",
      "boolean"
    },
    {
      "serverTimeOffset",
      "integer32"
    }
  }
  A0_121.work.test = A1_122
  A0_121.work.debug = A2_123
  A0_121.work.serverTimeOffset = 0
  if debug:isDebug() then
    A0_121.work.enableWidget = false
    A0_121.work.printProcessing = true
    A0_121.work.printProcessingLog = 1
    A0_121.work.printDisp = true
    A0_121.work.printDispFront = false
  else
    A0_121.work.enableWidget = true
    A0_121.work.printProcessing = false
    A0_121.work.printProcessingLog = 1
    A0_121.work.printDisp = false
    A0_121.work.printDispFront = false
  end
  A0_121:_loadTextDataPermanently(0, "debug")
end
function Debug.isPrintDisp(A0_124)
  return A0_124.work.printDisp
end
function Debug.setPrintDisp(A0_125, A1_126)
  A0_125.work.printDisp = A1_126
end
function Debug.setPrintDispFront(A0_127, A1_128)
  A0_127.work.printDispFront = A1_128
end
function Debug._onReceiveDataPacket(A0_129, ...)
  local L3_131, L4_132, L5_133, L6_134, L7_135
  L3_131 = type
  L4_132 = select
  L5_133 = 1
  L7_135 = ...
  L7_135 = L4_132(L5_133, L6_134, L7_135, ...)
  L3_131 = L3_131(L4_132, L5_133, L6_134, L7_135, L4_132(L5_133, L6_134, L7_135, ...))
  if L3_131 == "actor" then
    L4_132 = A0_129
    L3_131 = A0_129.processReceiveDataPacket
    L5_133 = select
    L6_134 = 2
    L7_135 = ...
    L5_133 = L5_133(L6_134, L7_135, ...)
    L6_134 = select
    L7_135 = 3
    L7_135 = L6_134(L7_135, ...)
    L3_131(L4_132, L5_133, L6_134, L7_135, L6_134(L7_135, ...))
  else
    L4_132 = A0_129
    L3_131 = A0_129.processReceiveDataPacket
    L5_133 = select
    L6_134 = 1
    L7_135 = ...
    L5_133 = L5_133(L6_134, L7_135, ...)
    L6_134 = select
    L7_135 = 2
    L7_135 = L6_134(L7_135, ...)
    L3_131(L4_132, L5_133, L6_134, L7_135, L6_134(L7_135, ...))
  end
end
function Debug.processReceiveDataPacket(A0_136, A1_137, ...)
  local L3_139, L4_140
  if A1_137 == "printLog" then
    L3_139 = (...)
    L4_140 = worldMaster
    L4_140 = L4_140._printDebugLog
    L4_140(L4_140, L3_139)
  elseif A1_137 == "printDisp" then
    L4_140 = ...
    debug:printDisp(L3_139, L4_140)
  elseif A1_137 == "printOverhead" then
    L4_140 = ...
    if L3_139 ~= nil then
      debug:printOverhead(L3_139, L4_140)
    end
  elseif A1_137 == "ping" then
    L3_139 = (...)
    L4_140 = debug
    L4_140 = L4_140._printLog
    L4_140(L4_140, "\229\191\156\231\173\148\230\153\130\233\150\147\239\188\154" .. debug:_getHighResolutionTime() - L3_139 .. " s")
  end
end
function Debug.printDisp(A0_141, A1_142, A2_143)
  local L3_144, L4_145
  L3_144 = debug
  L4_145 = L3_144
  L3_144 = L3_144.isPrintDisp
  L3_144 = L3_144(L4_145)
  if L3_144 then
    L3_144 = _isExistActor
    L4_145 = "desktopWidget"
    L3_144 = L3_144(L4_145)
    if L3_144 then
      L3_144 = 12
      L4_145 = nil
      if A2_143 ~= nil and type(A2_143) == "string" then
        if string:contains(A2_143, "\239\188\129") or string:contains(A2_143, "!") then
          L3_144 = 15
          L4_145 = 2
        end
        if string:contains(A2_143, "\239\188\129\239\188\129") or string:contains(A2_143, "!!") then
          L3_144 = 17
          L4_145 = 3
        end
      end
      desktopWidget:showDisp(A1_142, A2_143, L3_144, L4_145)
      desktopWidget:setDispFront(A0_141.work.printDispFront)
    else
      L3_144 = debug
      L4_145 = L3_144
      L3_144 = L3_144._display
      L3_144(L4_145, A1_142, A2_143)
    end
  end
end
function Debug.printOverhead(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151, L6_152, L7_153
  L4_150 = A1_147
  L3_149 = A1_147._setNameplate
  L5_151 = 2
  L6_152 = debug
  L7_153 = 20001
  L3_149(L4_150, L5_151, L6_152, L7_153, tostring(A2_148))
end
function Debug._onDebugInput(A0_154, A1_155, ...)
  if not worldMaster:_getMyPlayer():commandAboutDebug(A1_155, ...) then
    debug:_printLog("\227\131\135\227\131\144\227\131\131\227\130\176\227\130\179\227\131\158\227\131\179\227\131\137\227\129\140\233\149\183\227\129\153\227\129\142\227\129\190\227\129\153\227\128\130")
  end
end
function Debug.getQuestActorForPreview(A0_157, A1_158)
  local L2_159
  L2_159 = debug
  L2_159 = L2_159._printLog
  L2_159(L2_159, "\227\130\171\227\131\131\227\131\136\227\130\183\227\131\188\227\131\179\227\131\151\227\131\172\227\131\147\227\131\165\227\131\188\231\148\168\227\129\171" .. A1_158 .. "\227\129\168\227\129\132\227\129\134\227\130\162\227\130\175\227\130\191\227\131\188\227\130\146\231\148\159\230\136\144\227\129\151\227\130\136\227\129\134\227\129\168\227\129\151\227\129\190\227\129\151\227\129\159")
  if A1_158 == "Gcl101" then
    L2_159 = debug
    L2_159 = L2_159._printLog
    L2_159(L2_159, "\230\149\176\229\128\164\227\129\171\229\164\137\230\143\155")
    A1_158 = 111416
  elseif A1_158 == "Gcl104" then
    L2_159 = debug
    L2_159 = L2_159._printLog
    L2_159(L2_159, "\230\149\176\229\128\164\227\129\171\229\164\137\230\143\155")
    A1_158 = 111430
  elseif A1_158 == "Gcl105" then
    L2_159 = debug
    L2_159 = L2_159._printLog
    L2_159(L2_159, "\230\149\176\229\128\164\227\129\171\229\164\137\230\143\155")
    A1_158 = 111431
  elseif A1_158 == "Gcl106" then
    L2_159 = debug
    L2_159 = L2_159._printLog
    L2_159(L2_159, "\230\149\176\229\128\164\227\129\171\229\164\137\230\143\155")
    A1_158 = 111432
  elseif A1_158 == "Gcl107" then
    L2_159 = debug
    L2_159 = L2_159._printLog
    L2_159(L2_159, "\230\149\176\229\128\164\227\129\171\229\164\137\230\143\155")
    A1_158 = 111433
  end
  L2_159 = _getStaticActor
  L2_159 = L2_159(A1_158)
  debug:_printLog(debug:getDebugName(L2_159) .. "\227\129\168\227\129\132\227\129\134\227\130\175\227\130\168\227\130\185\227\131\136\227\130\162\227\130\175\227\130\191\227\131\188\227\129\140\231\148\159\230\136\144\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
  return L2_159
end
function Debug.prepareSpreadSheet(A0_160, A1_161)
  return _createActor(nil, "SpreadSheet", false, A1_161)
end
function Debug.isPrintProcessingTime(A0_162)
  return A0_162.work.printProcessing
end
function Debug.setPrintProcessingTime(A0_163, A1_164)
  A0_163.work.printProcessing = A1_164
end
function Debug.setPrintProcessingTimeLogThreshold(A0_165, A1_166)
  A0_165.work.printProcessingLog = A1_166
end
function Debug.printProcessingTime(A0_167, A1_168, A2_169, A3_170)
  local L4_171, L5_172, L6_173
  L4_171 = debug
  L5_172 = L4_171
  L4_171 = L4_171.isPrintProcessingTime
  L4_171 = L4_171(L5_172)
  if L4_171 then
    L4_171 = ""
    if A2_169 > 1 then
      L4_171 = "\239\188\129\239\188\129"
    elseif A2_169 > 0.1 then
      L4_171 = "\239\188\129"
    end
    if A3_170 == nil then
      A3_170 = ""
    end
    L5_172 = tostring
    L6_173 = debug
    L6_173 = L6_173._getHighResolutionTime
    L6_173 = L6_173(L6_173)
    L5_172 = L5_172(L6_173, L6_173(L6_173))
    L6_173 = "["
    L6_173 = L6_173 .. _math.floor(A2_169 * 1000) .. "ms" .. L4_171 .. "]"
    debug:printDisp(A1_168, A3_170 .. " at " .. L5_172 .. " " .. L6_173)
    if A2_169 >= A0_167.work.printProcessingLog then
      debug:_printLog(A1_168 .. " : " .. A3_170 .. " " .. L6_173)
    end
  end
end
