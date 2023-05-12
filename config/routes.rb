Rails.application.routes.draw do
  #顧客用
  #URL/custmers/sign_in
  #skip[]内不要なルーティング削除
  devise_for :customers,skip:[:passwords],controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  #管理者用
  #URL/admin/sign_in
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  resources :customers,only: [:show,:edit,:update,:unsubscribe,:withdraw]
  resources :items,only: [:index,:show]
  resources :cart_items,only: [:index,:update,:destroy,:destroy_all,:create]
  resources :oders,only: [:new,:confirm,:thanks,:create,:index,:show]
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  namespace :admin do
  #管理者側のルーティング設定
    get 'admin' => 'admins/homes#top'
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :oders,only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end