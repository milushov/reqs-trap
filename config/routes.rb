Rails.application.routes.draw do

  resources :traps, only: [], path: '/' do
    collection do
      get 'info', to: 'traps#info'
      get 'traps', to: 'traps#index'
      match ':trap_id', to: 'traps#create', via: [:get, :post, :put, :patch, :delete]
    end
    resources :requests, only: [:index, :show]
  end

  root 'traps#info'
end
