require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorGcg70101", "QuestDirectorBaseClass")
function QuestDirectorGcg70101.initAsQuestDirector(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0.work
  L2_2 = {}
  L1_1._temp = L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {
      "directNumber",
      "integer8"
    },
    {"point", "integer16"},
    {"limitTime", "integer32"}
  }
  L1_1._sync = L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {
      "direct",
      1,
      {
        "directNumber"
      },
      {"point"}
    },
    {
      "time",
      1,
      {"limitTime"}
    }
  }
  L1_1._tag = L2_2
end
function QuestDirectorGcg70101.processUIInit(A0_3)
  desktopWidget:openPublicEffectWidget(15)
end
function QuestDirectorGcg70101.processUIUpdate(A0_4, A1_5)
  local L2_6
  L2_6 = A0_4.work
  L2_6 = L2_6.directNumber
  if L2_6 == 20 then
    desktopWidget:openPublicEffectWidget(18)
    break
  else
  end
  if L2_6 == -1 then
    desktopWidget:openPublicEffectWidget(20)
    break
  else
  end
  if A1_5 == "time" then
    desktopWidget:processUpdateContentsInformation(A0_4, "start")
  else
    if A0_4.work.limitTime > 0 then
      desktopWidget:processUpdateContentsInformation(A0_4, "update", 1)
    else
    end
  end
end
function QuestDirectorGcg70101.processUIFinalize(A0_7)
  desktopWidget:processUpdateContentsInformation(A0_7, "cancel")
  if A0_7.work.directNumber == 0 then
    desktopWidget:openPublicEffectWidget(13)
  end
end
function QuestDirectorGcg70101.getKindContentsInformation(A0_8)
  local L1_9
  L1_9 = 1
  return L1_9
end
function QuestDirectorGcg70101.getGuildleveId(A0_10)
  local L1_11
  L1_11 = 0
  return L1_11
end
function QuestDirectorGcg70101.getTitleOnGuildleveInfo(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L1_13 = worldMaster
  L2_14 = 51112
  L3_15 = L1_13
  L4_16 = L2_14
  return L3_15, L4_16
end
function QuestDirectorGcg70101.getMaxIndexNumberOnGuildleveInfo(A0_17)
  local L1_18
  L1_18 = 1
  return L1_18
end
function QuestDirectorGcg70101.getTimeDataOnGuildleveInfo(A0_19)
  local L1_20, L2_21, L3_22, L4_23
  L1_20 = A0_19.work
  L1_20 = L1_20.limitTime
  L2_21 = L1_20 - 60
  L3_22 = L1_20
  L4_23 = L2_21
  return L3_22, L4_23
end
function QuestDirectorGcg70101.getInstructionOnGuildleveInfo(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = worldMaster
  L2_26 = 51115
  L3_27 = L1_25
  L4_28 = L2_26
  return L3_27, L4_28
end
function QuestDirectorGcg70101.getArticleFullDataOnGuildleveInfo(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48
  L2_31 = 1
  L3_32 = 1
  L4_33 = A0_29.work
  L4_33 = L4_33.point
  L5_34 = 1000
  L6_35 = 0
  L7_36 = A0_29.work
  L7_36 = L7_36.point
  if L7_36 >= 1000 then
    L2_31 = 2
  end
  L7_36 = 6
  L8_37 = worldMaster
  L9_38 = 33621
  L10_39 = L2_31
  L11_40 = L7_36
  L12_41 = L3_32
  L13_42 = L4_33
  L14_43 = L5_34
  L15_44 = L6_35
  L16_45 = L8_37
  L17_46 = L9_38
  L18_47 = 11000425
  L19_48 = 1
  return L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48
end
