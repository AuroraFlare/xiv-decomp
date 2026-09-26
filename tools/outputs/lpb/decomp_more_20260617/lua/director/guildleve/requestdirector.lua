require("/Director/Guildleve/GuildleveBaseClass")
_defineClass("RequestDirector", "GuildleveBaseClass")
function RequestDirector.initAsGuildleve(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L2_2 = {L3_3}
  L3_3 = {L4_4, "integer32"}
  L4_4 = "requestId"
  L3_3 = {L4_4}
  L4_4 = {
    "aimNpcBoss",
    "array",
    4,
    "integer8"
  }
  L4_4 = A0_0.initWork
  L4_4(A0_0, nil, L2_2, L3_3)
  L4_4 = A0_0.setTempWork
  L4_4(A0_0, "requestId", A1_1)
  L4_4 = {
    {
      "infoRequest",
      1,
      {"aimNpcBoss"}
    }
  }
  A0_0:initWorkSyncTag(L4_4)
end
function RequestDirector.getTimeLimit(A0_5)
  local L1_6
  L1_6 = 20
  return L1_6
end
function RequestDirector.processUIInit(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  for L4_11 = 1, 4 do
    A0_7:setAimNumNowTmpOf(L4_11, A0_7:getAimNumNowOf(L4_11))
    A0_7:setUiStateTmpOf(L4_11, A0_7:getUiStateOf(L4_11))
  end
  if L1_8 > 0 then
    if L1_8 == 0 then
      L1_8(L2_9, L3_10)
      L4_11 = "start"
      L1_8(L2_9, L3_10, L4_11)
      L1_8(L2_9)
    end
  end
end
function RequestDirector.processUpdateWork(A0_12, A1_13, A2_14)
  local L3_15, L4_16, L5_17, L6_18
  if A1_13 == "guildleveWork" then
    if A2_14 == "start" then
      if L3_15 > 0 then
        if L3_15 == 0 then
          L3_15(L4_16, L5_17)
          for L6_18 = 1, 4 do
            A0_12:setAimNumNowTmpOf(L6_18, A0_12:getAimNumNowOf(L6_18))
            A0_12:setUiStateTmpOf(L6_18, A0_12:getUiStateOf(L6_18))
          end
          L6_18 = "start"
          L3_15(L4_16, L5_17, L6_18)
          L3_15(L4_16)
          return
        end
      end
    end
    if L3_15 > 0 then
      if L3_15 < 0 then
        for L6_18 = 5, 7 do
          desktopWidget:processUpdateContentsInformation(A0_12, "update", L6_18)
        end
      end
      for L6_18 = 1, 4 do
        if A0_12:getAimNumNowTmpOf(L6_18) ~= A0_12:getAimNumNowOf(L6_18) then
          A0_12:setAimNumNowTmpOf(L6_18, A0_12:getAimNumNowOf(L6_18))
        end
        if A0_12:getUiStateTmpOf(L6_18) ~= A0_12:getUiStateOf(L6_18) then
          A0_12:setUiStateTmpOf(L6_18, A0_12:getUiStateOf(L6_18))
        end
        if true then
          if L6_18 ~= 4 then
            desktopWidget:processUpdateContentsInformation(A0_12, "update", L6_18 + 4)
          end
          desktopWidget:processUpdateContentsInformation(A0_12, "update", L6_18)
        end
      end
      if A2_14 == "signal" then
        if L3_15 == -1 then
          L6_18 = "finish"
          L3_15(L4_16, L5_17, L6_18)
          L3_15(L4_16)
          return
        else
          L3_15(L4_16)
          return
        end
      end
      if A2_14 == "marker" then
        L3_15(L4_16)
      end
    end
  end
end
function RequestDirector.getMaxIndexNumberOnGuildleveInfo(A0_19)
  local L1_20
  L1_20 = 7
  return L1_20
end
function RequestDirector.getArticleDataOnGuildleveInfo(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
  L2_23 = 0
  L3_24 = nil
  L4_25 = 0
  L5_26 = 0
  L6_27 = 0
  L7_28 = A1_22
  if L7_28 == 1 then
  elseif L7_28 == 2 then
  elseif L7_28 == 3 then
  else
  end
  if L7_28 == 4 then
    if 0 < A0_21:getUiStateOf(A1_22) then
      L2_23 = A0_21:getArticleTypeForInfo("smash")
      L3_24 = worldMaster
      L4_25 = 50090
      L5_26 = A0_21:getTempWork("requestId")
      L6_27 = 8 + A0_21:getUiStateOf(A1_22) - 1
      do break end
      elseif L7_28 == 5 then
      elseif L7_28 == 6 then
      elseif L7_28 == 7 then
      else
      end
      if L7_28 == 8 and 0 < A0_21.work.aimNpcBoss[A1_22 - 4] then
        L2_23 = A0_21:getArticleTypeForInfo("smash")
        L3_24 = worldMaster
        L4_25 = 50090
        L5_26 = A0_21:getTempWork("requestId")
        L6_27 = 8 + A0_21.work.aimNpcBoss[A1_22 - 4] - 1
      else
      end
    else
    end
  L7_28 = L2_23
  return L7_28, L3_24, L4_25, L5_26, L6_27
end
function RequestDirector.getArticleStateOnGuildleveInfo(A0_29, A1_30)
  local L2_31, L3_32
  L2_31 = 0
  L3_32 = A1_30
  if L3_32 > 4 then
    L3_32 = L3_32 - 4
  end
  if A1_30 <= 4 and 0 >= A0_29:getUiStateOf(L3_32) then
    L2_31 = 0
  elseif A1_30 > 4 and (A0_29.work.aimNpcBoss[L3_32] == 0 or 0 < A0_29:getUiStateOf(1)) then
    L2_31 = 0
  elseif A0_29:getAimNumNowOf(L3_32) >= A0_29:getAimNumOf(L3_32) then
    L2_31 = 2
  elseif 0 < A0_29:getAimNumOf(L3_32) then
    L2_31 = 1
  end
  return L2_31
end
function RequestDirector.getArticleParamOnGuildleveInfo(A0_33, A1_34)
  local L2_35, L3_36, L4_37, L5_38
  L5_38 = A1_34
  if L5_38 > 4 then
    L5_38 = L5_38 - 4
  end
  L2_35 = A0_33:getAimNumNowOf(L5_38)
  if L2_35 < 0 then
    L2_35 = 0
  end
  L3_36 = A0_33:getAimNumOf(L5_38)
  return L2_35, L3_36, L4_37
end
