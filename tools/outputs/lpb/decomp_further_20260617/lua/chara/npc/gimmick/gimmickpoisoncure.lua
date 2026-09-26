require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("GimmickPoisonCure", "GimmickNpcBaseClass")
function GimmickPoisonCure.initForGimmick(A0_0, ...)
  A0_0:_loadTextDataPermanently(10080, "gimmickPoisonCure")
end
function GimmickPoisonCure.askPoisonCure(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = false
  L3_5 = 0
  L4_6 = {}
  if A1_3 == 1 then
    L3_5 = 1
    L4_6[1] = 2
    L4_6[2] = 3
    break
  else
  end
  if A1_3 == 2 then
    L3_5 = 5
    L4_6[1] = 6
    L4_6[2] = 7
    do break end
    break
  else
  end
  if desktopWidget:askForEventMode(nil, nil, A0_2, 1, false, true, L3_5, L4_6) == 1 then
    L2_4 = true
  end
  return L2_4
end
