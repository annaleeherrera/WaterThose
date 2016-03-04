class DevicesController < ApplicationController
  #Device client
  def info
    device = Device.create(mac_address:'123abc')
    #insert value from lua code for mac_address
    device_should_water_url(device)
  end

  def should_water
    device = Device.where(id: device_params[:id])
    #if device_id is nil, assign an id
    if device.should_water == false
      render plain: "No"
    elsif device.should_water == true
      render plain: "Yes"
    end
  device.should_water = false
  end

  #User client
  def water
    device = Device.where(id: device_params[:device_id])
    device.should_water = true
  end

  def device_params
    params.require(:device).permit(:id, :user_id, :mac_address, :name, :should_water)
  end
end
