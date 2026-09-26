require("/Chara/Player/Player_work")
function Player._onInit(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5
  L3_3 = A0_0
  L2_2 = A0_0._callSuperClassFunc
  L4_4 = "_onInit"
  L5_5 = A1_1
  L2_2(L3_3, L4_4, L5_5)
  L3_3 = A0_0
  L2_2 = A0_0.defineWork
  L5_5 = L2_2(L3_3)
  A0_0.work._save = L2_2
  A0_0.work._temp = L3_3
  if A0_0:isMyPlayer() then
    A0_0.work._sync = L4_4
    A0_0:_bindWork(101001, "work", "guildleveId")
  else
    A0_0.work._sync = {}
  end
  for _FORV_10_ = 1, #L2_2(L3_3) do
    _table.insert(L5_5, L2_2(L3_3)[_FORV_10_])
  end
  _FOR_._tag = L5_5
end
function Player.updatePlayerParameters(A0_6, A1_7, A2_8, A3_9)
  if A0_6:canRequestInformation() then
    A0_6:_updateWork("work", A1_7, A2_8, A3_9)
    A0_6:recordRequestInformation()
    return true
  else
    return false
  end
end
