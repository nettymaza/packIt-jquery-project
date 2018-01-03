module SessionsHelper

    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !!current_user
    end

    def on_login_page?
        path = request.env['PATH_INFO']
        return path['/login'] || path['/signup']
    end

    # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
