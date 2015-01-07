Rails.application.routes.draw do

  resources :traps, only: [:create], path: '/' do
    collection do
      get 'info', to: 'traps#info'
      get 'traps', to: 'traps#index'
      match ':trap_id', to: 'traps#catch', via: [:get, :post, :put, :patch, :delete]
    end

    resources :requests, only: [:index, :show] do
      get 'stream', on: :collection
    end
  end

  root 'traps#info'
end
