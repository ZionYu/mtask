Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "tasks#index"
  resources "tasks"
  get 'tags/:tag', to: 'tasks#index', as: :tag
  resources :users , only:[:index] do 
    member do
      get :task
    end
  end

  namespace :admin do
    root "users#index"
    resources "users"
    post '/users' => 'users#create'
  end
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/404', to: 'errors#not_found', code: 404
  get '/500', to: 'errors#server_error', code: 500
  
end
