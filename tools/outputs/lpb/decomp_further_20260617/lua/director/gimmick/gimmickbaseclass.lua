require("/Director/DirectorBaseClass")
_defineBaseClass("GimmickBaseClass", "DirectorBaseClass")
function GimmickBaseClass.init(A0_0, ...)
  A0_0:_callSuperClassFunc("init")
  A0_0.gimmickWork._temp = {
    {
      "_assignForChild",
      24
    }
  }
end
