require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceFlyingShip", "NpcBaseClass")
function PopulaceFlyingShip.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {}
  A0_0:initWork(L4_4, L5_5)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(7620, "populaceFlyingShip")
end
function PopulaceFlyingShip.eventIn(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12, L7_13, L8_14
  L6_12 = A1_7
  L5_11 = A1_7.getMoneyOnHand
  L5_11 = L5_11(L6_12)
  A3_9 = L5_11
  L6_12 = A0_6
  L5_11 = A0_6.startCliantTalkTurn
  L7_13 = 2
  L8_14 = A1_7
  L5_11(L6_12, L7_13, L8_14)
  L6_12 = A0_6
  L5_11 = A0_6.getActorClassId
  L5_11 = L5_11(L6_12)
  L6_12 = {
    L7_13,
    L8_14,
    true
  }
  L7_13 = true
  L8_14 = true
  L7_13 = L5_11
  if L7_13 == 1500003 then
    L6_12[1] = false
    break
  else
  end
  if L7_13 == 1500055 then
    L6_12[2] = false
    break
  else
  end
  if L7_13 == 1500208 then
    L6_12[3] = false
    break
  else
  end
  L8_14 = A0_6
  L7_13 = A0_6.say
  L7_13(L8_14, A0_6, 2, 0)
  while true do
    L7_13 = worldMaster
    L8_14 = L7_13
    L7_13 = L7_13.ask
    L7_13 = L7_13(L8_14, A0_6, A0_6, 3, 3)
    if L7_13 == 1 then
      if A2_8 == true then
        L8_14 = A0_6.say
        L8_14(A0_6, A0_6, 30, 0)
      elseif A2_8 == nil then
        L8_14 = A0_6.say
        L8_14(A0_6, A0_6, 29, 0, A3_9, A4_10)
        break
      else
        L8_14 = A0_6.say
        L8_14(A0_6, A0_6, 10, 0, A3_9, A4_10)
      end
      while true do
        while true do
          while true do
            L8_14 = worldMaster
            L8_14 = L8_14.askRestrictChoices
            L8_14 = L8_14(L8_14, A0_6, A0_6, 11, L6_12[1], L6_12[2], L6_12[3], true)
            if L8_14 ~= 4 and L8_14 ~= nil then
              if A2_8 == true then
                A0_6:say(A0_6, 31, 0, L8_14)
              else
                A0_6:say(A0_6, 16, 0, L8_14, A4_10, A3_9)
              end
              if worldMaster:askMultipleTextMacro(A0_6, A0_6, 1, 17, 3, 1, true, true, true, L8_14, 0, 0, 0) == 1 then
                A0_6:say(A0_6, 21, 0)
                A0_6:finishCliantTalkTurn()
                return L8_14
              end
              if worldMaster:askMultipleTextMacro(A0_6, A0_6, 1, 17, 3, 1, true, true, true, L8_14, 0, 0, 0) == 3 then
                do break end
                break
              end
            end
          end
        end
      end
    elseif L7_13 == 2 then
      L8_14 = A0_6.say
      L8_14(A0_6, A0_6, 7, 0)
      L8_14 = A0_6.say
      L8_14(A0_6, A0_6, 8, 0)
      if L5_11 == 1500208 then
        L8_14 = A0_6._runCharaScheduler
        L8_14(A0_6, 70795264)
        L8_14 = A0_6.say
        L8_14(A0_6, A0_6, 9, 0)
      end
    else
      break
    end
  end
  L8_14 = A0_6
  L7_13 = A0_6.finishCliantTalkTurn
  L7_13(L8_14)
  L7_13 = nil
  return L7_13
end
function PopulaceFlyingShip.eventOut(A0_15, A1_16, A2_17)
  A0_15:startCliantTalkTurn(2, A1_16)
  if A2_17 == 30010 then
    A0_15:say(A0_15, 23, 0)
    worldMaster:say(A0_15, 24)
  else
    A0_15:say(A0_15, 32, 0)
  end
  if worldMaster:ask(A0_15, A0_15, 25, 2) == 1 then
    A0_15:say(A0_15, 28, 0)
    A0_15:finishCliantTalkTurn()
    return true
  else
    A0_15:finishCliantTalkTurn()
    return nil
  end
end
function PopulaceFlyingShip.eventNG(A0_18, A1_19)
  A0_18:startCliantTalkTurn(2, A1_19)
  A0_18:say(A0_18, 22, 0)
  A0_18:finishCliantTalkTurn()
end
