require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftLak", "ScenarioBaseClass")
function DftLak.initText(A0_0)
  A0_0:_loadTextDataPermanently(1457, "dftLak")
end
function DftLak.defaultTalkWithMemenugu_001(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 ~= 20 then
    A2_3:say(A0_1, 226, 0)
  else
    A2_3:say(A0_1, 2, 0)
  end
  A2_3:_runCharaScheduler(83943424)
  A2_3:say(A0_1, 3, 0)
  A2_3:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithLangliva_001(A0_5, A1_6, A2_7, A3_8)
  A2_7:_runCharaScheduler(354058240)
  if A3_8 ~= 20 then
    A2_7:say(A0_5, 227, 0)
  else
    A2_7:say(A0_5, 4, 0)
  end
end
function DftLak.defaultTalkWithEidinsath_001(A0_9, A1_10, A2_11, A3_12)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(353959936)
  if A3_12 ~= 20 then
    A2_11:say(A0_9, 228, 0)
  else
    A2_11:say(A0_9, 5, 0)
  end
  A2_11:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithRashaht_001(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18, A6_19)
  A2_15:startCliantTalkTurn(2, A1_14)
  if A3_16 == 1 then
    if A4_17 == 0 then
      A0_13:_wait(1)
      if A6_19 == 1 then
        A2_15:say(A0_13, 6, 0)
      else
        A2_15:say(A0_13, 7, 0)
      end
      A2_15:say(A0_13, 8, 0)
      A2_15:_runCharaScheduler(354082816)
      A2_15:say(A0_13, 9, 0)
    elseif A5_18 >= 20 or A4_17 == 2 then
      A0_13:_wait(1)
      A2_15:say(A0_13, 15, 0)
      A2_15:say(A0_13, 16, 0)
      A2_15:_runCharaScheduler(354099200)
      A2_15:say(A0_13, 17, 0)
    else
      A0_13:_wait(1)
      A2_15:say(A0_13, 10, 0)
      A2_15:say(A0_13, 11, 0)
      A2_15:_runCharaScheduler(354041856)
      if A5_18 < 0 then
        A2_15:say(A0_13, 12, 0)
        A2_15:say(A0_13, 13, 0)
      else
        A2_15:say(A0_13, 223, 0)
        A2_15:say(A0_13, 14, 0)
      end
    end
  elseif A3_16 == 2 or A3_16 == 3 then
    if A4_17 == 0 then
      A2_15:_runCharaScheduler(354103296)
      A2_15:say(A0_13, 18, 0, A3_16)
    elseif A5_18 >= 20 or A4_17 == 2 then
      A2_15:_runCharaScheduler(354054144)
      A2_15:say(A0_13, 20, 0, A3_16)
      A2_15:say(A0_13, 21, 0)
    else
      A2_15:_runCharaScheduler(354099200)
      A2_15:say(A0_13, 19, 0, A3_16)
    end
  else
    A2_15:_runCharaScheduler(354041856)
    A2_15:say(A0_13, 214, 0)
  end
  A2_15:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithMyrganmoen_001(A0_20, A1_21, A2_22, A3_23, A4_24, A5_25)
  A2_22:startCliantTalkTurn(2, A1_21)
  if A3_23 == 1 then
    if A4_24 == 0 then
      A0_20:_wait(1)
      A2_22:say(A0_20, 22, 0)
      A2_22:say(A0_20, 23, 0)
      A2_22:_runCharaScheduler(354082816)
      A2_22:say(A0_20, 24, 0)
    elseif A5_25 >= 20 or A4_24 == 2 then
      A0_20:_wait(1)
      A2_22:say(A0_20, 28, 0)
      A2_22:say(A0_20, 29, 0)
    else
      A0_20:_wait(1)
      A2_22:say(A0_20, 25, 0)
      A2_22:say(A0_20, 26, 0)
      A2_22:_runCharaScheduler(354066432)
      A2_22:say(A0_20, 27, 0)
    end
  elseif A3_23 == 2 or A3_23 == 3 then
    if A4_24 == 0 then
      A2_22:say(A0_20, 30, 0, A3_23)
      A2_22:_runCharaScheduler(354062336)
      A2_22:say(A0_20, 31, 0, A3_23)
    elseif A5_25 >= 20 or A4_24 == 2 then
      A2_22:say(A0_20, 34, 0)
      A2_22:_runCharaScheduler(354082816)
      A2_22:say(A0_20, 35, 0)
    else
      A2_22:say(A0_20, 32, 0)
      A2_22:_runCharaScheduler(354066432)
      A2_22:say(A0_20, 33, 0)
    end
  else
    A2_22:_runCharaScheduler(354078720)
    A2_22:say(A0_20, 215, 0)
  end
  A2_22:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithHidden_001(A0_26, A1_27, A2_28, A3_29, A4_30, A5_31)
  A2_28:startCliantTalkTurn(2, A1_27)
  if A3_29 == 1 then
    if A4_30 == 0 then
      A0_26:_wait(1)
      A2_28:say(A0_26, 36, 0)
      A2_28:say(A0_26, 37, 0)
      A2_28:say(A0_26, 38, 0)
      A2_28:_runCharaScheduler(354058240)
      A2_28:say(A0_26, 39, 0)
    elseif A5_31 >= 20 or A4_30 == 2 then
      A0_26:_wait(1)
      A2_28:say(A0_26, 45, 0)
      A2_28:_runCharaScheduler(354103296)
      A2_28:say(A0_26, 46, 0)
    else
      A0_26:_wait(1)
      A2_28:say(A0_26, 40, 0)
      A2_28:say(A0_26, 41, 0)
      if A5_31 >= 0 then
        A2_28:say(A0_26, 156, 0)
      end
    end
  elseif A3_29 == 2 or A3_29 == 3 then
    if A4_30 == 0 then
      A2_28:_runCharaScheduler(354078720)
      A2_28:say(A0_26, 47, 0, A3_29)
    elseif A5_31 >= 20 or A4_30 == 2 then
      A2_28:say(A0_26, 50, 0)
      A2_28:_runCharaScheduler(354099200)
      A2_28:say(A0_26, 51, 0)
      A2_28:say(A0_26, 158, 0)
    else
      A2_28:say(A0_26, 48, 0, A3_29)
      if A5_31 >= 0 then
        A2_28:_runCharaScheduler(354082816)
        A2_28:say(A0_26, 49, 0)
        A2_28:say(A0_26, 157, 0)
      end
    end
  else
    A2_28:_runCharaScheduler(354082816)
    A2_28:say(A0_26, 216, 0)
  end
  A2_28:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithQuinquerol_001(A0_32, A1_33, A2_34, A3_35, A4_36, A5_37, A6_38)
  A2_34:startCliantTalkTurn(2, A1_33)
  if A3_35 == 2 then
    if A4_36 == 0 then
      A0_32:_wait(1)
      if A6_38 == 1 then
        A2_34:say(A0_32, 52, 0)
      else
        A2_34:say(A0_32, 53, 0)
      end
      A2_34:say(A0_32, 54, 0)
      A2_34:say(A0_32, 55, 0)
      A2_34:_runCharaScheduler(354058240)
      A2_34:say(A0_32, 56, 0)
    elseif A5_37 >= 20 or A4_36 == 2 then
      A0_32:_wait(1)
      A2_34:say(A0_32, 62, 0)
      A2_34:say(A0_32, 63, 0)
      A2_34:_runCharaScheduler(354099200)
      A2_34:say(A0_32, 64, 0)
    else
      A0_32:_wait(1)
      A2_34:say(A0_32, 57, 0)
      A2_34:say(A0_32, 58, 0)
      A2_34:say(A0_32, 59, 0)
      A2_34:_runCharaScheduler(354099200)
      if A5_37 < 0 then
        A2_34:say(A0_32, 60, 0)
      else
        A2_34:say(A0_32, 61, 0)
      end
    end
  elseif A3_35 == 1 or A3_35 == 3 then
    if A4_36 == 0 then
      A2_34:say(A0_32, 65, 0)
      A2_34:_runCharaScheduler(354082816)
      A2_34:say(A0_32, 66, 0, A3_35)
      A2_34:say(A0_32, 67, 0)
    elseif A5_37 >= 20 or A4_36 == 2 then
      A2_34:_runCharaScheduler(353964032)
      A2_34:say(A0_32, 70, 0)
      A2_34:say(A0_32, 71, 0)
      A2_34:_runCharaScheduler(353976320)
      A2_34:say(A0_32, 72, 0)
    else
      A2_34:say(A0_32, 68, 0, A3_35)
      A2_34:_runCharaScheduler(354099200)
      A2_34:say(A0_32, 69, 0)
    end
  else
    A2_34:_runCharaScheduler(354082816)
    A2_34:say(A0_32, 217, 0)
  end
  A2_34:finishCliantTalkTurn()
end
function DftLak.defaultTalkTall_001(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44)
  A2_41:startCliantTalkTurn(2, A1_40)
  if A3_42 == 2 then
    if A4_43 == 0 then
      A0_39:_wait(1)
      A2_41:say(A0_39, 73, 0)
      A2_41:say(A0_39, 74, 0)
      A2_41:_runCharaScheduler(354082816)
      A2_41:say(A0_39, 75, 0)
    elseif A5_44 >= 20 or A4_43 == 2 then
      A0_39:_wait(1)
      A2_41:say(A0_39, 79, 0)
      A2_41:say(A0_39, 80, 0)
    else
      A0_39:_wait(1)
      A2_41:say(A0_39, 76, 0)
      A2_41:say(A0_39, 77, 0)
      if A5_44 >= 0 then
        A2_41:_runCharaScheduler(354066432)
        A2_41:say(A0_39, 78, 0)
      end
    end
  elseif A3_42 == 1 or A3_42 == 3 then
    if A4_43 == 0 then
      A2_41:_runCharaScheduler(354099200)
      A2_41:say(A0_39, 81, 0)
      A2_41:say(A0_39, 82, 0)
      A2_41:_runCharaScheduler(354082816)
      A2_41:say(A0_39, 83, 0)
    elseif A5_44 >= 20 or A4_43 == 2 then
      A2_41:_runCharaScheduler(353964032)
      A2_41:say(A0_39, 86, 0)
      A2_41:say(A0_39, 87, 0)
    else
      A2_41:say(A0_39, 84, 0)
      if A5_44 >= 0 then
        A2_41:_runCharaScheduler(354066432)
        A2_41:say(A0_39, 85, 0)
      end
    end
  else
    A2_41:_runCharaScheduler(353980416)
    A2_41:say(A0_39, 218, 0)
  end
  A2_41:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithVevina_001(A0_45, A1_46, A2_47, A3_48, A4_49, A5_50, A6_51)
  A2_47:startCliantTalkTurn(2, A1_46)
  if A3_48 == 2 then
    if A4_49 == 0 then
      A0_45:_wait(1)
      A2_47:say(A0_45, 88, 0)
      A2_47:say(A0_45, 89, 0)
      A2_47:say(A0_45, 90, 0)
      A2_47:_runCharaScheduler(354082816)
      A2_47:say(A0_45, 91, 0)
    elseif A5_50 >= 20 or A4_49 == 2 then
      A0_45:_wait(1)
      A2_47:say(A0_45, 97, 0)
      A2_47:say(A0_45, 98, 0)
    else
      A0_45:_wait(1)
      A2_47:say(A0_45, 92, 0)
      if A5_50 >= 5 and A5_50 < 20 then
        A2_47:say(A0_45, 93, 0)
        if A2_47:ask(A0_45, 94, 2) == 1 then
          A2_47:say(A0_45, 202, 0)
          worldMaster:say(A0_45, 203, A6_51)
          worldMaster:say(A0_45, 204, A6_51)
          A2_47:say(A0_45, 205, 0)
          worldMaster:say(A0_45, 206, A6_51)
          A2_47:say(A0_45, 207, 0)
          A2_47:say(A0_45, 224, 0)
          worldMaster:say(A0_45, 208, A6_51)
          worldMaster:say(A0_45, 209, A6_51)
          A2_47:say(A0_45, 210, 0)
          worldMaster:say(A0_45, 211, A6_51)
          A2_47:say(A0_45, 212, 0)
          A2_47:say(A0_45, 213, 0)
        end
      end
    end
  elseif A3_48 == 1 or A3_48 == 3 then
    if A4_49 == 0 then
      A2_47:_runCharaScheduler(353959936)
      A2_47:say(A0_45, 99, 0, A3_48)
    elseif A5_50 >= 20 or A4_49 == 2 then
      A2_47:say(A0_45, 102, 0)
      A2_47:_runCharaScheduler(353972224)
      A2_47:say(A0_45, 103, 0)
    else
      A2_47:_runCharaScheduler(354066432)
      A2_47:say(A0_45, 100, 0, A3_48)
      A2_47:say(A0_45, 101, 0)
      if A5_50 >= 5 and A5_50 < 20 then
        A2_47:say(A0_45, 93, 0)
        if A2_47:ask(A0_45, 94, 2) == 1 then
          A2_47:say(A0_45, 202, 0)
          worldMaster:say(A0_45, 203, A6_51)
          worldMaster:say(A0_45, 204, A6_51)
          A2_47:say(A0_45, 205, 0)
          worldMaster:say(A0_45, 206, A6_51)
          A2_47:say(A0_45, 207, 0)
          worldMaster:say(A0_45, 208, A6_51)
          worldMaster:say(A0_45, 209, A6_51)
          A2_47:say(A0_45, 210, 0)
          worldMaster:say(A0_45, 211, A6_51)
          A2_47:say(A0_45, 212, 0)
          A2_47:say(A0_45, 213, 0)
        end
      end
    end
  else
    A2_47:_runCharaScheduler(353976320)
    A2_47:say(A0_45, 219, 0)
  end
  A2_47:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithJakys_001(A0_52, A1_53, A2_54, A3_55, A4_56, A5_57, A6_58)
  A2_54:startCliantTalkTurn(2, A1_53)
  if A3_55 == 3 then
    if A4_56 == 0 then
      A0_52:_wait(1)
      if A6_58 == 1 then
        A2_54:say(A0_52, 104, 0)
      else
        A2_54:say(A0_52, 105, 0)
      end
      A2_54:say(A0_52, 106, 0)
      A2_54:say(A0_52, 107, 0)
      A2_54:_runCharaScheduler(354066432)
      A2_54:say(A0_52, 108, 0)
    else
      A0_52:_wait(1)
      A2_54:say(A0_52, 114, 0)
      A2_54:say(A0_52, 115, 0)
      A2_54:_runCharaScheduler(354066432)
      A2_54:say(A0_52, 116, 0)
    end
  elseif A3_55 == 1 or A3_55 == 2 then
    if A4_56 == 0 then
      A2_54:say(A0_52, 117, 0, A3_55)
      A2_54:_runCharaScheduler(354000896)
      A2_54:say(A0_52, 118, 0, A3_55)
      A2_54:say(A0_52, 119, 0)
    else
      A2_54:say(A0_52, 122, 0)
      A2_54:_runCharaScheduler(354082816)
      A2_54:say(A0_52, 123, 0)
      A2_54:say(A0_52, 124, 0)
    end
  else
    A2_54:_runCharaScheduler(354066432)
    A2_54:say(A0_52, 220, 0)
  end
  A2_54:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithMhenall_001(A0_59, A1_60, A2_61, A3_62, A4_63, A5_64)
  A2_61:startCliantTalkTurn(2, A1_60)
  if A3_62 == 3 then
    if A4_63 == 0 then
      A0_59:_wait(1)
      if A2_61:isUpperRank(3, 11) == true then
        A2_61:say(A0_59, 125, 0)
        A2_61:say(A0_59, 126, 0)
        A2_61:say(A0_59, 127, 0)
      else
        A2_61:say(A0_59, 175, 0)
        A2_61:say(A0_59, 176, 0)
        A2_61:say(A0_59, 177, 0)
      end
    elseif A5_64 >= 20 or A4_63 == 2 then
      A0_59:_wait(1)
      if A2_61:isUpperRank(3, 11) == true then
        A2_61:say(A0_59, 131, 0)
        A2_61:say(A0_59, 132, 0)
      else
        A2_61:say(A0_59, 181, 0)
        A2_61:say(A0_59, 182, 0)
      end
    else
      A0_59:_wait(1)
      if A2_61:isUpperRank(3, 11) == true then
        A2_61:say(A0_59, 128, 0)
        A2_61:say(A0_59, 129, 0)
        if A5_64 >= 0 then
          A2_61:say(A0_59, 130, 0)
        end
      else
        A2_61:say(A0_59, 178, 0)
        A2_61:say(A0_59, 179, 0)
        if A5_64 >= 0 then
          A2_61:say(A0_59, 180, 0)
        end
      end
    end
  elseif A3_62 == 1 or A3_62 == 2 then
    if A4_63 == 0 then
      A2_61:say(A0_59, 133, 0, A3_62)
      A2_61:_runCharaScheduler(354099200)
      A2_61:say(A0_59, 134, 0)
    elseif A5_64 >= 20 or A4_63 == 2 then
      A2_61:say(A0_59, 138, 0)
      A2_61:_runCharaScheduler(354058240)
      A2_61:say(A0_59, 139, 0)
    else
      A2_61:_runCharaScheduler(354066432)
      A2_61:say(A0_59, 136, 0)
      if A5_64 >= 0 then
        A2_61:say(A0_59, 137, 0)
      end
    end
  else
    A2_61:_runCharaScheduler(354103296)
    A2_61:say(A0_59, 221, 0)
  end
  A2_61:finishCliantTalkTurn()
end
function DftLak.defaultTalkWithClovissoix_001(A0_65, A1_66, A2_67, A3_68, A4_69, A5_70)
  A2_67:startCliantTalkTurn(2, A1_66)
  if A3_68 == 3 then
    if A4_69 == 0 then
      A0_65:_wait(1)
      if A2_67:isUpperRank(3, 11) == true then
        A2_67:say(A0_65, 140, 0)
        A2_67:say(A0_65, 141, 0)
        A2_67:say(A0_65, 142, 0)
        A2_67:_runCharaScheduler(354041856)
        A2_67:say(A0_65, 143, 0)
      else
        A2_67:say(A0_65, 189, 0)
        A2_67:say(A0_65, 190, 0)
        A2_67:say(A0_65, 191, 0)
        A2_67:_runCharaScheduler(354041856)
        A2_67:say(A0_65, 192, 0)
      end
    elseif A5_70 >= 20 or A4_69 == 2 then
      A0_65:_wait(1)
      if A2_67:isUpperRank(3, 11) == true then
        A2_67:say(A0_65, 149, 0)
        A2_67:say(A0_65, 150, 0)
      else
        A2_67:say(A0_65, 195, 0)
        A2_67:say(A0_65, 196, 0)
      end
    else
      A0_65:_wait(1)
      if A2_67:isUpperRank(3, 11) == true then
        A2_67:say(A0_65, 144, 0)
        if A5_70 >= 0 then
          A2_67:say(A0_65, 145, 0)
        end
      else
        A2_67:say(A0_65, 193, 0)
        if A5_70 >= 0 then
          A2_67:say(A0_65, 194, 0)
        end
      end
    end
  elseif A3_68 == 1 or A3_68 == 2 then
    if A4_69 == 0 then
      A2_67:_runCharaScheduler(354041856)
      A2_67:say(A0_65, 151, 0, A3_68)
    elseif A5_70 >= 20 or A4_69 == 2 then
      A2_67:say(A0_65, 154, 0)
      A2_67:_runCharaScheduler(354099200)
      A2_67:say(A0_65, 155, 0)
    else
      A2_67:say(A0_65, 152, 0)
      if A5_70 >= 0 then
        A2_67:_runCharaScheduler(354082816)
        A2_67:say(A0_65, 153, 0)
      end
    end
  else
    A2_67:_runCharaScheduler(354066432)
    A2_67:say(A0_65, 222, 0)
  end
  A2_67:finishCliantTalkTurn()
end
function DftLak.processEventContainer(A0_71, A1_72, A2_73)
  desktopWidget:openPublicInformDialogWidget(A0_71, 225)
end
function DftLak.processEventContainer2(A0_74, A1_75, A2_76)
  desktopWidget:openPublicInformDialogWidget(worldMaster, 51047)
end
