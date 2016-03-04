class UsersController < ApplicationController

  

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


end
