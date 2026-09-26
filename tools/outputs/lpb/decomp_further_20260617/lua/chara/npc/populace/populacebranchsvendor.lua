require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceBranchsVendor", "NpcBaseClass")
function PopulaceBranchsVendor.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 10276, "populaceBranchsVendor")
  L1_1 = {
    {"townNumber", "integer8"},
    {"tribe", "integer8"}
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500391 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500426 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 13
    break
  else
  end
  if A0_0:getActorClassId() == 1500410 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 8
    break
  else
  end
  if A0_0:getActorClassId() == 1500408 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 5
    break
  else
  end
  if A0_0:getActorClassId() == 1500424 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 12
    break
  else
  end
  if A0_0:getActorClassId() == 1500420 then
    A0_0.work.townNumber = 1
    A0_0.work.tribe = 14
    break
  else
  end
  if A0_0:getActorClassId() == 1500399 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 4
    break
  else
  end
  if A0_0:getActorClassId() == 1500427 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 14
    break
  else
  end
  if A0_0:getActorClassId() == 1500395 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500402 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 5
    break
  else
  end
  if A0_0:getActorClassId() == 1500398 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 4
    break
  else
  end
  if A0_0:getActorClassId() == 1500403 then
    A0_0.work.townNumber = 2
    A0_0.work.tribe = 5
    break
  else
  end
  if A0_0:getActorClassId() == 1500412 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 8
    break
  else
  end
  if A0_0:getActorClassId() == 1500415 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 10
    break
  else
  end
  if A0_0:getActorClassId() == 1500406 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 7
    break
  else
  end
  if A0_0:getActorClassId() == 1500416 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 9
    break
  else
  end
  if A0_0:getActorClassId() == 1500397 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1500417 then
    A0_0.work.townNumber = 3
    A0_0.work.tribe = 11
    do break end
    break
  else
  end
  A0_0:_setGroundOn(false)
end
function PopulaceBranchsVendor._onFinalize(A0_2)
  A0_2:_callSuperClassFunc("_onFinalize")
end
function PopulaceBranchsVendor.eventTalkWelcome(A0_3, A1_4)
  local L2_5
  L2_5 = 2
  if A0_3.work.tribe == 1 then
  else
  end
  if A0_3.work.tribe == 3 then
    if A0_3.work.townNumber == 1 then
      L2_5 = 2
    elseif A0_3.work.townNumber == 2 then
      L2_5 = 3
    else
      if A0_3.work.townNumber == 3 then
        L2_5 = 4
        do break end
        else
        end
        if A0_3.work.tribe == 2 then
          if A0_3.work.townNumber == 1 then
            L2_5 = 5
          elseif A0_3.work.townNumber == 2 then
            L2_5 = 6
          else
            if A0_3.work.townNumber == 3 then
              L2_5 = 7
              do break end
              elseif A0_3.work.tribe == 4 then
              else
              end
              if A0_3.work.tribe == 6 then
                if A0_3.work.townNumber == 1 then
                  L2_5 = 8
                elseif A0_3.work.townNumber == 2 then
                  L2_5 = 9
                else
                  if A0_3.work.townNumber == 3 then
                    L2_5 = 10
                    do break end
                    elseif A0_3.work.tribe == 5 then
                    else
                    end
                    if A0_3.work.tribe == 7 then
                      if A0_3.work.townNumber == 1 then
                        L2_5 = 11
                      elseif A0_3.work.townNumber == 2 then
                        L2_5 = 12
                      else
                        if A0_3.work.townNumber == 3 then
                          L2_5 = 13
                          do break end
                          elseif A0_3.work.tribe == 8 then
                          else
                          end
                          if A0_3.work.tribe == 10 then
                            if A0_3.work.townNumber == 1 then
                              L2_5 = 14
                            elseif A0_3.work.townNumber == 2 then
                              L2_5 = 15
                            else
                              if A0_3.work.townNumber == 3 then
                                L2_5 = 16
                                do break end
                                elseif A0_3.work.tribe == 9 then
                                else
                                end
                                if A0_3.work.tribe == 11 then
                                  if A0_3.work.townNumber == 1 then
                                    L2_5 = 17
                                  elseif A0_3.work.townNumber == 2 then
                                    L2_5 = 18
                                  else
                                    if A0_3.work.townNumber == 3 then
                                      L2_5 = 19
                                      do break end
                                      elseif A0_3.work.tribe == 12 then
                                      else
                                      end
                                      if A0_3.work.tribe == 13 then
                                        if A0_3.work.townNumber == 1 then
                                          L2_5 = 23
                                        elseif A0_3.work.townNumber == 2 then
                                          L2_5 = 24
                                        else
                                          if A0_3.work.townNumber == 3 then
                                            L2_5 = 25
                                            do break end
                                            elseif A0_3.work.tribe == 14 then
                                            else
                                            end
                                            if A0_3.work.tribe == 15 then
                                              if A0_3.work.townNumber == 1 then
                                                L2_5 = 20
                                              elseif A0_3.work.townNumber == 2 then
                                                L2_5 = 21
                                              else
                                                if A0_3.work.townNumber == 3 then
                                                  L2_5 = 22
                                                else
                                                end
                                              end
                                            else
                                            end
                                          else
                                          end
                                        end
                                    else
                                    end
                                  end
                              else
                              end
                            end
                        else
                        end
                      end
                  else
                  end
                end
            else
            end
          end
      else
      end
    end
  A0_3:startCliantTalkTurn(2, A1_4)
  A0_3:say(A0_3, L2_5, 0)
end
function PopulaceBranchsVendor.eventSearchItemAsk(A0_6, A1_7, A2_8)
  local L3_9, L4_10
  L3_9 = false
  if A2_8 > 0 then
    L3_9 = true
  end
  L4_10 = worldMaster
  L4_10 = L4_10.askMultipleTextMacro
  L4_10 = L4_10(L4_10, A0_6, A0_6, 1, 26, 3, 1, true, L3_9, true, 0, A2_8, 0)
  if type(L4_10) ~= "number" then
    L4_10 = -1
  end
  if L4_10 == 1 then
    desktopWidget:askItemSearchWidget()
    L4_10 = 0
  elseif L4_10 == 2 then
    L4_10 = A2_8
  else
    L4_10 = -1
  end
  return L4_10
end
function PopulaceBranchsVendor.eventTalkStepBreak(A0_11)
  A0_11:finishCliantTalkTurn()
  return 0
end
