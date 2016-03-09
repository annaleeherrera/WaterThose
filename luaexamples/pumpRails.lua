http = require("http")
pumpOnTime = 5000
pollingInterval = 500
pumpPin = 1
function polling()
  http.get("/devices/:device_id/should_water", nil, function(code, data)
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
