local L0_0, L1_1
L0_0 = String
function L1_1(A0_2, A1_3, ...)
  local L3_5, L4_6, L5_7, L6_8
  L6_8 = ...
  for L6_8 = 1, L4_6(L5_7, L6_8, ...) do
    A1_3 = A1_3 .. _string.upper(_string.sub(select(L6_8, ...), 1, 1)) .. _string.sub(select(L6_8, ...), 2)
  end
  L6_8 = 1
  L6_8 = L4_6(L5_7, L6_8, 1)
  L6_8 = 2
  return L3_5
end
L0_0.lowerCamelCase = L1_1
L0_0 = String
function L1_1(A0_9, A1_10, ...)
  local L3_12, L4_13, L5_14, L6_15
  L6_15 = ...
  for L6_15 = 1, L4_13(L5_14, L6_15, ...) do
    A1_10 = A1_10 .. _string.upper(_string.sub(select(L6_15, ...), 1, 1)) .. _string.sub(select(L6_15, ...), 2)
  end
  L6_15 = 1
  L6_15 = L4_13(L5_14, L6_15, 1)
  L6_15 = 2
  return L3_12
end
L0_0.upperCamelCase = L1_1
L0_0 = String
function L1_1(A0_16, A1_17, A2_18)
  return _string.sub(A1_17, 1, #A2_18) == A2_18
end
L0_0.startsWith = L1_1
L0_0 = String
function L1_1(A0_19, A1_20, A2_21)
  return _string.sub(A1_20, -#A2_21) == A2_21
end
L0_0.endsWith = L1_1
L0_0 = String
function L1_1(A0_22, A1_23, A2_24)
  return _string.find(A1_23, A2_24, 1, true) ~= nil
end
L0_0.contains = L1_1
L0_0 = String
function L1_1(A0_25, A1_26, A2_27)
  local L3_28, L4_29, L5_30, L6_31
  L3_28 = {}
  L4_29, L5_30, L6_31 = nil, nil, nil
  L4_29 = 1
  while true do
    L5_30, L6_31 = _string.find(A1_26, A2_27, L4_29)
    if L5_30 ~= nil then
      _table.insert(L3_28, _string.sub(A1_26, L4_29, L5_30 - 1))
      L4_29 = L6_31 + 1
    else
      break
    end
  end
  _table.insert(L3_28, _string.sub(A1_26, L4_29))
  return L3_28
end
L0_0.split = L1_1
L0_0 = String
function L1_1(A0_32, A1_33)
  return _string.gsub(_string.gsub(A1_33, "^%s+", ""), "%s+$", "")
end
L0_0.trim = L1_1
