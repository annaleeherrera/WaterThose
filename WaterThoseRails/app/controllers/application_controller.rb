class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user
  before_action :require_login
  before_action :only_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_device
    @device = Device.find_by!(mac_address: params[:mac_address])
    # if @device == nil
    #   @device = Device.create
    #   @device.mac_address = device_params[:mac_address]
    #   @device.save!
    # end
  end


  def require_login
    if @current_user.nil?
      flash[:error] = "You must be logged in to view this section"
      # redirect_to new_session_path
    end
  end

  def only_current_user
    if !@current_user || @current_user.id != params[:id].to_i
      flash[:error] = "You are not authorized to view that section"
    end
  end
end
