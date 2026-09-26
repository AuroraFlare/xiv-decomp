require("/Chara/Npc/Populace/Shop/ShopBaseClass")
_defineClass("PopulaceGuildShop", "ShopBaseClass")
function PopulaceGuildShop.initForShop(A0_0)
  A0_0:_loadTextDataPermanently(2208, "populaceGuildShop")
end
function PopulaceGuildShop.cashbackTalkCommand(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8, A8_9, A9_10, A10_11)
  local L11_12
  L11_12 = {
    A1_2,
    A2_3,
    A3_4,
    A4_5,
    A5_6,
    A6_7,
    A7_8,
    A8_9,
    A9_10,
    A10_11
  }
  worldMaster:say(A0_1, 81)
  for _FORV_15_ = 1, 10 do
    if L11_12[_FORV_15_] == nil then
      L11_12[_FORV_15_] = 0
    end
  end
  if _FOR_ == 0 then
    worldMaster:say(A0_1, 82)
  else
    worldMaster:say(A0_1, 84)
    worldMaster:say(A0_1, 85, unpack(L11_12))
  end
end
function PopulaceGuildShop.cashbackTalk(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18, A6_19, A7_20, A8_21, A9_22, A10_23)
  local L11_24
  L11_24 = {
    A3_16,
    A4_17,
    A5_18,
    A6_19,
    A7_20,
    A8_21,
    A9_22,
    A10_23
  }
  for _FORV_15_ = 1, 8 do
    if L11_24[_FORV_15_] == nil then
      L11_24[_FORV_15_] = 0
    end
  end
  if _FOR_ ~= 0 then
    worldMaster:say(A0_13, 86, unpack(L11_24))
  end
  worldMaster:say(A0_13, 87)
  if worldMaster:ask(A0_13, A0_13, 88, 2, A2_15) == 2 then
    return true
  else
    return false
  end
