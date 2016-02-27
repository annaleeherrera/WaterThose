tmr.alarm(5,10000,1,function() print("alarm 1") end)
tmr.alarm(3,1000,1,function() print("alarm 3") end)
tmr.alarm(2,2000,1,function() print("alarm 2") end)
tmr.stop(3)
