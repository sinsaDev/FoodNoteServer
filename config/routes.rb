Rails.application.routes.draw do

  root to: 'main#index'

  namespace :api do
    resources :user
  end
end

