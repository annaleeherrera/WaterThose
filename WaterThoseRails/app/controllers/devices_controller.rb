require 'pry'
class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :find_device
  attr_accessor :device
  #NodeMCU does not provide an authenticity token bc it is not the user's browser

  def should_water
    #if device_id is nil, assign an id
    #device.create
    if @device.should_water
      render plain: "Yes"
    else
      render plain: "No"
    end
    @device.should_water = false
    @device.save!
  end

  #User client
  def water
    @device.should_water = true
    @device.save!
    flash.now[:alert] = "Thank you!"
    redirect_to root_path, status: 200
  end

  def find_device
    @device = Device.find_by(mac_address: params[:mac_address])
    if @device == nil
      @device = Device.create
      @device.mac_address = device_params[:mac_address]
      @device.save!
    end
  end

  def device_params
    raise "mac_address param required" unless params.has_key?(:mac_address)
    return params
  end
end
