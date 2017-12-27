Rails.application.routes.draw do

    # Root 'home' controller
    root 'welcome#home'

    # Users controller
    resources :users, :only => [:new, :create]

    # Sessions Controller
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'

end
