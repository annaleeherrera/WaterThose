require 'pry'
class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :find_device
  attr_accessor :device
  #NodeMCU does not provide an authenticity token bc it is not the user's browser

  def should_water
    days_between = Date.today - @device.last_auto_water_date
    has_been_enough_days = days_between >= @device.auto_water_period_days
    is_after_watering_hour = Time.now.utc.hour >= @device.auto_water_hour_utc
    if @device.manual_watering_requested
      @device.manual_watering_requested = false
      @device.save!
      render plain: "Yes"
    elsif has_been_enough_days && is_after_watering_hour
      @device.last_auto_water_date = Date.today
      @device.save!
      render plain: "Yes"
    else
      render plain: "No"
    end
  end

  #User client
  def water
    @device.manual_watering_requested = true
    @device.save!
    flash.now[:alert] = "Thank you!"
    redirect_to root_path, status: 200
  end

  def find_device
    @device = Device.find_by!(mac_address: params[:mac_address])
    # if @device == nil
    #   @device = Device.create
    #   @device.mac_address = device_params[:mac_address]
    #   @device.save!
    # end
  end

  def device_params
    raise "mac_address param required" unless params.has_key?(:mac_address)
    return params
  end
end
