http = require("http")
pumpOnTime = 5000
pollingInterval = 500
pumpPin = 1
mac_address = string.gsub(wifi.sta.getmac(),":","%%3A")
poll_url = "http://www.waterthose.online/devices/should_water?mac_address="..mac_address
print(mac_address)
print(poll_url)
function polling()
  print("polling")
  http.get(poll_url, nil, function(code, data)
    if (code == 200 and data == "Yes") then
      gpio.write(pumpPin, gpio.HIGH)
      print("Turning pump ON")
      tmr.alarm(1,pumpOnTime,0,function ()
        gpio.write(pumpPin, gpio.LOW)
        print("Turning pump OFF")
        polling()
      end)

    else
      if (code ~= 200) then
        print(data,code)
      end

      gpio.write(pumpPin, gpio.LOW)
      print("Turning pump OFF")
      tmr.alarm(3,pollingInterval,0,polling)
    end
  end)
end

gpio.mode(pumpPin, gpio.OUTPUT)
polling()
