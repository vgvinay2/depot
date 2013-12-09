class SessionsController < ApplicationController
  skip_before_filter :authorize , :only => [:new , :validate_user]
  
  
  
  def new
    @user = User.new
  end

  def validate_user
      if user = User.authenticate(params[:name], params[:password])
        session[:user_id] = user.id
        redirect_to store_url
      else
        redirect_to login_url, :alert => "Invalid user/password combination"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged out"

  end
end
