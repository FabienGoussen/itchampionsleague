Rails.application.routes.draw do
  resources :players do
    member do
      patch :select
    end

    collection do
      post :import
      get :create_teams
    end
  end

  root 'players#index'
end
