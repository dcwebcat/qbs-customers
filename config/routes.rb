Rails.application.routes.draw do
  
  resources :messages, only: [:new, :create]

  resources :charges, only: [:new, :create, :index]
  get '/payments', to: 'charges#payments'
  
  resources :banks, only: [:new, :create, :index]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  get '/home', to: 'welcome#home'
  
  get '/support', to: 'support#index'
  get '/support/files', to: 'support#files'
  
  resources :readings
  resources :users, except: [:destroy]
  
  get '/users/:id/readings' => 'users#readings', :as => :user_readings
  
  get '/readings/:id/record' => 'readings#record', :as => 'record_reading'
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"

  #get '/readings', to: 'readings#index'
  #get '/readings/new', to: 'readings#new', as: 'new-reading'
  #post '/readings', to: 'readings#create'
  #get '/readings/:id/edit', to: 'readings#edit', as: 'edit_reading'
  #patch '/readings/:id', to: 'readings#update'
  #get '/readings/:id', to: 'readings#show', as: 'reading'
  #delete '/readings/:id', to: 'readings#destroy'


end