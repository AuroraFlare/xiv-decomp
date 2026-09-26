local L0_0, L1_1
L0_0 = CharaBaseClass
function L1_1(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2.charaWork
  L2_4 = L2_4.parameterSave
  L2_4 = L2_4.hp
  L2_4 = L2_4[A1_3]
  return L2_4
end
L0_0.getHpImpl = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_5, A1_6)
  local L2_7
  L2_7 = A0_5.charaWork
  L2_7 = L2_7.parameterSave
  L2_7 = L2_7.hpMax
  L2_7 = L2_7[A1_6]
  return L2_7
end
L0_0.getHpMaxImpl = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_8, A1_9)
  local L2_10, L3_11
  L2_10 = A0_8.charaWork
  L2_10 = L2_10.battleTemp
  L2_10 = L2_10.generalParameter
  L3_11 = A1_9 + 3
  L2_10 = L2_10[L3_11]
  return L2_10
end
L0_0.getPhysicalParameter = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_12, A1_13)
  if A0_12:getStateMainSkillLevel() <= 10 then
  elseif A0_12:getStateMainSkillLevel() <= 20 then
  elseif A0_12:getStateMainSkillLevel() <= 30 then
  elseif A0_12:getStateMainSkillLevel() <= 40 then
  elseif A0_12:getStateMainSkillLevel() <= 50 then
  elseif A0_12:getStateMainSkillLevel() <= 60 then
  elseif A0_12:getStateMainSkillLevel() <= 70 then
  else
  end
  return _math.ceil((8000 + (A0_12:getStateMainSkillLevel() - 70) * 500) * (A1_13 * 0.001))
end
L0_0.calculateCommandCost = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_14)
  if A0_14:isPlayer() == false then
    return A0_14:getStateMainSkill()
  end
  if A0_14:_getJob() ~= 0 then
    return (A0_14:_getJob())
  end
  return A0_14:getStateMainSkill()
end
L0_0.getMainClassOrJob = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_15, A1_16)
  if A0_15:_getJob() == 0 then
    return true
  end
  for _FORV_8_ = 1, #{
    15,
    16,
    17,
    18,
    19,
    26,
    27
  } do
    if A0_15:_getJob() == ({
      15,
      16,
      17,
      18,
      19,
      26,
      27
    })[_FORV_8_] then
      for _FORV_12_ = 1, #({
        {
          2,
          8,
          7
        },
        {
          3,
          4,
          23
        },
        {
          4,
          3,
          2
        },
        {
          7,
          23,
          22
        },
        {
          8,
          2,
          7
        },
        {
          22,
          2,
          7
        },
        {
          23,
          3,
          2
        }
      })[_FORV_8_] do
        if A1_16 == ({
          {
            2,
            8,
            7
          },
          {
            3,
            4,
            23
          },
          {
            4,
            3,
            2
          },
          {
            7,
            23,
            22
          },
          {
            8,
            2,
            7
          },
          {
            22,
            2,
            7
          },
          {
            23,
            3,
            2
          }
        })[_FORV_8_][_FORV_12_] then
          return true
        end
      end
      return _FOR_
    end
  end
  return _FOR_
end
L0_0.checkClassCommandPermission = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_17, A1_18)
  local L2_19
  if A1_18 >= 15 and A1_18 <= 19 then
    L2_19 = true
    return L2_19
  end
  if A1_18 >= 26 and A1_18 <= 27 then
    L2_19 = true
    return L2_19
  end
  L2_19 = false
  return L2_19
end
L0_0.isJob = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_20, A1_21)
  local L2_22
  L2_22 = {
    15,
    16,
    17,
    18,
    19,
    26,
    27,
    2,
    3,
    4,
    7,
    8,
    22,
    23
  }
  for _FORV_7_ = 1, #L2_22 do
    if A1_21 == L2_22[_FORV_7_] then
      return ({
        2,
        3,
        4,
        7,
        8,
        22,
        23,
        15,
        16,
        17,
        18,
        19,
        26,
        27
      })[_FORV_7_]
    end
  end
  return _FOR_
end
L0_0.convertSkillId = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_23)
  local L1_24
  L1_24 = {
    27146,
    27147,
    27148,
    27149,
    27159,
    27186,
    27187,
    27188,
    27189,
    27192,
    27106,
    27107,
    27108,
    27109,
    27118,
    27266,
    27267,
    27268,
    27272,
    27277,
    27227,
    27232,
    27237,
    27238,
    27239,
    27344,
    27345,
    27357,
    27358,
    27359,
    27305,
    27316,
    27317,
    27318,
    27319,
    29742
  }
  return L1_24
