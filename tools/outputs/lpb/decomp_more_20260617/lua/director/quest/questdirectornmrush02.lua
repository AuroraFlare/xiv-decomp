require("/Director/Quest/QuestDirectorBaseClass")
_defineClass("QuestDirectorNMRush02", "QuestDirectorBaseClass")
function QuestDirectorNMRush02.initAsQuestDirector(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {"timer", "boolean"}
  }
  L1_1._temp = L2_2
  L1_1 = A0_0.work
  L2_2 = {
    {
      "directNumber",
      "integer8"
    },
    {"limitTime", "integer32"}
  }
  L1_1._sync = L2_2
  L1_1 = A0_0.work
  L1_1.timer = false
  L1_1 = A0_0.work
  L2_2 = {
    {
      "direct",
      1,
      {
        "directNumber"
      }
    },
    {
      "time",
      1,
      {"limitTime"}
    }
  }
  L1_1._tag = L2_2
end
function QuestDirectorNMRush02.processUIUpdate(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3.work
  L2_5 = L2_5.directNumber
  if L2_5 == 0 then
    break
  else
  end
  if L2_5 == 1 then
    if A0_3.work.timer == false then
      desktopWidget:processUpdateContentsInformation(A0_3, "start")
      A0_3.work.timer = true
      do break end
      else
      end
      if L2_5 == 2 then
        if A0_3.work.timer == false then
          desktopWidget:processUpdateContentsInformation(A0_3, "start")
          A0_3.work.timer = true
          do break end
          else
          end
          if L2_5 == 3 then
            desktopWidget:processUpdateContentsInformation(A0_3, "cancel")
          else
          end
        else
        end
    else
    end
end
function QuestDirectorNMRush02.processUIFinalize(A0_6)
  desktopWidget:processUpdateContentsInformation(A0_6, "cancel")
end
function QuestDirectorNMRush02.getKindContentsInformation(A0_7)
  local L1_8
  L1_8 = 1
  return L1_8
end
function QuestDirectorNMRush02.getGuildleveId(A0_9)
  local L1_10
  L1_10 = 0
  return L1_10
end
function QuestDirectorNMRush02.getTitleOnGuildleveInfo(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = worldMaster
  L2_13 = 51144
  L3_14 = L1_12
  L4_15 = L2_13
  return L3_14, L4_15
end
function QuestDirectorNMRush02.getMaxIndexNumberOnGuildleveInfo(A0_16)
  local L1_17
  L1_17 = 0
  return L1_17
end
function QuestDirectorNMRush02.getTimeDataOnGuildleveInfo(A0_18)
  local L1_19, L2_20, L3_21, L4_22
  L1_19 = A0_18.work
  L1_19 = L1_19.limitTime
  L2_20 = L1_19 - 60
  L3_21 = L1_19
  L4_22 = L2_20
  return L3_21, L4_22
end
function QuestDirectorNMRush02.getInstructionOnGuildleveInfo(A0_23)
  local L1_24, L2_25, L3_26, L4_27
  L1_24 = worldMaster
  L2_25 = 51145
  L3_26 = L1_24
  L4_27 = L2_25
  return L3_26, L4_27
end
