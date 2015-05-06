Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
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