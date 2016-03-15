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
    redirect_to user_path(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "Welcome to Water Those! You are now logged in."
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
  end
  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
