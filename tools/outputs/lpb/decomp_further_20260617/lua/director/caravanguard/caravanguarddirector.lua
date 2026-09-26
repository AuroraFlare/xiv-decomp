require("/Director/DirectorBaseClass")
_defineClass("CaravanGuardDirector", "DirectorBaseClass")
function CaravanGuardDirector.init(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6)
  local L7_7, L8_8
  L7_7 = A0_0.work
  L8_8 = {
    {"uiStep", "integer8"},
    {"isFinished", "boolean"},
    {"town", "integer8"},
    {"placeStart", "integer16"},
    {"placeEnd", "integer16"},
    {"name1", "integer32"},
    {"name2", "integer32"},
    {"name3", "integer32"}
  }
  L7_7._temp = L8_8
  L7_7 = A0_0.work
  L8_8 = {
    {"step", "integer8"},
    {
      "progressPer",
      "integer8"
    },
    {"finishTime", "integer32"},
    {
      "chocoboStatus",
      "array",
      3,
      "integer8"
    },
    {
      "chocoboHPStatus",
      "array",
      3,
      "integer8"
    },
    {
      "markerX",
      "array",
      3,
      "float"
    },
    {
      "markerY",
      "array",
      3,
      "float"
    },
    {
      "markerZ",
      "array",
      3,
      "float"
    }
  }
  L7_7._sync = L8_8
  L7_7 = A0_0.work
  L7_7.uiStep = 0
  L7_7 = A0_0.work
  L7_7.isFinished = false
  L7_7 = A0_0.work
  L7_7.town = A1_1
  L7_7 = A0_0.work
  L7_7.placeStart = A2_2
  L7_7 = A0_0.work
  L7_7.placeEnd = A3_3
  L7_7 = A0_0.work
  L7_7.name1 = A4_4
  L7_7 = A0_0.work
  L7_7.name2 = A5_5
  L7_7 = A0_0.work
  L7_7.name3 = A6_6
  L7_7 = A0_0.work
  L8_8 = {
    {
      "step",
      1,
      {"step"},
      {"finishTime"}
    },
    {
      "progress",
      1,
      {
        "progressPer"
      }
    },
    {
      "status",
      1,
      {
        "chocoboStatus"
      },
      {"markerX"},
      {"markerY"},
      {"markerZ"}
    },
    {
      "hp",
      1,
      {
        "chocoboHPStatus"
      }
    }
  }
  L7_7._tag = L8_8
end
function CaravanGuardDirector.processUIInit(A0_9)
  if A0_9.work.step < 40 then
    desktopWidget:setMiniMapWidgetMarkerData(2, 0, 1, A0_9.work.markerX[1], A0_9.work.markerY[1], A0_9.work.markerZ[1])
  elseif A0_9.work.town == 1 then
    desktopWidget:openPublicEffectWidget(14)
  elseif A0_9.work.town == 2 then
    desktopWidget:openPublicEffectWidget(15)
  elseif A0_9.work.town == 3 then
    desktopWidget:openPublicEffectWidget(16)
  end
