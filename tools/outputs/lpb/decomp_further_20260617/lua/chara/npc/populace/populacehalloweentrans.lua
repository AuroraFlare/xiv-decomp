require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceHalloweenTrans", "NpcBaseClass")
function PopulaceHalloweenTrans.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(7696, "populaceHalloweenTrans")
end
function PopulaceHalloweenTrans.firstUboa(A0_1, A1_2)
  A0_1:say(A0_1, 9)
end
function PopulaceHalloweenTrans.firstTalkNomalEvent(A0_3, A1_4)
  A0_3:say(A0_3, 10, 0)
  A0_3:say(A0_3, 11, 0)
  A0_3:say(A0_3, 12, 0)
  A0_3:say(A0_3, A1_4)
end
function PopulaceHalloweenTrans.firstTalkAskEvent(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11)
  local L7_12, L8_13
  L8_13 = {
    A3_8,
    A4_9,
    A5_10
  }
  L7_12 = desktopWidget:askForEventMode(A0_5, A0_5, A0_5, 1, false, false, A2_7, L8_13)
  if L7_12 == A6_11 then
    A0_5:say(A0_5, 13, 0)
    A0_5:say(A0_5, 14, 0)
    A0_5:say(A0_5, 15, 0, 9)
    A0_5:say(A0_5, 16, 0)
    return 0
  else
    A0_5:say(A0_5, 17, 0)
    A0_5:say(A0_5, 18, 0, 5)
    A0_5:say(A0_5, 19, 0)
    return 1
  end
end
function PopulaceHalloweenTrans.occupyEvent(A0_14, A1_15)
  A0_14:say(A0_14, 20, 0)
  A0_14:say(A0_14, 21, 0)
end
function PopulaceHalloweenTrans.itemFullEvent(A0_16, A1_17)
  A0_16:say(A0_16, 22, 0)
  A0_16:say(A0_16, 23, 0)
end
function PopulaceHalloweenTrans.getSweets(A0_18, A1_19)
end
function PopulaceHalloweenTrans.halloweenshowHideTest(A0_20, A1_21)
  local L2_22
  return L2_22
end
