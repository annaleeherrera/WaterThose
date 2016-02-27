print('now connecting to wifi')
wifi.setmode(wifi.STATION)
wifi.sta.config("BroadCityAD","georgemichael85")
print(wifi.sta.getip())
