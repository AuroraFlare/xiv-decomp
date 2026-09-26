require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("SceCutTest", "ScenarioBaseClass")
function SceCutTest.initText(A0_0)
  local L1_1
end
function SceCutTest.processOfferGood(A0_2, A1_3, A2_4)
end
function SceCutTest.processCutTest(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11
  if L3_8 == 1 then
    L4_9, L5_10, L6_11 = nil, nil, nil
    if L4_9 == 2 then
      L5_10 = 2
      L6_11 = 4
    elseif L4_9 == 3 then
      L5_10 = 3
      L6_11 = 23
    elseif L4_9 == 4 then
      L5_10 = 3
      L6_11 = 24
    elseif L4_9 == 5 then
      L5_10 = 3
      L6_11 = 7
    elseif L4_9 == 6 then
      L5_10 = 3
      L6_11 = 8
    elseif L4_9 == 7 then
      L5_10 = 3
      L6_11 = 9
    elseif L4_9 == 8 then
      L5_10 = 3
      L6_11 = 10
    elseif L4_9 == 9 then
      L5_10 = 3
      L6_11 = 11
    end
    if L4_9 == 1 then
    else
      if L5_10 == 1 then
        A0_5:startFadeOutCutSceneDefault(A1_6)
        A0_5:startNQCutScene(L6_11, 1)
      elseif L5_10 == 2 then
        A0_5:startFadeOutCutSceneDefault(A1_6)
        A0_5:startHQCutScene(L6_11, 1)
      else
        if L5_10 == 3 then
        else
        end
      end
      A0_5:startFadeInCutSceneDefault(A1_6)
    end
  end
  if L3_8 == 2 then
    L4_9, L5_10, L6_11 = nil, nil, nil
    if L4_9 == 2 then
      L5_10 = 2
      L6_11 = 4
    elseif L4_9 == 3 then
      L5_10 = 3
      L6_11 = 23
    end
    if L4_9 == 1 then
    elseif L4_9 == 2 then
      A0_5:startFadeOutCutSceneDefault(A1_6)
      A0_5:startHQCutSceneDebugCase(L6_11)
      A0_5:startFadeInCutSceneDefault(A1_6)
    end
  else
  end
  if L3_8 == 3 then
    L4_9, L5_10, L6_11 = nil, nil, nil
    L5_10 = 4
    L6_11 = "PlanTest01\239\188\136\229\173\151\229\185\149\231\179\187\227\130\171\227\131\131\227\131\136\227\130\183\227\131\188\227\131\179\239\188\137"
    A0_5:startFadeOutCutSceneDefault(A1_6)
    A0_5:startHQCutScene(L5_10)
    A0_5:startFadeInCutSceneDefault(A1_6)
  end
  if L3_8 == 4 then
    L4_9 = 1
    L5_10 = nil
    L6_11 = A1_6._fadeOut
    L6_11(A1_6, L4_9)
    L6_11 = A1_6._waitForFading
    L6_11(A1_6)
    L6_11 = A1_6._fadeIn
    L6_11(A1_6, L4_9)
    L6_11 = A1_6._waitForFading
    L6_11(A1_6)
    L6_11 = A1_6._wait
    L6_11(A1_6, 2)
    L6_11 = A1_6._fadeOut
    L6_11(A1_6, 2)
    L6_11 = A1_6._wait
    L6_11(A1_6, 1)
    L6_11 = A1_6._cancelFading
    L6_11(A1_6)
    L6_11 = A1_6._isFading
    L6_11 = L6_11(A1_6)
    L5_10 = L6_11
    if L5_10 == false then
    end
  else
  end
end
