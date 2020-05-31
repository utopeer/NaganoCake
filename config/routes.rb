Rails.application.routes.draw do
  
  namespace :admin do
    devise_for :admins

    resources :items
    resources :genres
    resources :members
    resources :orders
    resources :order_items, only:[:update]

    get '/admins' => 'admin#top'
  end

  namespace :public do
  
    devise_for :members
    
    get '/about' => 'homes#about'

    resources :items, only:[:index,:show]
    resources :cart_items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only:[:new,:create,:index,:show]
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    resource :members
    patch '/members/withdrawal' => 'members#withdrawal'
    resources :addresses
  end

 root 'homes#top'

end
