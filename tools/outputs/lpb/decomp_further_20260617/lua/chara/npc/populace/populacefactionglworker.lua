require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceFactionGLWorker", "NpcBaseClass")
function PopulaceFactionGLWorker.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {
    L2_2,
    {"iconGil", "integer32"},
    {
      "guildleveId",
      "integer16"
    },
    {"clearTime", "integer16"},
    {
      "missionBonus",
      "integer32"
    },
    {
      "difficultyBonus",
      "integer32"
    },
    {
      "factionNumber",
      "integer8"
    },
    {
      "factionBonus",
      "integer32"
    },
    {
      "factionCredit",
      "integer8"
    },
    {
      "glRewardItem",
      "integer32"
    },
    {
      "glRewardNumber",
      "integer32"
    },
    {
      "glRewardSubItem",
      "integer32"
    },
    {
      "glRewardSubNumber",
      "integer32"
    },
    {"difficulty", "integer8"}
  }
  L2_2 = {"talkStep", "integer8"}
  L2_2 = A0_0.initWork
  L2_2(A0_0, nil, L1_1)
  L2_2 = A0_0._setGroundOn
  L2_2(A0_0, true)
  L2_2 = itemDataSheet
  L2_2 = L2_2._loadKeyTemporarily
  L2_2(L2_2, 1000001, 1000001)
  L2_2 = itemDataSheet
  L2_2 = L2_2._getData
  L2_2 = L2_2(L2_2, 1000001, 36)
  A0_0:setTempWork("iconGil", L2_2)
  A0_0.work.talkStep = 0
  A0_0:_loadTextDataPermanently(30, "populaceFactionGLWorker")
end
function PopulaceFactionGLWorker.eventTalkFaction01Start(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8)
  local L6_9
  L6_9 = worldMaster
  L6_9 = L6_9._getMyPlayer
  L6_9 = L6_9(L6_9)
  A0_3:startCliantTalkTurn(2, L6_9)
  if A2_5 == 0 then
    A0_3:_runCharaScheduler(69226496)
    if A1_4 then
      A0_3:say(A0_3, 1, 0)
      A0_3:say(A0_3, 317, 0)
      A0_3:say(A0_3, 2, 0)
      A0_3:_runCharaScheduler(70799360)
      A0_3:say(A0_3, 3, 0)
      A0_3:say(A0_3, 4, 0)
    elseif A3_6 == 1011 then
      A0_3:say(A0_3, 144, 0)
    elseif A3_6 == 1012 then
      A0_3:_runCharaScheduler(83968000)
      A0_3:say(A0_3, 153, 0)
      A0_3:say(A0_3, 154, 0)
    elseif A3_6 == 1013 then
      A0_3:say(A0_3, 160, 0)
    elseif A3_6 == 1014 then
      A0_3:say(A0_3, 167, 0)
    elseif A3_6 == 1015 then
      A0_3:_runCharaScheduler(83968000)
      A0_3:say(A0_3, 173, 0)
    elseif A3_6 == 1016 then
      A0_3:say(A0_3, 179, 0)
    elseif A3_6 == 1017 then
      A0_3:say(A0_3, 274, 0)
    elseif A3_6 == 1018 then
      A0_3:say(A0_3, 256, 0)
    elseif A3_6 == 1019 then
      A0_3:say(A0_3, 265, 0)
    elseif A3_6 == 1020 then
      A0_3:say(A0_3, 318, 0)
    else
      A0_3:say(A0_3, 5, 0)
    end
    if A3_6 == 1011 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 145, 0)
      A0_3:say(A0_3, 146, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 147, 0)
      A0_3:say(A0_3, 148, 0)
    elseif A3_6 == 1012 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 155, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 156, 0)
    elseif A3_6 == 1013 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 161, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 162, 0)
    elseif A3_6 == 1014 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 168, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 169, 0)
    elseif A3_6 == 1015 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 174, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 175, 0)
    elseif A3_6 == 1016 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 180, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 181, 0)
    elseif A3_6 == 1017 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 275, 0)
      A0_3:say(A0_3, 276, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 277, 0)
      A0_3:say(A0_3, 278, 0)
    elseif A3_6 == 1018 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 257, 0)
      A0_3:say(A0_3, 258, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 259, 0)
      A0_3:say(A0_3, 260, 0)
    elseif A3_6 == 1019 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 266, 0)
      A0_3:say(A0_3, 267, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 268, 0)
      A0_3:say(A0_3, 269, 0)
    elseif A3_6 == 1020 then
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 319, 0)
      A0_3:say(A0_3, 320, 0)
      A0_3:say(A0_3, 321, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 322, 0)
      A0_3:say(A0_3, 323, 0)
    else
      A0_3:_runCharaScheduler(70803456)
      A0_3:say(A0_3, 6, 0)
      A0_3:_runCharaScheduler(354000896)
      A0_3:say(A0_3, 7, 0)
    end
  elseif A3_6 == 1011 then
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 149, 0)
  elseif A3_6 == 1017 then
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 279, 0)
  elseif A3_6 == 1018 then
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 261, 0)
  elseif A3_6 == 1019 then
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 270, 0)
  elseif A3_6 == 1020 then
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 324, 0)
  else
    A0_3:_runCharaScheduler(354000896)
    A0_3:say(A0_3, 8, 0, A4_7, A5_8)
  end
  A0_3:finishCliantTalkTurn()
  return true
