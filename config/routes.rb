Rails.application.routes.draw do

    # Root 'home' controller
    root 'welcome#home'

    # Users controller
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'
    resources :users, :only => [:new, :create, :show]

    # Sessions Controller
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    #Sessios Omniauthable
    get '/auth/:provider/callback', to: 'sessions#create'
end
