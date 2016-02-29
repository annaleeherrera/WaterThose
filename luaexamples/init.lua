dofile('wificonnect.lua')
gpio.mode(2, gpio.INPUT, gpio.PULLUP)
if(gpio.read(2) == 0) then
  print('Autostarting pump.lua')
  dofile('pump.lua')
end
