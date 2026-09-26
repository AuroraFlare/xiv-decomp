require("/Chara/Npc/NpcBaseClass")
_defineClass("MusicChange", "NpcBaseClass")
function MusicChange.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
end
function MusicChange.eventCut(A0_3, A1_4)
  if A1_4 ~= "" then
    worldMaster:_getMyPlayer():_fadeOut(1)
    worldMaster:_getMyPlayer():_waitForFading()
    worldMaster:createCutScene(A1_4, A0_3):startCutScene(1, 61, 1)
    worldMaster:_getMyPlayer():_fadeIn(1)
    worldMaster:_getMyPlayer():_waitForFading()
  end
end