end
L0_0.getAdditionalCommandList = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_25, A1_26)
  local L2_27
  L2_27 = {
    15,
    16,
    17,
    18,
    19,
    26,
    27
  }
  for _FORV_7_ = 1, #L2_27 do
    if L2_27[_FORV_7_] == A1_26 then
      return ({
        2000202,
        2000201,
        2000203,
        2000205,
        2000204,
        2000207,
        2000206
      })[_FORV_7_]
    end
  end
  return _FOR_
end
L0_0.getJobItemId = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_28)
  local L1_29
  L1_29 = A0_28.charaWork
  L1_29 = L1_29.battleTemp
  L1_29 = L1_29.generalParameter
  L1_29 = L1_29[18]
  return L1_29
end
L0_0.getAttack = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_30)
  local L1_31
  L1_31 = A0_30.charaWork
  L1_31 = L1_31.battleTemp
  L1_31 = L1_31.generalParameter
  L1_31 = L1_31[16]
  return L1_31
end
L0_0.getAttackRate = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_32)
  local L1_33
  L1_33 = A0_32.charaWork
  L1_33 = L1_33.battleTemp
  L1_33 = L1_33.generalParameter
  L1_33 = L1_33[19]
  return L1_33
end
L0_0.getNormalDefence = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_34)
  local L1_35
  L1_35 = A0_34.charaWork
  L1_35 = L1_35.battleTemp
  L1_35 = L1_35.generalParameter
  L1_35 = L1_35[17]
  return L1_35
end
L0_0.getEvasion = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_36)
  local L1_37
  L1_37 = A0_36.charaWork
  L1_37 = L1_37.battleTemp
  L1_37 = L1_37.generalParameter
  L1_37 = L1_37[24]
  return L1_37
end
L0_0.getAttackMagic = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_38)
  local L1_39
  L1_39 = A0_38.charaWork
  L1_39 = L1_39.battleTemp
  L1_39 = L1_39.generalParameter
  L1_39 = L1_39[25]
  return L1_39
end
L0_0.getHealMagic = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_40)
  local L1_41
  L1_41 = A0_40.charaWork
  L1_41 = L1_41.battleTemp
  L1_41 = L1_41.generalParameter
  L1_41 = L1_41[26]
  return L1_41
end
L0_0.getReinforceMagic = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_42)
  local L1_43
  L1_43 = A0_42.charaWork
  L1_43 = L1_43.battleTemp
  L1_43 = L1_43.generalParameter
  L1_43 = L1_43[27]
  return L1_43
end
L0_0.getWeekMagic = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_44)
  local L1_45
  L1_45 = A0_44.charaWork
  L1_45 = L1_45.battleTemp
  L1_45 = L1_45.generalParameter
  L1_45 = L1_45[28]
  return L1_45
end
L0_0.getMagicRate = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_46)
  local L1_47
  L1_47 = A0_46.charaWork
  L1_47 = L1_47.battleTemp
  L1_47 = L1_47.generalParameter
  L1_47 = L1_47[29]
  return L1_47
end
L0_0.getMagicEvasion = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_48)
  local L1_49
  L1_49 = A0_48.charaWork
  L1_49 = L1_49.battleTemp
  L1_49 = L1_49.generalParameter
  L1_49 = L1_49[30]
  return L1_49
end
L0_0.getCraftProcessing = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_50)
  local L1_51
  L1_51 = A0_50.charaWork
  L1_51 = L1_51.battleTemp
  L1_51 = L1_51.generalParameter
  L1_51 = L1_51[31]
  return L1_51
end
L0_0.getCraftMagicProcessing = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_52)
  local L1_53
  L1_53 = A0_52.charaWork
  L1_53 = L1_53.battleTemp
  L1_53 = L1_53.generalParameter
  L1_53 = L1_53[32]
  return L1_53
end
L0_0.getCraftProcessControl = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_54)
  local L1_55
  L1_55 = A0_54.charaWork
  L1_55 = L1_55.battleTemp
  L1_55 = L1_55.generalParameter
  L1_55 = L1_55[33]
  return L1_55
end
L0_0.getHarvestPotency = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_56)
  local L1_57
  L1_57 = A0_56.charaWork
  L1_57 = L1_57.battleTemp
  L1_57 = L1_57.generalParameter
  L1_57 = L1_57[34]
  return L1_57
end
L0_0.getHarvestLimit = L1_1
L0_0 = CharaBaseClass
function L1_1(A0_58)
  local L1_59
  L1_59 = A0_58.charaWork
  L1_59 = L1_59.battleTemp
  L1_59 = L1_59.generalParameter
  L1_59 = L1_59[35]
  return L1_59
end
L0_0.getHarvestRate = L1_1