end
function PopulaceFactionGLWorker.eventTalkFaction02Start(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15)
  local L6_16
  L6_16 = worldMaster
  L6_16 = L6_16._getMyPlayer
  L6_16 = L6_16(L6_16)
  A0_10:startCliantTalkTurn(2, L6_16)
  if A2_12 == 0 then
    if A3_13 == 1118 or A3_13 == 1119 then
      A0_10:_runCharaScheduler(353980416)
    else
      A0_10:_runCharaScheduler(69246976)
    end
    if A3_13 == 1118 then
      A0_10:say(A0_10, 341, 0)
    elseif A3_13 == 1119 then
      A0_10:say(A0_10, 349, 0)
    elseif A1_11 then
      if A3_13 == 1111 then
        A0_10:say(A0_10, 185, 0)
        A0_10:say(A0_10, 186, 0)
        A0_10:_runCharaScheduler(67727360)
        A0_10:say(A0_10, 187, 0)
        A0_10:say(A0_10, 188, 0)
        A0_10:_runCharaScheduler(83890176)
        A0_10:say(A0_10, 189, 0)
      else
        A0_10:say(A0_10, 11, 0)
        A0_10:say(A0_10, 12, 0)
        A0_10:_runCharaScheduler(67727360)
        A0_10:say(A0_10, 13, 0)
        A0_10:say(A0_10, 14, 0)
        A0_10:_runCharaScheduler(83890176)
        A0_10:say(A0_10, 15, 0)
      end
    elseif A3_13 == 1111 then
      A0_10:say(A0_10, 190, 0)
      A0_10:say(A0_10, 191, 0)
    elseif A3_13 == 1112 then
      A0_10:say(A0_10, 197, 0)
    elseif A3_13 == 1113 then
      A0_10:say(A0_10, 203, 0)
    elseif A3_13 == 1114 then
      A0_10:say(A0_10, 283, 0)
    elseif A3_13 == 1115 then
      A0_10:say(A0_10, 309, 0)
    elseif A3_13 == 1116 then
      A0_10:say(A0_10, 292, 0)
    elseif A3_13 == 1117 then
      A0_10:say(A0_10, 300, 0)
    else
      A0_10:say(A0_10, 16, 0)
    end
    if A3_13 == 1111 then
      A0_10:say(A0_10, 192, 0)
    elseif A3_13 == 1112 then
      A0_10:say(A0_10, 198, 0)
    elseif A3_13 == 1113 then
      A0_10:say(A0_10, 204, 0)
    elseif A3_13 == 1113 then
      A0_10:say(A0_10, 204, 0)
    elseif A3_13 == 1114 then
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 284, 0)
      A0_10:say(A0_10, 285, 0)
      A0_10:say(A0_10, 286, 0)
      A0_10:_runCharaScheduler(70799360)
      A0_10:say(A0_10, 287, 0)
      A0_10:say(A0_10, 288, 0)
    elseif A3_13 == 1115 then
      A0_10:_runCharaScheduler(70799360)
      A0_10:say(A0_10, 310, 0)
      A0_10:say(A0_10, 311, 0)
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 312, 0)
      A0_10:say(A0_10, 313, 0)
    elseif A3_13 == 1116 then
      A0_10:_runCharaScheduler(70799360)
      A0_10:say(A0_10, 293, 0)
      A0_10:say(A0_10, 294, 0)
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 295, 0)
      A0_10:say(A0_10, 296, 0)
    elseif A3_13 == 1117 then
      A0_10:_runCharaScheduler(70799360)
      A0_10:say(A0_10, 301, 0)
      A0_10:say(A0_10, 302, 0)
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 303, 0)
      A0_10:say(A0_10, 304, 0)
    elseif A3_13 == 1118 then
      A0_10:_runCharaScheduler(67887104)
      A0_10:say(A0_10, 342, 0)
      A0_10:say(A0_10, 343, 0)
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 344, 0)
      A0_10:say(A0_10, 345, 0)
    elseif A3_13 == 1119 then
      A0_10:_runCharaScheduler(69197824)
      A0_10:say(A0_10, 350, 0)
      A0_10:say(A0_10, 351, 0)
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 352, 0)
      A0_10:say(A0_10, 353, 0)
    else
      A0_10:_runCharaScheduler(354004992)
      A0_10:say(A0_10, 17, 0, A4_14, A5_15)
      A0_10:say(A0_10, 18, 0)
      A0_10:_runCharaScheduler(70799360)
      A0_10:say(A0_10, 19, 0)
    end
  elseif A3_13 == 1111 then
    A0_10:say(A0_10, 193, 0)
  elseif A3_13 == 1112 then
    A0_10:say(A0_10, 199, 0)
  elseif A3_13 == 1113 then
    A0_10:say(A0_10, 205, 0)
  elseif A3_13 == 1114 then
    A0_10:say(A0_10, 289, 0)
  elseif A3_13 == 1115 then
    A0_10:say(A0_10, 314, 0)
  elseif A3_13 == 1116 then
    A0_10:say(A0_10, 297, 0)
  elseif A3_13 == 1117 then
    A0_10:say(A0_10, 305, 0)
  elseif A3_13 == 1118 then
    A0_10:say(A0_10, 346, 0)
  elseif A3_13 == 1119 then
    A0_10:say(A0_10, 354, 0)
  else
    A0_10:_runCharaScheduler(354004992)
    A0_10:say(A0_10, 20, 0, A4_14, A5_15)
  end
  A0_10:finishCliantTalkTurn()
  return true
