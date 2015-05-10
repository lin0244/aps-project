Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { sessions: 'sessions' }

  get '/', to: 'application#index', as: :root

  devise_scope :user do
    post '/registrations', to: 'registrations#create'
    post '/sessions', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/get_user_status', to: 'users#get_user_status', as: :get_user_status
    get '/index', to: 'users#index'
  end

  scope :projects do
    get '/index', to: 'projects#index'
    post '/create', to: 'projects#create'
    get '/show', to: 'projects#show'
  end

  scope :positions do
    get '/index', to: 'positions#index'
    post '/create', to: 'positions#create'
    get '/show', to: 'positions#show'
  end

  scope :products do
    get '/index', to: 'products#index'
    post '/create', to: 'products#create'
    get '/show', to: 'products#show'
  end

  scope :productions do
    get '/index', to: 'productions#index'
    post '/create', to: 'productions#create'
    get '/show', to: 'productions#show'
  end

  scope :equipment do
    get '/index', to: 'equipment#index'
    post '/create', to: 'equipment#create'
    get '/show', to: 'equipment#show'
  end

  scope :materials do
    get '/index', to: 'materials#index'
    post '/create', to: 'materials#create'
    get '/show', to: 'materials#show'
  end

end