end
function CaravanGuardDirector.processUIUpdate(A0_10, A1_11)
  local L2_12, L3_13, L4_14
  L2_12 = A0_10.work
  L2_12 = L2_12.step
  if L2_12 == 20 then
  else
  end
  if L2_12 == 30 then
    L3_13 = desktopWidget
    L4_14 = L3_13
    L3_13 = L3_13.setMiniMapWidgetMarkerData
    L3_13(L4_14, 2, -1)
    L3_13 = desktopWidget
    L4_14 = L3_13
    L3_13 = L3_13.setMiniMapWidgetMarkerData
    L3_13(L4_14, 2, 0, 1, A0_10.work.markerX[1], A0_10.work.markerY[1], A0_10.work.markerZ[1])
    return
  else
  end
  if L2_12 == 40 then
    if A1_11 == "step" then
      L3_13 = A0_10.work
      L3_13 = L3_13.town
      if L3_13 == 1 then
        L3_13 = desktopWidget
        L4_14 = L3_13
        L3_13 = L3_13.openPublicEffectWidget
        L3_13(L4_14, 14)
      else
        L3_13 = A0_10.work
        L3_13 = L3_13.town
        if L3_13 == 2 then
          L3_13 = desktopWidget
          L4_14 = L3_13
          L3_13 = L3_13.openPublicEffectWidget
          L3_13(L4_14, 15)
        else
          L3_13 = A0_10.work
          L3_13 = L3_13.town
          if L3_13 == 3 then
            L3_13 = desktopWidget
            L4_14 = L3_13
            L3_13 = L3_13.openPublicEffectWidget
            L3_13(L4_14, 16)
            do break end
            elseif L2_12 == 50 then
            elseif L2_12 == 60 then
            else
            end
            if L2_12 == 70 then
              L3_13 = A0_10.work
              L3_13 = L3_13.uiStep
              if L3_13 == 0 then
                L3_13 = A0_10.work
                L3_13.uiStep = 1
                L3_13 = desktopWidget
                L4_14 = L3_13
                L3_13 = L3_13.processUpdateContentsInformation
                L3_13(L4_14, A0_10, "start")
                L3_13 = desktopWidget
                L4_14 = L3_13
                L3_13 = L3_13.setMiniMapWidgetMarkerData
                L3_13(L4_14, 2, -1)
              else
                L3_13 = A1_11
                if L3_13 == "progress" then
                  L4_14 = desktopWidget
                  L4_14 = L4_14.processUpdateContentsInformation
                  L4_14(L4_14, A0_10, "update", 1)
                  break
                else
                end
                if L3_13 == "status" then
                  L4_14 = desktopWidget
                  L4_14 = L4_14.processUpdateContentsInformation
                  L4_14(L4_14, A0_10, "update", 2)
                  L4_14 = desktopWidget
                  L4_14 = L4_14.setMiniMapWidgetMarkerData
                  L4_14(L4_14, 2, -1)
                  L4_14 = 0
                  for _FORV_8_ = 1, 3 do
                    if A0_10.work.chocoboStatus[_FORV_8_] == 4 then
                      desktopWidget:setMiniMapWidgetMarkerData(2, L4_14, 1, A0_10.work.markerX[_FORV_8_], A0_10.work.markerY[_FORV_8_], A0_10.work.markerZ[_FORV_8_])
                      L4_14 = L4_14 + 1
                    end
                  end
                  break
                else
                end
                if L3_13 == "hp" then
                  L4_14 = desktopWidget
                  L4_14 = L4_14.processUpdateContentsInformation
                  L4_14(L4_14, A0_10, "update", 3)
                  do break end
                  do break end
                  do break end
                  else
                  end
                  if L2_12 == 80 then
                    L3_13 = A0_10.work
                    L3_13.isFinished = true
                    L3_13 = desktopWidget
                    L4_14 = L3_13
                    L3_13 = L3_13.setMiniMapWidgetMarkerData
                    L3_13(L4_14, 2, -1)
                    L3_13 = desktopWidget
                    L4_14 = L3_13
                    L3_13 = L3_13.setMiniMapWidgetMarkerData
                    L3_13(L4_14, 2, 0, 1, A0_10.work.markerX[1], A0_10.work.markerY[1], A0_10.work.markerZ[1])
                    if A1_11 == "step" then
                      L3_13 = A0_10.work
                      L3_13 = L3_13.town
                      if L3_13 == 1 then
                        L3_13 = desktopWidget
                        L4_14 = L3_13
                        L3_13 = L3_13.openPublicEffectWidget
                        L3_13(L4_14, 17)
                      else
                        L3_13 = A0_10.work
                        L3_13 = L3_13.town
                        if L3_13 == 2 then
                          L3_13 = desktopWidget
                          L4_14 = L3_13
                          L3_13 = L3_13.openPublicEffectWidget
                          L3_13(L4_14, 18)
                        else
                          L3_13 = A0_10.work
                          L3_13 = L3_13.town
                          if L3_13 == 3 then
                            L3_13 = desktopWidget
                            L4_14 = L3_13
                            L3_13 = L3_13.openPublicEffectWidget
                            L3_13(L4_14, 19)
                          end
                        end
                      end
                    else
                      L3_13 = A0_10.work
                      L3_13 = L3_13.uiStep
                      if L3_13 == 1 then
                        L3_13 = desktopWidget
                        L4_14 = L3_13
                        L3_13 = L3_13.processUpdateContentsInformation
                        L3_13(L4_14, A0_10, "finish")
                        do break end
                        else
                        end
                        if L2_12 == 90 then
                          L3_13 = A0_10.work
                          L3_13.isFinished = true
                          L3_13 = desktopWidget
                          L4_14 = L3_13
                          L3_13 = L3_13.setMiniMapWidgetMarkerData
                          L3_13(L4_14, 2, -1)
                          L3_13 = desktopWidget
                          L4_14 = L3_13
                          L3_13 = L3_13.setMiniMapWidgetMarkerData
                          L3_13(L4_14, 2, 0, 1, A0_10.work.markerX[1], A0_10.work.markerY[1], A0_10.work.markerZ[1])
                          if A1_11 == "step" then
                            L3_13 = desktopWidget
                            L4_14 = L3_13
                            L3_13 = L3_13.openPublicEffectWidget
                            L3_13(L4_14, 20)
                          else
                            L3_13 = A0_10.work
                            L3_13 = L3_13.uiStep
                            if L3_13 == 1 then
                              L3_13 = desktopWidget
                              L4_14 = L3_13
                              L3_13 = L3_13.processUpdateContentsInformation
                              L3_13(L4_14, A0_10, "finish")
                              do break end
                              L3_13 = A0_10.work
                              L3_13 = L3_13.uiStep
                              if L3_13 == 1 then
                                L3_13 = A0_10.work
                                L3_13.uiStep = 0
                                L3_13 = desktopWidget
                                L4_14 = L3_13
                                L3_13 = L3_13.processUpdateContentsInformation
                                L3_13(L4_14, A0_10, "finish")
                                L3_13 = desktopWidget
                                L4_14 = L3_13
                                L3_13 = L3_13.setMiniMapWidgetMarkerData
                                L3_13(L4_14, 2, -1)
                              end
                            end
                          end
                        else
                        end
                      end
                    end
                end
              end
          end
        end
      end
    end