end
function PopulaceFactionGLWorker.eventTalkFaction03Start(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22)
  local L6_23
  L6_23 = worldMaster
  L6_23 = L6_23._getMyPlayer
  L6_23 = L6_23(L6_23)
  if A5_22 then
    A0_17:startCliantTalkTurn(2, L6_23)
    A0_17:_wait(2)
  else
    A0_17:startCliantTalkTurn(1, L6_23)
  end
  if A2_19 == 0 then
    A0_17:_runCharaScheduler(70795264)
    if A3_20 == 1214 then
      A0_17:say(A0_17, 328, 0)
    elseif A1_18 then
      A0_17:say(A0_17, 24, 0)
      A0_17:say(A0_17, 25, 0)
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 26, 0)
      A0_17:_runCharaScheduler(67887104)
      A0_17:say(A0_17, 27, 0)
      A0_17:_runCharaScheduler(67723264)
      A0_17:say(A0_17, 28, 0)
    elseif A3_20 == 1211 then
      A0_17:say(A0_17, 210, 0)
    elseif A3_20 == 1211 then
      A0_17:say(A0_17, 225, 0)
    elseif A3_20 == 1211 then
      A0_17:say(A0_17, 242, 0)
    else
      A0_17:say(A0_17, 29, 0)
    end
    if A3_20 == 1203 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 30, 0)
      A0_17:say(A0_17, 31, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 32, 0)
      A0_17:say(A0_17, 33, 0)
    elseif A3_20 == 1202 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 42, 0)
      A0_17:say(A0_17, 43, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 44, 0)
      A0_17:say(A0_17, 45, 0)
    elseif A3_20 == 1201 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 55, 0)
      A0_17:say(A0_17, 56, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 57, 0)
      A0_17:say(A0_17, 58, 0)
    elseif A3_20 == 1204 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 66, 0)
      A0_17:say(A0_17, 67, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 68, 0)
      A0_17:say(A0_17, 69, 0)
    elseif A3_20 == 1205 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 77, 0)
      A0_17:say(A0_17, 78, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 79, 0)
      A0_17:say(A0_17, 80, 0)
    elseif A3_20 == 1206 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 88, 0)
      A0_17:say(A0_17, 89, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 90, 0)
      A0_17:say(A0_17, 91, 0)
    elseif A3_20 == 1207 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 99, 0)
      A0_17:say(A0_17, 100, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 101, 0)
    elseif A3_20 == 1208 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 108, 0)
      A0_17:say(A0_17, 109, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 110, 0)
      A0_17:say(A0_17, 111, 0)
    elseif A3_20 == 1209 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 118, 0)
      A0_17:say(A0_17, 119, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 120, 0)
      A0_17:say(A0_17, 121, 0)
    elseif A3_20 == 1210 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 131, 0)
      A0_17:say(A0_17, 132, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 133, 0)
      A0_17:say(A0_17, 134, 0)
    elseif A3_20 == 1211 then
      A0_17:_runCharaScheduler(67846144)
      A0_17:say(A0_17, 211, 0)
      A0_17:say(A0_17, 212, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 213, 0)
      A0_17:say(A0_17, 214, 0)
    elseif A3_20 == 1212 then
      A0_17:_runCharaScheduler(69394432)
      A0_17:say(A0_17, 226, 0)
      A0_17:say(A0_17, 227, 0)
      A0_17:_runCharaScheduler(67723264)
      A0_17:say(A0_17, 228, 0)
      A0_17:say(A0_17, 229, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 230, 0)
      A0_17:say(A0_17, 231, 0)
      A0_17:_runCharaScheduler(67723264)
      A0_17:say(A0_17, 232, 0)
      A0_17:say(A0_17, 233, 0)
      A0_17:say(A0_17, 234, 0)
    elseif A3_20 == 1213 then
      A0_17:_runCharaScheduler(69394432)
      A0_17:say(A0_17, 243, 0)
      A0_17:say(A0_17, 244, 0)
      A0_17:_runCharaScheduler(67723264)
      A0_17:say(A0_17, 245, 0)
      A0_17:say(A0_17, 246, 0)
      A0_17:_runCharaScheduler(70799360)
      A0_17:say(A0_17, 247, 0)
      A0_17:say(A0_17, 248, 0)
    elseif A3_20 == 1214 then
      A0_17:_runCharaScheduler(353959936)
      A0_17:say(A0_17, 329, 0)
      A0_17:say(A0_17, 330, 0)
      A0_17:_runCharaScheduler(354103296)
      A0_17:say(A0_17, 331, 0)
      A0_17:say(A0_17, 332, 0)
    end
  elseif A3_20 == 1203 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 34, 0)
  elseif A3_20 == 1202 then
    if A4_21 == 1 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 46, 0)
    elseif A4_21 == 2 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 47, 0)
    end
  elseif A3_20 == 1201 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 59, 0)
  elseif A3_20 == 1204 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 70, 0)
  elseif A3_20 == 1205 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 81, 0)
  elseif A3_20 == 1206 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 92, 0)
  elseif A3_20 == 1207 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 102, 0)
  elseif A3_20 == 1208 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 112, 0)
  elseif A3_20 == 1209 then
    if A4_21 == 1 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 122, 0)
    elseif A4_21 == 2 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 123, 0)
    end
  elseif A3_20 == 1210 then
    if A4_21 == 1 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 135, 0)
    elseif A4_21 == 2 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 136, 0)
    end
  elseif A3_20 == 1211 then
    if A4_21 == 1 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 215, 0)
    elseif A4_21 == 2 then
      A0_17:_runCharaScheduler(70819840)
      A0_17:say(A0_17, 216, 0)
    end
  elseif A3_20 == 1212 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 235, 0)
  elseif A3_20 == 1213 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 249, 0)
  elseif A3_20 == 1214 then
    A0_17:_runCharaScheduler(354004992)
    A0_17:say(A0_17, 333, 0)
  end
  A0_17:finishCliantTalkTurn()
  A0_17:_wait(1)
  return true
