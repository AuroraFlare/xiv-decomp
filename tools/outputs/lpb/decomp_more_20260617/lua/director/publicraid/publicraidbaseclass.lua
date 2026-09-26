require("/Director/DirectorBaseClass")
_defineBaseClass("PublicRaidBaseClass", "DirectorBaseClass")
function PublicRaidBaseClass.init(A0_0, ...)
  A0_0:_callSuperClassFunc("init")
  A0_0.instanceRaidWork._temp = {
    {
      "_assignForChild",
      24
    }
  }
end
