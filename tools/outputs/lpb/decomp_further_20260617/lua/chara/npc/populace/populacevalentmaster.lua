require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceValentMaster", "NpcBaseClass")
function PopulaceValentMaster.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(8032, "populaceValentMaster")
  A0_0:_setGroundOn(false)
end
function PopulaceValentMaster.valentAfirstAsk(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(L3_4, 2, A1_2)
  L3_4 = A0_1
  L2_3 = A0_1._runCharaScheduler
  L2_3(L3_4, 69197824)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 2, 0)
  L2_3 = nil
  L3_4 = A0_1.getTownMasterType
  L3_4 = L3_4(A0_1)
  while true do
    L2_3 = A0_1:askExtendWidget(A0_1, 3, 5, 1, 1)
    if L2_3 == 1 then
      A0_1:_runCharaScheduler(353972224)
      A0_1:say(A0_1, 9, 0)
      A0_1:say(A0_1, 10, 0)
      worldMaster:say(A0_1, 11)
      A0_1:_runCharaScheduler(67727360)
      A0_1:say(A0_1, 12, 0, L3_4)
      A0_1:say(A0_1, 13, 0)
      worldMaster:say(A0_1, 14)
    else
      break
    end
  end
  return L2_3
end
function PopulaceValentMaster.valentANowTribe(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = A0_5.getTownMasterType
  L3_8 = L3_8(A0_5)
  A0_5:say(A0_5, 15, 0, L3_8, A2_7)
  A0_5:say(A0_5, 16, 0, L3_8)
end
function PopulaceValentMaster.valentAmemberAgainst(A0_9, A1_10)
  A0_9:_runCharaScheduler(67727360)
  A0_9:say(A0_9, 17, 0)
  A0_9:valentAgoodAayAsClient(A1_10)
end
function PopulaceValentMaster.valentAitemFullMessage(A0_11, A1_12)
  A0_11:say(A0_11, 18, 0)
  A0_11:valentAgoodAayAsClient(A1_12)
end
function PopulaceValentMaster.valentAheartChokerGet(A0_13)
  A0_13:say(A0_13, 19, 0)
  A0_13:say(A0_13, 20, 0)
end
function PopulaceValentMaster.valentAitemDayFaile(A0_14, A1_15)
  A0_14:say(A0_14, 30, 0)
  A0_14:valentAgoodAayAsClient(A1_15)
end
function PopulaceValentMaster.valentAchocolateGet(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21
  L2_18 = A0_16
  L1_17 = A0_16.say
  L3_19 = A0_16
  L4_20 = 29
  L5_21 = 0
  L1_17(L2_18, L3_19, L4_20, L5_21, A0_16:getTownMasterType())
end
function PopulaceValentMaster.valentAmemberGCAgainst(A0_22, A1_23, A2_24, A3_25)
  local L4_26
  L4_26 = A0_22.getTownMasterType
  L4_26 = L4_26(A0_22)
  A0_22:_runCharaScheduler(353968128)
  A0_22:say(A0_22, 21, 0, L4_26, A2_24)
  if A3_25 == false then
    A0_22:say(A0_22, 22, 0, L4_26)
    A0_22:valentAgoodAayAsClient(A1_23)
  else
    A0_22:say(A0_22, 118, 0, L4_26)
  end
end
function PopulaceValentMaster.valentAgcOk(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  local L6_33
  L6_33 = A0_27.getTownMasterType
  L6_33 = L6_33(A0_27)
  A0_27:_runCharaScheduler(353968128)
  A0_27:say(A0_27, 23, 0, L6_33, A2_29)
  A0_27:say(A0_27, 24, 0, L6_33)
  A0_27:say(A0_27, 25, 0, A3_30, A4_31, A5_32)
  if A3_30 == 1 and A4_31 == 1 and A5_32 == 1 then
    A0_27:say(A0_27, 26, 0)
  else
    A0_27:say(A0_27, 28, 0)
  end
end
function PopulaceValentMaster.valentAgoodBay(A0_34, A1_35)
  A0_34:_runCharaScheduler(354062336)
  A0_34:finishCliantTalkTurn()
end
function PopulaceValentMaster.valentAgoodAayAsClient(A0_36, A1_37)
  A0_36:_runCharaScheduler(354062336)
  A0_36:finishCliantTalkTurn()
end
function PopulaceValentMaster.valentBfirstAsk(A0_38, A1_39)
  local L2_40
  L2_40 = A0_38.startCliantTalkTurn
  L2_40(A0_38, 2, A1_39)
  L2_40 = A0_38._runCharaScheduler
  L2_40(A0_38, 67727360)
  L2_40 = A0_38.say
  L2_40(A0_38, A0_38, 34, 0)
  L2_40 = nil
  while true do
    L2_40 = A0_38:askExtendWidget(A0_38, 35, 5, 1, 1)
    if L2_40 == 1 then
      A0_38:say(A0_38, 41, 0)
      A0_38:_runCharaScheduler(100294562)
      A0_38:say(A0_38, 42, 0)
      worldMaster:say(A0_38, 43)
      worldMaster:say(A0_38, 45)
      A0_38:_runCharaScheduler(83980288)
      A0_38:say(A0_38, 46, 0)
      A0_38:say(A0_38, 47, 0)
      worldMaster:say(A0_38, 48)
      worldMaster:say(A0_38, 49)
      worldMaster:say(A0_38, 50)
      A0_38:_runCharaScheduler(354103296)
      A0_38:say(A0_38, 51, 0)
      worldMaster:say(A0_38, 52)
      worldMaster:say(A0_38, 53)
    else
      break
    end
  end
  return L2_40
end
function PopulaceValentMaster.valentBmemberAgainst(A0_41, A1_42)
  A0_41:say(A0_41, 54, 0)
  A0_41:valentBgoodBayAsClient(A1_42)
end
function PopulaceValentMaster.valentBshortCount(A0_43, A1_44)
  A0_43:_runCharaScheduler(354078720)
  A0_43:say(A0_43, 55, 0)
  worldMaster:say(A0_43, 56)
  A0_43:valentBgoodBayAsClient(A1_44)
end
function PopulaceValentMaster.valentBresetAns(A0_45, A1_46)
  A0_45:_runCharaScheduler(354045952)
  A0_45:say(A0_45, 57, 0)
  worldMaster:say(A0_45, 58)
  if A0_45:askExtendWidget(A0_45, 59, 2, 1, 1) ~= 1 then
    A0_45:valentBgoodBayAsClient(A1_46)
  end
  return (A0_45:askExtendWidget(A0_45, 59, 2, 1, 1))
end
function PopulaceValentMaster.valentBsendItem(A0_47, A1_48, A2_49)
  if A2_49 == 1 then
    A0_47:say(A0_47, 62, 0)
    A0_47:_runCharaScheduler(68378624)
    A0_47:say(A0_47, 63, 0)
  else
    A0_47:say(A0_47, 64, 0)
    A0_47:_runCharaScheduler(68378624)
    A0_47:say(A0_47, 65, 0)
  end
end
function PopulaceValentMaster.valentBsendItemRelief(A0_50, A1_51, A2_52)
  A0_50:say(A0_50, 57, 0)
  if A2_52 == 1 then
    A0_50:say(A0_50, 62, 0)
    A0_50:_runCharaScheduler(68378624)
    A0_50:say(A0_50, 63, 0)
  else
    A0_50:say(A0_50, 64, 0)
    A0_50:_runCharaScheduler(68378624)
    A0_50:say(A0_50, 65, 0)
  end
end
function PopulaceValentMaster.valentBitemFullMessage(A0_53, A1_54)
  A0_53:say(A0_53, 66, 0)
  A0_53:valentBgoodBayAsClient(A1_54)
end
function PopulaceValentMaster.valentBnowCount(A0_55, A1_56, A2_57)
  A0_55:say(A0_55, 67, 0)
  worldMaster:say(A0_55, 68, A2_57)
end
function PopulaceValentMaster.valentBnowMax(A0_58, A1_59, A2_60, A3_61, A4_62)
  A0_58:say(A0_58, 32, 0, 1, A2_60, A3_61)
  worldMaster:say(A0_58, 33, A4_62)
end
function PopulaceValentMaster.valentBnowMaxNone(A0_63, A1_64)
  A0_63:say(A0_63, 113, 0)
end
function PopulaceValentMaster.valentBgoodBay(A0_65, A1_66)
  A0_65:_runCharaScheduler(354062336)
  A0_65:finishCliantTalkTurn()
end
function PopulaceValentMaster.valentBgoodBayAsClient(A0_67, A1_68)
  A0_67:_runCharaScheduler(354062336)
  A0_67:finishCliantTalkTurn()
end
function PopulaceValentMaster.valentCfirstAsk(A0_69, A1_70)
  local L2_71
  L2_71 = A0_69.startCliantTalkTurn
  L2_71(A0_69, 2, A1_70)
  L2_71 = A0_69._runCharaScheduler
  L2_71(A0_69, 67723264)
  L2_71 = A0_69.say
  L2_71(A0_69, A0_69, 70, 0)
  L2_71 = nil
  L2_71 = A0_69:askExtendWidget(A0_69, 71, 4, 1, 1)
  return L2_71
end
function PopulaceValentMaster.valentCPairAsk(A0_72, A1_73)
  A0_72:_runCharaScheduler(353964032)
  A0_72:say(A0_72, 85, 0)
  return (A0_72:askExtendWidget(A0_72, 86, 2, 1, 1))
end
function PopulaceValentMaster.valentCwaitExplan(A0_74, A1_75)
  worldMaster:say(A0_74, 89)
  worldMaster:say(A0_74, 90)
  A0_74:_runCharaScheduler(353959936)
  A0_74:say(A0_74, 91, 0, A0_74:getTownMasterType())
end
function PopulaceValentMaster.valentCwithinAsk(A0_76, A1_77, A2_78)
  A0_76:_runCharaScheduler(353968128)
  A0_76:say(A0_76, 76, 0)
  A0_76:say(A0_76, 77, 0, A2_78)
  return (A0_76:askExtendWidget(A0_76, 78, 2, 1, 1))
end
function PopulaceValentMaster.valentCpartyExplan(A0_79, A1_80, A2_81)
  A0_79:_runCharaScheduler(353972224)
  A0_79:say(A0_79, 81, 0)
  worldMaster:say(A0_79, 82, A2_81)
  A0_79:_runCharaScheduler(353976320)
  A0_79:say(A0_79, 83, 0, A0_79:getTownMasterType())
  A0_79:say(A0_79, 84, 0, A2_81)
end
function PopulaceValentMaster.valentCchocoPairAsk(A0_82, A1_83)
  A0_82:_runCharaScheduler(353964032)
  A0_82:say(A0_82, 100, 0)
  return (A0_82:askExtendWidget(A0_82, 101, 2, 1, 1))
end
function PopulaceValentMaster.valentCchocowaitExplan(A0_84, A1_85)
  worldMaster:say(A0_84, 104)
  worldMaster:say(A0_84, 105)
  A0_84:_runCharaScheduler(353959936)
  A0_84:say(A0_84, 106, 0)
end
function PopulaceValentMaster.valentCchocowithinAsk(A0_86, A1_87, A2_88)
  A0_86:_runCharaScheduler(353968128)
  A0_86:say(A0_86, 92, 0)
  A0_86:say(A0_86, 93, 0, A2_88)
  return (A0_86:askExtendWidget(A0_86, 94, 2, 1, 1))
end
function PopulaceValentMaster.valentCchocopartyExplan(A0_89, A1_90, A2_91)
  A0_89:_runCharaScheduler(353972224)
  A0_89:say(A0_89, 97, 0)
  worldMaster:say(A0_89, 98, A2_91)
  A0_89:_runCharaScheduler(353976320)
  A0_89:say(A0_89, 99, 0)
end
function PopulaceValentMaster.valentCchocoNone(A0_92, A1_93)
  A0_92:say(A0_92, 107, 0)
  A0_92:valentCBgoodBayAsClient(A1_93)
end
function PopulaceValentMaster.valentCchancelAsk(A0_94, A1_95)
  return (A0_94:askExtendWidget(A0_94, 109, 2, 1, 1))
end
function PopulaceValentMaster.valentCchancelOk(A0_96, A1_97)
  worldMaster:say(A0_96, 112)
end
function PopulaceValentMaster.valentCchancelNg(A0_98, A1_99)
  worldMaster:say(A0_98, 108)
  A0_98:valentCBgoodBayAsClient(A1_99)
end
function PopulaceValentMaster.valentCalreadyReservation(A0_100, A1_101)
  A0_100:say(A0_100, 115, 0)
  A0_100:valentCBgoodBayAsClient(A1_101)
end
function PopulaceValentMaster.valentCerrParty(A0_102, A1_103)
  worldMaster:say(A0_102, 116)
  A0_102:valentCBgoodBayAsClient(A1_103)
end
function PopulaceValentMaster.valentCerrMenyParty(A0_104, A1_105)
  A0_104:say(A0_104, 114, 0)
  A0_104:valentCBgoodBayAsClient(A1_105)
end
function PopulaceValentMaster.valentCnoneChocolate(A0_106, A1_107)
  worldMaster:say(A0_106, 117, 0)
  A0_106:valentCBgoodBayAsClient(A1_107)
end
function PopulaceValentMaster.valentCgoodBay(A0_108, A1_109)
  A0_108:_runCharaScheduler(354062336)
  A0_108:finishCliantTalkTurn()
end
function PopulaceValentMaster.valentCBgoodBayAsClient(A0_110, A1_111)
  A0_110:_runCharaScheduler(354062336)
  A0_110:finishCliantTalkTurn()
end
function PopulaceValentMaster.getTownMasterType(A0_112)
  if A0_112:getActorClassId() == 1001841 or A0_112:getActorClassId() == 1001844 or A0_112:getActorClassId() == 1001847 then
    return 1
  elseif A0_112:getActorClassId() == 1001842 or A0_112:getActorClassId() == 1001845 or A0_112:getActorClassId() == 1001848 then
    return 2
  elseif A0_112:getActorClassId() == 1001843 or A0_112:getActorClassId() == 1001846 or A0_112:getActorClassId() == 1001849 then
    return 3
  else
    return 0
  end
end
