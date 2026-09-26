require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("GimmickNpcBaseClass", "NpcBaseClass")
function GimmickNpcBaseClass.initForEvent(A0_0, A1_1, ...)
  local L3_3, L4_4
  L3_3 = A0_0.gimmickNpcWork
  L4_4 = {
    {"talkRange", "float"},
    {
      "_assignForChild",
      60
    }
  }
  L3_3._temp = L4_4
  L3_3 = A0_0.gimmickNpcWork
  L4_4 = {
    {
      "_assignForChild",
      4
    }
  }
  L3_3._sync = L4_4
  L3_3 = A0_0.gimmickNpcWork
  L3_3.talkRange = A1_1
  L4_4 = A0_0
  L3_3 = A0_0.initForGimmick
  L3_3(L4_4, ...)
end
function GimmickNpcBaseClass.initForGimmick(A0_5, ...)
end
function GimmickNpcBaseClass.getLimitedDistanceForTalk(A0_7)
  return A0_7.gimmickNpcWork.talkRange
end
function GimmickNpcBaseClass.askExit(A0_8, A1_9, A2_10)
  local L3_11, L4_12
  L3_11 = false
  L4_12 = {52043, 52044}
  if A2_10 == nil then
    A2_10 = 1
  else
  end
  if desktopWidget:askForEventMode(nil, nil, worldMaster, A2_10, false, true, 52042, L4_12, A1_9) == 1 then
    L3_11 = true
  end
  return L3_11
end
