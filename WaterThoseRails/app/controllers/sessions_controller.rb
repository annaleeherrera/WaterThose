class SessionsController < ApplicationController

  def create
    data = params[:session_data]
    @user = User.find_by_email_address(data[:email_address])
    if !@user.nil?
      if @user.authenticate(data[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Your email was not found or password did not match. Please try again."
        render :login_failed
      end
    else
      flash.now[:error] = "Your email was not found or password did not match. Please try again or sign up to create a new user."
      render :login_failed
    end
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

  # private
  #
  # def session_params
  #   params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  # end

end