end
function PopulaceFactionGLWorker.eventTalkFaction01End(A0_24, A1_25)
  local L2_26
  L2_26 = worldMaster
  L2_26 = L2_26._getMyPlayer
  L2_26 = L2_26(L2_26)
  A0_24:startCliantTalkTurn(2, L2_26)
  if A1_25 == 1011 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 150, 0)
  elseif A1_25 == 1012 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 157, 0)
  elseif A1_25 == 1013 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 163, 0)
    A0_24:say(A0_24, 164, 0)
  elseif A1_25 == 1014 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 170, 0)
    A0_24:say(A0_24, 171, 0)
  elseif A1_25 == 1015 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 176, 0)
  elseif A1_25 == 1016 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 182, 0)
  elseif A1_25 == 1017 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 280, 0)
    A0_24:say(A0_24, 281, 0)
    A0_24:say(A0_24, 282, 0)
  elseif A1_25 == 1018 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 262, 0)
    A0_24:say(A0_24, 263, 0)
    A0_24:say(A0_24, 264, 0)
  elseif A1_25 == 1019 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 271, 0)
    A0_24:say(A0_24, 272, 0)
    A0_24:say(A0_24, 273, 0)
  elseif A1_25 == 1020 then
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 325, 0)
    A0_24:say(A0_24, 326, 0)
    A0_24:say(A0_24, 327, 0)
  else
    A0_24:_runCharaScheduler(354004992)
    A0_24:say(A0_24, 9, 0)
  end
  return true
