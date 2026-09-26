require("/GameData/CutScene_common")
function CutScene._onInit(A0_0, A1_1, A2_2)
  local L3_3
  L3_3 = A0_0._callSuperClassFunc
  L3_3(A0_0, "_onInit")
  L3_3 = A0_0.work
  L3_3._temp = {
    {"textOwner", "actor"},
    {
      "isPreviewTextOwner",
      "boolean"
    },
    {
      "actorclassSheet",
      "actor"
    }
  }
  L3_3 = A0_0._setFilename
  L3_3(A0_0, A1_1)
  L3_3 = "actorclass"
  A0_0.work.actorclassSheet = _createActor(nil, "SpreadSheet", false, L3_3)
  A0_0.work.textOwner = A2_2
  A0_0.work.isPreviewTextOwner = false
end
function CutScene._onFinalize(A0_4)
  A0_4.work.actorclassSheet:_delete()
  A0_4.work.textOwner = nil
  A0_4.work.actorclassSheet = nil
end
