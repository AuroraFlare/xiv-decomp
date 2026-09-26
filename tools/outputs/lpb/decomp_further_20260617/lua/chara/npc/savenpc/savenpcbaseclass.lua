require("/Chara/Npc/NpcBaseClass")
_defineBaseClass("SaveNpcBaseClass", "NpcBaseClass")
function SaveNpcBaseClass.getSaveNpcId(A0_0)
  local L1_1
  L1_1 = 1
  return L1_1
end
function SaveNpcBaseClass.initForEvent(A0_2, ...)
  A0_2.saveNpcWork._temp = {
    {
      "savenpcdummy",
      "integer32"
    },
    {
      "_assignForChild",
      60
    }
  }
end
function SaveNpcBaseClass.processReceiveData(A0_4, A1_5, ...)
  local L3_7
  L3_7 = SaveNpc_SEND_DATA_PACKET_CATEGORY_TYPE
  if A1_5 == L3_7 then
  else
    L3_7 = SaveNpc_SEND_DATA_PACKET_FIGURE_TYPE
    if A1_5 == L3_7 then
    end
  end
end
