class WelcomeController < ApplicationController
  def home
      if current_user
          redirect_to trips_path
      end
  end
end
