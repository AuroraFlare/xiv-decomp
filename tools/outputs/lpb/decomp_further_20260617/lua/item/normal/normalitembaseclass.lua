require("/Item/Normal/NormalItemBaseClass_common")
function NormalItemBaseClass._onInit(A0_0)
  A0_0:_callSuperClassFunc("_onInit")
  A0_0:init()
end
function NormalItemBaseClass.updateWork(A0_1)
  if worldMaster:_getMyPlayer():canRequestInformation() then
    A0_1:_updateWork()
    worldMaster:_getMyPlayer():recordRequestInformation()
    return true
  else
    return false
  end
end
function NormalItemBaseClass._onUpdateWork(A0_2)
  desktopWidget:processUpdateItemWork(A0_2)
end
