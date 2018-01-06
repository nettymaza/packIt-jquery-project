class SessionsController < ApplicationController

    def new
    end

    def create
        #Log in via Github Flow
        if auth_hash = request.env["omniauth.auth"]

            oauth_email = request.env["omniauth.auth"]["info"]["email"]
            if user = User.find_by(:email => oauth_email)
                log_in user
                redirect_to user
            else
                user = User.new(:email => oauth_email, :password => SecureRandom.hex)
                if user.save
                log_in user
                redirect_to user
                else
                    raise user.errors.full_messages.inspect
                end
            end
        else
        # Normal Login Flow
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                log_in user
                redirect_to user
            else
                flash.now[:danger] = 'Invalid email/password combination'
                render 'new'
            end
        end
    end

    def destroy
        log_out
        redirect_to login_path
    end

end
