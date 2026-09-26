local L0_0, L1_1
L0_0 = WorldMaster
function L1_1(A0_2, A1_3)
  if A0_2:_getHydaelynHour(A1_3) >= 5 then
    if A0_2:_getHydaelynHour(A1_3) < 19 then
      return false
    else
      return true
    end
  else
    return true
  end
end
L0_0.isHydaelynNight = L1_1
L0_0 = WorldMaster
function L1_1(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = worldMaster
  L2_6 = L1_5
  L1_5 = L1_5._getServerTime
  L1_5 = L1_5(L2_6)
  L2_6 = _math
  L2_6 = L2_6.floor
  L3_7 = L1_5 / 3600
  L2_6 = L2_6(L3_7)
  L3_7 = _math
  L3_7 = L3_7.floor
  L4_8 = L2_6 / 12
  L3_7 = L3_7(L4_8)
  L3_7 = L3_7 + 1
  L3_7 = L3_7 * 60
  L3_7 = L3_7 * 60
  L3_7 = L3_7 * 12
  L4_8 = L2_6 % 12
  L4_8 = 11 - L4_8
  return L3_7, L4_8
end
L0_0.getGuildleveTime = L1_1
L0_0 = WorldMaster
function L1_1(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = worldMaster
  L2_11 = L1_10
  L1_10 = L1_10._getServerTime
  L1_10 = L1_10(L2_11)
  L2_11 = _math
  L2_11 = L2_11.floor
  L3_12 = L1_10 / 3600
  L2_11 = L2_11(L3_12)
  L3_12 = _math
  L3_12 = L3_12.floor
  L4_13 = L2_11 / 12
  L3_12 = L3_12(L4_13)
  L3_12 = L3_12 + 1
  L3_12 = L3_12 * 60
  L3_12 = L3_12 * 60
  L3_12 = L3_12 * 12
  L4_13 = L2_11 % 12
  L4_13 = 11 - L4_13
  return L3_12, L4_13
end
L0_0.getBoostTime = L1_1
L0_0 = WorldMaster
function L1_1(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = worldMaster
  L2_16 = L1_15
  L1_15 = L1_15._getServerTime
  L1_15 = L1_15(L2_16)
  L2_16 = _math
  L2_16 = L2_16.floor
  L3_17 = L1_15 / 3600
  L2_16 = L2_16(L3_17)
  L3_17 = _math
  L3_17 = L3_17.floor
  L4_18 = L2_16 / 4
  L3_17 = L3_17(L4_18)
  L3_17 = L3_17 + 1
  L3_17 = L3_17 * 60
  L3_17 = L3_17 * 60
  L3_17 = L3_17 * 4
  L4_18 = L2_16 % 4
  L4_18 = 3 - L4_18
  return L3_17, L4_18
end
L0_0.getAnimaTime = L1_1
L0_0 = WorldMaster
function L1_1(A0_19, A1_20, A2_21, ...)
  local L5_23, L6_24, L7_25, L8_26, L9_27, L10_28
  L5_23 = desktopWidget
  L6_24 = L5_23
  L5_23 = L5_23.showMessage
  L7_25 = A0_19
  L8_26 = 40
  L9_27 = A1_20
  L10_28 = A2_21
  L5_23(L6_24, L7_25, L8_26, L9_27, L10_28, ...)
end
L0_0.say = L1_1
L0_0 = WorldMaster
function L1_1(A0_29, A1_30, A2_31, ...)
  local L5_33, L6_34, L7_35, L8_36, L9_37, L10_38
  L5_33 = desktopWidget
  L6_34 = L5_33
  L5_33 = L5_33.showLog
  L7_35 = A0_29
  L8_36 = 32
  L9_37 = A1_30
  L10_38 = A2_31
  L5_33(L6_34, L7_35, L8_36, L9_37, L10_38, ...)
end
L0_0.notify = L1_1
L0_0 = WorldMaster
function L1_1(A0_39, A1_40, A2_41, ...)
  local L5_43, L6_44, L7_45, L8_46, L9_47, L10_48
  L5_43 = desktopWidget
  L6_44 = L5_43
  L5_43 = L5_43.showLog
  L7_45 = A0_39
  L8_46 = 33
  L9_47 = A1_40
  L10_48 = A2_41
  L5_43(L6_44, L7_45, L8_46, L9_47, L10_48, ...)
end
L0_0.alert = L1_1
L0_0 = WorldMaster
function L1_1(A0_49, A1_50, A2_51, A3_52, ...)
  local L5_54, L6_55, L7_56, L8_57, L9_58, L10_59, L11_60, L12_61, L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72
  L5_54 = {}
  L6_55 = false
  L7_56 = 1
  L8_57 = 1
  L9_58 = 0
  L10_59 = 1
  L11_60 = 0
  while L6_55 == false do
    L12_61 = select
    L14_62 = L7_56
    L24_72 = ...
    L12_61 = L12_61(L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...)
    if L12_61 == true then
      L12_61 = A3_52 + L7_56
      L5_54[L8_57] = L12_61
      L8_57 = L8_57 + 1
    end
    L7_56 = L7_56 + 1
    L10_59 = L10_59 + 1
    L12_61 = type
    L14_62 = select
    L15_63 = L7_56
    L24_72 = ...
    L24_72 = L14_62(L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...)
    L12_61 = L12_61(L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, L14_62(L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...))
    if L12_61 ~= "boolean" then
      L6_55 = true
    end
  end
  L7_56 = L7_56 + 1
  L12_61 = type
  L14_62 = select
  L15_63 = L7_56
  L24_72 = ...
  L24_72 = L14_62(L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...)
  L12_61 = L12_61(L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, L14_62(L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...))
  if L12_61 == "boolean" then
  end
  L12_61 = desktopWidget
  L14_62 = L12_61
  L12_61 = L12_61.askForEventMode
  L15_63 = A1_50
  L16_64 = A0_49
  L17_65 = A2_51
  L18_66 = 1
  L19_67 = false
  L20_68 = true
  L21_69 = A3_52
  L22_70 = L5_54
  L23_71 = select
  L24_72 = L10_59
  L24_72 = L23_71(L24_72, ...)
  L12_61 = L12_61(L14_62, L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, L23_71(L24_72, ...))
  L7_56 = 1
  while L11_60 < L12_61 do
    L14_62 = select
    L15_63 = L7_56
    L24_72 = ...
    L14_62 = L14_62(L15_63, L16_64, L17_65, L18_66, L19_67, L20_68, L21_69, L22_70, L23_71, L24_72, ...)
    if L14_62 == true then
      L11_60 = L11_60 + 1
    end
    L9_58 = L9_58 + 1
    L7_56 = L7_56 + 1
  end
  if L12_61 == -3 then
    L9_58 = nil
  end
  return L9_58
end
L0_0.askRestrictChoices = L1_1
L0_0 = WorldMaster
function L1_1(A0_73, A1_74, A2_75, A3_76, A4_77, ...)
  local L6_79, L7_80, L8_81, L9_82, L10_83, L11_84, L12_85, L13_86, L14_87, L15_88, L16_89, L17_90
  L6_79 = {}
  for L10_83 = 1, A4_77 do
    L11_84 = A3_76 + L10_83
    L6_79[L10_83] = L11_84
  end
  L10_83 = A0_73
  L11_84 = A2_75
  L12_85 = 1
  L13_86 = false
  L14_87 = true
  L15_88 = A3_76
  L16_89 = L6_79
  L17_90 = ...
  return L7_80
end
L0_0.ask = L1_1
L0_0 = WorldMaster
function L1_1(A0_91, A1_92, A2_93, A3_94, A4_95, A5_96, A6_97, ...)
  local L8_99, L9_100, L10_101, L11_102, L12_103, L13_104, L14_105, L15_106, L16_107, L18_108, L19_109, L20_110, L21_111, L22_112, L23_113
  L8_99 = select
  L9_100 = "#"
  L23_113 = ...
  L8_99 = L8_99(L9_100, L10_101, L11_102, L12_103, L13_104, L14_105, L15_106, L16_107, L18_108, L19_109, L20_110, L21_111, L22_112, L23_113, ...)
  L9_100 = 0
  L10_101 = {}
  for L14_105 = 1, A5_96 do
    L16_107 = L14_105
    L23_113 = ...
    if L15_106 == true then
      L9_100 = L9_100 + 1
    end
    L16_107 = A4_95 + L14_105
    L10_101[L14_105] = L16_107
  end
  L16_107 = A2_93
  L18_108 = A3_94
  L19_109 = false
  L20_110 = true
  L21_111 = A6_97
  L22_112 = A4_95
  L23_113 = L10_101
  L9_100 = 0
  for L16_107 = 1, A5_96 do
    L18_108 = select
    L19_109 = L16_107
    L23_113 = ...
    L18_108 = L18_108(L19_109, L20_110, L21_111, L22_112, L23_113, ...)
    if L18_108 == true then
      L9_100 = L9_100 + 1
      if L9_100 == L12_103 then
        return L16_107
      end
    end
  end
  return L12_103
end
L0_0.askMultipleTextMacro = L1_1
