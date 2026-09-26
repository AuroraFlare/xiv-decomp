require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceMonsterGrandma", "NpcBaseClass")
function PopulaceMonsterGrandma.askMonsterRace(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
  L1_1 = {}
  L2_2 = {}
  L3_3 = 1
  L4_4 = debug
  L5_5 = L4_4
  L4_4 = L4_4.prepareSpreadSheet
  L4_4 = L4_4(L5_5, L6_6)
  L5_5 = L4_4._getAllKey
  L5_5 = L5_5(L6_6)
  for L9_9 = 1, #L5_5, 2 do
    for L13_13 = 1, L5_5[L11_11] do
      L14_14 = L5_5[L9_9]
      L14_14 = L14_14 + L13_13
      L14_14 = L14_14 - 1
      if A0_0:getMonsterRaceName(L14_14) ~= nil then
        L1_1[L3_3] = A0_0:getMonsterRaceName(L14_14)
        L2_2[L3_3] = L14_14
        L3_3 = L3_3 + 1
      end
    end
  end
  L6_6(L7_7)
  L9_9 = "\229\133\168\233\131\168\227\129\139\227\130\137\233\129\184\227\129\182"
  L14_14 = L10_10(L11_11)
  if L6_6 == 1 then
    return L7_7
  else
    return L7_7
  end
end
function PopulaceMonsterGrandma.getMonsterRaceName(A0_15, A1_16)
  local L2_17
  L2_17 = debug
  L2_17 = L2_17._getLocalizedXtx
  L2_17 = L2_17(L2_17, "monsterRace", A1_16)
  if L2_17 == nil then
    A0_15:_wait(0.05)
    L2_17 = debug:_getLocalizedXtx("monsterRace", A1_16)
    if L2_17 == nil then
      L2_17 = "\239\188\159\239\188\159\239\188\159"
    end
  end
  return L2_17
end
function PopulaceMonsterGrandma.askActorClassID(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23, A6_24, A7_25, A8_26, A9_27, A10_28, A11_29, A12_30)
  local L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37, L20_38, L21_39
  L13_31 = {
    L14_32,
    L15_33,
    L16_34,
    L17_35,
    L18_36,
    L19_37,
    L20_38,
    L21_39,
    A9_27,
    A10_28,
    A11_29,
    A12_30
  }
  L14_32 = A1_19
  L15_33 = A2_20
  L19_37 = A6_24
  L20_38 = A7_25
  L21_39 = A8_26
  L14_32 = {}
  L15_33 = debug
  L15_33 = L15_33.prepareSpreadSheet
  L15_33 = L15_33(L16_34, L17_35)
  for L19_37 = 1, #L13_31 do
    L21_39 = A0_18
    L20_38 = A0_18.getDisplayName
    L20_38 = L20_38(L21_39, L15_33, L13_31[L19_37])
    L21_39 = L20_38
    L21_39 = L21_39 .. "\227\128\128(ID=" .. tostring(L13_31[L19_37]) .. ")"
    L14_32[L19_37] = L21_39
  end
  L19_37 = "\239\188\158\230\172\161\227\131\154\227\131\188\227\130\184"
  L20_38 = unpack
  L21_39 = L14_32
  L21_39 = L20_38(L21_39)
  if L16_34 == 0 then
    L17_35(L18_36)
    return L17_35, L18_36
  else
    L20_38 = A0_18
    L19_37 = A0_18.getDisplayName
    L21_39 = L15_33
    L19_37 = L19_37(L20_38, L21_39, L13_31[L16_34])
    L20_38 = " \227\130\146\228\189\149\228\189\147\227\131\145\227\131\188\227\131\134\227\130\163\227\129\152\227\130\131\239\188\159"
    L19_37 = L19_37 .. L20_38
    L20_38 = "\239\188\145"
    L21_39 = "\239\188\146"
    L19_37 = L18_36
    L21_39 = A0_18
    L20_38 = A0_18.getDisplayName
    L20_38 = L20_38(L21_39, L15_33, L13_31[L16_34])
    L21_39 = " \227\130\146 "
    L20_38 = L20_38 .. L21_39 .. tostring(L17_35) .. " \228\189\147\227\129\152\227\130\131\227\129\170\227\128\130\227\129\130\227\129\132\227\130\136\239\188\129"
    L18_36(L19_37, L20_38)
    if L17_35 == 1 then
      L19_37 = L18_36
      L20_38 = "\227\131\135\227\131\144\227\131\131\227\130\176\227\130\179\227\131\158\227\131\179\227\131\137\227\128\140//dev pop "
      L21_39 = L13_31[L16_34]
      L20_38 = L20_38 .. L21_39 .. "\227\128\141" .. "\227\129\167\227\130\130\229\145\188\227\129\185\227\130\139\227\129\158\227\128\130\232\166\154\227\129\136\227\129\166\227\129\138\227\129\143\227\129\140\227\130\136\227\129\132\227\128\130"
      L18_36(L19_37, L20_38)
    end
    L19_37 = L15_33
    L18_36(L19_37)
    L19_37 = L17_35
    return L18_36, L19_37
  end
end
function PopulaceMonsterGrandma.getDisplayName(A0_40, A1_41, A2_42)
  local L3_43, L4_44
  L4_44 = A1_41
  L3_43 = A1_41._loadKeyTemporarily
  L3_43(L4_44, A2_42, A2_42)
  L4_44 = A1_41
  L3_43 = A1_41._getData
  L3_43 = L3_43(L4_44, A2_42, 5)
  L4_44 = A1_41._unloadKey
  L4_44(A1_41, A2_42, A2_42)
  L4_44 = debug
  L4_44 = L4_44._getLocalizedXtx
  L4_44 = L4_44(L4_44, "displayName", L3_43)
  if L4_44 == nil then
    A0_40:_wait(0.05)
    L4_44 = debug:_getLocalizedXtx("displayName", L3_43)
    if L4_44 == nil then
      L4_44 = "\239\188\159\239\188\159\239\188\159"
    end
  end
  return L4_44
end
