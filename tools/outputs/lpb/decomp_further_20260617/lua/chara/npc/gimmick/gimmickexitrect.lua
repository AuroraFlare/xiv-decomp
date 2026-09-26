require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("GimmickExitRect", "GimmickNpcBaseClass")
function GimmickExitRect.initForGimmick(A0_0, ...)
  A0_0:_loadTextDataPermanently(10064, "gimmickExitRect")
  A0_0:_setGroundOn(false)
end
function GimmickExitRect.askExitWithPlaceNameId(A0_2, A1_3)
  local L2_4, L3_5, L4_6
  L2_4 = false
  L3_5 = 0
  L4_6 = {}
  L3_5 = 1
  L4_6[1] = 2
  L4_6[2] = 3
  if desktopWidget:askForEventMode(nil, nil, A0_2, 1, false, true, L3_5, L4_6, A1_3) == 1 then
    L3_5 = 4
    L4_6[1] = 5
    L4_6[2] = 6
    if desktopWidget:askForEventMode(nil, nil, A0_2, 1, false, true, L3_5, L4_6, A1_3) == 1 then
      L2_4 = true
    end
  end
  return L2_4
end
