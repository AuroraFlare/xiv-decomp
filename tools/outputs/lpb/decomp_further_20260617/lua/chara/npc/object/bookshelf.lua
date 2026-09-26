require("/Chara/Npc/NpcBaseClass")
_defineClass("BookShelf", "NpcBaseClass")
function BookShelf.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(2733, "bookShelf")
  A0_0:_setGroundOn(false)
end
function BookShelf.bookTalk(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L2_3 = worldMaster
  L3_4 = L2_3
  L2_3 = L2_3.say
  L4_5 = A0_1
  L5_6 = 1
  L2_3(L3_4, L4_5, L5_6)
  while true do
    L2_3 = worldMaster
    L3_4 = L2_3
    L2_3 = L2_3.askRestrictChoices
    L4_5 = A0_1
    L5_6 = A0_1
    L6_7 = 2
    L7_8 = true
    L8_9 = true
    L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, false, true)
    if L2_3 == nil or L2_3 == 4 then
      return
    elseif L2_3 == 1 then
      L3_4 = worldMaster
      L4_5 = L3_4
      L3_4 = L3_4.say
      L5_6 = A0_1
      L6_7 = 7
      L3_4(L4_5, L5_6, L6_7)
      while true do
        L3_4 = worldMaster
        L4_5 = L3_4
        L3_4 = L3_4.ask
        L5_6 = A0_1
        L6_7 = A0_1
        L7_8 = 8
        L8_9 = 7
        L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8, L8_9)
        if L3_4 == nil or L3_4 == 7 then
          break
        elseif L3_4 == 1 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 16
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 78
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 2 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 17
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 3 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 18
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 79
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 4 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 19
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 20
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 80
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 21
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 5 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 22
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 23
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 6 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 24
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 81
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 25
          L4_5(L5_6, L6_7, L7_8)
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 26
          L4_5(L5_6, L6_7, L7_8)
        end
      end
    elseif L2_3 == 2 then
      L3_4 = worldMaster
      L4_5 = L3_4
      L3_4 = L3_4.say
      L5_6 = A0_1
      L6_7 = 27
      L3_4(L4_5, L5_6, L6_7)
      while true do
        L3_4 = worldMaster
        L4_5 = L3_4
        L3_4 = L3_4.ask
        L5_6 = A0_1
        L6_7 = A0_1
        L7_8 = 28
        L8_9 = 5
        L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8, L8_9)
        if L3_4 == nil or L3_4 == 5 then
          break
        elseif L3_4 == 1 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 34
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 2 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 35
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 3 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 36
          L4_5(L5_6, L6_7, L7_8)
        elseif L3_4 == 4 then
          L4_5 = worldMaster
          L5_6 = L4_5
          L4_5 = L4_5.say
          L6_7 = A0_1
          L7_8 = 37
          L4_5(L5_6, L6_7, L7_8)
        end
      end
    elseif L2_3 == 3 then
      L3_4 = worldMaster
      L4_5 = L3_4
      L3_4 = L3_4.say
      L5_6 = A0_1
      L6_7 = 38
      L3_4(L4_5, L5_6, L6_7)
      L4_5 = A1_2
      L3_4 = A1_2._canGetTrophy
      L3_4 = L3_4(L4_5)
      L4_5 = worldMaster
      L5_6 = L4_5
      L4_5 = L4_5.say
      L6_7 = A0_1
      L7_8 = 39
      L4_5(L5_6, L6_7, L7_8)
      while true do
        L4_5 = worldMaster
        L5_6 = L4_5
        L4_5 = L4_5.ask
        L6_7 = A0_1
        L7_8 = A0_1
        L8_9 = 40
        L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, 4)
        if L4_5 == nil or L4_5 == 4 then
          break
        elseif L4_5 == 1 or L4_5 == 2 or L4_5 == 3 then
          L5_6, L6_7, L7_8 = nil, nil, nil
          if L4_5 == 1 then
            L5_6 = 9
            L6_7 = 25
            L7_8 = 46
          elseif L4_5 == 2 then
            L5_6 = 9
            L6_7 = 16
            L7_8 = 57
          elseif L4_5 == 3 then
            L5_6 = 7
            L6_7 = 7
            L7_8 = 68
          end
          L8_9 = {}
          for _FORV_13_ = 1, L5_6 do
            if A1_2:_isAchievedTrophy(L6_7 + 1 - _FORV_13_) then
              L8_9[_FORV_13_] = false
            else
              L8_9[_FORV_13_] = true
            end
          end
          L8_9[_FOR_] = true
          if true == true then
            if worldMaster:askRestrictChoices(A0_1, A0_1, L7_8, unpack(L8_9)) ~= nil and worldMaster:askRestrictChoices(A0_1, A0_1, L7_8, unpack(L8_9)) ~= L5_6 + 1 then
              A1_2:_achieveTrophy(L6_7 + 1 - worldMaster:askRestrictChoices(A0_1, A0_1, L7_8, unpack(L8_9)))
              worldMaster:say(A0_1, 77)
            end
          else
            worldMaster:say(A0_1, 45)
          end
        end
      end
    end
  end
end
