require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceChocoboLender", "NpcBaseClass")
function PopulaceChocoboLender.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 7604, "populaceChocoboLender")
  L1_1 = {
    {"townId", "integer8"},
    {
      "companyRank",
      "integer8"
    }
  }
  A0_0:initWork(nil, L1_1)
  if A0_0:getActorClassId() == 1500006 then
    A0_0.work.townId = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1500061 then
    A0_0.work.townId = 2
    break
  elseif A0_0:getActorClassId() == 1000840 then
  else
  end
  if A0_0:getActorClassId() == 1500059 then
    A0_0.work.townId = 3
    do break end
    break
  else
  end
  A0_0.work.companyRank = 31
  A0_0:_setGroundOn(false)
end
function PopulaceChocoboLender.eventTalkWelcome(A0_2, A1_3)
  A0_2:startCliantTalkTurn(2, A1_3)
  A0_2:_runCharaScheduler(353959936)
  if A0_2:getActorClassId() == 1500006 then
    A0_2:say(A0_2, 57, 0)
    break
  else
  end
  if A0_2:getActorClassId() == 1500061 then
    A0_2:say(A0_2, 36, 0)
    break
  else
  end
  if A0_2:getActorClassId() == 1000840 then
    A0_2:say(A0_2, 2, 0)
    break
  else
  end
  if A0_2:getActorClassId() == 1500059 then
    A0_2:say(A0_2, 84, 0)
    do break end
    break
  else
  end
end
function PopulaceChocoboLender.eventAskMainMenu(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9, A6_10, A7_11)
  local L8_12, L9_13, L10_14
  L9_13 = A0_4
  L8_12 = A0_4.getActorClassId
  L8_12 = L8_12(L9_13)
  if L8_12 == 1500059 then
    A4_8 = false
    A5_9 = false
    A6_10 = false
  end
  L8_12 = A5_9
  L9_13 = A0_4.work
  L9_13 = L9_13.townId
  L10_14 = A1_5._getBelongGrandCompany
  L10_14 = L10_14(A1_5)
  if L9_13 ~= L10_14 then
    L8_12 = false
  end
  L9_13 = 0
  repeat
    L10_14 = worldMaster
    L10_14 = L10_14.askMultipleTextMacro
    L10_14 = L10_14(L10_14, A0_4, A0_4, 1, 104, 7, 1, A4_8, A5_9, A6_10, L8_12, true, true, true, A0_4.work.townId, 0, 0, 0, 0, 0, 0)
    L9_13 = L10_14
    if L9_13 == 1 then
      return L9_13
    elseif L9_13 == 2 then
      L10_14 = A0_4.eventUseMyChocobo
      L10_14 = L10_14(A0_4, A1_5, A7_11)
      if L10_14 == true then
        return L9_13
      end
    elseif L9_13 == 3 then
      L10_14 = A0_4.eventSelectChocoboWare
      L10_14 = L10_14(A0_4, A1_5, A7_11)
      if L10_14 ~= 0 then
        return L9_13, L10_14
      end
    elseif L9_13 == 4 then
      L10_14 = A0_4.eventLookChocoboWare
      L10_14(A0_4, A1_5)
    elseif L9_13 == 5 then
      L10_14 = A0_4.eventUseRentalChocobo
      L10_14 = L10_14(A0_4, A1_5, A2_6, A3_7)
      if L10_14 == true then
        return L9_13
      end
    elseif L9_13 == 6 then
      L10_14 = A0_4.eventInformationRental
      L10_14(A0_4)
    elseif L9_13 == 7 then
      L9_13 = -3
      break
    else
      L9_13 = 0
      break
    end
  until L9_13 < 1
  return L9_13
end
function PopulaceChocoboLender.eventUseMyChocobo(A0_15, A1_16, A2_17)
  local L3_18, L4_19
  L3_18 = 81
  L4_19 = "cho0l210"
  if A0_15:getActorClassId() == 1500006 then
    L3_18 = 83
    L4_19 = "cho0l210"
    break
  else
  end
  if A0_15:getActorClassId() == 1500061 then
    L3_18 = 82
    L4_19 = "cho0g210"
    break
  elseif A0_15:getActorClassId() == 1000840 then
  else
  end
  if A0_15:getActorClassId() == 1500059 then
    L3_18 = 81
    L4_19 = "cho0u210"
    do break end
    break
  else
  end
  if worldMaster:askMultipleTextMacro(A0_15, A0_15, 1, 78, 2, 0, true, true) == 1 then
    A0_15:say(A0_15, L3_18, 0)
    worldMaster:say(A0_15, 33)
    A1_16:_fadeOut(1)
    A1_16:_waitForFading()
    A0_15:finishCliantTalkTurn()
    if 0 < A1_16:_getBelongGrandCompany() then
      worldMaster:createCutScene(L4_19, A0_15):_delete()
    end
    A1_16:_fadeInAfterWarp()
    return true
  end
  return false