end
function PopulaceGuildShop.selectMode(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30)
  local L6_31, L7_32, L8_33, L9_34, L10_35
  L6_31 = worldMaster
  L7_32 = L6_31
  L6_31 = L6_31._getMyPlayer
  L6_31 = L6_31(L7_32)
  L7_32 = nil
  L9_34 = L6_31
  L8_33 = L6_31.getMoneyOnHand
  L10_35 = A4_29
  L8_33 = L8_33(L9_34, L10_35)
  L9_34 = 1
  repeat
    repeat
      repeat
        while true do
          if L9_34 == 1 or L9_34 == 2 or L9_34 == 3 then
            L10_35 = worldMaster
            L10_35 = L10_35.askRestrictChoices
            L10_35 = L10_35(L10_35, A0_25, A0_25, 2, A3_28, true, true, true)
            L9_34 = L10_35
            if L9_34 == 2 then
              L10_35 = A2_27
              if L10_35 == 1000157 then
                A0_25:say(A0_25, 31, 0)
                A0_25:say(A0_25, 32, 0)
                A0_25:say(A0_25, 33, 0)
                break
              else
              end
              if L10_35 == 1000158 then
                A0_25:say(A0_25, 73, 0)
                A0_25:say(A0_25, 74, 0)
                A0_25:say(A0_25, 75, 0)
                break
              else
              end
              if L10_35 == 1000162 then
                A0_25:say(A0_25, 58, 0)
                A0_25:say(A0_25, 59, 0)
                A0_25:say(A0_25, 60, 0)
                break
              else
              end
              if L10_35 == 1000164 then
                A0_25:say(A0_25, 52, 0)
                A0_25:say(A0_25, 53, 0)
                A0_25:say(A0_25, 54, 0)
                break
              else
              end
              if L10_35 == 1000459 then
                A0_25:say(A0_25, 64, 0)
                A0_25:say(A0_25, 65, 0)
                A0_25:say(A0_25, 66, 0)
                break
              else
              end
              if L10_35 == 1000460 then
                A0_25:say(A0_25, 43, 0)
                A0_25:say(A0_25, 44, 0)
                A0_25:say(A0_25, 45, 0)
                break
              else
              end
              if L10_35 == 1000461 then
                A0_25:say(A0_25, 49, 0)
                A0_25:say(A0_25, 50, 0)
                A0_25:say(A0_25, 51, 0)
                break
              else
              end
              if L10_35 == 1000462 then
                A0_25:say(A0_25, 37, 0)
                A0_25:say(A0_25, 38, 0)
                A0_25:say(A0_25, 39, 0)
                break
              else
              end
              if L10_35 == 1000464 then
                A0_25:say(A0_25, 34, 0)
                A0_25:say(A0_25, 35, 0)
                A0_25:say(A0_25, 36, 0)
                break
              else
              end
              if L10_35 == 1000466 then
                A0_25:say(A0_25, 55, 0)
                A0_25:say(A0_25, 56, 0)
                A0_25:say(A0_25, 57, 0)
                break
              else
              end
              if L10_35 == 1000631 then
                A0_25:say(A0_25, 28, 0)
                A0_25:say(A0_25, 29, 0)
                A0_25:say(A0_25, 30, 0)
                break
              else
              end
              if L10_35 == 1000632 then
                A0_25:say(A0_25, 25, 0)
                A0_25:say(A0_25, 26, 0)
                A0_25:say(A0_25, 27, 0)
                break
              else
              end
              if L10_35 == 1000633 then
                A0_25:say(A0_25, 40, 0)
                A0_25:say(A0_25, 41, 0)
                A0_25:say(A0_25, 42, 0)
                break
              else
              end
              if L10_35 == 1000634 then
                A0_25:say(A0_25, 70, 0)
                A0_25:say(A0_25, 71, 0)
                A0_25:say(A0_25, 72, 0)
                break
              else
              end
              if L10_35 == 1000635 then
                A0_25:say(A0_25, 61, 0)
                A0_25:say(A0_25, 62, 0)
                A0_25:say(A0_25, 63, 0)
                break
              else
              end
              if L10_35 == 1000636 then
                A0_25:say(A0_25, 67, 0)
                A0_25:say(A0_25, 68, 0)
                A0_25:say(A0_25, 69, 0)
                break
              else
              end
              if L10_35 == 1000637 then
                A0_25:say(A0_25, 46, 0)
                A0_25:say(A0_25, 47, 0)
                A0_25:say(A0_25, 48, 0)
                do break end
                break
              end
              if L10_35 == 1001461 then
                A0_25:say(A0_25, 76, 0)
                A0_25:say(A0_25, 77, 0)
                A0_25:say(A0_25, 78, 0)
                break
              end
            end
            if L9_34 == 1 then
              L10_35 = nil
              L10_35 = worldMaster:ask(A0_25, A0_25, 91, 21)
              if L10_35 == 0 then
                L10_35 = nil
              elseif L10_35 == 21 then
                if L8_33 == 0 then
                  worldMaster:say(A0_25, 120, A4_29)
                  L10_35 = nil
                else
                  worldMaster:say(A0_25, 113, A4_29, L8_33, L8_33 * 4)
                  L10_35 = worldMaster:askMultipleTextMacro(A0_25, A0_25, 2, 114, 2, 0, true, true)
                  if L10_35 == 1 then
                    L10_35 = worldMaster:askMultipleTextMacro(A0_25, A0_25, 2, 117, 2, 0, true, true)
                    if L10_35 == 1 then
                      L10_35 = 21
                    else
                      L10_35 = nil
                    end
                  else
                    L10_35 = nil
                  end
                end
              end
              L9_34 = 100 + L10_35
            end
            L10_35 = L6_31.hasItem
            L10_35 = L10_35(L6_31, 1, 3020410, 1)
            if L10_35 == true then
              L10_35 = worldMaster
              L10_35 = L10_35.say
              L10_35(L10_35, A0_25, 121, 3020410, A5_30)
              L10_35 = worldMaster
              L10_35 = L10_35.askMultipleTextMacro
              L10_35 = L10_35(L10_35, A0_25, A0_25, 2, 122, 2, 1, true, true, A5_30, 0, 0)
              return L9_34
            end
            L10_35 = worldMaster
            L10_35 = L10_35.say
            L10_35(L10_35, A0_25, 129, 3020410)
          end
        end
      until L10_35 ~= nil
    until L9_34 == 3
  until L10_35 == 1 and worldMaster:askMultipleTextMacro(A0_25, A0_25, 2, 125, 2, 1, true, true, 3020410, 0, 0) == 1
  L7_32 = L9_34
  L10_35 = L7_32
  return L10_35, L8_33
end
function PopulaceGuildShop.maskShopList(A0_36)
  local L1_37
  return
