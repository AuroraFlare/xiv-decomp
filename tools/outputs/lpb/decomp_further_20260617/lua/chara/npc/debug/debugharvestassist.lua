require("/Chara/Npc/NpcBaseClass")
_defineClass("DebugHarvestAssist", "NpcBaseClass")
function DebugHarvestAssist.initForEvent(A0_0)
  local L1_1
end
function DebugHarvestAssist.select(A0_2, A1_3)
  return (debug:_ask("\232\130\178\230\136\144", "\239\188\145", "\239\188\146", "\239\188\147", "\239\188\148", "\239\188\149", "\228\187\138\227\129\175\227\130\132\227\130\129\227\129\166\227\129\138\227\129\143"))
end
