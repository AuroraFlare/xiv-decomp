require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyBuffer", "NpcBaseClass")
function PopulaceCompanyBuffer.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 10256, "populaceCompanyBuffer")
  L1_1 = {
    {
      "grandCompanyNumber",
      "integer8"
    },
    {
      "companyRank",
      "integer8"
    }
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500388 then
    A0_0.work.grandCompanyNumber = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500389 then
    A0_0.work.grandCompanyNumber = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1500390 then
    A0_0.work.grandCompanyNumber = 3
    do break end
    break
  else
  end
  A0_0.work.companyRank = 13
  A0_0:_setGroundOn(false)
end
function PopulaceCompanyBuffer.eventTalkWelcome(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9
  L3_5 = 2
  L4_6 = 0
  L5_7 = false
  L7_9 = A1_3
  L6_8 = A1_3._getBelongGrandCompany
  L6_8 = L6_8(L7_9)
  if L6_8 == 0 then
    L3_5 = 20
  else
    L7_9 = A0_2.work
    L7_9 = L7_9.grandCompanyNumber
    if L6_8 ~= L7_9 then
      if A2_4 == false then
        L3_5 = 17
      else
        L7_9 = A1_3._getGrandCompanyRank
        L7_9 = L7_9(A1_3, L6_8)
        if L7_9 < 27 then
          L3_5 = 17
        else
          L3_5 = 18
          L5_7 = true
        end
      end
    else
      L7_9 = A1_3._getGrandCompanyRank
      L7_9 = L7_9(A1_3, L6_8)
      if L7_9 < 27 then
        L3_5 = 15
      else
        L3_5 = 2
        L5_7 = true
      end
    end
  end
  L7_9 = A0_2.doSalute
  L7_9 = L7_9(A0_2, A0_2.work.grandCompanyNumber, A0_2.work.companyRank)
  if L7_9 == 0 then
    if L5_7 == false then
      L7_9 = A0_2._runCharaScheduler
      L7_9(A0_2, 353959936)
    else
      L7_9 = 0
      if A0_2.work.grandCompanyNumber == 1 then
        L7_9 = 84090880
      elseif A0_2.work.grandCompanyNumber == 2 then
        L7_9 = 84094976
      elseif A0_2.work.grandCompanyNumber == 3 then
        L7_9 = 84099072
      end
      if L7_9 ~= 0 then
        A0_2:_runCharaScheduler(L7_9)
      end
    end
  end
  L7_9 = A0_2.startCliantTalkTurn
  L7_9(A0_2, 2, A1_3)
  L7_9 = A0_2._wait
  L7_9(A0_2, 1.5)
  L7_9 = A0_2.say
  L7_9(A0_2, A0_2, L3_5, 0, A0_2.work.grandCompanyNumber)
  if L3_5 == 20 or L3_5 == 17 then
    L7_9 = 0
    return L7_9
  end
  L7_9 = 0
  repeat
    L7_9 = worldMaster:askMultipleTextMacro(A0_2, A0_2, 1, 4, 3, 0, L5_7, true, true)
    if type(L7_9) ~= "number" then
      return 0
    end
    if L7_9 == 1 then
      return 1
    elseif L7_9 == 2 then
      A0_2:_runCharaScheduler(353959936)
      A0_2:say(A0_2, 10, 0, A0_2.work.grandCompanyNumber)
      A0_2:_runCharaScheduler(353968128)
      A0_2:say(A0_2, 11, 0, A0_2.work.grandCompanyNumber)
      A0_2:_runCharaScheduler(353959936)
      A0_2:say(A0_2, 12, 0, A0_2.work.grandCompanyNumber)
      worldMaster:say(A0_2, 13, 180)
      worldMaster:say(A0_2, 14)
    else
      return 0
    end
  until L7_9 < 1
  return 0
end
function PopulaceCompanyBuffer.eventTalkBufEffect(A0_10, A1_11)
  A0_10:say(A0_10, 8, 0)
  A0_10:_runCharaScheduler(68378624)
  A0_10:_wait(2)
end
function PopulaceCompanyBuffer.eventTalkBufEffectAfter(A0_12, A1_13)
  A1_13:_runCharaScheduler(67108924)
  A0_12:_wait(2)
  A0_12:_runCharaScheduler(83906560)
  A0_12:say(A0_12, 9, 0)
end
function PopulaceCompanyBuffer.eventTalkStepBreak(A0_14)
  A0_14:finishCliantTalkTurn()
end
