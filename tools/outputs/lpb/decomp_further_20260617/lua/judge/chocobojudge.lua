_defineClass("ChocoboJudge", "JudgeBaseClass")
function ChocoboJudge.isRiding(A0_0, A1_1)
  if A1_1:_getActorMainStat() == 15 then
    return true
  end
  return false
end
function ChocoboJudge.isRidingChocobo(A0_2, A1_3)
  if A1_3:_getActorMainStat() == 15 and A1_3:_getChocoboRidingGrade() ~= 257 then
    return true
  end
  return false
end
function ChocoboJudge.isRidingGoobbue(A0_4, A1_5)
  if A1_5:_getActorMainStat() == 15 and A1_5:_getChocoboRidingGrade() == 257 then
    return true
  end
  return false
end
function ChocoboJudge.getRidingErrorTextId(A0_6, A1_7, A2_8)
  if A2_8 == nil then
    A2_8 = 32507
  end
  if A1_7:_getChocoboRidingGrade() == 257 then
    if A2_8 == 26005 then
      return 26022
    elseif A2_8 == 26010 then
      return 26024
    elseif A2_8 == 26013 then
      return 26029
    elseif A2_8 == 26014 then
      return 26030
    else
      if A2_8 == 32507 then
        return 32508
      else
      end
    end
  else
    return A2_8
  end
end
function ChocoboJudge._onInit(A0_9)
  local L1_10
end
function ChocoboJudge.hasWhistle(A0_11, A1_12)
  if A1_12:_getChocoboGrade() == nil then
    return false
  end
  return true
end
function ChocoboJudge.hasGoobbueWhistle(A0_13, A1_14)
  if A1_14:_isEnabledGoobbue() then
    return true
  end
  return false
end
