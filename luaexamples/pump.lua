gpio.mode(3, gpio.OUTPUT)
tmr.alarm(3,1000,1,function()
  require("http").get("http://waterthose.herokuapp.com/should_water", nil, function(code, data)
    if (code == 200 and data == "Yes") then
      gpio.write(3, gpio.HIGH)
      print("Turning pump ON")
    else
      if (code ~= 200) then
        print(data,code)
      end
      gpio.write(3, gpio.LOW)
      print("Turning pump OFF")
    end
  end)
end)
