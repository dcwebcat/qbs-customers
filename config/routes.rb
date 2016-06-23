Rails.application.routes.draw do
  
  resources :charges, only: [:new, :create, :index]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  get '/home', to: 'welcome#home'
  
  get '/support', to: 'support#index'
  
  resources :readings
  resources :users, except: [:destroy]
  
  get '/users/:id/readings' => 'users#readings', :as => :user_readings
  
  get '/readings/:id/record' => 'readings#record', :as => 'record_reading'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"

  post '/exchange_token', to: "exchange_tokens#create"
 
end