require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("GimmickTerminal", "GimmickNpcBaseClass")
function GimmickTerminal.initForGimmick(A0_0, ...)
  A0_0:_loadTextDataPermanently(10096, "gimmickTerminal")
end
function GimmickTerminal.eventTalkTerminal(A0_2, A1_3)
  worldMaster:say(A0_2, A1_3)
end
