Rails.application.routes.draw do
  #会員側のルーティング
  devise_for :admins
  devise_for :customers
  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about'
  get 'items' => 'public/item#index'
  namespace :admin do
   #管理者側のルーティング設定
  get 'items' => 'items#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
end