end
function PopulaceFactionGLWorker.eventTalkFaction02End(A0_27, A1_28)
  local L2_29
  L2_29 = worldMaster
  L2_29 = L2_29._getMyPlayer
  L2_29 = L2_29(L2_29)
  A0_27:startCliantTalkTurn(2, L2_29)
  if A1_28 == 1111 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 195, 0)
  elseif A1_28 == 1112 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 201, 0)
  elseif A1_28 == 1113 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 207, 0)
  elseif A1_28 == 1114 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 290, 0)
    A0_27:say(A0_27, 291, 0)
  elseif A1_28 == 1115 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 315, 0)
    A0_27:say(A0_27, 316, 0)
  elseif A1_28 == 1116 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 298, 0)
    A0_27:say(A0_27, 299, 0)
  elseif A1_28 == 1117 then
    A0_27:_runCharaScheduler(69156864)
    A0_27:say(A0_27, 306, 0)
    A0_27:say(A0_27, 307, 0)
    A0_27:say(A0_27, 308, 0)
  elseif A1_28 == 1118 then
    A0_27:_runCharaScheduler(69197824)
    A0_27:say(A0_27, 347, 0)
    A0_27:say(A0_27, 348, 0)
  elseif A1_28 == 1119 then
    A0_27:_runCharaScheduler(69197824)
    A0_27:say(A0_27, 355, 0)
    A0_27:say(A0_27, 356, 0)
  else
    A0_27:_runCharaScheduler(354062336)
    A0_27:say(A0_27, 21, 0)
  end
  return true
end
function PopulaceFactionGLWorker.eventTalkFaction03End(A0_30, A1_31, A2_32)
  local L3_33
  L3_33 = worldMaster
  L3_33 = L3_33._getMyPlayer
  L3_33 = L3_33(L3_33)
  A0_30:startCliantTalkTurn(1, L3_33)
  if A1_31 == 1203 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 35, 0)
    A0_30:say(A0_30, 36, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 37, 0)
      A0_30:say(A0_30, 38, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 39, 0)
      A0_30:say(A0_30, 40, 0)
    end
  elseif A1_31 == 1202 then
    A0_30:say(A0_30, 48, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(354041856)
      A0_30:say(A0_30, 49, 0)
      A0_30:say(A0_30, 50, 0)
      A0_30:say(A0_30, 51, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 52, 0)
      A0_30:say(A0_30, 53, 0)
      A0_30:say(A0_30, 54, 0)
    end
  elseif A1_31 == 1201 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 60, 0)
    A0_30:say(A0_30, 61, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 62, 0)
      A0_30:say(A0_30, 63, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 64, 0)
      A0_30:say(A0_30, 65, 0)
    end
  elseif A1_31 == 1204 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 71, 0)
    A0_30:say(A0_30, 72, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 73, 0)
      A0_30:say(A0_30, 74, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 75, 0)
      A0_30:say(A0_30, 76, 0)
    end
  elseif A1_31 == 1205 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 82, 0)
    A0_30:say(A0_30, 83, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 84, 0)
      A0_30:say(A0_30, 85, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 86, 0)
      A0_30:say(A0_30, 87, 0)
    end
  elseif A1_31 == 1206 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 93, 0)
    A0_30:say(A0_30, 94, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 95, 0)
      A0_30:say(A0_30, 96, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 97, 0)
      A0_30:say(A0_30, 98, 0)
    end
  elseif A1_31 == 1207 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 103, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 104, 0)
      A0_30:say(A0_30, 105, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 106, 0)
      A0_30:say(A0_30, 107, 0)
    end
  elseif A1_31 == 1208 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 113, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 114, 0)
      A0_30:say(A0_30, 115, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 116, 0)
      A0_30:say(A0_30, 117, 0)
    end
  elseif A1_31 == 1209 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 124, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 125, 0)
      A0_30:say(A0_30, 126, 0)
      A0_30:say(A0_30, 127, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 128, 0)
      A0_30:say(A0_30, 129, 0)
      A0_30:say(A0_30, 130, 0)
    end
  elseif A1_31 == 1210 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 137, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 138, 0)
      A0_30:say(A0_30, 139, 0)
      A0_30:say(A0_30, 140, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 141, 0)
      A0_30:say(A0_30, 142, 0)
      A0_30:say(A0_30, 143, 0)
    end
  elseif A1_31 == 1211 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 217, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 218, 0)
      A0_30:say(A0_30, 219, 0)
      A0_30:say(A0_30, 220, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 221, 0)
      A0_30:say(A0_30, 222, 0)
      A0_30:say(A0_30, 223, 0)
    end
  elseif A1_31 == 1212 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 236, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 237, 0)
      A0_30:say(A0_30, 238, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 239, 0)
      A0_30:say(A0_30, 240, 0)
    end
  elseif A1_31 == 1213 then
    A0_30:_runCharaScheduler(354062336)
    A0_30:say(A0_30, 250, 0)
    if A2_32 == 1 then
      A0_30:_runCharaScheduler(69197824)
      A0_30:say(A0_30, 251, 0)
      A0_30:say(A0_30, 252, 0)
    elseif A2_32 == 2 then
      A0_30:_runCharaScheduler(70795264)
      A0_30:say(A0_30, 253, 0)
      A0_30:say(A0_30, 254, 0)
    end
  elseif A1_31 == 1214 then
    A0_30:_runCharaScheduler(354004992)
    A0_30:say(A0_30, 334, 0)
    L3_33:_fadeOut(1)
    L3_33:_waitForFading()
    A0_30:_wait(2)
    L3_33:_fadeIn(1)
    L3_33:_waitForFading()
    A0_30:_runCharaScheduler(70795264)
    A0_30:say(A0_30, 335, 0)
    A0_30:say(A0_30, 336, 0)
    A0_30:say(A0_30, 337, 0)
    A0_30:_runCharaScheduler(69197824)
    A0_30:say(A0_30, 338, 0)
    A0_30:say(A0_30, 339, 0)
    A0_30:say(A0_30, 340, 0)
  end
  return true
