local L0_0, L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_2, A1_3)
  return A0_2.work[A1_3]
end
L0_0.getTempWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_4, A1_5)
  return A0_4.work[A1_5]
end
L0_0.getSaveWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_6, A1_7, A2_8)
  A0_6.work[A1_7] = A2_8
end
L0_0.setTempWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_9, A1_10, A2_11)
  A0_9.work[A1_10] = A2_11
end
L0_0.setSaveWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_12)
  return A0_12.directorWork.contentCommand, A0_12.directorWork.contentCommandSub
end
L0_0.getContentCommandVariation = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_13, A1_14, ...)
  A0_13:_callSuperClassFunc("_onInit")
  A0_13.directorWork._temp = {
    {"directorId", "integer32"},
    {
      "_assignForChild",
      240
    }
  }
  A0_13.directorWork._sync = {
    {
      "contentCommand",
      "integer32"
    },
    {
      "contentCommandSub",
      "integer32"
    },
    {
      "syncBuffer",
      "array",
      128,
      "boolean"
    },
    {
      "_assignForChild",
      64
    }
  }
  A0_13.directorWork._tag = {
    {
      "contentCommand",
      1,
      {
        "contentCommand"
      },
      {
        "contentCommandSub"
      },
      {"syncBuffer"}
    }
  }
  A0_13.directorWork.directorId = A1_14
  A0_13:init(...)
end
L0_0._onInit = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_16, ...)
end
L0_0.init = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_18)
  do break end
  do return end
  A0_18:processUIFinalize()
  A0_18:processFinalize()
  if A0_18.directorWork.contentCommand ~= 0 then
    worldMaster:_getMyPlayer():setContentCommandVariation(nil)
  end
end
L0_0._onFinalize = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_19)
  local L1_20
end
L0_0.processFinalize = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_21, A1_22, A2_23, A3_24)
  local L4_25, L5_26
  L4_25 = A0_21.work
  L5_26 = A2_23 or {}
  L4_25._temp = L5_26
  L4_25 = A0_21.work
  L5_26 = A3_24 or {}
  L4_25._sync = L5_26
end
L0_0.initWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_27, A1_28)
  A0_27.work._tag = A1_28
end
L0_0.initWorkSyncTag = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_29, A1_30)
  return A0_29.work[A1_30]
end
L0_0.getSyncWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_31, A1_32, A2_33)
  if worldMaster:_getMyPlayer():canRequestInformation() then
    A0_31:_updateWork("work", A2_33)
    worldMaster:_getMyPlayer():recordRequestInformation()
    return true
  else
    return false
  end
end
L0_0.updateSyncWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_34, A1_35, A2_36, A3_37, ...)
  local L5_39, L6_40, L7_41, L8_42, L9_43, L10_44
  L6_40 = A2_36
  L5_39 = A2_36._callFunction
  L7_41 = A3_37
  L8_42 = A1_35
  L9_43 = A0_34
  L10_44 = ...
  return L5_39(L6_40, L7_41, L8_42, L9_43, L10_44)
end
L0_0.delegateEvent = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_45, A1_46, A2_47, A3_48)
  desktopWidget:closeAllOwnedContentWidget(A0_45)
  if A2_47 == "noticeEvent" then
    A1_46:_resetFade()
  end
end
L0_0._onEventCancel = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_49, A1_50)
end
L0_0._onNoticeRejected = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_51, A1_52, A2_53, A3_54, A4_55)
  do break end
  do return end
  if A2_53 == "_init" then
    if A0_51.directorWork.contentCommand ~= 0 and worldMaster:_getMyPlayer():getQuestContentsCommandPermitFlag() == true then
      worldMaster:_getMyPlayer():setContentCommandVariation(A0_51.directorWork.contentCommand, A0_51.directorWork.contentCommandSub)
    end
    A0_51:processUIInit()
    A0_51:processUpdateWork(A1_52, A2_53)
  elseif A1_52 == "directorWork" and A2_53 == "contentCommand" then
    if A0_51:getUseContentsCommand() == true then
      worldMaster:_getMyPlayer():setContentCommandVariation(A0_51.directorWork.contentCommand, A0_51.directorWork.contentCommandSub)
    end
  elseif A1_52 ~= "directorWork" and A1_52 ~= "work" then
    A0_51:processUpdateWork(A1_52, A2_53)
  elseif A1_52 == "work" then
    A0_51:processUIUpdate(A2_53)
  end
end
L0_0._onUpdateWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_56, A1_57, A2_58)
end
L0_0.processUpdateWork = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_59)
  local L1_60
end
L0_0.processUIInit = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_61, A1_62)
end
L0_0.processUIUpdate = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_63)
  local L1_64
end
L0_0.processUIFinalize = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_65)
  local L1_66
end
L0_0.processMapOpenMessage = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_67)
  local L1_68
end
L0_0.getKindContentsInformation = L1_1
L0_0 = DirectorBaseClass
function L1_1(A0_69)
  local L1_70
  L1_70 = true
  return L1_70
end
L0_0.getUseContentsCommand = L1_1
