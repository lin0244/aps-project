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
  end

  scope :positions do
    get '/index', to: 'positions#index'
  end

end