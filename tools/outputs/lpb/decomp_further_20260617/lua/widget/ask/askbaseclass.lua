require("/Widget/WidgetBaseClass")
_defineBaseClass("AskBaseClass", "WidgetBaseClass")
function AskBaseClass.init(A0_0, ...)
  A0_0.askWork._temp = {
    {"askResult", "integer16"},
    {
      "inputControlFlag",
      "boolean"
    },
    {
      "_assignForChild",
      128
    }
  }
  A0_0.askWork.askResult = 0
  A0_0.askWork.inputControlFlag = true
  A0_0:setModal(true)
  A0_0:initAsk(...)
end
function AskBaseClass.processWaitCallFunction(A0_2)
  return A0_2:isAskFinish()
end
function AskBaseClass.initAsk(A0_3, ...)
end
function AskBaseClass.setAskParameter(A0_5, ...)
end
function AskBaseClass.updateAskParameter(A0_7, ...)
end
function AskBaseClass.getAskResult(A0_9)
  return A0_9:getBaseAskResult()
end
function AskBaseClass.setInputContorlFlag(A0_10, A1_11)
  A0_10.askWork.inputControlFlag = A1_11
end
function AskBaseClass.setBaseAskResult(A0_12, A1_13)
  if A0_12.askWork.inputControlFlag == true then
    A0_12:setInputEnable(false)
  end
  A0_12.askWork.askResult = A1_13
end
function AskBaseClass.resetBaseAskResult(A0_14)
  if A0_14.askWork.inputControlFlag == true then
    A0_14:setInputEnable(true)
  end
  A0_14.askWork.askResult = 0
end
function AskBaseClass.getBaseAskResult(A0_15)
  return A0_15.askWork.askResult
end
function AskBaseClass.isAskFinish(A0_16)
  local L1_17
  L1_17 = A0_16.askWork
  L1_17 = L1_17.askResult
  if L1_17 == 0 then
    L1_17 = false
    return L1_17
  end
  L1_17 = true
  return L1_17
end
