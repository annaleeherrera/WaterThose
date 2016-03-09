print('now connecting to wifi')
wifi.setmode(wifi.STATION)
wifi.sta.config("notatruck","diskswim9")
print(wifi.sta.getip())
