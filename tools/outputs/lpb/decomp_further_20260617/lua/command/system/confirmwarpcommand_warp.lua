require("/Command/System/SystemCommandBaseClass")
_defineClass("ConfirmWarpCommand", "SystemCommandBaseClass")
function ConfirmWarpCommand.canFireDetail(A0_0, A1_1, A2_2)
  if A1_1:isActiveMode() then
    return false
  end
  if A1_1:_getActorMainStat() ~= 0 then
    return false
  end
  return true
end