end
function PopulaceFactionGLWorker.eventTalkWaitKeyPerson(A0_34, A1_35, A2_36)
  local L3_37
  L3_37 = worldMaster
  L3_37 = L3_37._getMyPlayer
  L3_37 = L3_37(L3_37)
  A0_34:startCliantTalkTurn(2, L3_37)
  if A1_35 == false then
    if A2_36 == 1111 then
      A0_34:say(A0_34, 192, 0)
    elseif A2_36 == 1112 then
      A0_34:say(A0_34, 198, 0)
    elseif A2_36 == 1113 then
      A0_34:say(A0_34, 204, 0)
    end
  elseif A2_36 == 1111 then
    A0_34:say(A0_34, 194, 0)
  elseif A2_36 == 1112 then
    A0_34:say(A0_34, 200, 0)
  elseif A2_36 == 1113 then
    A0_34:say(A0_34, 206, 0)
  end
  A0_34:finishCliantTalkTurn()
end
function PopulaceFactionGLWorker.eventGuildleveReward(A0_38, A1_39, A2_40, A3_41, A4_42, A5_43, A6_44, A7_45, A8_46, A9_47, A10_48, A11_49, A12_50)
  local L13_51, L14_52
  L13_51 = A0_38.work
  L14_52 = A0_38.work
  L13_51.guildleveId, L14_52.clearTime, A0_38.work.missionBonus, A0_38.work.difficultyBonus, A0_38.work.factionNumber, A0_38.work.factionBonus, A0_38.work.factionCredit, A0_38.work.glRewardItem, A0_38.work.glRewardNumber, A0_38.work.glRewardSubItem, A0_38.work.glRewardSubNumber, A0_38.work.difficulty = A1_39, A2_40, A3_41, A4_42, A5_43, A6_44, A7_45, A8_46, A9_47, A10_48, A11_49, A12_50
  L13_51 = desktopWidget
  L14_52 = L13_51
  L13_51 = L13_51.askEventModeWidgetYield
  L14_52 = L13_51(L14_52, "Ask/ContentRewardWidget", 1, A0_38, 1)
  return L13_51, L14_52
