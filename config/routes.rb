Rails.application.routes.draw do

  root to: 'sessions#login'

  namespace :api do
    resources :users do
      collection do
        post :naver_login
        post :kakao_login
        post :facebook_login
      end
    end
    #resources :users_description
    #resources :products
    #post "users/login", to: "users#login"
  end

  namespace :admin do
    resources :users
  end

  resources :sessions do
    collection do
      get :login
    end
  end
end

