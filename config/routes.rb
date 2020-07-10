Rails.application.routes.draw do

  root to: 'main#index'

  namespace :api do
    resources :user do
      collection do
        get :login
      end
    end
  end
end

