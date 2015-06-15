Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { sessions: 'sessions' }

  get '/', to: 'application#index', as: :root

  devise_scope :user do
    post '/registrations', to: 'registrations#create'
    post '/sessions', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/get_user_status', to: 'sessions#get_user_status', as: :get_user_status
    get 'users/check_intern', to: 'users#check_intern', as: :check_intern
    get 'users/index', to: 'users#index'
    delete 'users/delete', to: 'users#destroy'
    get 'users/position_index', to: 'users#position_index'
    get 'users/managers', to: 'users#managers'
  end

  scope :projects do
    get '/index', to: 'projects#index'
    post '/create', to: 'projects#create'
    get '/show', to: 'projects#show'
    post '/update', to: 'projects#update'
    delete '/delete', to: 'projects#destroy'
    post '/find_date', to: 'projects#find_date'
  end

  scope :positions do
    get '/index', to: 'positions#index'
    post '/create', to: 'positions#create'
    get '/show', to: 'positions#show'
    post '/update', to: 'positions#update'
    delete '/delete', to: 'positions#destroy'
  end

  scope :products do
    get '/index', to: 'products#index'
    post '/create', to: 'products#create'
    get '/show', to: 'products#show'
    post '/update', to: 'products#update'
    delete '/delete', to: 'products#destroy'
    get '/types', to: 'products#types'
  end

  scope :productions do
    get '/index', to: 'productions#index'
    post '/create', to: 'productions#create'
    get '/show', to: 'productions#show'
    post '/update', to: 'productions#update'
    delete '/delete', to: 'productions#destroy'
  end

  scope :equipment do
    get '/index', to: 'equipment#index'
    post '/create', to: 'equipment#create'
    get '/show', to: 'equipment#show'
    post '/update', to: 'equipment#update'
    delete '/delete', to: 'equipment#destroy'
  end

  scope :materials do
    get '/index', to: 'materials#index'
    post '/create', to: 'materials#create'
    get '/show', to: 'materials#show'
    post '/update', to: 'materials#update'
    delete '/delete', to: 'materials#destroy'
  end

end