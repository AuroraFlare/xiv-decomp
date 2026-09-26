require("/Chara/Npc/Object/Aetheryte/AetheryteBaseClass")
_defineClass("AetheryteParent", "AetheryteBaseClass")
function AetheryteParent.getLimitedDistanceForTalk(A0_0)
  local L1_1
  L1_1 = 10
  return L1_1
end
function AetheryteParent.initForEventAsAetheryte(A0_2)
  A0_2:_loadTextDataPermanently(303, "aetheryteParent")
end
function AetheryteParent.eventAetheryteParentSelect(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10)
  local L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18
  L8_11 = 1
  L9_12 = {}
  L10_13, L11_14, L12_15, L13_16, L14_17 = nil, nil, nil, nil, nil
  if A3_6 == 0 then
    L10_13 = false
  else
    L10_13 = true
    L9_12[L8_11] = A3_6
    L8_11 = L8_11 + 1
  end
  if A4_7 == 0 then
    L11_14 = false
  else
    L11_14 = true
    L9_12[L8_11] = A4_7
    L8_11 = L8_11 + 1
  end
  if A5_8 == 0 then
    L12_15 = false
  else
    L12_15 = true
    L9_12[L8_11] = A5_8
    L8_11 = L8_11 + 1
  end
  if A6_9 == 0 then
    L13_16 = false
  else
    L13_16 = true
    L9_12[L8_11] = A6_9
    L8_11 = L8_11 + 1
  end
  if A7_10 == 0 then
    L14_17 = false
  else
    L14_17 = true
    L9_12[L8_11] = A7_10
    L8_11 = L8_11 + 1
  end
  L15_18 = nil
  if A1_4 == true then
    L15_18 = worldMaster:askRestrictChoices(A0_3, A0_3, 117, true, true, true, true, true, true)
    if L15_18 == 1 then
      return nil
    elseif L15_18 == 2 then
      if A2_5 == 0 then
        worldMaster:say(worldMaster, 34115, 1, 0)
        return nil
      end
      worldMaster:say(A0_3, 145, 1, A2_5)
      L15_18 = worldMaster:askRestrictChoices(A0_3, A0_3, 7, L10_13, L11_14, L12_15, L13_16, L14_17, true, unpack(L9_12))
      if L15_18 == 6 then
        return nil
      end
      return L15_18
    end
  else
    L15_18 = worldMaster:askRestrictChoices(A0_3, A0_3, 117, true, false, true, true, true, true)
    if L15_18 == 1 then
      return nil
    end
  end
  if L15_18 == 3 then
    return -1
  elseif L15_18 == 4 then
    worldMaster:say(A0_3, 328)
    L15_18 = worldMaster:ask(A0_3, A0_3, 329, 2)
    if L15_18 ~= 1 then
      return nil
    end
    return -2
  elseif L15_18 == 5 then
    return -3
  elseif L15_18 == 6 then
    A0_3:showAetheryteTips()
  end
end
function AetheryteParent.eventAetheryteParentDesion(A0_19, A1_20)
  worldMaster:say(A0_19, 332, A1_20)
