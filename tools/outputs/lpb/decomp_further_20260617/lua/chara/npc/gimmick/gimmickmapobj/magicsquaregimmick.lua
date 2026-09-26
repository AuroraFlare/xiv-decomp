require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("MagicSquareGimmick", "GimmickNpcBaseClass")
function MagicSquareGimmick.initForGimmick(A0_0, A1_1)
  if A1_1 ~= "" then
    A0_0:_runBgSchedulerFromMidstream(A1_1, 5)
  end
  A0_0:_setGroundOn(false)
end
