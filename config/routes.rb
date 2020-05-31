Rails.application.routes.draw do
 root 'public/homes#top'

  namespace :admin do
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }
    resources :items
    resources :genres
    resources :members
    resources :orders
    resources :order_items, only:[:update]
    get '/admins' => 'admins#top'
  end

  namespace :public do
    devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
    }
    get '/about' => 'homes#about'
    resources :items, only:[:index,:show]
    resources :cart_items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only:[:new,:create,:index,:show]
    get '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    resource :members, only:[:show ,:edit,:update]
    patch '/members' => 'members#destroy'
    get '/members/withdrawal' => 'members#withdrawal'
    resources :addresses
  end
end
