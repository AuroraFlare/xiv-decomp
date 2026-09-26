require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Noc000", "ScenarioBaseClass")
function Noc000.initText(A0_0)
  A0_0:_loadTextDataPermanently(5923, "noc000")
end
function Noc000.pETaskBoardAskLimsa(A0_1, A1_2, A2_3)
  return (worldMaster:ask(A2_3, A0_1, 57, 5, 0, 30, 31, 36, 41))
end
function Noc000.pETaskBoardAskUldah(A0_4, A1_5, A2_6)
  return (worldMaster:ask(A2_6, A0_4, 57, 5, 0, 32, 34, 35, 39))
end
function Noc000.pETaskBoardAskGridania(A0_7, A1_8, A2_9)
  return (worldMaster:ask(A2_9, A0_7, 57, 4, 0, 29, 33, 40))
end
function Noc000.pETaskBoardGuild(A0_10, A1_11, A2_12, A3_13)
  worldMaster:say(A0_10, 66, A3_13)
end
function Noc000.pETaskBoardOrder(A0_14, A1_15, A2_16, A3_17, A4_18, A5_19, A6_20)
  worldMaster:say(A0_14, 67, A3_17, A4_18, A5_19, A6_20)
end
function Noc000.pENPCAskBsmArm(A0_21, A1_22, A2_23, A3_24, A4_25)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:_runCharaScheduler(354172928)
  A2_23:say(A0_21, 3, 0)
  if worldMaster:askRestrictChoices(A2_23, A0_21, 84, true, A3_24, A4_25) == nil or worldMaster:askRestrictChoices(A2_23, A0_21, 84, true, A3_24, A4_25) == 1 then
    A2_23:finishCliantTalkTurn()
  end
  return worldMaster:askRestrictChoices(A2_23, A0_21, 84, true, A3_24, A4_25) + 1
end
function Noc000.pENPCAskRank(A0_26, A1_27, A2_28, A3_29, A4_30)
  local L5_31, L6_32
  if A3_29 ~= 0 then
    L6_32 = A2_28
    L5_31 = A2_28.startCliantTalkTurn
    L5_31(L6_32, 2, A1_27)
    L5_31 = 3
    L6_32 = 354107392
    if A4_30 == 36 then
      L6_32 = 353968128
      if A3_29 == 1 then
        L5_31 = 8
      else
        L5_31 = 9
      end
    elseif A4_30 == 41 then
      L6_32 = 354177024
      L5_31 = 12
    elseif A4_30 == 32 then
      L6_32 = 354177024
      L5_31 = 4
    elseif A4_30 == 34 then
      L6_32 = 353968128
      L5_31 = 6
    elseif A4_30 == 35 then
      L6_32 = 354172928
      L5_31 = 7
    elseif A4_30 == 39 then
      L6_32 = 353968128
      L5_31 = 10
    elseif A4_30 == 29 then
      L6_32 = 353968128
      L5_31 = 2
    elseif A4_30 == 33 then
      L6_32 = 353968128
      L5_31 = 5
    elseif A4_30 == 40 then
      L6_32 = 354177024
      L5_31 = 11
    end
    A2_28:_runCharaScheduler(L6_32)
    A2_28:say(A0_26, L5_31, 0)
  end
  L5_31 = worldMaster
  L6_32 = L5_31
  L5_31 = L5_31.ask
  L5_31 = L5_31(L6_32, A2_28, A0_26, 68, 3, A4_30, A4_30, A4_30)
  if L5_31 == nil or L5_31 == 1 then
    L6_32 = A2_28.finishCliantTalkTurn
    L6_32(A2_28)
  end
  return L5_31
end
function Noc000.pENPCReward(A0_33, A1_34, A2_35, A3_36, A4_37, A5_38, A6_39, A7_40, A8_41, A9_42, A10_43)
  local L11_44
  L11_44 = 14
  if A4_37 == 36 then
    if A3_36 == 1 then
      L11_44 = 19
    else
      L11_44 = 20
    end
  elseif A4_37 == 41 then
    L11_44 = 23
  elseif A4_37 == 32 then
    L11_44 = 15
  elseif A4_37 == 34 then
    L11_44 = 17
  elseif A4_37 == 35 then
    L11_44 = 18
  elseif A4_37 == 39 then
    L11_44 = 21
  elseif A4_37 == 29 then
    L11_44 = 13
  elseif A4_37 == 33 then
    L11_44 = 16
  elseif A4_37 == 40 then
    L11_44 = 22
  end
  A2_35:say(A0_33, L11_44, 0, A5_38, A6_39, A7_40, A8_41, A9_42, A10_43)
