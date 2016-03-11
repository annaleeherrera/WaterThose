devices = [
  {
    user_id: 1,
    mac_address: "12345",
    manual_watering_requested: false,
    name: "Device1"
  },

  {
    user_id: 2,
    mac_address: "123456",
    manual_watering_requested: false,
    name: "Device2"
  }
]

users = [
  {
    username: "annalee",
    email_address: "annaleeherrera@gmail.com",
    password: "123",
    password_confirmation: "123"
  }
]

devices.each do |device|
  Device.create!(device)
end

users.each do |user|
  User.create!(user)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