end
function PopulaceFactionGLWorker.eventTalkGuildleveWarp(A0_53, A1_54, A2_55, A3_56, A4_57, A5_58, A6_59)
  local L7_60, L8_61
  L7_60 = worldMaster
  L8_61 = L7_60
  L7_60 = L7_60._getMyPlayer
  L7_60 = L7_60(L8_61)
  if A3_56 == 1 or A3_56 == 2 then
    L8_61 = A0_53.startCliantTalkTurn
    L8_61(A0_53, 2, L7_60)
  else
    L8_61 = A0_53.startCliantTalkTurn
    L8_61(A0_53, 1, L7_60)
  end
  if A3_56 == 1 then
    if A4_57 == 1011 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 67887104)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 151, 0)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 152, 0)
    elseif A4_57 == 1012 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 354041856)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 158, 0)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 159, 0)
    elseif A4_57 == 1013 then
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 165, 0)
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83968000)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 166, 0)
    elseif A4_57 == 1014 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 69300224)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 172, 0)
    elseif A4_57 == 1015 then
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 177, 0)
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83968000)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 178, 0)
    elseif A4_57 == 1016 then
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 183, 0)
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83968000)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 184, 0)
    elseif A4_57 == 1017 or A4_57 == 1018 or A4_57 == 1019 or A4_57 == 1020 then
    else
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 69300224)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 10, 0, A5_58)
    end
  elseif A3_56 == 2 then
    if A4_57 == 1111 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83996672)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 196, 0)
    elseif A4_57 == 1112 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83996672)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 202, 0)
    elseif A4_57 == 1113 then
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 208, 0)
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 83996672)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 209, 0)
    elseif A4_57 == 1114 or A4_57 == 1115 or A4_57 == 1116 or A4_57 == 1117 or A4_57 == 1118 or A4_57 == 1119 then
    else
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 69156864)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 22, 0)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 23, 0)
    end
  elseif A3_56 == 3 then
    if A4_57 == 1211 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 84013056)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 224, 0)
    elseif A4_57 == 1212 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 84013056)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 241, 0)
    elseif A4_57 == 1213 then
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 84013056)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 255, 0)
    else
      L8_61 = A0_53._runCharaScheduler
      L8_61(A0_53, 354062336)
      L8_61 = A0_53.say
      L8_61(A0_53, A0_53, 41, 0)
    end
  end
  L8_61 = 0
  if A2_55 > 0 then
    L8_61 = worldMaster:askRestrictChoices(A0_53, worldMaster, 50084, true, true, true, true, 0, A1_54, A2_55)
  else
    L8_61 = worldMaster:askRestrictChoices(A0_53, worldMaster, 50084, true, false, true, true, 0, A1_54)
  end
  A0_53:finishCliantTalkTurn()
  return L8_61
end
function PopulaceFactionGLWorker.getGuildleveId(A0_62)
  return A0_62:getTempWork("guildleveId")
end
function PopulaceFactionGLWorker.getContentRewardButtonText(A0_63)
  local L1_64, L2_65
  L2_65 = 4403
  return L1_64, L2_65
end
function PopulaceFactionGLWorker.getContentRewardMainTitle(A0_66)
  local L1_67, L2_68
  L2_68 = 4401
  return L1_67, L2_68, A0_66:getTempWork("guildleveId")
end
function PopulaceFactionGLWorker.getContentRewardGridVisible(A0_69, A1_70)
  local L2_71
  if A1_70 == 1 then
    L2_71 = A0_69.work
    L2_71 = L2_71.glRewardItem
    if L2_71 == 0 then
      L2_71 = false
      return L2_71
    end
  end
  L2_71 = true
  return L2_71
end
function PopulaceFactionGLWorker.getContentRewardSubTitle(A0_72, A1_73)
  if A1_73 == 1 then
  else
    return
  end
