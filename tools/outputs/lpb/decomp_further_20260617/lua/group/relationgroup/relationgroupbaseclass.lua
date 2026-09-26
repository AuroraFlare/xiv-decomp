require("/Group/GroupBaseClass")
_defineBaseClass("RelationGroupBaseClass", "GroupBaseClass")
function RelationGroupBaseClass.init(A0_0, ...)
  local L2_2, L3_3
  L2_2 = A0_0.relationGroupWork
  L3_3 = {
    {
      "_assignForChild",
      16
    }
  }
  L2_2._temp = L3_3
  L2_2 = A0_0.relationGroupWork
  L3_3 = {
    {
      "_assignForChild",
      108
    }
  }
  L2_2._sync = L3_3
  L3_3 = A0_0
  L2_2 = A0_0.initAsRelationGroup
  L2_2(L3_3, ...)
end
function RelationGroupBaseClass.initAsRelationGroup(A0_4, ...)
end
