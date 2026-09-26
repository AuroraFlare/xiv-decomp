require("/Command/System/SystemCommandBaseClass")
_defineClass("WidgetOpenCommand", "SystemCommandBaseClass")
function WidgetOpenCommand.command(A0_0, A1_1, A2_2, ...)
  require("/Widget/" .. A2_2)
  return true
end
