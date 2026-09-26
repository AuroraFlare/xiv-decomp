require("/Director/DirectorBaseClass")
_defineBaseClass("QuestDirectorBaseClass", "DirectorBaseClass")
function QuestDirectorBaseClass.init(A0_0, ...)
  A0_0.questDirectorWork._temp = {
    {
      "_assignForChild",
      16
    }
  }
  A0_0.questDirectorWork._sync = {
    {
      "_assignForChild",
      32
    }
  }
  if A0_0:getOwnClientQuestId() ~= nil then
  end
  A0_0:initAsQuestDirector(...)
end
function QuestDirectorBaseClass.initAsQuestDirector(A0_2, ...)
end
function QuestDirectorBaseClass.getUseContentsCommand(A0_4)
  return (worldMaster:_getMyPlayer():getQuestContentsCommandPermitFlag())
end
function QuestDirectorBaseClass.getOwnClientQuestId(A0_5)
  local L1_6
end
function QuestDirectorBaseClass.processFinalize(A0_7)
  if A0_7:getOwnClientQuestId() ~= nil then
  end
  if nil ~= nil then
  end
end
