require("/Command/System/SystemCommandBaseClass")
_defineClass("RequestQuestJournalCommand", "SystemCommandBaseClass")
function RequestQuestJournalCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  return A1_1:canRequestInformation()
end
