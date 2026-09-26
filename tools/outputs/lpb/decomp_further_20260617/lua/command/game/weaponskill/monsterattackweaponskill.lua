require("/Command/Game/WeaponSkill/WeaponSkillBaseClass")
_defineClass("MonsterAttackWeaponSkill", "WeaponSkillBaseClass")
function MonsterAttackWeaponSkill.getCommandInformation(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L3_3 = A0_0
  L2_2 = A0_0.getCommandId
  L2_2 = L2_2(L3_3)
  L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11 = nil, nil, nil, nil, nil, nil, nil, nil, nil
  L12_12 = 1
  if L2_2 == 23010 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23014 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23015 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23016 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23017 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23018 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23019 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23020 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23024 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23025 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23026 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23029 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23030 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23031 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23033 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23038 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23039 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23044 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23048 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23049 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23051 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23058 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23059 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23066 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 4, 2, -1, 2, 1
  elseif L2_2 == 23067 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23068 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23070 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23071 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23072 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, -1, -1
  elseif L2_2 == 23074 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23075 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23076 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23078 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23079 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 1, 1
  elseif L2_2 == 23081 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23082 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23083 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23085 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23087 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23088 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23089 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23091 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23094 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23095 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23096 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23114 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23116 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, -1, -1
  elseif L2_2 == 23117 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23118 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23122 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23123 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23124 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23128 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23129 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23134 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23135 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23136 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23137 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23139 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23348 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23140 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, -1
  elseif L2_2 == 23144 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23145 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23147 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23148 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23149 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23150 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23155 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23157 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23159 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23160 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23161 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23162 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23163 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23164 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23165 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23166 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23167 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23192 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23193 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23194 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23198 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23199 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23200 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23190 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23217 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23224 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 3, -1, -1, 1
  elseif L2_2 == 23259 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23260 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, -1
  elseif L2_2 == 23261 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, -1
  elseif L2_2 == 23246 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23288 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 1, 1
  elseif L2_2 == 23289 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 1, 1
  elseif L2_2 == 23291 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 1, 1
  elseif L2_2 == 23290 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23234 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23235 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23236 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23237 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23231 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23232 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23184 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23185 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23204 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, -1
  elseif L2_2 == 23205 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23206 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23208 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23209 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23263 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23269 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23265 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23266 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23273 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23274 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23275 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23276 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 2, 1
  elseif L2_2 == 23277 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 2, 1
  elseif L2_2 == 23278 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23285 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23281 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23282 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23286 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23283 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23284 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23211 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23212 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23214 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23215 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23213 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23294 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23296 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 1, -1, 1, 1
  elseif L2_2 == 23297 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 4, 2, -1, 1, 1
  elseif L2_2 == 23298 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23299 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23300 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23301 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23302 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23307 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23308 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23311 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 2, 1
  elseif L2_2 == 23312 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = true, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23313 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, false, 1, 1, -1, 2, -1
  elseif L2_2 == 23314 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 3, -1, 2, 1
  elseif L2_2 == 23315 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23316 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 4, 2, -1, 1, 1
  elseif L2_2 == 23318 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23319 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23320 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23321 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23322 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23339 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23343 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23344 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23345 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23350 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23351 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23352 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23353 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23354 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 4, 2, -1, 2, 1
  elseif L2_2 == 23355 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23360 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23361 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23362 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23363 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23409 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23408 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23368 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23385 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23386 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23387 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 1, 1
  elseif L2_2 == 23388 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 4, 2, -1, 2, 1
  elseif L2_2 == 23389 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 1, -1, 1, 1
  elseif L2_2 == 23390 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23391 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23392 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23393 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23394 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23395 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, 1
  elseif L2_2 == 23396 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, -1
  elseif L2_2 == 23397 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 2, 1
  elseif L2_2 == 23403 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 2, 2, -1, 2, -1
  elseif L2_2 == 23401 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23413 then
    L3_3, L4_4, L5_5, L8_8, L9_9, L10_10, L11_11, L12_12 = false, false, true, 1, 2, -1, 1, 1
  elseif L2_2 == 23423 or L2_2 == 23438 then
    L12_12 = -1
  end
  if A1_1 == 8 then
    return L12_12
  else
  end
end
function MonsterAttackWeaponSkill.getFrequency(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = 1
  L3_16 = A0_13
  L2_15 = A0_13.getCommandId
  L2_15 = L2_15(L3_16)
  L3_16 = L2_15
  if L3_16 == 23490 then
    L1_14 = 3
    break
  else
  end
  if L3_16 == 23486 then
    L1_14 = 2
    break
  else
  end
  if L3_16 == 23614 then
    L1_14 = 6
    break
  else
  end
  return L1_14
end
function MonsterAttackWeaponSkill.getRangeWidth(A0_17, A1_18, A2_19, A3_20)
  if A0_17:getCommandId() == 23297 then
    return 4
  elseif A0_17:getCommandId() == 23479 then
    return 4
  end
  return 2
end
function MonsterAttackWeaponSkill.getRangeRotate(A0_21, A1_22, A2_23, A3_24)
  local L4_25
  L4_25 = A0_21.getCommandId
  L4_25 = L4_25(A0_21)
  if L4_25 == 23017 then
  elseif L4_25 == 23018 then
  elseif L4_25 == 23019 then
  elseif L4_25 == 23031 then
  elseif L4_25 == 23079 then
  elseif L4_25 == 23095 then
  elseif L4_25 == 23135 then
  elseif L4_25 == 23278 then
  elseif L4_25 == 23445 then
  else
  end
  if L4_25 == 23464 then
    break
  elseif L4_25 == 23440 then
  else
  end
  if L4_25 == 23458 then
    break
  elseif L4_25 == 23161 then
  else
  end
  if L4_25 == 23164 then
    break
  elseif L4_25 == 23162 then
  else
  end
  if L4_25 == 23165 then
    break
  elseif L4_25 == 23441 then
  else
  end
  if L4_25 == 23460 then
    break
  else
  end
  return 0
end
function MonsterAttackWeaponSkill.getCommandRangeHeight(A0_26, A1_27, A2_28, A3_29)
  if A0_26:getCommandId() == 23224 then
    return 30
  else
    return 10
  end
end
function MonsterAttackWeaponSkill.getPartsDamageAdjust(A0_30)
  if A0_30:getCommandId() == 23114 then
    return 1, 0
  else
    return 1, 1
  end
end
