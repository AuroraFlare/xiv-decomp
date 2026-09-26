require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyGuide", "NpcBaseClass")
function PopulaceCompanyGuide.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 7504, "populaceCompanyGuide")
  L1_1 = {
    {"townNumber", "integer8"},
    {
      "companyRank",
      "integer8"
    }
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1001737 then
    A0_0.work.townNumber = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1001738 then
    A0_0.work.townNumber = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1001739 then
    A0_0.work.townNumber = 3
    break
  else
  end
  A0_0.work.townNumber = 0
  do break end
  A0_0.work.companyRank = 31
  A0_0:_setGroundOn(false)
end
function PopulaceCompanyGuide.eventTalkWelcome(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7
  L3_5 = worldMaster
  L4_6 = L3_5
  L3_5 = L3_5._getMyPlayer
  L3_5 = L3_5(L4_6)
  L5_7 = L3_5
  L4_6 = L3_5.getGrandCompanyRankLinear
  L4_6 = L4_6(L5_7, A0_2.work.townNumber)
  L5_7 = A0_2.startCliantTalkTurn
  L5_7(A0_2, 1, L3_5)
  L5_7 = 2
  if A0_2.work.townNumber == 2 then
    L5_7 = 29
  elseif A0_2.work.townNumber == 3 then
    L5_7 = 45
  end
  A0_2:_runCharaScheduler(353959936)
  A0_2:say(A0_2, L5_7, 0)
  return 0
end
function PopulaceCompanyGuide.eventTalkProvisional(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13
  L3_11 = worldMaster
  L4_12 = L3_11
  L3_11 = L3_11._getMyPlayer
  L3_11 = L3_11(L4_12)
  L5_13 = L3_11
  L4_12 = L3_11.getGrandCompanyRankLinear
  L4_12 = L4_12(L5_13, A0_8.work.townNumber)
  L5_13 = A0_8.startCliantTalkTurn
  L5_13(A0_8, 1, L3_11)
  L5_13 = 4
  if A0_8.work.townNumber == 2 then
    L5_13 = 31
  elseif A0_8.work.townNumber == 3 then
    L5_13 = 47
  end
  A0_8:_runCharaScheduler(354099200)
  A0_8:say(A0_8, L5_13, 0)
  return 0
end
function PopulaceCompanyGuide.eventTalkExclusive(A0_14, A1_15, A2_16, A3_17)
  local L4_18, L5_19, L6_20
  L4_18 = worldMaster
  L5_19 = L4_18
  L4_18 = L4_18._getMyPlayer
  L4_18 = L4_18(L5_19)
  L6_20 = L4_18
  L5_19 = L4_18.getGrandCompanyRankLinear
  L5_19 = L5_19(L6_20, A0_14.work.townNumber)
  L6_20 = 3
  if A0_14.work.townNumber == 2 then
    L6_20 = 30
  elseif A0_14.work.townNumber == 3 then
    L6_20 = 46
  end
  A0_14:startCliantTalkTurn(1, L4_18)
  A0_14:_runCharaScheduler(354078720)
  A0_14:say(A0_14, L6_20, 0, A3_17)
  return 0
end
function PopulaceCompanyGuide.eventTalkComMember(A0_21, A1_22, A2_23, A3_24)
  local L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34
  L4_25 = worldMaster
  L5_26 = L4_25
  L4_25 = L4_25._getMyPlayer
  L4_25 = L4_25(L5_26)
  L6_27 = L4_25
  L5_26 = L4_25.getGrandCompanyRankLinear
  L7_28 = A0_21.work
  L7_28 = L7_28.townNumber
  L5_26 = L5_26(L6_27, L7_28)
  L7_28 = A0_21
  L6_27 = A0_21.startCliantTalkTurn
  L8_29 = 1
  L9_30 = L4_25
  L6_27(L7_28, L8_29, L9_30)
  L6_27 = 0
  L7_28 = 5
  L8_29 = 12
  L9_30 = 63
  L10_31 = 63
  L11_32, L12_33 = nil, nil
  L13_34 = 354168832
  if A0_21.work.townNumber == 1 then
    L7_28 = 5
    L6_27 = A2_23:doSalute(1, 33)
  elseif A0_21.work.townNumber == 2 then
    L7_28 = 32
    L6_27 = A2_23:doSalute(2, 33)
  elseif A0_21.work.townNumber == 3 then
    L7_28 = 48
    L6_27 = A2_23:doSalute(3, 33)
  end
  if L6_27 == 0 then
    A2_23:_runCharaScheduler(354041856)
  end
  A0_21:say(A0_21, L7_28, 0)
  repeat
    while L11_32 ~= 4 do
      L12_33 = 0
      L11_32 = worldMaster:askRestrictChoices(A0_21, A0_21, 6, true, A3_24, true, true)
      if L11_32 == 1 then
        L7_28 = 11
        L8_29 = 12
        L9_30 = 63
        if A0_21.work.townNumber == 2 then
          L7_28 = 33
          L8_29 = 34
          L9_30 = 61
        elseif A0_21.work.townNumber == 3 then
          L7_28 = 49
          L8_29 = 50
          L9_30 = 62
        end
        A2_23:_runCharaScheduler(353980416)
        A0_21:say(A0_21, L7_28, 0)
        A0_21:say(A0_21, L8_29, 0)
        A0_21:say(A0_21, L9_30, 0)
      elseif L11_32 == 2 then
        L13_34 = 353976320
        L7_28 = 13
        L8_29 = 14
        if A0_21.work.townNumber == 2 then
          L13_34 = 353976320
          L7_28 = 35
          L8_29 = 36
        elseif A0_21.work.townNumber == 3 then
          L13_34 = 354066432
          L7_28 = 51
          L8_29 = 52
        end
        A2_23:_runCharaScheduler(L13_34)
        A0_21:say(A0_21, L7_28, 0)
        A0_21:say(A0_21, L8_29, 0)
      else
        if L11_32 == 3 then
          while true do
            L12_33 = worldMaster:askRestrictChoices(A0_21, A0_21, 15, true, true, true, true, true)
            if L12_33 == 1 then
              L7_28 = 21
              L8_29 = 22
              L9_30 = 64
              if A0_21.work.townNumber == 2 then
                L7_28 = 37
                L8_29 = 38
                L9_30 = 65
              elseif A0_21.work.townNumber == 3 then
                L7_28 = 53
                L8_29 = 54
                L9_30 = 66
              end
              A2_23:_runCharaScheduler(353984512)
              A0_21:say(A0_21, L7_28, 0)
              A0_21:say(A0_21, L8_29, 0)
              A0_21:say(A0_21, L9_30, 0)
            elseif L12_33 == 2 then
              L7_28 = 23
              L8_29 = 24
              L9_30 = 121
              L10_31 = 122
              if A0_21.work.townNumber == 2 then
                L7_28 = 39
                L8_29 = 40
                L9_30 = 125
                L10_31 = 127
              elseif A0_21.work.townNumber == 3 then
                L7_28 = 55
                L8_29 = 56
                L9_30 = 129
                L10_31 = 131
              end
              A2_23:_runCharaScheduler(353964032)
              A0_21:say(A0_21, L7_28, 0)
              A0_21:say(A0_21, L8_29, 0)
              A0_21:say(A0_21, L9_30, 0)
              A0_21:say(A0_21, L10_31, 0)
            elseif L12_33 == 3 then
              L7_28 = 25
              L8_29 = 26
              if A0_21.work.townNumber == 2 then
                L7_28 = 41
                L8_29 = 42
              elseif A0_21.work.townNumber == 3 then
                L7_28 = 57
                L8_29 = 58
              end
              A2_23:_runCharaScheduler(353980416)
              A0_21:say(A0_21, L7_28, 0)
              A0_21:say(A0_21, L8_29, 0)
            elseif L12_33 == 4 then
              L7_28 = 27
              L8_29 = 28
              if A0_21.work.townNumber == 2 then
                L7_28 = 43
                L8_29 = 44
              elseif A0_21.work.townNumber == 3 then
                L7_28 = 59
                L8_29 = 60
              end
              A2_23:_runCharaScheduler(354099200)
              A0_21:say(A0_21, L7_28, 0)
              A0_21:say(A0_21, L8_29, 0)
            else
            end
            if L12_33 == 5 then
            end
          end
          L12_33 = 5
        end
        if L11_32 == 4 then
          return L11_32
        else
          return
        end
      end
    end
  until L12_33 ~= 5
end
function PopulaceCompanyGuide.eventTalkStepBreak(A0_35)
  A0_35:finishCliantTalkTurn()
  return 0
end