end
function PopulaceGuildShop.maskShopListIndex(A0_38, A1_39, A2_40)
  if A2_40 == true then
    A2_40 = false
  elseif A2_40 == false then
    A2_40 = true
  end
  desktopWidget:getChildWidgetByWindowName("Ask/ShopBuyWidget"):setItemMask(A1_39, A2_40)
end
function PopulaceGuildShop.guildExplain(A0_41, A1_42, A2_43)
  A0_41:startCliantTalkTurn(2, A2_43)
  if A1_42 == 1000157 then
    A0_41:say(A0_41, 31, 0)
    A0_41:say(A0_41, 32, 0)
    A0_41:say(A0_41, 33, 0)
    break
  else
  end
  if A1_42 == 1000158 then
    A0_41:say(A0_41, 73, 0)
    A0_41:say(A0_41, 74, 0)
    A0_41:say(A0_41, 75, 0)
    break
  else
  end
  if A1_42 == 1000162 then
    A0_41:say(A0_41, 58, 0)
    A0_41:say(A0_41, 59, 0)
    A0_41:say(A0_41, 60, 0)
    break
  else
  end
  if A1_42 == 1000164 then
    A0_41:say(A0_41, 52, 0)
    A0_41:say(A0_41, 53, 0)
    A0_41:say(A0_41, 54, 0)
    break
  else
  end
  if A1_42 == 1000459 then
    A0_41:say(A0_41, 64, 0)
    A0_41:say(A0_41, 65, 0)
    A0_41:say(A0_41, 66, 0)
    break
  else
  end
  if A1_42 == 1000460 then
    A0_41:say(A0_41, 43, 0)
    A0_41:say(A0_41, 44, 0)
    A0_41:say(A0_41, 45, 0)
    break
  else
  end
  if A1_42 == 1000461 then
    A0_41:say(A0_41, 49, 0)
    A0_41:say(A0_41, 50, 0)
    A0_41:say(A0_41, 51, 0)
    break
  else
  end
  if A1_42 == 1000462 then
    A0_41:say(A0_41, 37, 0)
    A0_41:say(A0_41, 38, 0)
    A0_41:say(A0_41, 39, 0)
    break
  else
  end
  if A1_42 == 1000464 then
    A0_41:say(A0_41, 34, 0)
    A0_41:say(A0_41, 35, 0)
    A0_41:say(A0_41, 36, 0)
    break
  else
  end
  if A1_42 == 1000466 then
    A0_41:say(A0_41, 55, 0)
    A0_41:say(A0_41, 56, 0)
    A0_41:say(A0_41, 57, 0)
    break
  else
  end
  if A1_42 == 1000631 then
    A0_41:say(A0_41, 28, 0)
    A0_41:say(A0_41, 29, 0)
    A0_41:say(A0_41, 30, 0)
    break
  else
  end
  if A1_42 == 1000632 then
    A0_41:say(A0_41, 25, 0)
    A0_41:say(A0_41, 26, 0)
    A0_41:say(A0_41, 27, 0)
    break
  else
  end
  if A1_42 == 1000633 then
    A0_41:say(A0_41, 40, 0)
    A0_41:say(A0_41, 41, 0)
    A0_41:say(A0_41, 42, 0)
    break
  else
  end
  if A1_42 == 1000634 then
    A0_41:say(A0_41, 70, 0)
    A0_41:say(A0_41, 71, 0)
    A0_41:say(A0_41, 72, 0)
    break
  else
  end
  if A1_42 == 1000635 then
    A0_41:say(A0_41, 61, 0)
    A0_41:say(A0_41, 62, 0)
    A0_41:say(A0_41, 63, 0)
    break
  else
  end
  if A1_42 == 1000636 then
    A0_41:say(A0_41, 67, 0)
    A0_41:say(A0_41, 68, 0)
    A0_41:say(A0_41, 69, 0)
    break
  else
  end
  if A1_42 == 1000637 then
    A0_41:say(A0_41, 46, 0)
    A0_41:say(A0_41, 47, 0)
    A0_41:say(A0_41, 48, 0)
    break
  else
  end
  if A1_42 == 1001461 then
    A0_41:say(A0_41, 76, 0)
    A0_41:say(A0_41, 77, 0)
    A0_41:say(A0_41, 78, 0)
    break
  else
  end
end
