Rails.application.routes.draw do

    # Root 'home' controller
    root 'welcome#home'

    # Users controller
    get  '/signup',  to: 'users#new'
    resources :users

    # Sessions Controller
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
end
