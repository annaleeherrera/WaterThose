http = require("http")
pumpOnTime = 5000
pollingInterval = 500
function polling()
  http.get("http://waterthose.herokuapp.com/should_water", nil, function(code, data)
    if (code == 200 and data == "Yes") then
      gpio.write(3, gpio.HIGH)
      print("Turning pump ON")
      tmr.alarm(1,pumpOnTime,0,function ()
        gpio.write(3, gpio.LOW)
        print("Turning pump OFF")
        polling()
      end)

    else
      if (code ~= 200) then
        print(data,code)
      end

      gpio.write(3, gpio.LOW)
      print("Turning pump OFF")
      tmr.alarm(3,pollingInterval,0,polling)
    end
  end)
end

gpio.mode(3, gpio.OUTPUT)
polling()
