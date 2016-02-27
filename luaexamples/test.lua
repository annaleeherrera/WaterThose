tmr.alarm(3,1000,1,function()
  require("http").get("http://waterthose.herokuapp.com/should_water", nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)
end)
