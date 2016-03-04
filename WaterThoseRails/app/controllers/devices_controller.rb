class DevicesController < ApplicationController
  #Device client
  #pass a post request upon plug in w/ assigning an id
  before_action :find_device
  before_action :assign

  def info
    device = Device.create(mac_address:'123abc')
    #insert value from lua code for mac_address
    device_should_water_url(device)
  end

  def assign
    # device = Device.where(id: device_params[:id])
    if device = nil
      device = Device.create
    end
  end

  def should_water
    device = Device.where(id: device_params[:id])
    #if device_id is nil, assign an id
    #device.create
    if device.should_water == false
      render plain: "No"
    elsif device.should_water == true
      render plain: "Yes"
      flash.now[:alert] = "Thanks, #{user.username}!"
      redirect_to root_path, status: 200
    end
  device.should_water = false
  end

  #User client
  def water
    # device = Device.where(id: device_params[:device_id])
    device.should_water = true
  end

  def find_device
    device = Device.find_by(params[:id])
  end

  def device_params
    params.require(:device).permit(:id, :user_id, :mac_address, :name, :should_water)
  end
end
