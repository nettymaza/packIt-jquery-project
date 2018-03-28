class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :check_for_user, only: [:new]

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render 'new'
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_for_user
      if current_user
        redirect_to user_path current_user.id
      end
    end
end
