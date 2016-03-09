dofile('wificonnect.lua')
gpio.mode(2, gpio.INPUT, gpio.PULLUP)
if(gpio.read(2) == 0) then
  print('Autostarting pump.lua on wifi connect')
  tmr.alarm(1,1000, 1, function()
    if wifi.sta.getip()==nil then
      print(" Wait to IP address!")
    else
      print("New IP address is "..wifi.sta.getip())
      tmr.stop(1)
      print("Starting pump.lua")
      dofile('pump.lua')
    end
  end)
end