end
function PopulaceChocoboLender.eventUseRentalChocobo(A0_20, A1_21, A2_22, A3_23)
  local L4_24, L5_25, L6_26, L7_27
  L4_24 = 14
  L5_25 = 10
  L6_26 = 8
  L7_27 = A0_20.getActorClassId
  L7_27 = L7_27(A0_20)
  if L7_27 == 1500006 then
    L4_24 = 61
    L5_25 = 59
    L6_26 = 58
    break
  else
  end
  if L7_27 == 1500061 then
    L4_24 = 40
    L5_25 = 38
    L6_26 = 37
    break
  else
  end
  if L7_27 == 1000840 then
    L4_24 = 14
    L5_25 = 10
    L6_26 = 8
    break
  else
  end
  if L7_27 == 1500059 then
    L4_24 = 88
    L5_25 = 86
    L6_26 = 85
    do break end
    break
  else
  end
  if A2_22 >= 10 then
    if A3_23 == true then
      L7_27 = A1_21.getMoneyOnHand
      L7_27 = L7_27(A1_21, 1000001)
      if worldMaster:askMultipleTextMacro(A0_20, A0_20, 2, 11, 2, 1, true, true, 0, L7_27, 0, 0) == 1 then
        A0_20:say(A0_20, L4_24, 0)
        worldMaster:say(A0_20, 33)
        A1_21:_fadeOut(1)
        A1_21:_waitForFading()
        A0_20:finishCliantTalkTurn()
        A1_21:_fadeInAfterWarp()
        return true
      else
        return false
      end
    else
      L7_27 = A0_20._runCharaScheduler
      L7_27(A0_20, 354041856)
      L7_27 = A0_20.say
      L7_27(A0_20, A0_20, L5_25, 0)
    end
  else
    L7_27 = A0_20._runCharaScheduler
    L7_27(A0_20, 354041856)
    L7_27 = A0_20.say
    L7_27(A0_20, A0_20, L6_26, 0)
    L7_27 = worldMaster
    L7_27 = L7_27.say
    L7_27(L7_27, A0_20, 9)
  end
  L7_27 = false
  return L7_27
