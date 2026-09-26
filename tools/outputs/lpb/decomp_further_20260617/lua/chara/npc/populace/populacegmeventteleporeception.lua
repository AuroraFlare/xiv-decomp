require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGMEventTelepoReception", "NpcBaseClass")
function PopulaceGMEventTelepoReception.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7984, "populaceGMEventTelepoReception")
end
function PopulaceGMEventTelepoReception.telepoEntry(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(L3_4, 2, A1_2)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 2, 0)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 3, 0)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 4, 0)
  L3_4 = A0_1
  L2_3 = A0_1.askExtendWidget
  L2_3 = L2_3(L3_4, A0_1, 5, 2, 1, 2)
  L3_4 = L2_3
  if L3_4 == 1 then
    break
  else
  end
  if L3_4 == 2 then
    A0_1:finishCliantTalkTurn()
    break
  else
  end
  return L2_3
end
function PopulaceGMEventTelepoReception.telepoEntryOK(A0_5, A1_6)
  A0_5:say(A0_5, 9, 0)
  A0_5:say(A0_5, 10, 0)
  A0_5:finishCliantTalkTurn()
end
function PopulaceGMEventTelepoReception.telepoEntryNG(A0_7, A1_8)
  A0_7:say(A0_7, 8, 0)
  A0_7:finishCliantTalkTurn()
end
function PopulaceGMEventTelepoReception.telepoStandBy(A0_9, A1_10)
  A0_9:startCliantTalkTurn(2, A1_10)
  A0_9:say(A0_9, 10, 0)
  A0_9:finishCliantTalkTurn()
end
function PopulaceGMEventTelepoReception.telepoFullMember(A0_11, A1_12)
  A0_11:startCliantTalkTurn(2, A1_12)
  A0_11:say(A0_11, 11, 0)
  A0_11:finishCliantTalkTurn()
end
function PopulaceGMEventTelepoReception.debugTelepoMenu(A0_13, A1_14)
  A0_13:startCliantTalkTurn(2, A1_14)
  A0_13:say(A0_13, 17, 0)
  A0_13:finishCliantTalkTurn()
  return (A0_13:askExtendWidget(A0_13, 18, 2, 1, 2))
end
