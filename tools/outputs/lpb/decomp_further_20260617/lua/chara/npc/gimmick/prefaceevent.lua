require("/Chara/Npc/NpcBaseClass")
_defineClass("PrefaceEvent", "NpcBaseClass")
function PrefaceEvent._onInit(A0_0)
  A0_0:_setVisible(false)
  A0_0:_setGroundOn(false)
end
function PrefaceEvent.processEvent(A0_1, A1_2, ...)
  local L3_4, L4_5, L5_6, L6_7
  L4_5 = A1_2
  L3_4 = A1_2.processEvent
  L5_6 = A0_1
  L6_7 = ...
  L3_4(L4_5, L5_6, L6_7)
end