end
function PopulaceChocoboLender.eventInformationRental(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33, L6_34
  L1_29 = 15
  L2_30 = 16
  L3_31 = 17
  L4_32 = 18
  L5_33 = 19
  L6_34 = 20
  if A0_28:getActorClassId() == 1500006 then
    L1_29 = 62
    L2_30 = 63
    L3_31 = 64
    L4_32 = 65
    L5_33 = 66
    L6_34 = 67
    break
  else
  end
  if A0_28:getActorClassId() == 1500061 then
    L1_29 = 41
    L2_30 = 42
    L3_31 = 43
    L4_32 = 44
    L5_33 = 45
    L6_34 = 46
    break
  else
  end
  if A0_28:getActorClassId() == 1000840 then
    L1_29 = 15
    L2_30 = 16
    L3_31 = 17
    L4_32 = 18
    L5_33 = 19
    L6_34 = 20
    break
  else
  end
  if A0_28:getActorClassId() == 1500059 then
    L1_29 = 3
    L2_30 = 4
    L3_31 = 5
    L4_32 = 6
    L5_33 = 7
    L6_34 = 89
    do break end
    break
  else
  end
  A0_28:_runCharaScheduler(353968128)
  A0_28:say(A0_28, L1_29, 0)
  A0_28:say(A0_28, L2_30, 0)
  A0_28:say(A0_28, L3_31, 0)
  A0_28:say(A0_28, L4_32, 0)
  A0_28:say(A0_28, L5_33, 0)
  A0_28:_runCharaScheduler(354099200)
  A0_28:say(A0_28, L6_34, 0)
end
function PopulaceChocoboLender.eventTalkMyChocobo(A0_35, A1_36)
  local L2_37, L3_38
  L2_37 = "cho0l110"
  L3_38 = 1
  if A0_35:getActorClassId() == 1500006 then
    L2_37 = "cho0l110"
    L3_38 = 1
    break
  else
  end
  if A0_35:getActorClassId() == 1500061 then
    L2_37 = "cho0g110"
    L3_38 = 31
    break
  else
  end
  if A0_35:getActorClassId() == 1000840 then
    L2_37 = "cho0u110"
    L3_38 = 61
    do break end
    break
  else
  end
  A1_36:_fadeOut(0.5)
  A1_36:_waitForFading()
  worldMaster:createCutScene(L2_37, A0_35):_delete()
  A1_36:_wait(1)
  A0_35:visibleChocobo(A1_36, L3_38, true, true)
  A1_36:_fadeIn(1)
end
function PopulaceChocoboLender.eventSetChocoboName(A0_39, A1_40)
  if A1_40 == true then
    worldMaster:say(A0_39, 35)
  end
  return (desktopWidget:askChocoboNamingWidget())
end
function PopulaceChocoboLender.eventAfterChocoboName(A0_41, A1_42, A2_43)
  local L3_44
  L3_44 = "cho0l120"
  if A0_41:getActorClassId() == 1500006 then
    L3_44 = "cho0l120"
    break
  else
  end
  if A0_41:getActorClassId() == 1500061 then
    L3_44 = "cho0g120"
    break
  elseif A0_41:getActorClassId() == 1000840 then
  else
  end
  if A0_41:getActorClassId() == 1500059 then
    L3_44 = "cho0u120"
    do break end
    break
  else
  end
  A0_41:finishCliantTalkTurn()
  A1_42:_wait(2)
  A1_42:_fadeOut(1)
  A1_42:_waitForFading()
  worldMaster:createCutScene(L3_44, A0_41):_delete()
  A0_41:visibleChocobo(A1_42, 0, false, false)
  A1_42:_fadeInAfterWarp()
end
function PopulaceChocoboLender.eventCancelChocoboName(A0_45, A1_46)
  A1_46:_fadeOut(1)
  A1_46:_waitForFading()
  A0_45:visibleChocobo(A1_46, 0, false, false)
  A1_46:_fadeIn(1)
  A1_46:_waitForFading()
  A0_45:finishCliantTalkTurn()
end
function PopulaceChocoboLender.visibleChocobo(A0_47, A1_48, A2_49, A3_50, A4_51)
  if A3_50 == true then
    worldMaster:_transformIntoChocobo(1080101, A2_49)
  else
    worldMaster:_cancelTransformIntoChocobo(1080101)
  end
  if A4_51 == true then
    worldMaster:_aimCameraChocobo(1080101)
  else
    worldMaster:_cancelAimCameraChocobo(1080101)
  end
end
function PopulaceChocoboLender.eventLookChocoboWare(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60
  L2_54 = 81
  L3_55 = 2001017
  L4_56 = 2001018
  L5_57 = 2001019
  L6_58 = 1
  L8_60 = A0_52
  L7_59 = A0_52.getActorClassId
  L7_59 = L7_59(L8_60)
  if L7_59 == 1500006 then
    L2_54 = 102
    L3_55 = 2001017
    L4_56 = 2001018
    L5_57 = 2001019
    L6_58 = 1
    break
  else
  end
  if L7_59 == 1500061 then
    L2_54 = 101
    L3_55 = 2001020
    L4_56 = 2001021
    L5_57 = 2001022
    L6_58 = 31
    break
  else
  end
  if L7_59 == 1000840 then
    L2_54 = 100
    L3_55 = 2001023
    L4_56 = 2001024
    L5_57 = 2001025
    L6_58 = 61
    do break end
    break
  else
  end
  L8_60 = A0_52
  L7_59 = A0_52._runCharaScheduler
  L7_59(L8_60, 353968128)
  L8_60 = A0_52
  L7_59 = A0_52.say
  L7_59(L8_60, A0_52, L2_54, 0, A0_52.work.townId)
  L7_59 = 1
  L8_60 = L6_58
  A1_53:_fadeOut(0.5)
  A1_53:_waitForFading()
  A0_52:visibleChocobo(A1_53, L8_60, true, true)
  A1_53:_fadeIn(0.5)
  A1_53:_waitForFading()
  while true do
    L7_59 = worldMaster:askMultipleTextMacro(A0_52, A0_52, L7_59, 91, 5, 1, true, true, true, true, true, L3_55, L4_56, L5_57, 0, 0)
    if L7_59 == 4 then
      L8_60 = L6_58
    elseif L7_59 == 1 or L7_59 == 2 or L7_59 == 3 then
      L8_60 = L6_58 + L7_59
    else
      A1_53:_fadeOut(0.5)
      A1_53:_waitForFading()
      A0_52:visibleChocobo(A1_53, 1, false, false)
      A1_53:_fadeIn(0.5)
      A1_53:_waitForFading()
      return
    end
    A1_53:_fadeOut(0.5)
    A1_53:_waitForFading()
    worldMaster:_transformIntoChocobo(1080101, L8_60)
    A1_53:_fadeIn(0.5)
    A1_53:_waitForFading()
  end
  return
end
function PopulaceChocoboLender.eventSelectChocoboWare(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66, L6_67, L7_68, L8_69, L9_70, L10_71, L11_72, L12_73
  L3_64 = 1
  L4_65 = 2001017
  L5_66 = 2001018
  L6_67 = 2001019
  L7_68 = false
  L8_69 = false
  L9_70 = false
  L10_71 = true
  L12_73 = A1_62
  L11_72 = A1_62._getBelongGrandCompany
  L11_72 = L11_72(L12_73)
  if L11_72 == 1 then
    L3_64 = 1
    L4_65 = 2001017
    L5_66 = 2001018
    L6_67 = 2001019
    break
  else
  end
  if L11_72 == 2 then
    L3_64 = 31
    L4_65 = 2001020
    L5_66 = 2001021
    L6_67 = 2001022
    break
  else
  end
  if L11_72 == 3 then
    L3_64 = 61
    L4_65 = 2001023
    L5_66 = 2001024
    L6_67 = 2001025
    do break end
    break
  else
  end
  L12_73 = A1_62
  L11_72 = A1_62.hasItem
  L11_72 = L11_72(L12_73, 101, L4_65, 1)
  L7_68 = L11_72
  L12_73 = A1_62
  L11_72 = A1_62.hasItem
  L11_72 = L11_72(L12_73, 101, L5_66, 1)
  L8_69 = L11_72
  L12_73 = A1_62
  L11_72 = A1_62.hasItem
  L11_72 = L11_72(L12_73, 101, L6_67, 1)
  L9_70 = L11_72
  if A2_63 == L3_64 then
    L10_71 = false
  else
    L11_72 = L3_64 + 1
    if A2_63 == L11_72 then
      L7_68 = false
    else
      L11_72 = L3_64 + 2
      if A2_63 == L11_72 then
        L8_69 = false
      else
        L11_72 = L3_64 + 3
        if A2_63 == L11_72 then
          L9_70 = false
        end
      end
    end
  end
  L11_72 = A2_63 - L3_64
  L11_72 = L11_72 + 1
  L12_73 = A2_63
  A1_62:_fadeOut(0.5)
  A1_62:_waitForFading()
  A0_61:visibleChocobo(A1_62, L12_73, true, true)
  A1_62:_fadeIn(0.5)
  A1_62:_waitForFading()
  while true do
    L11_72 = worldMaster:askMultipleTextMacro(A0_61, A0_61, L11_72, 91, 5, 1, L7_68, L8_69, L9_70, L10_71, true, L4_65, L5_66, L6_67, 0, 0)
    if L11_72 == 4 then
      L12_73 = L3_64
    elseif L11_72 == 1 or L11_72 == 2 or L11_72 == 3 then
      L12_73 = L3_64 + L11_72
    else
      A1_62:_fadeOut(0.5)
      A1_62:_waitForFading()
      A0_61:visibleChocobo(A1_62, 0, false, false)
      A1_62:_fadeIn(0.5)
      A1_62:_waitForFading()
      return 0
    end
    A1_62:_fadeOut(0.5)
    A1_62:_waitForFading()
    worldMaster:_transformIntoChocobo(1080101, L12_73)
    A1_62:_fadeIn(0.5)
    A1_62:_waitForFading()
    if worldMaster:askMultipleTextMacro(A0_61, A0_61, 2, 97, 2, 1, true, true, 0, 0) == 1 then
      A1_62:_fadeOut(0.5)
      A1_62:_waitForFading()
      A0_61:visibleChocobo(A1_62, 0, false, false)
      A1_62:_fadeIn(0.5)
      A1_62:_waitForFading()
      return L12_73
    else
      A1_62:_fadeOut(0.5)
      A1_62:_waitForFading()
      worldMaster:_transformIntoChocobo(1080101, A2_63)
      A1_62:_fadeIn(0.5)
      A1_62:_waitForFading()
      L12_73 = A2_63
    end
  end
  return 0
end
function PopulaceChocoboLender.eventTalkStepBreak(A0_74, A1_75)
  if A1_75 ~= 0 then
    if A0_74:getActorClassId() == 1500006 then
      A0_74:say(A0_74, 60, 0)
      break
    else
    end
    if A0_74:getActorClassId() == 1500061 then
      A0_74:say(A0_74, 39, 0)
      break
    else
    end
    if A0_74:getActorClassId() == 1000840 then
      A0_74:say(A0_74, 34, 0)
      break
    else
    end
    if A0_74:getActorClassId() == 1500059 then
      A0_74:say(A0_74, 87, 0)
      break
    else
    end
  else
  end
  A0_74:finishCliantTalkTurn()
  return 0
end
