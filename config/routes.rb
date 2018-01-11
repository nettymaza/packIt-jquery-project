Rails.application.routes.draw do

    # Root 'home' controller
    root 'welcome#home'

    # Users controller
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'
    resources :users, :only => [:show]

    # Sessions Controller
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'


    #Sessios Omniauthable
    get '/auth/:provider/callback', to: 'sessions#create'

    #Trip routes
    resources :trips

    #Nested List/Items routes
    # resources :packing_lists do
    #   resources :packing_list_items
    # end

end
