Rails.application.routes.draw do
 root 'public/homes#top'
    devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
    }
    
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }

  namespace :admin do
    get '/admins' => 'admins#top'
    resources :items
    resources :genres
    resources :members
    resources :orders
    resources :order_items, only:[:update]
  end

  namespace :public do
    get '/about' => 'homes#about'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items, only:[:index,:show,:new]
    resources :cart_items
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    patch '/members' => 'members#destroy'
    get '/members/withdrawal' => 'members#withdrawal'
    resources :orders, only:[:new,:create,:index,:show]
    resource :members, only:[:show ,:edit,:update]
    resources :addresses
  end
end
