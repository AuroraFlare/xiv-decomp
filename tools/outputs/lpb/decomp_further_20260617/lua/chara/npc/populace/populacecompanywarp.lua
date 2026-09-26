require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCompanyWarp", "NpcBaseClass")
function PopulaceCompanyWarp.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 7888, "populaceCompanyWarp")
  L1_1 = {
    {
      "grandCompanyNumber",
      "integer8"
    },
    {
      "warpTicketId",
      "integer32"
    },
    {"female", "boolean"},
    {
      "companyRank",
      "integer8"
    }
  }
  A0_0:initWork(nil, L1_1)
  A0_0.work.female = true
  if A0_0:getActorClassId() == 1500321 then
  elseif A0_0:getActorClassId() == 1500322 then
  elseif A0_0:getActorClassId() == 1500323 then
  else
  end
  if A0_0:getActorClassId() == 1500339 then
    A0_0.work.female = false
  elseif A0_0:getActorClassId() == 1500330 then
  elseif A0_0:getActorClassId() == 1500331 then
  else
  end
  if A0_0:getActorClassId() == 1500332 then
    A0_0.work.grandCompanyNumber = 1
    A0_0.work.warpTicketId = 2001014
    break
  elseif A0_0:getActorClassId() == 1500324 then
  elseif A0_0:getActorClassId() == 1500325 then
  else
  end
  if A0_0:getActorClassId() == 1500326 then
    A0_0.work.female = false
  elseif A0_0:getActorClassId() == 1500333 then
  elseif A0_0:getActorClassId() == 1500334 then
  else
  end
  if A0_0:getActorClassId() == 1500335 then
    A0_0.work.grandCompanyNumber = 2
    A0_0.work.warpTicketId = 2001015
    break
  elseif A0_0:getActorClassId() == 1500327 then
  elseif A0_0:getActorClassId() == 1500328 then
  else
  end
  if A0_0:getActorClassId() == 1500329 then
    A0_0.work.female = false
  elseif A0_0:getActorClassId() == 1500336 then
  elseif A0_0:getActorClassId() == 1500337 then
  else
  end
  if A0_0:getActorClassId() == 1500338 then
    A0_0.work.grandCompanyNumber = 3
    A0_0.work.warpTicketId = 2001016
    do break end
    break
  else
  end
  A0_0.work.companyRank = 13
  A0_0:_setGroundOn(false)
end
function PopulaceCompanyWarp.eventTalkWelcome(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = 27
  L3_5 = 0
  L4_6 = 28
  if A0_2.work.grandCompanyNumber == 1 then
    if A0_2.work.female == false then
      L2_4 = 27
      L4_6 = 28
    else
      L2_4 = 3
      L4_6 = 4
    end
  elseif A0_2.work.grandCompanyNumber == 2 then
    if A0_2.work.female == false then
      L2_4 = 31
      L3_5 = 98
      L4_6 = 32
    else
      L2_4 = 11
      L4_6 = 12
    end
  elseif A0_2.work.grandCompanyNumber == 3 then
    if A0_2.work.female == false then
      L2_4 = 35
      L4_6 = 36
    else
      L2_4 = 19
      L4_6 = 20
    end
  end
  if A0_2:doSalute(A0_2.work.grandCompanyNumber, A0_2.work.companyRank) == 0 then
    A0_2:_runCharaScheduler(353964032)
  end
  A0_2:startCliantTalkTurn(2, A1_3)
  A0_2:say(A0_2, L2_4, 0, A0_2.work.warpTicketId)
  if L3_5 ~= 0 then
    A0_2:say(A0_2, L3_5, 0)
  end
  A0_2:_runCharaScheduler(353968128)
  A0_2:say(A0_2, L4_6, 0)
  A0_2:finishCliantTalkTurn()
  return
end
function PopulaceCompanyWarp.eventAskMainMenu(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16
  L3_10 = 25
  L4_11 = 26
  L5_12 = 37
  L6_13 = 9
  L7_14 = 84090880
  L8_15 = A0_7.work
  L8_15 = L8_15.grandCompanyNumber
  if L8_15 == 1 then
    L8_15 = A0_7.work
    L8_15 = L8_15.female
    if L8_15 == false then
      L3_10 = 25
      L4_11 = 26
    else
      L3_10 = 1
      L4_11 = 2
    end
    L5_12 = 37
    L6_13 = 9
    L7_14 = 84090880
  else
    L8_15 = A0_7.work
    L8_15 = L8_15.grandCompanyNumber
    if L8_15 == 2 then
      L8_15 = A0_7.work
      L8_15 = L8_15.female
      if L8_15 == false then
        L3_10 = 29
        L4_11 = 30
      else
        L3_10 = 9
        L4_11 = 10
      end
      L5_12 = 57
      L6_13 = 9
      L7_14 = 84094976
    else
      L8_15 = A0_7.work
      L8_15 = L8_15.grandCompanyNumber
      if L8_15 == 3 then
        L8_15 = A0_7.work
        L8_15 = L8_15.female
        if L8_15 == false then
          L3_10 = 33
          L4_11 = 34
        else
          L3_10 = 17
          L4_11 = 18
        end
        L5_12 = 77
        L6_13 = 9
        L7_14 = 84099072
      end
    end
  end
  L8_15 = {}
  for _FORV_12_ = 1, L6_13 do
    L8_15[_FORV_12_] = true
  end
  L8_15[L9_16] = false
  L9_16(A0_7, 2, A1_8)
  L9_16(A0_7, L7_14)
  L9_16(A0_7, 403087360)
  L9_16(L9_16, A0_7, 38, A0_7, L3_10)
  if L9_16 <= 1 or L6_13 < L9_16 then
  else
    A0_7:_runCharaScheduler(69197824)
    A0_7:_runCharaScheduler(403087360)
    desktopWidget:showLog(A0_7, 38, A0_7, L4_11)
    A0_7:_waitForCharaSchedulerFinished(69197824)
    A0_7:_wait(1)
  end
  A0_7:finishCliantTalkTurn()
  return L9_16
end
function PopulaceCompanyWarp.eventAfterWarpOtherZone(A0_17, A1_18)
  A1_18:_fadeOut(1)
  A1_18:_waitForFading()
  A1_18:_fadeInAfterWarp()
end
function PopulaceCompanyWarp.eventTalkStepBreak(A0_19)
  A0_19:finishCliantTalkTurn()
  return 0
end
