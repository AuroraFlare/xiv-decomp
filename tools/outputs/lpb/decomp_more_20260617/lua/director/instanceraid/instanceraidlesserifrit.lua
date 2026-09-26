require("/Director/InstanceRaid/InstanceRaidBaseClass")
_defineClass("InstanceRaidLesserIfrit", "InstanceRaidBaseClass")
function InstanceRaidLesserIfrit.processStartEvent(A0_0, A1_1, A2_2)
  if A1_1 ~= nil then
    A0_0:executeCutScene("GC010105", A2_2, true, 0, A1_1)
  end
end
