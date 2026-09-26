require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCampSubMaster", "NpcBaseClass")
function PopulaceCampSubMaster.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(1330, "populaceCampSubMaster")
end
function PopulaceCampSubMaster.talkWelcome(A0_3, A1_4, A2_5, A3_6)
  local L4_7, L5_8
  L5_8 = A0_3
  L4_7 = A0_3.startCliantTalkTurn
  L4_7(L5_8, 2, A1_4)
  L5_8 = A0_3
  L4_7 = A0_3.getActorClassId
  L4_7 = L4_7(L5_8)
  L5_8 = L4_7
  if L5_8 == 1000613 then
    A0_3:say(A0_3, 1, 0)
    break
  else
  end
  if L5_8 == 1000614 then
    if A2_5 == 20 then
      A0_3:say(A0_3, 51, 0)
    else
      A0_3:say(A0_3, 2, 0)
      do break end
      else
      end
      if L5_8 == 1000615 then
        A0_3:say(A0_3, 3, 0)
        break
      else
      end
      if L5_8 == 1000616 then
        A0_3:say(A0_3, 4, 0)
        break
      else
      end
      if L5_8 == 1000617 then
        A0_3:say(A0_3, 5, 0)
        break
      else
      end
      if L5_8 == 1500094 then
        if A2_5 == 20 then
          A0_3:say(A0_3, 55, 0)
        else
          A0_3:say(A0_3, 11, 0)
          do break end
          else
          end
          if L5_8 == 1500095 then
            A0_3:say(A0_3, 12, 0)
            break
          else
          end
          if L5_8 == 1500096 then
            A0_3:say(A0_3, 13, 0)
            break
          else
          end
          if L5_8 == 1500097 then
            A0_3:say(A0_3, 14, 0)
            break
          else
          end
          if L5_8 == 1500098 then
            A0_3:say(A0_3, 15, 0)
            break
          else
          end
          if L5_8 == 1500099 then
            if A3_6 == true then
              A0_3:say(A0_3, 52, 0)
            else
              A0_3:say(A0_3, 6, 0)
              do break end
              else
              end
              if L5_8 == 1500100 then
                A0_3:say(A0_3, 7, 0)
                break
              else
              end
              if L5_8 == 1500101 then
                if A3_6 == true then
                  A0_3:say(A0_3, 53, 0)
                else
                  A0_3:say(A0_3, 8, 0)
                  do break end
                  else
                  end
                  if L5_8 == 1500102 then
                    if A2_5 ~= 20 then
                      A0_3:say(A0_3, 54, 0)
                    else
                      A0_3:say(A0_3, 9, 0)
                      do break end
                      else
                      end
                      if L5_8 == 1500103 then
                        A0_3:say(A0_3, 10, 0)
                        break
                      else
                      end
                      if L5_8 == 1500104 then
                        if A3_6 == true then
                          A0_3:say(A0_3, 56, 0)
                        else
                          A0_3:say(A0_3, 16, 0)
                          do break end
                          else
                          end
                          if L5_8 == 1500105 then
                            A0_3:say(A0_3, 17, 0)
                            break
                          else
                          end
                          if L5_8 == 1500106 then
                            A0_3:say(A0_3, 57, 0)
                            break
                          else
                          end
                          if L5_8 == 1500107 then
                            if A2_5 ~= 20 then
                              A0_3:say(A0_3, 58, 0)
                            else
                              A0_3:say(A0_3, 19, 0)
                              do break end
                              else
                              end
                              if L5_8 == 1500108 then
                                if A2_5 == 20 then
                                  A0_3:say(A0_3, 59, 0)
                                else
                                  A0_3:say(A0_3, 20, 0)
                                  do break end
                                  else
                                  end
                                  if L5_8 == 1500123 then
                                    if A2_5 ~= 20 then
                                      A0_3:say(A0_3, 60, 0)
                                    else
                                      A0_3:say(A0_3, 21, 0)
                                      do break end
                                      else
                                      end
                                      if L5_8 == 1500124 then
                                        if A2_5 ~= 20 then
                                          A0_3:say(A0_3, 61, 0)
                                        else
                                          A0_3:say(A0_3, 22, 0)
                                          do break end
                                          break
                                        end
                                      else
                                      end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
  L5_8 = A0_3.askExtendWidget
  L5_8 = L5_8(A0_3, A0_3, 23, 2, 1, 1)
  if L5_8 == 1 then
    if L4_7 == 1000613 then
      A0_3:say(A0_3, 29, 0)
      break
    else
    end
    if L4_7 == 1000614 then
      A0_3:say(A0_3, 30, 0)
      break
    else
    end
    if L4_7 == 1000615 then
      A0_3:say(A0_3, 31, 0)
      break
    else
    end
    if L4_7 == 1000616 then
      A0_3:say(A0_3, 32, 0)
      break
    else
    end
    if L4_7 == 1000617 then
      A0_3:say(A0_3, 33, 0)
      break
    else
    end
    if L4_7 == 1500094 then
      A0_3:say(A0_3, 39, 0)
      break
    else
    end
    if L4_7 == 1500095 then
      A0_3:say(A0_3, 40, 0)
      break
    else
    end
    if L4_7 == 1500096 then
      A0_3:say(A0_3, 41, 0)
      break
    else
    end
    if L4_7 == 1500097 then
      A0_3:say(A0_3, 42, 0)
      break
    else
    end
    if L4_7 == 1500098 then
      A0_3:say(A0_3, 43, 0)
      break
    else
    end
    if L4_7 == 1500099 then
      A0_3:say(A0_3, 34, 0)
      break
    else
    end
    if L4_7 == 1500100 then
      A0_3:say(A0_3, 35, 0)
      break
    else
    end
    if L4_7 == 1500101 then
      A0_3:say(A0_3, 36, 0)
      break
    else
    end
    if L4_7 == 1500102 then
      A0_3:say(A0_3, 37, 0)
      break
    else
    end
    if L4_7 == 1500103 then
      A0_3:say(A0_3, 38, 0)
      break
    else
    end
    if L4_7 == 1500104 then
      A0_3:say(A0_3, 44, 0)
      break
    else
    end
    if L4_7 == 1500105 then
      A0_3:say(A0_3, 45, 0)
      break
    else
    end
    if L4_7 == 1500106 then
      A0_3:say(A0_3, 46, 0)
      break
    else
    end
    if L4_7 == 1500107 then
      A0_3:say(A0_3, 47, 0)
      break
    else
    end
    if L4_7 == 1500108 then
      A0_3:say(A0_3, 48, 0)
      break
    else
    end
    if L4_7 == 1500123 then
      A0_3:say(A0_3, 49, 0)
      break
    else
    end
    if L4_7 == 1500124 then
      A0_3:say(A0_3, 50, 0)
      do break end
      break
    else
    end
    return L5_8
  else
    return nil
  end
end
function PopulaceCampSubMaster.confirmUseFacility(A0_9, A1_10, A2_11)
  local L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18
  L5_13 = A0_9
  L4_12 = A0_9.askExtendWidget
  L6_14 = A0_9
  L7_15 = 26
  L8_16 = 2
  L9_17 = 1
  L10_18 = 1
  L4_12 = L4_12(L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, A2_11, A1_10:getMoneyOnHand())
  if L4_12 == 1 then
    L5_13 = true
    return L5_13
  end
  L5_13 = false
  return L5_13
end
function PopulaceCampSubMaster.finishTalkTurn(A0_19)
  A0_19:finishCliantTalkTurn()
end
