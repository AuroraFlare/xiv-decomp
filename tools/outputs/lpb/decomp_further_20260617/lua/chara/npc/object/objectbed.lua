require("/Chara/Npc/NpcBaseClass")
_defineClass("ObjectBed", "NpcBaseClass")
function ObjectBed.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._setGroundOn
  L1_1(A0_0, false)
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 10240, "objectBed")
  L1_1 = {
    {"isInBed", "boolean"},
    {
      "isInLoginEvent",
      "boolean"
    }
  }
  A0_0:initWork(nil, L1_1)
  if worldMaster:_getMyPlayer():_readyInnBed(A0_0) == true then
    A0_0.work.isInLoginEvent = true
  end
end
function ObjectBed.processUpdateInitWork(A0_2, A1_3)
  if A0_2.work.isInLoginEvent == true then
    A0_2:_setNameplateVisible(false)
    A0_2.work.isInLoginEvent = false
  end
end
function ObjectBed.askLogout(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9, L6_10
  L3_7 = A1_5
  L2_6 = A1_5._forceCameraTPSMode
  L2_6(L3_7)
  L2_6 = worldMaster
  L3_7 = L2_6
  L2_6 = L2_6.ask
  L4_8 = A0_4
  L5_9 = A0_4
  L6_10 = 2
  L2_6 = L2_6(L3_7, L4_8, L5_9, L6_10, 4)
  if L2_6 == 2 or L2_6 == 3 then
    L4_8 = A1_5
    L3_7 = A1_5._forceCameraTPSMode
    L5_9 = true
    L3_7(L4_8, L5_9)
    L4_8 = A1_5
    L3_7 = A1_5._fadeOut
    L5_9 = 1
    L3_7(L4_8, L5_9)
    L4_8 = A1_5
    L3_7 = A1_5._waitForFading
    L3_7(L4_8)
    L4_8 = A1_5
    L3_7 = A1_5._setNameplateVisible
    L5_9 = false
    L3_7(L4_8, L5_9)
    L4_8 = A0_4
    L3_7 = A0_4._setNameplateVisible
    L5_9 = false
    L3_7(L4_8, L5_9)
    L3_7, L4_8, L5_9, L6_10 = nil, nil, nil, nil
    if A0_4:getActorClassId() == 1200378 then
      L3_7 = -162.42
      L4_8 = 0
      L5_9 = -154.21
      L6_10 = -1.56
    elseif A0_4:getActorClassId() == 1200379 then
      L3_7 = 157.55
      L4_8 = 0
      L5_9 = 165.05
      L6_10 = -1.53
    else
      if A0_4:getActorClassId() == 1200380 then
        L3_7 = -2.65
        L4_8 = 0
        L5_9 = 3.94
        L6_10 = -1.52
      else
      end
    end
    A1_5:_setPosDirInn(L3_7, L4_8, L5_9, L6_10)
    desktopWidget:_setTargetCharacter(1, nil)
    A1_5:_fadeIn(1)
    A1_5:_waitForFading()
    if L2_6 == 3 then
      worldMaster:notify(worldMaster, 34103)
    else
      worldMaster:notify(worldMaster, 34132)
    end
    A0_4.work.isInBed = true
    A1_5:_runCharaScheduler(83783680)
    A1_5:_wait(7)
    A1_5:_fadeOut(1)
    A1_5:_waitForFading()
  end
  return L2_6
end
function ObjectBed.debugAsk(A0_11, A1_12, A2_13)
  if nil == #{
    "\227\130\175\227\130\168\227\130\185\227\131\136(\227\131\173\227\130\176\227\130\164\227\131\179\227\130\164\227\131\153\227\131\179\227\131\136)",
    "\227\130\175\227\130\168\227\130\185\227\131\136(\227\129\149\227\130\136\227\129\170\227\130\137)",
    "\227\129\138\227\129\190\227\129\145",
    "\230\174\139\229\191\181\232\179\158",
    "\227\130\162\227\130\191\227\131\1701",
    "\227\130\162\227\130\191\227\131\1702",
    "\227\130\162\227\130\191\227\131\1703",
    "\227\130\162\227\130\191\227\131\1704",
    "\227\130\162\227\130\191\227\131\1705",
    "\227\130\162\227\130\191\227\131\1706",
    "\227\130\162\227\130\191\227\131\1707",
    "\227\130\162\227\130\191\227\131\1708",
    "\227\130\162\227\130\191\227\131\1709",
    "\227\130\162\227\130\191\227\131\17010",
    "\227\130\162\227\130\191\227\131\17011",
    "\227\130\162\227\130\191\227\131\17012",
    "\229\164\137\227\129\136\227\129\170\227\129\132",
    "\227\131\173\227\130\176\227\130\162\227\130\166\227\131\136\227\129\151\227\129\170\227\129\132"
  } then
    A0_11:cancelLogout(A1_12)
  end
  return nil
end
function ObjectBed._onEventCancel(A0_14, A1_15, A2_16)
  A0_14:cancelLogout(A1_15)
end
function ObjectBed.cancelLogout(A0_17, A1_18)
  if A0_17.work.isInBed then
    A0_17.work.isInBed = false
    A1_18:_setDir(A1_18:_getDir() + _math.pi)
    A1_18:_runCharaScheduler(83787776)
    A1_18:_wait(1)
    A1_18:_runCharaScheduler(83791872)
    A1_18:_wait(8)
  end
end
