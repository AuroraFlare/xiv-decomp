require("/Chara/Npc/NpcBaseClass")
_defineClass("MateriaBook", "NpcBaseClass")
function MateriaBook.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(7592, "materiaBook")
  A0_0:_setGroundOn(false)
end
function MateriaBook.materiabookTalk(A0_1, A1_2, A2_3, A3_4)
  if A2_3 == 1 then
    worldMaster:say(A0_1, 1, 0)
    while true do
      if worldMaster:askRestrictChoices(A0_1, A0_1, 2, true, true, true, true) == nil or worldMaster:askRestrictChoices(A0_1, A0_1, 2, true, true, true, true) == 4 then
        return
      elseif worldMaster:askRestrictChoices(A0_1, A0_1, 2, true, true, true, true) == 1 then
        worldMaster:say(A0_1, 8)
        while true do
          if worldMaster:ask(A0_1, A0_1, 9, 7) == nil or worldMaster:ask(A0_1, A0_1, 9, 7) == 7 then
            break
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 1 then
            worldMaster:say(A0_1, 17)
            worldMaster:say(A0_1, 53)
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 2 then
            worldMaster:say(A0_1, 18)
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 3 then
            worldMaster:say(A0_1, 19)
            worldMaster:say(A0_1, 20)
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 4 then
            worldMaster:say(A0_1, 21)
            worldMaster:say(A0_1, 22)
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 5 then
            worldMaster:say(A0_1, 23)
          elseif worldMaster:ask(A0_1, A0_1, 9, 7) == 6 then
            worldMaster:say(A0_1, 24)
          end
        end
      elseif worldMaster:askRestrictChoices(A0_1, A0_1, 2, true, true, true, true) == 2 then
        worldMaster:say(A0_1, 25)
        while true do
          if worldMaster:ask(A0_1, A0_1, 26, 3) == nil or worldMaster:ask(A0_1, A0_1, 26, 3) == 3 then
            break
          elseif worldMaster:ask(A0_1, A0_1, 26, 3) == 1 then
            worldMaster:say(A0_1, 30)
            worldMaster:say(A0_1, 31)
          elseif worldMaster:ask(A0_1, A0_1, 26, 3) == 2 then
            worldMaster:say(A0_1, 32)
          end
        end
      elseif worldMaster:askRestrictChoices(A0_1, A0_1, 2, true, true, true, true) == 3 then
        worldMaster:say(A0_1, 33)
        while true do
          if worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == nil or worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == 5 then
            break
          elseif worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == 1 then
            worldMaster:say(A0_1, 40)
            worldMaster:say(A0_1, 41)
          elseif worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == 2 then
            worldMaster:say(A0_1, 42)
            worldMaster:say(A0_1, 43)
            worldMaster:say(A0_1, 44)
            worldMaster:say(A0_1, 45)
            worldMaster:say(A0_1, 46)
          elseif worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == 3 then
            worldMaster:say(A0_1, 47)
            worldMaster:say(A0_1, 48)
            worldMaster:say(A0_1, 49)
          elseif worldMaster:askRestrictChoices(A0_1, A0_1, 34, true, true, A3_4, true, true) == 4 then
            worldMaster:say(A0_1, 51)
            worldMaster:say(A0_1, 52)
          end
        end
      end
    end
  else
    worldMaster:say(A0_1, 7, 0)
  end
end
