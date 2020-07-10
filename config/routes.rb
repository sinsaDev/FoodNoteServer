Rails.application.routes.draw do

  root to: 'main#index'

  namespace :api do
    resources :users do
      collection do
        get :login
      end
    end
  end
end