end
function Noc000.pENPCAskLast(A0_45, A1_46, A2_47, A3_48, A4_49, A5_50, A6_51, A7_52, A8_53)
  local L9_54, L10_55, L11_56
  L9_54 = _math
  L9_54 = L9_54.floor
  L10_55 = A8_53 / 60
  L9_54 = L9_54(L10_55)
  L10_55 = L9_54 * 60
  L10_55 = A8_53 - L10_55
  L11_56 = nil
  while L11_56 ~= 1 do
    L11_56 = worldMaster:ask(A2_47, A0_45, 76, 2, A4_49, A5_50, A6_51, A7_52, L9_54, L10_55, A3_48)
    if L11_56 == 1 then
      L11_56 = worldMaster:ask(A2_47, A0_45, 79, 2, A5_50, A6_51, A7_52)
    else
      return
    end
  end
  return L11_56
end
function Noc000.pENPCComp(A0_57, A1_58, A2_59, A3_60, A4_61)
  local L5_62, L6_63
  L5_62 = 27
  L6_63 = 354172928
  if A4_61 == 36 then
    L6_63 = 354107392
    if A3_60 == 1 then
      L5_62 = 42
    else
      L5_62 = 43
    end
  elseif A4_61 == 41 then
    L6_63 = 354177024
    L5_62 = 54
  elseif A4_61 == 32 then
    L6_63 = 354177024
    L5_62 = 30
  elseif A4_61 == 34 then
    L6_63 = 354107392
    L5_62 = 36
  elseif A4_61 == 35 then
    L6_63 = 354172928
    L5_62 = 39
  elseif A4_61 == 39 then
    L6_63 = 354107392
    L5_62 = 48
  elseif A4_61 == 29 then
    L6_63 = 353968128
    L5_62 = 24
  elseif A4_61 == 33 then
    L6_63 = 354107392
    L5_62 = 33
  elseif A4_61 == 40 then
    L6_63 = 354177024
    L5_62 = 51
  end
  A2_59:_runCharaScheduler(L6_63)
  A2_59:say(A0_57, L5_62, 0)
  return
end
function Noc000.pENPCBonusReward(A0_64, A1_65, A2_66, A3_67, A4_68, A5_69, A6_70)
  local L7_71
  if A6_70 == true then
    L7_71 = A2_66.startCliantTalkTurn
    L7_71(A2_66, 2, A1_65)
    L7_71 = 28
    if A4_68 == 30 or A4_68 == 31 then
      if A5_69 == 2 then
        L7_71 = 28
      else
        L7_71 = 29
      end
    elseif A4_68 == 36 then
      if A3_67 == 1 then
        if A5_69 == 2 then
          L7_71 = 44
        else
          L7_71 = 46
        end
      elseif A5_69 == 2 then
        L7_71 = 45
      else
        L7_71 = 47
      end
    elseif A4_68 == 41 then
      if A5_69 == 2 then
        L7_71 = 55
      else
        L7_71 = 56
      end
    elseif A4_68 == 32 then
      if A5_69 == 2 then
        L7_71 = 31
      else
        L7_71 = 32
      end
    elseif A4_68 == 34 then
      if A5_69 == 2 then
        L7_71 = 37
      else
        L7_71 = 38
      end
    elseif A4_68 == 35 then
      if A5_69 == 2 then
        L7_71 = 40
      else
        L7_71 = 41
      end
    elseif A4_68 == 39 then
      if A5_69 == 2 then
        L7_71 = 49
      else
        L7_71 = 50
      end
    elseif A4_68 == 29 then
      if A5_69 == 2 then
        L7_71 = 25
      else
        L7_71 = 26
      end
    elseif A4_68 == 33 then
      if A5_69 == 2 then
        L7_71 = 34
      else
        L7_71 = 35
      end
    elseif A4_68 == 40 then
      if A5_69 == 2 then
        L7_71 = 52
      else
        L7_71 = 53
      end
    end
    A2_66:say(A0_64, L7_71, 0)
  end
  return
end
function Noc000.pENPCEnd(A0_72, A1_73, A2_74, A3_75, A4_76)
  local L5_77
  L5_77 = 89
  if A4_76 == 36 then
    if A3_75 == 1 then
      L5_77 = 94
    else
      L5_77 = 95
    end
  elseif A4_76 == 41 then
    L5_77 = 98
  elseif A4_76 == 32 then
    L5_77 = 90
  elseif A4_76 == 34 then
    L5_77 = 92
  elseif A4_76 == 35 then
    L5_77 = 93
  elseif A4_76 == 39 then
    L5_77 = 96
  elseif A4_76 == 29 then
    L5_77 = 88
  elseif A4_76 == 33 then
    L5_77 = 91
  elseif A4_76 == 40 then
    L5_77 = 97
  end
  A2_74:say(A0_72, L5_77, 0)
  A2_74:finishCliantTalkTurn()
  return
end
function Noc000.pELimitErr(A0_78, A1_79, A2_80)
  worldMaster:say(A0_78, 82)
  A2_80:finishCliantTalkTurn()
end
function Noc000.pETradeErr(A0_81, A1_82, A2_83)
  worldMaster:say(A0_81, 83)
  A2_83:finishCliantTalkTurn()
end
function Noc000.pETradeErrNew(A0_84, A1_85, A2_86)
  worldMaster:say(A0_84, 99)
  A2_86:finishCliantTalkTurn()
end
