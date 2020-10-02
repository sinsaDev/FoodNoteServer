Rails.application.routes.draw do

  root to: 'main#index'
  namespace :api do
    resources :users do
      collection do
        get :naver_login
        get :kakao_login
        get :facebook_login
      end
    end
    resources :users_description
    resources :products
    post "users/login", to: "users#login"
  end
end

