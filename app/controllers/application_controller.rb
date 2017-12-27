class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    if !logged_in?
      redirect_to controller: 'sessions', action: 'new'
    else
      logged_in?
    end
  end
end
