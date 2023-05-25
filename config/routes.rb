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
  scope module: :public do
    resources :customers,only: [:show,:edit,:update,]
    resources :items,only: [:index,:show,:create,:update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all',as: "destroy_all"
    resources :cart_items,only: [:index,:update,:destroy,:create]
    resources :orders,only: [:new,:confirm,:thanks,:create,:index,:show]
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/unsubscribe' => 'customers#unsubscribe',as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw',as: 'withdraw'
    post 'orders/confirm' => 'orders#confirm',as: 'confirm'
    get 'orders/thanks' => 'orders#thanks',as: 'thanks'
  end

  namespace :admin do
  #管理者側のルーティング設定
    root to: 'homes#top'
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :oders,only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end