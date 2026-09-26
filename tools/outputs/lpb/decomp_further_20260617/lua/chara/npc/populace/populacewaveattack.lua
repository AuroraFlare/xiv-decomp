require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceWaveAttack", "NpcBaseClass")
function PopulaceWaveAttack.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7200, "populaceWaveAttack")
end
function PopulaceWaveAttack.waveAttackEntry(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(L3_4, 2, A1_2)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 2, 0)
  L3_4 = A0_1
  L2_3 = A0_1.askExtendWidget
  L2_3 = L2_3(L3_4, A0_1, 3, 2, 1, 2)
  L3_4 = L2_3
  if L3_4 == 1 then
    break
  else
  end
  if L3_4 == 2 then
    A0_1:say(A0_1, 7, 0)
    A0_1:finishCliantTalkTurn()
    break
  else
  end
  if L3_4 == -3 then
    A0_1:finishCliantTalkTurn()
    break
  else
  end
  return L2_3
end
function PopulaceWaveAttack.waveAttackEntryOK(A0_5, A1_6)
  A0_5:say(A0_5, 6, 0)
  A0_5:finishCliantTalkTurn()
end
function PopulaceWaveAttack.waveAttackEntryNG(A0_7, A1_8)
  A0_7:say(A0_7, 8, 0)
  A0_7:finishCliantTalkTurn()
end
function PopulaceWaveAttack.waveAttackLeave(A0_9, A1_10)
  local L2_11, L3_12
  L3_12 = A0_9
  L2_11 = A0_9.startCliantTalkTurn
  L2_11(L3_12, 2, A1_10)
  L3_12 = A0_9
  L2_11 = A0_9.say
  L2_11(L3_12, A0_9, 15, 0)
  L3_12 = A0_9
  L2_11 = A0_9.askExtendWidget
  L2_11 = L2_11(L3_12, A0_9, 16, 2, 1, 2)
  L3_12 = L2_11
  if L3_12 == 1 then
    A0_9:say(A0_9, 19, 0)
    break
  else
  end
  if L3_12 == 2 then
    A0_9:say(A0_9, 20, 0)
    break
  else
  end
  L3_12 = A0_9.finishCliantTalkTurn
  L3_12(A0_9)
  return L2_11
end
function PopulaceWaveAttack.waveAttackFullMember(A0_13, A1_14)
  A0_13:startCliantTalkTurn(2, A1_14)
  A0_13:say(A0_13, 9, 0)
  A0_13:finishCliantTalkTurn()
end
function PopulaceWaveAttack.waveAttackWin(A0_15, A1_16)
  A0_15:startCliantTalkTurn(2, A1_16)
  A0_15:say(A0_15, 21, 0)
  A0_15:finishCliantTalkTurn()
end
