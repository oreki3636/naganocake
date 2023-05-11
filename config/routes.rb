Rails.application.routes.draw do
  #顧客用
  #URL/custmers/sign_in
  #skip[]内不要なローティング削除
  devise_for :customers,skip:[:passwords],controllers:{
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  #管理者用
  #URL/admin/sign_in
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }


  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about'
  get 'items' => 'public/item#index'
  namespace :admin do
   #管理者側のルーティング設定
  get 'items' => 'items#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
