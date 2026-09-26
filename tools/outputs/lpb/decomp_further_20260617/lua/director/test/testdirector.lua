require("/Director/Test/TestDirectorBaseClass")
_defineClass("TestDirector", "TestDirectorBaseClass")
function TestDirector.initAsTestDirector(A0_0, A1_1)
  local L2_2, L3_3, L4_4
  L2_2 = {}
  L3_3 = {L4_4}
  L4_4 = {"count", "integer8"}
  L4_4 = A0_0.initWork
  L4_4(A0_0, nil, L2_2, L3_3)
  L4_4 = {
    {
      "info",
      1,
      {"count"}
    }
  }
  A0_0:initWorkSyncTag(L4_4)
  debugCommandSheet:_loadKeyTemporarily(A1_1, A1_1)
end
function TestDirector.eventNoticeStep1(A0_5, A1_6)
  A0_5:_wait(5)
end
function TestDirector.eventTalkStep0(A0_7)
  local L1_8
  return L1_8
end
function TestDirector.processUIInit(A0_9)
  local L1_10
end
function TestDirector.processUIUpdate(A0_11, A1_12)
end
function TestDirector.processUIFinalize(A0_13)
  local L1_14
end