end
function AetheryteParent.showAetheryteTips(A0_21)
  local L1_22
  repeat
    repeat
      repeat
        repeat
          repeat
            repeat
              repeat
                repeat
                  while L1_22 ~= 0 do
                    L1_22 = worldMaster:ask(A0_21, A0_21, 166, 9)
                    if L1_22 == 1 or L1_22 == nil then
                      L1_22 = 0
                      break
                    elseif L1_22 == 2 then
                      worldMaster:say(A0_21, 176)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 177, 4)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 182)
                            worldMaster:say(A0_21, 183)
                            worldMaster:say(A0_21, 184)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 185)
                            worldMaster:say(A0_21, 186)
                            worldMaster:say(A0_21, 187)
                          end
                        end
                      until L1_22 == 4
                      worldMaster:say(A0_21, 338)
                      worldMaster:say(A0_21, 339)
                    elseif L1_22 == 3 then
                      worldMaster:say(A0_21, 191)
                      worldMaster:say(A0_21, 192)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 193, 4)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 198)
                            worldMaster:say(A0_21, 326)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 199)
                            worldMaster:say(A0_21, 200)
                          end
                        end
                      until L1_22 == 4
                      worldMaster:say(A0_21, 201)
                      worldMaster:say(A0_21, 202)
                      worldMaster:say(A0_21, 203)
                      worldMaster:say(A0_21, 204)
                    elseif L1_22 == 4 then
                      worldMaster:say(A0_21, 205)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 206, 5)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 212)
                            worldMaster:say(A0_21, 213)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 214)
                            worldMaster:say(A0_21, 215)
                          elseif L1_22 == 4 then
                            worldMaster:say(A0_21, 216)
                            worldMaster:say(A0_21, 217)
                            worldMaster:say(A0_21, 333)
                          end
                        end
                      until L1_22 == 5
                      worldMaster:say(A0_21, 218)
                      worldMaster:say(A0_21, 219)
                      worldMaster:say(A0_21, 327)
                      worldMaster:say(A0_21, 334)
                    elseif L1_22 == 5 then
                      worldMaster:say(A0_21, 220)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 221, 4)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 226)
                            worldMaster:say(A0_21, 227)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 228)
                            worldMaster:say(A0_21, 229)
                          end
                        end
                      until L1_22 == 4
                      worldMaster:say(A0_21, 230)
                    elseif L1_22 == 6 then
                      worldMaster:say(A0_21, 231)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 232, 3)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 236)
                            worldMaster:say(A0_21, 237)
                            worldMaster:say(A0_21, 238)
                          end
                        end
                      until L1_22 == 3
                      worldMaster:say(A0_21, 239)
                      worldMaster:say(A0_21, 240)
                    elseif L1_22 == 7 then
                      worldMaster:say(A0_21, 241)
                      worldMaster:say(A0_21, 325)
                      while true do
                        repeat
                          L1_22 = worldMaster:ask(A0_21, A0_21, 242, 6)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 249)
                            worldMaster:say(A0_21, 250)
                            worldMaster:say(A0_21, 251)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 335, 12, 4, 99)
                            worldMaster:say(A0_21, 336)
                          elseif L1_22 == 4 then
                            worldMaster:say(A0_21, 254)
                            worldMaster:say(A0_21, 255)
                            while true do
                              if L1_22 ~= 0 then
                                L1_22 = worldMaster:ask(A0_21, A0_21, 256, 6)
                              end
                              if L1_22 == 1 or L1_22 == nil then
                                break
                              elseif L1_22 == 2 then
                                worldMaster:say(A0_21, 264)
                                worldMaster:say(A0_21, 265)
                              elseif L1_22 == 3 then
                                worldMaster:say(A0_21, 266)
                                worldMaster:say(A0_21, 267)
                                worldMaster:say(A0_21, 268)
                              elseif L1_22 == 4 then
                                worldMaster:say(A0_21, 269)
                                worldMaster:say(A0_21, 270)
                              elseif L1_22 == 5 then
                                worldMaster:say(A0_21, 271)
                                worldMaster:say(A0_21, 272)
                              elseif L1_22 == 6 then
                                worldMaster:say(A0_21, 273)
                                worldMaster:say(A0_21, 274)
                                worldMaster:say(A0_21, 275)
                              end
                            end
                          elseif L1_22 == 5 then
                            worldMaster:say(A0_21, 278)
                            while true do
                              if L1_22 ~= 0 then
                                L1_22 = worldMaster:ask(A0_21, A0_21, 279, 4)
                              end
                              if L1_22 == 1 or L1_22 == nil then
                                break
                              elseif L1_22 == 2 then
                                worldMaster:say(A0_21, 284)
                                worldMaster:say(A0_21, 285)
                                worldMaster:say(A0_21, 286)
                              elseif L1_22 == 3 then
                                worldMaster:say(A0_21, 287)
                                worldMaster:say(A0_21, 288)
                              elseif L1_22 == 4 then
                                worldMaster:say(A0_21, 289)
                                worldMaster:say(A0_21, 290)
                                worldMaster:say(A0_21, 291)
                              end
                            end
                          else
                            if L1_22 == 6 then
                              worldMaster:say(A0_21, 292)
                              while true do
                                while true do
                                  L1_22 = worldMaster:ask(A0_21, A0_21, 293, 4)
                                  elseif L1_22 == 1 or L1_22 == nil then
                                  end
                                end
                                if L1_22 == 2 then
                                  worldMaster:say(A0_21, 298)
                                  worldMaster:say(A0_21, 299)
                                elseif L1_22 == 3 then
                                  worldMaster:say(A0_21, 300)
                                elseif L1_22 == 4 then
                                  worldMaster:say(A0_21, 301)
                                  worldMaster:say(A0_21, 337)
                                end
                              end
                          end
                        until L1_22 ~= 0
                      end
                    elseif L1_22 == 8 then
                      worldMaster:say(A0_21, 302)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 303, 4)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 308)
                            worldMaster:say(A0_21, 309)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 310)
                            worldMaster:say(A0_21, 311)
                          end
                        end
                      until L1_22 == 4
                      worldMaster:say(A0_21, 312)
                    elseif L1_22 == 9 then
                      worldMaster:say(A0_21, 313)
                      repeat
                        while true do
                          L1_22 = worldMaster:ask(A0_21, A0_21, 314, 5)
                          if L1_22 == 1 or L1_22 == nil then
                            break
                          elseif L1_22 == 2 then
                            worldMaster:say(A0_21, 320)
                          elseif L1_22 == 3 then
                            worldMaster:say(A0_21, 321)
                          elseif L1_22 == 4 then
                            worldMaster:say(A0_21, 322)
                            worldMaster:say(A0_21, 323)
                          end
                        end
                      until L1_22 == 5
                      worldMaster:say(A0_21, 324)
                    end
                  end
                until L1_22 ~= 0
              until L1_22 ~= 0
            until L1_22 ~= 0
          until L1_22 ~= 0
        until L1_22 ~= 0
      until L1_22 ~= 0
    until L1_22 ~= 0
  until L1_22 ~= 0
