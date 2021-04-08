Rails.application.routes.draw do
  
  resources :owners, except: [:index, :put] do 
    resources :items, except: [:destroy, :put]
  end
  
  resources :items, except:[:put] do
    resources :inventories, only: [:new, :create, :edit]
  end

  resources :inventories, only: [:new, :create, :index]

  get '/signup' => "owners#new", as: "signup"
  post '/signup' => "owners#create"
  get '/login' => "sessions#new", as: "login"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"
  get '/auth/facebook/callback' => 'sessions#create_with_fb'
  patch '/owners/:id/edit' => 'owners#update'
  # get '/most' => 'items#most'
  get '/search' => 'items#search', as: 'search_page'
  post '/search' => 'items#results'
  root :to => 'sessions#welcome'

 end