end
function CaravanGuardDirector.processUIFinalize(A0_15)
  desktopWidget:setMiniMapWidgetMarkerData(2, -1)
  if A0_15.work.isFinished == false then
    desktopWidget:openPublicEffectWidget(13)
  end
  if A0_15.work.uiStep == 1 then
    A0_15.work.uiStep = 0
    desktopWidget:processUpdateContentsInformation(A0_15, "finish")
  end
end
function CaravanGuardDirector.getKindContentsInformation(A0_16)
  local L1_17
  L1_17 = 2
  return L1_17
end
function CaravanGuardDirector.getUIDataOpen(A0_18)
  return A0_18.work.finishTime, A0_18.work.town, A0_18.work.placeStart, A0_18.work.placeEnd, A0_18.work.name1, A0_18.work.name2, A0_18.work.name3
end
function CaravanGuardDirector.getUIDataUpdate(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24
  L2_21 = A1_20
  if L2_21 == 1 then
    L3_22 = A0_19.work
    L3_22 = L3_22.progressPer
    return L3_22
  else
  end
  if L2_21 == 2 then
    L3_22 = A0_19.work
    L3_22 = L3_22.chocoboStatus
    L3_22 = L3_22[1]
    L4_23 = A0_19.work
    L4_23 = L4_23.chocoboStatus
    L4_23 = L4_23[2]
    L5_24 = A0_19.work
    L5_24 = L5_24.chocoboStatus
    L5_24 = L5_24[3]
    return L3_22, L4_23, L5_24
  else
  end
  if L2_21 == 3 then
    L3_22 = A0_19.work
    L3_22 = L3_22.chocoboHPStatus
    L3_22 = L3_22[1]
    L4_23 = A0_19.work
    L4_23 = L4_23.chocoboHPStatus
    L4_23 = L4_23[2]
    L5_24 = A0_19.work
    L5_24 = L5_24.chocoboHPStatus
    L5_24 = L5_24[3]
    return L3_22, L4_23, L5_24
  else
  end
end
function CaravanGuardDirector.processMapOpenMessage(A0_25)
  local L1_26, L2_27
  L1_26 = A0_25.work
  L1_26 = L1_26.step
  if L1_26 == 20 then
  elseif L1_26 == 30 then
  elseif L1_26 == 80 then
  else
  end
  if L1_26 == 90 then
    L2_27 = desktopWidget
    L2_27 = L2_27.setMapNavigationWidgetMarkerData
    L2_27(L2_27, 2, 0, 1, A0_25.work.markerX[1], A0_25.work.markerY[1], A0_25.work.markerZ[1])
    break
  else
  end
  if L1_26 == 70 then
    L2_27 = 0
    for _FORV_6_ = 1, 3 do
      if A0_25.work.chocoboStatus[_FORV_6_] == 4 then
        desktopWidget:setMapNavigationWidgetMarkerData(2, L2_27, 1, A0_25.work.markerX[_FORV_6_], A0_25.work.markerY[_FORV_6_], A0_25.work.markerZ[_FORV_6_])
        L2_27 = L2_27 + 1
      end
    end
    break
  else
  end
end
