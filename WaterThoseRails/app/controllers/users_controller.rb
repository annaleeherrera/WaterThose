class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @devices = User.find(params[:id]).devices
    #change this to Device.find_by id
  end

  def register_device
    if params[:mac_address].blank?
      raise("MAC Address required")
    else
      device = Device.new({
        :mac_address => params[:mac_address],
        :name => params[:name],
        :manual_watering_requested => false,
        :last_auto_water_date => Time.now,
        :auto_water_period_days => params[:auto_water_period_days],
        :auto_water_hour_utc => (params[:auto_water_hour_local].to_i +
          params[:timezone_offset].to_i/60)%24
      })
      User.find(params[:id]).devices << device
    end
    redirect_to user_path
  end

  def create
    user = User.create(:email_address => params[:email_address], :password => params[:password])
    user.save!
    redirect_to user_path(user.id)
  end


  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
