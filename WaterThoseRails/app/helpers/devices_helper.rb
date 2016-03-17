module DevicesHelper
  def device_water_time(hour_utc)
    "#{(Date.today + hour_utc.hours).in_time_zone(-7).strftime("%I:00 %p")}"
  end
end