end
function PopulaceFactionGLWorker.getContentRewardItem(A0_74, A1_75, A2_76, A3_77)
  local L4_78, L5_79
  if A1_75 == 1 then
    if A2_76 == 1 then
      L4_78 = A0_74.work
      L4_78 = L4_78.glRewardItem
      if L4_78 > 0 then
        if A3_77 == 1 then
          L4_78, L5_79 = nil, nil
          return L4_78, L5_79, 4402
        elseif A3_77 == 2 then
          L4_78 = itemDataSheet
          L5_79 = L4_78
          L4_78 = L4_78._loadKeyTemporarily
          L4_78(L5_79, A0_74.work.glRewardItem, A0_74.work.glRewardItem)
          L4_78 = itemDataSheet
          L5_79 = L4_78
          L4_78 = L4_78._getData
          L4_78 = L4_78(L5_79, A0_74.work.glRewardItem, 36)
          L5_79 = A0_74.work
          L5_79 = L5_79.glRewardItem
          if L5_79 == 1000001 then
            L5_79 = L4_78
            return L5_79, nil, 4405, A0_74.work.glRewardNumber
          else
            L5_79 = L4_78
            return L5_79, nil, 4406, A0_74.work.glRewardItem, A0_74.work.glRewardNumber
          end
        end
      end
    elseif A2_76 == 2 then
      L4_78 = A0_74.work
      L4_78 = L4_78.glRewardSubItem
      if L4_78 > 0 then
        if A3_77 == 1 then
          return
        elseif A3_77 == 2 then
          L4_78 = itemDataSheet
          L5_79 = L4_78
          L4_78 = L4_78._loadKeyTemporarily
          L4_78(L5_79, A0_74.work.glRewardSubItem, A0_74.work.glRewardSubItem)
          L4_78 = itemDataSheet
          L5_79 = L4_78
          L4_78 = L4_78._getData
          L4_78 = L4_78(L5_79, A0_74.work.glRewardSubItem, 36)
          L5_79 = L4_78
          return L5_79, nil, 4406, A0_74.work.glRewardSubItem, A0_74.work.glRewardSubNumber
        end
      end
    elseif A2_76 == 3 then
      L4_78 = A0_74.work
      L4_78 = L4_78.factionCredit
      if L4_78 > 0 then
        if A3_77 == 1 then
          L4_78, L5_79 = nil, nil
          return L4_78, L5_79, 4409, A0_74.work.factionNumber
        elseif A3_77 == 2 then
          L4_78 = 535
          L5_79 = A0_74.work
          L5_79 = L5_79.factionNumber
          if L5_79 == 2 then
            L4_78 = 536
          else
            L5_79 = A0_74.work
            L5_79 = L5_79.factionNumber
            if L5_79 == 3 then
              L4_78 = 537
            end
          end
          L5_79 = L4_78
          return L5_79, nil, 4410, A0_74.work.factionCredit
        end
      end
    elseif A2_76 == 4 then
      L4_78 = A0_74.work
      L4_78 = L4_78.factionBonus
      if L4_78 > 0 then
        if A3_77 == 1 then
          return
        elseif A3_77 == 2 then
          L5_79 = A0_74
          L4_78 = A0_74.getTempWork
          L4_78 = L4_78(L5_79, "iconGil")
          L5_79 = nil
          return L4_78, L5_79, 4405, A0_74.work.factionBonus
        end
      end
    end
  elseif A1_75 == 2 then
    if A2_76 == 1 then
      L4_78 = A0_74.work
      L4_78 = L4_78.missionBonus
      if L4_78 > 0 then
        if A3_77 == 1 then
          L4_78, L5_79 = nil, nil
          return L4_78, L5_79, 4407
        elseif A3_77 == 2 then
          L5_79 = A0_74
          L4_78 = A0_74.getTempWork
          L4_78 = L4_78(L5_79, "iconGil")
          L5_79 = nil
          return L4_78, L5_79, 4405, A0_74.work.missionBonus
        end
      end
    elseif A2_76 == 2 then
      L4_78 = A0_74.work
      L4_78 = L4_78.difficulty
      if L4_78 > 1 then
        if A3_77 == 1 then
          L4_78, L5_79 = nil, nil
          return L4_78, L5_79, 4408, A0_74.work.difficulty
        elseif A3_77 == 2 then
          L4_78 = A0_74.work
          L4_78 = L4_78.guildleveId
          if L4_78 > 20000 then
            L4_78 = A0_74.work
            L4_78 = L4_78.guildleveId
            if L4_78 < 29999 then
              L4_78 = itemDataSheet
              L5_79 = L4_78
              L4_78 = L4_78._loadKeyTemporarily
              L4_78(L5_79, A0_74.work.glRewardItem, A0_74.work.glRewardItem)
              L4_78 = itemDataSheet
              L5_79 = L4_78
              L4_78 = L4_78._getData
              L4_78 = L4_78(L5_79, A0_74.work.glRewardItem, 36)
              L5_79 = 0
              guildleveSheet:_loadKeyTemporarily(A0_74.work.guildleveId, A0_74.work.guildleveId)
              if guildleveSheet:_getData(A0_74.work.guildleveId, 5) == 30 then
                L5_79 = (A0_74.work.difficulty - 1) * 10
              else
                L5_79 = (A0_74.work.difficulty - 1) * 25
              end
              return L4_78, nil, 4406, A0_74.work.glRewardItem, L5_79
            end
          else
            L5_79 = A0_74
            L4_78 = A0_74.getTempWork
            L4_78 = L4_78(L5_79, "iconGil")
            L5_79 = nil
            return L4_78, L5_79, 4405, A0_74.work.difficultyBonus
          end
        end
      end
    end
  elseif A1_75 == 3 and A2_76 == 1 and A3_77 == 1 then
    L4_78 = _math
    L4_78 = L4_78.fmod
    L5_79 = A0_74.getTempWork
    L5_79 = L5_79(A0_74, "clearTime")
    L4_78 = L4_78(L5_79, 60)
    L5_79 = A0_74.getTempWork
    L5_79 = L5_79(A0_74, "clearTime")
    L5_79 = L5_79 - L4_78
    L5_79 = L5_79 / 60
    return 111, nil, 4404, L5_79, L4_78
  end
  return
end
