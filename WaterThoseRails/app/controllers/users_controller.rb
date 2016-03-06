class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @device = Device.new
    #change this to Device.find_by id
  end

  def create
    user = User.new
    if user.save
    flash[:notice] = "Welcome to Water Those! You are now registered."
    redirect_to user_path
    end
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
    params.require(:user).permit(:username, :email, :password, :name, :should_water)
  end

end
