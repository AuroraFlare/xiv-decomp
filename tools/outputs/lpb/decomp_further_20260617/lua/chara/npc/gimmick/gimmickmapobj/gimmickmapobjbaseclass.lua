require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineBaseClass("GimmickMapObjBaseClass", "GimmickNpcBaseClass")
function GimmickMapObjBaseClass.initForGimmick(A0_0, A1_1, ...)
  if A1_1 ~= "" then
    A0_0:_runBgSchedulerFromMidstream(A1_1, 5)
  end
  A0_0:_setGroundOn(false)
  A0_0:initForGimmickMapObj(...)
end
function GimmickMapObjBaseClass.initForGimmickMapObj(A0_3, ...)
end
