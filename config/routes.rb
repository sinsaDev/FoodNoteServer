Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root to: 'sessions#login'

  namespace :api do
    resources :users do
      collection do
        post :social_login
      end
    end
    #resources :users_description
    #resources :products
    #post "users/login", to: "users#login"
  end

  namespace :admin do
    resources :users
    resources :comments
  end

  resources :sessions do
    collection do
      get :login
    end
  end
end

