require("/Widget/WidgetBaseClass")
_defineClass("SplashEffectWidget", "WidgetBaseClass")
function SplashEffectWidget.init(A0_0, A1_1)
  if A1_1 ~= nil then
    desktopWidget:executeEffect(A1_1)
  end
  A0_0:setUICommandCondition("UILuaCommands.AnimationCompleted")
  A0_0:sendCommand("Animation.Start")
end
function SplashEffectWidget.processUICommandEvent(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7)
  if A3_5 == "UILuaCommands.AnimationCompleted" then
    desktopWidget:closeWidgetDirect(A0_2)
  end
end
function SplashEffectWidget.finish(A0_8)
  A0_8:sendCommand("Fadeout.Start")
end
