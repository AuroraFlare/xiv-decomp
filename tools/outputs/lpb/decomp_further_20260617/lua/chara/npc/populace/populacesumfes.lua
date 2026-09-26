require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceSumFes", "NpcBaseClass")
function PopulaceSumFes.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(7216, "populaceSumFes")
  if A0_0:getActorClassId() == 1001679 then
    A0_0:_setGroundOn(false)
  end
end
function PopulaceSumFes.eventTalkStep0(A0_1, A1_2, A2_3)
  A0_1:startCliantTalkTurn(2, A1_2)
  if A2_3 == 0 then
    desktopWidget:showMessage(1000194, 38, A0_1, 35)
    break
  else
  end
  if A2_3 == 1 then
    desktopWidget:showMessage(1200177, 38, A0_1, 37)
    break
  else
  end
  if A2_3 == 2 then
    desktopWidget:showMessage(1600148, 38, A0_1, 36)
    break
  else
  end
  if 5 == 5 then
    A0_1:finishCliantTalkTurn()
  elseif 199 == -3 then
    A0_1:finishCliantTalkTurn()
  end
  A0_1:finishCliantTalkTurn()
  return 199
end
function PopulaceSumFes.eventTalkStep1(A0_4, A1_5, A2_6)
  A0_4:startCliantTalkTurn(2, A1_5)
  if A2_6 == 0 then
    desktopWidget:showMessage(1000194, 38, A0_4, 44)
    break
  else
  end
  if A2_6 == 1 then
    desktopWidget:showMessage(1200177, 38, A0_4, 46)
    break
  else
  end
  if A2_6 == 2 then
    desktopWidget:showMessage(1600148, 38, A0_4, 45)
    break
  else
  end
  A0_4:finishCliantTalkTurn()
  return
end
function PopulaceSumFes.eventTalkStep2(A0_7, A1_8, A2_9)
  A0_7:startCliantTalkTurn(2, A1_8)
  if A2_9 == 0 then
    desktopWidget:showMessage(1000194, 38, A0_7, 47)
    break
  else
  end
  if A2_9 == 1 then
    desktopWidget:showMessage(1200177, 38, A0_7, 49)
    break
  else
  end
  if A2_9 == 2 then
    desktopWidget:showMessage(1600148, 38, A0_7, 48)
    break
  else
  end
  A0_7:finishCliantTalkTurn()
  return
end
