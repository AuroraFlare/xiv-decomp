require("/Director/DirectorBaseClass")
_defineBaseClass("WeatherDirectorBaseClass", "DirectorBaseClass")
function WeatherDirectorBaseClass.init(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0.weatherDirectorWork
  L2_2 = {
    {
      "_assignForChild",
      6
    }
  }
  L1_1._temp = L2_2
  L1_1 = A0_0.weatherDirectorWork
  L2_2 = {
    {
      "_assignForChild",
      8
    },
    {"weatherId", "integer16"}
  }
  L1_1._sync = L2_2
  L1_1 = A0_0.weatherDirectorWork
  L2_2 = {
    {
      "weatherInfo",
      1,
      {"weatherId"}
    }
  }
  L1_1._tag = L2_2
end
function WeatherDirectorBaseClass.processUpdateWork(A0_3, A1_4, A2_5)
  if worldMaster:_getMyPlayer():getWeatherId() == 0 then
  else
    worldMaster:_getMyPlayer():_setWeather(A0_3.weatherDirectorWork.weatherId, 15)
  end
  worldMaster:_getMyPlayer():setWeatherId(A0_3.weatherDirectorWork.weatherId)
end
