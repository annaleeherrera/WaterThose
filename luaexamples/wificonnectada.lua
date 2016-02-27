print('now connecting to wifi')
wifi.setmode(wifi.STATION)
wifi.sta.config("ada-seattle","AdaLovelaceCodesIt")
print(wifi.sta.getip())
