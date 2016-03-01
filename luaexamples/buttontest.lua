gpio.mode(3,gpio.PULLUP)
gpio.trig(3, "down", function()
        print('hello world')
      end
    )
