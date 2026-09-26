require("/Chara/Npc/Monster/Chocobo/ChocoboBaseClass")
_defineClass("ChocoboCaravanGuard", "ChocoboBaseClass")
function ChocoboCaravanGuard.getBattalion(A0_0)
  local L1_1
  L1_1 = 1
  return L1_1
end
function ChocoboCaravanGuard.initForEvent(A0_2)
  A0_2:_loadTextDataPermanently(7680, "chocoboCaravanGuard")
end
function ChocoboCaravanGuard.chocoboCommand(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10)
  local L8_11, L9_12, L10_13
  L10_13 = worldMaster
  L10_13 = L10_13._getMyPlayer
  L10_13 = L10_13(L10_13)
  A0_3:startCliantTalkTurn(2, L10_13)
  L8_11 = worldMaster:askRestrictChoices(A0_3, A0_3, 1, true, true, A1_4, true)
  if L8_11 == 2 then
    L9_12 = worldMaster:ask(A0_3, A0_3, 6, 4, A2_5, A3_6, A4_7)
  end
  A0_3:finishCliantTalkTurn()
  return L8_11, L9_12
end
