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
    resources :items,only: [:index,:show,:create,:update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all',as: "destroy_all"
    resources :cart_items,only: [:index,:update,:destroy,:create]
    get 'orders/thanks' => 'orders#thanks',as: 'thanks'
    resources :orders,only: [:new,:create,:index,:show]
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/mypage' => 'customers#show',as: 'mypage'
    get 'customers/mypage/edit' => 'customers#edit',as: 'edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe',as: 'unsubscribe'
    patch 'customers/update' => 'customers#update',as: 'mypage_update'
    patch 'customers/withdraw' => 'customers#withdraw',as: 'withdraw'
    post 'orders/confirm' => 'orders#confirm',as: 'confirm'
  end

  namespace :admin do
  #管理者側のルーティング設定
    root to: 'homes#top'
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end