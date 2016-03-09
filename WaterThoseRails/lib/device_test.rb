require 'httparty'

puts HTTParty.get("http://127.0.0.1:3000/devices/should_water?mac_address=123ab")
