require("/Command/CommandBaseClass")
_defineClass("DebugInputCommand", "CommandBaseClass")
function DebugInputCommand.command(A0_0, A1_1, A2_2, ...)
  local L4_4, L5_5, L6_6, L7_7, L8_8
  if A2_2 == "devc" or A2_2 == "gmc" or A2_2 == "testc" then
    L4_4 = A1_1._getGMRank
    L4_4 = L4_4(L5_5)
    if L4_4 ~= nil then
      L4_4 = ""
      for L8_8 = 1, L6_6(L7_7, L8_8, ...) do
        L4_4 = L4_4 .. " " .. debug:getDebugName((select(L8_8, ...)))
      end
      L5_5(L6_6, L7_7)
      if L5_5 ~= nil then
        for _FORV_10_ = 1, #L6_6 do
          worldMaster:_printDebugLog(L6_6[_FORV_10_])
        end
      end
      return L6_6
    end
  elseif A2_2 == "luac" then
    L4_4 = A1_1._getGMRank
    L4_4 = L4_4(L5_5)
    if L4_4 ~= nil then
      L4_4 = nil
      L4_4 = L5_5
      if L5_5 == false then
        if L8_8 ~= nil then
        end
      end
      for _FORV_11_ = 1, #L7_7 do
        worldMaster:_printDebugLog(L7_7[_FORV_11_])
      end
      return L8_8
    end
  elseif A2_2 == "lua" then
    L4_4 = A1_1._getGMRank
    L4_4 = L4_4(L5_5)
    if L4_4 ~= nil then
      L4_4 = nil
      L4_4 = L5_5
      L5_5(L6_6, L7_7, L8_8, A2_2, L4_4, ...)
      return L5_5
    end
  end
  L4_4 = false
  return L4_4
end