end
function AetheryteParent.aetheryteTips(A0_23)
  local L1_24
  repeat
    repeat
      repeat
        repeat
          repeat
            while L1_24 ~= 0 do
              L1_24 = worldMaster:ask(A0_23, A0_23, 128, 7)
              if L1_24 == 1 or L1_24 == nil then
                L1_24 = 0
                break
              elseif L1_24 == 2 then
                worldMaster:say(A0_23, 39)
                repeat
                  while true do
                    L1_24 = worldMaster:ask(A0_23, A0_23, 40, 3)
                    if L1_24 == 1 or L1_24 == nil then
                      break
                    elseif L1_24 == 2 then
                      worldMaster:say(A0_23, 44)
                    end
                  end
                until L1_24 == 3
                worldMaster:say(A0_23, 45)
              elseif L1_24 == 3 then
                worldMaster:say(A0_23, 46)
                while true do
                  repeat
                    L1_24 = worldMaster:ask(A0_23, A0_23, 47, 4)
                    if L1_24 == 1 or L1_24 == nil then
                      break
                    elseif L1_24 == 2 then
                      worldMaster:say(A0_23, 52)
                    elseif L1_24 == 3 then
                      worldMaster:say(A0_23, 53)
                      while true do
                        if L1_24 ~= 0 then
                          L1_24 = worldMaster:ask(A0_23, A0_23, 54, 4)
                        end
                        if L1_24 == 1 or L1_24 == nil then
                          break
                        elseif L1_24 == 2 then
                          worldMaster:say(A0_23, 59)
                        elseif L1_24 == 3 then
                          worldMaster:say(A0_23, 60)
                        elseif L1_24 == 4 then
                          worldMaster:say(A0_23, 61)
                        end
                      end
                    else
                      if L1_24 == 4 then
                        worldMaster:say(A0_23, 62)
                        while true do
                          while true do
                            L1_24 = worldMaster:ask(A0_23, A0_23, 63, 3)
                            elseif L1_24 == 1 or L1_24 == nil then
                            end
                          end
                          if L1_24 == 2 then
                            worldMaster:say(A0_23, 67)
                          elseif L1_24 == 3 then
                            worldMaster:say(A0_23, 68)
                          end
                        end
                    end
                  until L1_24 ~= 0
                end
              elseif L1_24 == 4 then
                worldMaster:say(A0_23, 69)
                repeat
                  while true do
                    L1_24 = worldMaster:ask(A0_23, A0_23, 70, 6)
                    if L1_24 == 1 or L1_24 == nil then
                      break
                    elseif L1_24 == 2 then
                      worldMaster:say(A0_23, 77)
                    elseif L1_24 == 3 then
                      worldMaster:say(A0_23, 78)
                    elseif L1_24 == 4 then
                      worldMaster:say(A0_23, 79)
                      worldMaster:say(A0_23, 80)
                    elseif L1_24 == 5 then
                      worldMaster:say(A0_23, 81)
                    end
                  end
                until L1_24 == 6
                worldMaster:say(A0_23, 82)
              elseif L1_24 == 5 then
                worldMaster:say(A0_23, 83)
                repeat
                  while true do
                    L1_24 = worldMaster:ask(A0_23, A0_23, 84, 5)
                    if L1_24 == 1 or L1_24 == nil then
                      break
                    elseif L1_24 == 2 then
                      worldMaster:say(A0_23, 90)
                      worldMaster:say(A0_23, 91)
                    elseif L1_24 == 3 then
                      worldMaster:say(A0_23, 92)
                      worldMaster:say(A0_23, 93, 200)
                    elseif L1_24 == 4 then
                      worldMaster:say(A0_23, 94)
                      while true do
                        if L1_24 ~= 0 then
                          L1_24 = worldMaster:ask(A0_23, A0_23, 95, 6)
                        end
                        if L1_24 == 1 or L1_24 == nil then
                          break
                        elseif L1_24 == 2 then
                          worldMaster:say(A0_23, 102)
                          worldMaster:say(A0_23, 103)
                        elseif L1_24 == 3 then
                          worldMaster:say(A0_23, 104)
                          worldMaster:say(A0_23, 105)
                          worldMaster:say(A0_23, 106, 8)
                        elseif L1_24 == 4 then
                          worldMaster:say(A0_23, 107)
                          worldMaster:say(A0_23, 108)
                        elseif L1_24 == 5 then
                          worldMaster:say(A0_23, 109)
                          worldMaster:say(A0_23, 110)
                        elseif L1_24 == 6 then
                          worldMaster:say(A0_23, 111)
                          worldMaster:say(A0_23, 112)
                        end
                      end
                    end
                  end
                until L1_24 == 5
                worldMaster:say(A0_23, 113)
                worldMaster:say(A0_23, 114)
              elseif L1_24 == 6 then
                worldMaster:say(A0_23, 115)
                worldMaster:say(A0_23, 116)
              elseif L1_24 == 7 then
                worldMaster:say(A0_23, 136)
                repeat
                  while true do
                    L1_24 = worldMaster:askRestrictChoices(A0_23, A0_23, 137, true, true, false, true)
                    if L1_24 == 1 or L1_24 == nil then
                      break
                    elseif L1_24 == 2 then
                      worldMaster:say(A0_23, 142)
                    end
                  end
                until L1_24 == 4
                worldMaster:say(A0_23, 144, 8)
              end
            end
          until L1_24 ~= 0
        until L1_24 ~= 0
      until L1_24 ~= 0
    until L1_24 ~= 0
  until L1_24 ~= 0
