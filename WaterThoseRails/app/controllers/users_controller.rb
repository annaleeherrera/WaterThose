class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @devices = User.find(params[:id]).devices
    #change this to Device.find_by id
  end

  def register_device
    device = Device.new({
      :mac_address => params[:mac_address],
      :name => params[:name],
      :manual_watering_requested => false,
      :last_auto_water_date => Time.now,
      :auto_water_period_days => params[:auto_water_period_days],
      :auto_water_hour_utc => params[:auto_water_hour_utc]
    })
    User.find(params[:id]).devices << device
    redirect_to user_path
  end

  def create
    user = User.create(:email_address => params[:email_address], :password => params[:password])
    user.save!
  end

  def redirect
  client = Signet::OAuth2::Client.new({
    client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
    client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET'),
    authorization_uri: 'http://localhost:3000/',
    scope: Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY,
    redirect_uri: url_for(:action => :callback)
  })

  redirect_to client.authorization_uri.to_s
  end

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
