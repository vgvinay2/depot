module SessionsHelper
  # session helper available in view
  def current_user
    (session[:user_id]) ? (current_user ||= User.find(session[:user_id])) : (redirect_to login_url)
  end
  
end