end
function AetheryteParent.processGuildleveBoost(A0_25, A1_26, A2_27)
  worldMaster:say(A0_25, 26)
  return (worldMaster:ask(A0_25, A0_25, 27, 2, A2_27, A1_26))
end
function AetheryteParent.processGuildlevePlaying(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34, A7_35, A8_36, A9_37)
  local L10_38, L11_39, L12_40, L13_41, L14_42, L15_43, L16_44
  L10_38 = 0
  L11_39 = 0
  L12_40 = false
  if A7_35 == nil then
    A7_35 = 0
  end
  if A7_35 > 0 then
    L12_40 = true
  end
  L13_41 = false
  if A8_36 > 0 then
    L13_41 = true
  end
  L14_42 = false
  while L10_38 == 0 do
    L15_43 = worldMaster
    L16_44 = L15_43
    L15_43 = L15_43.askRestrictChoices
    L15_43 = L15_43(L16_44, A0_28, A0_28, 146, true, A2_30, L12_40, L13_41, L14_42, true, A1_29, A7_35, A6_34, A8_36)
    L10_38 = L15_43
    if L10_38 == 2 then
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.say
      L15_43(L16_44, A0_28, 153)
      if A9_37 ~= nil and A9_37 ~= 0 then
        L15_43 = worldMaster
        L16_44 = L15_43
        L15_43 = L15_43._getMyPlayer
        L15_43 = L15_43(L16_44)
        L16_44 = worldMaster
        L16_44 = L16_44.say
        L16_44(L16_44, worldMaster, 50039, A9_37, L15_43)
      end
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.ask
      L15_43 = L15_43(L16_44, A0_28, A0_28, 154, 2, A3_31, A4_32, A5_33, A1_29)
      if L15_43 ~= 1 then
        L10_38 = 0
      else
        return L10_38
      end
    elseif L10_38 == 3 then
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.say
      L15_43(L16_44, A0_28, 26)
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.ask
      L15_43 = L15_43(L16_44, A0_28, A0_28, 27, 2, A7_35, A6_34)
      if L15_43 ~= 1 then
        L10_38 = 0
      else
        return L10_38
      end
    elseif L10_38 == 4 then
      if A8_36 == 1 then
        L15_43 = worldMaster
        L16_44 = L15_43
        L15_43 = L15_43.say
        L15_43(L16_44, A0_28, 164)
        L10_38 = 0
      else
        L15_43 = worldMaster
        L16_44 = L15_43
        L15_43 = L15_43.say
        L15_43(L16_44, A0_28, 162)
        L15_43 = desktopWidget
        L16_44 = L15_43
        L15_43 = L15_43.askEventModeWidgetYield
        L16_44 = L15_43(L16_44, "Ask/GuildleveSelectLevelWidget", 1, A8_36 - 1)
        if L15_43 ~= true or L16_44 == -1 then
          L10_38 = 0
        elseif L16_44 ~= nil and L16_44 > 0 and L16_44 < 6 then
          return L10_38, L16_44
        else
          L10_38 = 0
        end
      end
    elseif L10_38 == 6 then
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.say
      L15_43(L16_44, A0_28, 158)
      L15_43 = worldMaster
      L16_44 = L15_43
      L15_43 = L15_43.ask
      L15_43 = L15_43(L16_44, A0_28, A0_28, 159, 2)
      if L15_43 ~= 1 then
        L10_38 = 0
      else
        return L10_38
      end
    end
  end
  return L10_38
end
function AetheryteParent.processGuildleveJoin(A0_45)
  return (worldMaster:ask(A0_45, A0_45, 18, 2))
end
