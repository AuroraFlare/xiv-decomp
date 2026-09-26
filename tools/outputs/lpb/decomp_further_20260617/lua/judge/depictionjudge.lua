require("/Judge/JudgeBaseClass")
_defineClass("DepictionJudge", "JudgeBaseClass")
function DepictionJudge.judgeNameplate(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L3_3 = worldMaster
  L4_4 = L3_3
  L3_3 = L3_3._getMyPlayer
  L3_3 = L3_3(L4_4)
  L5_5 = L3_3
  L4_4 = L3_3.getPlayerParty
  L4_4 = L4_4(L5_5)
  L6_6 = L3_3
  L5_5 = L3_3.getCurrentContentGroup
  L5_5 = L5_5(L6_6)
  L7_7 = L4_4
  L6_6 = L4_4._getOccupancyGroup
  L6_6 = L6_6(L7_7)
  if L5_5 ~= nil then
    L8_8 = L5_5
    L7_7 = L5_5._getKind
    L7_7 = L7_7(L8_8)
    if L7_7 ~= 30001 then
      L8_8 = L5_5
      L7_7 = L5_5._getKind
      L7_7 = L7_7(L8_8)
    elseif L7_7 == 30006 then
      L8_8 = L5_5
      L7_7 = L5_5._isMember
      L9_9 = A1_1
      L7_7 = L7_7(L8_8, L9_9)
      if L7_7 then
        L8_8 = A1_1
        L7_7 = A1_1.isPropertyEnabled
        L9_9 = 3
        L7_7 = L7_7(L8_8, L9_9)
        if L7_7 then
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateIcon
          L9_9 = 1
          L10_10 = 1
          L11_11 = 246
          L7_7(L8_8, L9_9, L10_10, L11_11)
        end
      end
    end
  else
    L8_8 = A1_1
    L7_7 = A1_1.isPlayer
    L7_7 = L7_7(L8_8)
    if L7_7 then
      L8_8 = A1_1
      L7_7 = A1_1.getLinkshellIconId
      L7_7 = L7_7(L8_8)
      L9_9 = A1_1
      L8_8 = A1_1._getNetStatSystem
      L10_10 = 2
      L8_8 = L8_8(L9_9, L10_10)
      if L8_8 then
        L9_9 = A1_1
        L8_8 = A1_1._setNameplateIcon
        L10_10 = 1
        L11_11 = 1
        L8_8(L9_9, L10_10, L11_11, 312)
      else
        L9_9 = A1_1
        L8_8 = A1_1._getNetStatSystem
        L10_10 = 1
        L8_8 = L8_8(L9_9, L10_10)
        if L8_8 then
          L9_9 = A1_1
          L8_8 = A1_1._setNameplateIcon
          L10_10 = 1
          L11_11 = 1
          L8_8(L9_9, L10_10, L11_11, 313)
        else
          L9_9 = A1_1
          L8_8 = A1_1._getNetStatUser
          L10_10 = 1
          L8_8 = L8_8(L9_9, L10_10)
          if L8_8 then
            L9_9 = A1_1
            L8_8 = A1_1._setNameplateIcon
            L10_10 = 1
            L11_11 = 1
            L8_8(L9_9, L10_10, L11_11, 314)
          elseif L7_7 > 0 then
            L9_9 = A1_1
            L8_8 = A1_1._setNameplateIcon
            L10_10 = 1
            L11_11 = 1
            L8_8(L9_9, L10_10, L11_11, L7_7 + 40001 - 1)
          else
            L9_9 = A1_1
            L8_8 = A1_1._setNameplateIcon
            L10_10 = 1
            L11_11 = 1
            L8_8(L9_9, L10_10, L11_11, 0)
          end
        end
      end
    else
      L8_8 = A1_1
      L7_7 = A1_1.getCategoryIcon
      L7_7 = L7_7(L8_8)
      if L7_7 > 0 then
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 1
        L10_10 = 1
        L11_11 = A1_1.getCategoryIcon
        L11_11 = L11_11(A1_1)
        L7_7(L8_8, L9_9, L10_10, L11_11, L11_11(A1_1))
      else
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 1
        L10_10 = 1
        L11_11 = 0
        L7_7(L8_8, L9_9, L10_10, L11_11)
      end
    end
  end
  L8_8 = A1_1
  L7_7 = A1_1.isRetailDealer
  L7_7 = L7_7(L8_8)
  if L7_7 then
    L8_8 = A1_1
    L7_7 = A1_1._setNameplateIcon
    L9_9 = 2
    L10_10 = 1
    L11_11 = 220
    L7_7(L8_8, L9_9, L10_10, L11_11)
  else
    L8_8 = A1_1
    L7_7 = A1_1.isPlayer
    L7_7 = L7_7(L8_8)
    if L7_7 == false then
      L8_8 = A1_1
      L7_7 = A1_1.isPropertyEnabled
      L9_9 = 3
      L7_7 = L7_7(L8_8, L9_9)
      if L7_7 == true then
        L8_8 = A1_1
        L7_7 = A1_1.getBattalion
        L7_7 = L7_7(L8_8)
        if L7_7 ~= 1 then
          L8_8 = A1_1
          L7_7 = A1_1.getAggro
          L7_7 = L7_7(L8_8)
          if L7_7 > 0 then
            L8_8 = A1_1
            L7_7 = A1_1._setNameplateIcon
            L9_9 = 2
            L10_10 = 1
            L11_11 = 517
            L7_7(L8_8, L9_9, L10_10, L11_11)
          else
            L8_8 = A1_1
            L7_7 = A1_1._setNameplateIcon
            L9_9 = 2
            L10_10 = 1
            L11_11 = 518
            L7_7(L8_8, L9_9, L10_10, L11_11)
          end
        end
      end
    else
      L8_8 = A1_1
      L7_7 = A1_1._setNameplateIcon
      L9_9 = 2
      L10_10 = 1
      L11_11 = 0
      L7_7(L8_8, L9_9, L10_10, L11_11)
    end
  end
  L8_8 = A1_1
  L7_7 = A1_1.getRepairType
  L7_7 = L7_7(L8_8)
  if L7_7 ~= 0 then
    L8_8 = A1_1
    L7_7 = A1_1._setNameplateIcon
    L9_9 = 3
    L10_10 = 1
    L11_11 = 928
    L7_7(L8_8, L9_9, L10_10, L11_11)
  else
    L8_8 = A1_1
    L7_7 = A1_1.isRepairDealer
    L7_7 = L7_7(L8_8)
    if L7_7 then
      L8_8 = A1_1
      L7_7 = A1_1._setNameplateIcon
      L9_9 = 3
      L10_10 = 1
      L11_11 = 380
      L7_7(L8_8, L9_9, L10_10, L11_11)
    else
      L8_8 = A1_1
      L7_7 = A1_1.isMateriaAttachDealer
      L7_7 = L7_7(L8_8)
      if L7_7 then
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 3
        L10_10 = 1
        L11_11 = 929
        L7_7(L8_8, L9_9, L10_10, L11_11)
      else
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 3
        L10_10 = 1
        L11_11 = 0
        L7_7(L8_8, L9_9, L10_10, L11_11)
      end
    end
  end
  L8_8 = A1_1
  L7_7 = A1_1.isPropertyEnabled
  L9_9 = 3
  L7_7 = L7_7(L8_8, L9_9)
  if L7_7 then
    L8_8 = A1_1
    L7_7 = A1_1.getTargetInformationOpenThinking
    L7_7 = L7_7(L8_8)
    if L7_7 ~= 0 then
      L8_8 = L4_4
      L7_7 = L4_4._isMember
      L9_9 = A1_1
      L7_7 = L7_7(L8_8, L9_9)
      if L7_7 then
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 4
        L10_10 = 1
        L11_11 = A1_1.getTargetInformationOpenThinking
        L11_11 = L11_11(A1_1)
        L11_11 = 304 + L11_11
        L11_11 = L11_11 - 1
        L7_7(L8_8, L9_9, L10_10, L11_11)
      else
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 4
        L10_10 = 1
        L11_11 = 0
        L7_7(L8_8, L9_9, L10_10, L11_11)
      end
    else
      L8_8 = A1_1
      L7_7 = A1_1.getTargetInformationPartyTarget
      L7_7 = L7_7(L8_8)
      if L7_7 ~= 0 then
        if L5_5 ~= nil then
          L8_8 = L5_5
          L7_7 = L5_5._getKind
          L7_7 = L7_7(L8_8)
          if L7_7 == 30001 then
            L8_8 = L5_5
            L7_7 = L5_5._isMember
            L9_9 = A1_1
            L7_7 = L7_7(L8_8, L9_9)
            if L7_7 then
              L8_8 = A1_1
              L7_7 = A1_1._setNameplateIcon
              L9_9 = 4
              L10_10 = 1
              L11_11 = A1_1.getTargetInformationPartyTarget
              L11_11 = L11_11(A1_1)
              L11_11 = 296 + L11_11
              L11_11 = L11_11 - 100
              L7_7(L8_8, L9_9, L10_10, L11_11)
            end
          end
        else
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateIcon
          L9_9 = 4
          L10_10 = 1
          L11_11 = 0
          L7_7(L8_8, L9_9, L10_10, L11_11)
        end
      else
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateIcon
        L9_9 = 4
        L10_10 = 1
        L11_11 = 0
        L7_7(L8_8, L9_9, L10_10, L11_11)
      end
    end
  else
    L8_8 = A1_1
    L7_7 = A1_1.isPlayer
    L7_7 = L7_7(L8_8)
    if L7_7 == false then
      L8_8 = A1_1
      L7_7 = A1_1.isRetainer
      L7_7 = L7_7(L8_8)
      if L7_7 then
        L8_8 = A1_1
        L7_7 = A1_1._getSystemFlag
        L9_9 = 1
        L7_7 = L7_7(L8_8, L9_9)
        if L7_7 == true then
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateIcon
          L9_9 = 4
          L10_10 = 1
          L11_11 = 456
          L7_7(L8_8, L9_9, L10_10, L11_11)
        else
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateIcon
          L9_9 = 4
          L10_10 = 1
          L11_11 = 0
          L7_7(L8_8, L9_9, L10_10, L11_11)
        end
      end
    end
  end
  L8_8 = A1_1
  L7_7 = A1_1.isDeadMode
  L7_7 = L7_7(L8_8)
  if L7_7 then
    L8_8 = A1_1
    L7_7 = A1_1._setNameplateColor
    L9_9 = 1
    L10_10 = 0.6
    L11_11 = 0.6
    L7_7(L8_8, L9_9, L10_10, L11_11, 0.6, 1)
    L8_8 = A1_1
    L7_7 = A1_1.isPlayer
    L7_7 = L7_7(L8_8)
    if not L7_7 then
      L8_8 = A1_1
      L7_7 = A1_1._setMapMarker
      L9_9 = nil
      L7_7(L8_8, L9_9)
    end
  else
    L8_8 = A1_1
    L7_7 = A1_1.isPlayer
    L7_7 = L7_7(L8_8)
    if L7_7 then
      if A1_1 == L3_3 then
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateColor
        L9_9 = 1
        L10_10 = 1
        L11_11 = 1
        L7_7(L8_8, L9_9, L10_10, L11_11, 1, 1)
      elseif A1_1 ~= L3_3 then
        L8_8 = L4_4
        L7_7 = L4_4._isMember
        L9_9 = A1_1
        L7_7 = L7_7(L8_8, L9_9)
        if L7_7 then
          L8_8 = A1_1
          L7_7 = A1_1._isAccessibleInServer
          L7_7 = L7_7(L8_8)
          if not L7_7 then
            L8_8 = A1_1
            L7_7 = A1_1._setNameplateColor
            L9_9 = 1
            L10_10 = 0.5
            L11_11 = 1
            L7_7(L8_8, L9_9, L10_10, L11_11, 1, 0.3)
            L8_8 = A1_1
            L7_7 = A1_1._setMapMarker
            L9_9 = 1
            L7_7(L8_8, L9_9)
          else
            L8_8 = A1_1
            L7_7 = A1_1._setNameplateColor
            L9_9 = 1
            L10_10 = 0.5
            L11_11 = 1
            L7_7(L8_8, L9_9, L10_10, L11_11, 1, 1)
            L8_8 = A1_1
            L7_7 = A1_1._setMapMarker
            L9_9 = 1
            L7_7(L8_8, L9_9)
          end
        end
      else
        L8_8 = A1_1
        L7_7 = A1_1._isAccessibleInServer
        L7_7 = L7_7(L8_8)
        if not L7_7 then
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateColor
          L9_9 = 1
          L10_10 = 1
          L11_11 = 1
          L7_7(L8_8, L9_9, L10_10, L11_11, 1, 0.3)
          L8_8 = A1_1
          L7_7 = A1_1._setMapMarker
          L9_9 = 2
          L7_7(L8_8, L9_9)
        else
          L8_8 = A1_1
          L7_7 = A1_1._setNameplateColor
          L9_9 = 1
          L10_10 = 1
          L11_11 = 1
          L7_7(L8_8, L9_9, L10_10, L11_11, 1, 1)
          L8_8 = A1_1
          L7_7 = A1_1._setMapMarker
          L9_9 = 2
          L7_7(L8_8, L9_9)
        end
      end
    else
      L8_8 = L4_4
      L7_7 = L4_4._isMember
      L9_9 = A1_1
      L7_7 = L7_7(L8_8, L9_9)
      if L7_7 then
        L8_8 = A1_1
        L7_7 = A1_1._setNameplateColor
        L9_9 = 1
        L10_10 = 0.5
        L11_11 = 1
        L7_7(L8_8, L9_9, L10_10, L11_11, 1, 1)
        L8_8 = A1_1
        L7_7 = A1_1._setMapMarker
        L9_9 = 1
        L7_7(L8_8, L9_9)
      else
        L8_8 = A1_1
        L7_7 = A1_1.isPropertyEnabled
        L9_9 = 3
        L7_7 = L7_7(L8_8, L9_9)
        if L7_7 then
          L8_8 = A1_1
          L7_7 = A1_1.getBattalion
          L7_7 = L7_7(L8_8)
          if L7_7 == 1 then
            L8_8 = A1_1
            L7_7 = A1_1._setNameplateColor
            L9_9 = 1
            L10_10 = 0.5
            L11_11 = 1
            L7_7(L8_8, L9_9, L10_10, L11_11, 0.5, 1)
            L8_8 = A1_1
            L7_7 = A1_1.isMapMarkerVisibleForTalkable
            L7_7 = L7_7(L8_8)
            if L7_7 == true then
              L8_8 = A1_1
              L7_7 = A1_1._setMapMarker
              L10_10 = A1_1
              L9_9 = A1_1.getMapMarkerTypeForTalkable
              L11_11 = L9_9(L10_10)
              L7_7(L8_8, L9_9, L10_10, L11_11, L9_9(L10_10))
            else
              L8_8 = A1_1
              L7_7 = A1_1._setMapMarker
              L9_9 = nil
              L7_7(L8_8, L9_9)
            end
          elseif L5_5 ~= nil then
            L8_8 = L5_5
            L7_7 = L5_5._getKind
            L7_7 = L7_7(L8_8)
            if L7_7 ~= 30001 then
              L8_8 = L5_5
              L7_7 = L5_5._getKind
              L7_7 = L7_7(L8_8)
            elseif L7_7 == 30006 then
              L8_8 = L5_5
              L7_7 = L5_5._isMember
              L9_9 = A1_1
              L7_7 = L7_7(L8_8, L9_9)
              if L7_7 then
                L8_8 = A1_1
                L7_7 = A1_1.getHateType
                L7_7 = L7_7(L8_8)
                if L7_7 == 1 then
                  L9_9 = A1_1
                  L8_8 = A1_1._setNameplateColor
                  L10_10 = 1
                  L11_11 = 1
                  L8_8(L9_9, L10_10, L11_11, 1, 0.5, 1)
                elseif L7_7 == 2 then
                  L9_9 = A1_1
                  L8_8 = A1_1._setNameplateColor
                  L10_10 = 1
                  L11_11 = 1
                  L8_8(L9_9, L10_10, L11_11, 0.7, 0.2, 1)
                else
                  L8_8 = nil
                  L10_10 = A1_1
                  L9_9 = A1_1.getParty
                  L9_9 = L9_9(L10_10)
                  if L9_9 ~= nil then
                    L11_11 = L9_9
                    L10_10 = L9_9._getOccupancyGroup
                    L10_10 = L10_10(L11_11)
                    L8_8 = L10_10
                  end
                  if L8_8 ~= nil then
                    L11_11 = L8_8
                    L10_10 = L8_8._isMember
                    L10_10 = L10_10(L11_11, L3_3)
                    if L10_10 then
                      L11_11 = A1_1
                      L10_10 = A1_1._setNameplateColor
                      L10_10(L11_11, 1, 1, 0.5, 0.7, 1)
                    end
                  else
                    L11_11 = A1_1
                    L10_10 = A1_1._setNameplateColor
                    L10_10(L11_11, 1, 0.6, 0.6, 0.9, 1)
                  end
                end
                L9_9 = A1_1
                L8_8 = A1_1._setMapMarker
                L10_10 = 3
                L8_8(L9_9, L10_10)
              end
            end
          else
            L7_7 = nil
            L9_9 = A1_1
            L8_8 = A1_1.getHateType
            L8_8 = L8_8(L9_9)
            L10_10 = A1_1
            L9_9 = A1_1.isNotoriousMonster
            L10_10 = L9_9(L10_10)
            if L8_8 == 1 then
              L11_11 = A1_1._setNameplateColor
              L11_11(A1_1, 1, 1, 1, 0.5, 1)
              if L9_9 == true and L10_10 == 13 then
                L7_7 = 8
              else
                L7_7 = 5
              end
            elseif L8_8 == 2 then
              L11_11 = A1_1._setNameplateColor
              L11_11(A1_1, 1, 1, 0.7, 0.2, 1)
              if L9_9 == true and L10_10 == 13 then
                L7_7 = 8
              else
                L7_7 = 5
              end
            else
              L11_11 = nil
              if A1_1:getParty() ~= nil then
                L11_11 = A1_1:getParty():_getOccupancyGroup()
              end
              if L11_11 ~= nil and L11_11:_isMember(L3_3) then
                A1_1:_setNameplateColor(1, 1, 0.38, 0.44, 1)
                if L9_9 == true and L10_10 == 13 then
                  L7_7 = 9
                else
                  L7_7 = 4
                end
              else
                A1_1:_setNameplateColor(1, 0.6, 0.45, 0.94, 1)
                if L9_9 == true and L10_10 == 13 then
                  L7_7 = 8
                else
                  L7_7 = 5
                end
              end
            end
            L11_11 = A1_1.isNotoriousMonster
            L11_11 = L11_11(A1_1)
            if L11_11 == true and L11_11(A1_1) == 12 then
              L7_7 = 7
            end
            if A1_1:isMapMarkerVisibleForTalkable() == false then
              L7_7 = nil
            end
            A1_1:_setMapMarker(L7_7)
          end
        else
          L8_8 = A1_1
          L7_7 = A1_1.isRetainer
          L7_7 = L7_7(L8_8)
          if L7_7 then
            L8_8 = L3_3
            L7_7 = L3_3._getGroup
            L9_9 = 80001
            L7_7 = L7_7(L8_8, L9_9)
            if L7_7 ~= nil then
              L9_9 = L7_7
              L8_8 = L7_7._isMember
              L10_10 = A1_1
              L8_8 = L8_8(L9_9, L10_10)
              if L8_8 then
                L9_9 = A1_1
                L8_8 = A1_1._setNameplateColor
                L10_10 = 1
                L11_11 = 0.7
                L8_8(L9_9, L10_10, L11_11, 0.5, 1, 1)
              else
                L9_9 = A1_1
                L8_8 = A1_1._setNameplateColor
                L10_10 = 1
                L11_11 = 0.5
                L8_8(L9_9, L10_10, L11_11, 0.5, 1, 1)
              end
            else
              L9_9 = A1_1
              L8_8 = A1_1._setNameplateColor
              L10_10 = 1
              L11_11 = 0.5
              L8_8(L9_9, L10_10, L11_11, 0.5, 1, 1)
            end
            L9_9 = A1_1
            L8_8 = A1_1._getSystemFlag
            L10_10 = 1
            L8_8 = L8_8(L9_9, L10_10)
            if L8_8 == true then
              L9_9 = A1_1
              L8_8 = A1_1._setMapMarker
              L10_10 = 4
              L8_8(L9_9, L10_10)
            else
              L9_9 = A1_1
              L8_8 = A1_1._setMapMarker
              L10_10 = 6
              L8_8(L9_9, L10_10)
            end
          else
            L8_8 = A1_1
            L7_7 = A1_1._isTalkable
            L7_7 = L7_7(L8_8)
            if L7_7 then
              L8_8 = A1_1
              L7_7 = A1_1._setNameplateColor
              L9_9 = 1
              L10_10 = 0.5
              L11_11 = 1
              L7_7(L8_8, L9_9, L10_10, L11_11, 0.5, 1)
              L8_8 = A1_1
              L7_7 = A1_1.isMapMarkerVisibleForTalkable
              L7_7 = L7_7(L8_8)
              if L7_7 == true then
                L8_8 = A1_1
                L7_7 = A1_1.getMapMarkerTypeForTalkable
                L7_7 = L7_7(L8_8)
                L9_9 = A1_1
                L8_8 = A1_1._setMapMarker
                L10_10 = L7_7
                L8_8(L9_9, L10_10)
              else
                L8_8 = A1_1
                L7_7 = A1_1._setMapMarker
                L9_9 = nil
                L7_7(L8_8, L9_9)
              end
            else
              L8_8 = A1_1
              L7_7 = A1_1.getMapMarkerRange
              L7_7 = L7_7(L8_8)
              if L7_7 ~= nil then
                L8_8 = A1_1
                L7_7 = A1_1._setNameplateColor
                L9_9 = 1
                L10_10 = 0
                L11_11 = 0
                L7_7(L8_8, L9_9, L10_10, L11_11, 0, 0)
                L8_8 = A1_1
                L7_7 = A1_1._setMapMarker
                L9_9 = nil
                L11_11 = A1_1
                L10_10 = A1_1.getMapMarkerRange
                L11_11 = L10_10(L11_11)
                L7_7(L8_8, L9_9, L10_10, L11_11, L10_10(L11_11))
              else
                L8_8 = A1_1
                L7_7 = A1_1._setNameplateColor
                L9_9 = 1
                L10_10 = 0.5
                L11_11 = 0.5
                L7_7(L8_8, L9_9, L10_10, L11_11, 0.5, 1)
                L8_8 = A1_1
                L7_7 = A1_1._setMapMarker
                L9_9 = nil
                L7_7(L8_8, L9_9)
              end
            end
          end
        end
      end
    end
  end
end
