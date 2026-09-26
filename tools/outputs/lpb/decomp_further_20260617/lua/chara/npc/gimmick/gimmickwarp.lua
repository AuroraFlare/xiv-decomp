require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("GimmickWarp", "GimmickNpcBaseClass")
function GimmickWarp.initForGimmick(A0_0)
  A0_0:_loadTextDataPermanently(10112, "gimmickWarp")
  A0_0:_setGroundOn(false)
end
function GimmickWarp.askWarp(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7
  L3_4 = false
  L4_5 = 0
  L5_6 = {}
  L6_7 = A1_2
  if L6_7 == 1 then
    L4_5 = 1
    L5_6[1] = 2
    L5_6[2] = 3
    if A2_3 ~= 0 then
      A2_3 = 0
      do break end
      else
      end
      if L6_7 == 2 then
        L4_5 = 4
        L5_6[1] = 5
        L5_6[2] = 6
        break
      else
      end
      if L6_7 == 3 then
        L4_5 = 7
        L5_6[1] = 8
        L5_6[2] = 9
        break
      else
      end
    else
    end
  L6_7 = 0
  if A2_3 == 0 then
    L6_7 = desktopWidget:askForEventMode(nil, nil, A0_1, 1, false, true, L4_5, L5_6)
  else
    L6_7 = desktopWidget:askForEventMode(nil, nil, A0_1, 1, false, true, L4_5, L5_6, A2_3)
  end
  if L6_7 == 1 then
    L3_4 = true
  end
  return L3_4
end
