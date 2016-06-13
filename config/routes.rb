Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  resources :readings
  resources :users
  
  get '/users/:id/readings' => 'users#readings', :as => :user_readings

  #get '/readings', to: 'readings#index'
  #get '/readings/new', to: 'readings#new', as: 'new-reading'
  #post '/readings', to: 'readings#create'
  #get '/readings/:id/edit', to: 'readings#edit', as: 'edit_reading'
  #patch '/readings/:id', to: 'readings#update'
  #get '/readings/:id', to: 'readings#show', as: 'reading'
  #delete '/readings/:id', to: 'readings#destroy'
  

end