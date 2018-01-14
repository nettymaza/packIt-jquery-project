Rails.application.routes.draw do

    # Root 'home' controller
    root 'welcome#home'

    # Users controller
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'

    # Nested Routes
    resources :users, :only => [:show] do
      resources :trips, :only => [:show, :index]
    end

    # Sessions Controller
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'


    #Sessios Omniauthable
    get '/auth/:provider/callback', to: 'sessions#create'

    #Trip routes
    resources :trips
end
