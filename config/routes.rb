Rails.application.routes.draw do
  # get 'registrations/new'
  # get 'registrations/create'
  # get 'registrations/index'
  resources :players do
    member do
      patch :select
    end

    collection do
      post :import
      get :create_teams
    end
  end

 resources :registrations, only: [:new, :create, :index, :destroy] do
  collection do
    post :create_teams
    get :teams
  end
end

  root 'players#index'
end
