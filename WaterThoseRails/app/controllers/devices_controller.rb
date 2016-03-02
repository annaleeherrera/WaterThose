class DevicesController < ApplicationController

  def info
    device = Device.where(:mac_address => params[:mac_address]).first
    render plain: device_should_water_url(device)
  end
end
