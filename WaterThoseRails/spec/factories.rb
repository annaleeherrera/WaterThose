FactoryGirl.define do
  factory :device, class: Device do
    name "Ada Lovelace"
    mac_address "Adele"
    manual_watering_requested false
    last_auto_water_date "2016-03-16"
    auto_water_period_days 5
    auto_water_hour_utc 7
  end

  factory :user do
    email_address "people@person.com"
  end
end
