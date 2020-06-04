Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :customers, skip: [:passwords], controllers: {
  	sessions: 'customers/sessions',
  	passwords: 'customers/passwords',
  	registrations: 'customers/registrations'
  }

  #　管理者側のルーティング
  namespace :admins do

    get '/' => 'homes#top'

    # admin/productsコントローラ
    resources :products, only: [:index, :new, :show, :edit, :create, :update]
    # admin/categoriesコントローラ
    resources :categories, only: [:index, :edit, :create, :update]
    # admin/customersコントローラ
    resources :customers, only: [:index, :show, :edit, :update]
    # admin/ordersコントローラ
    resources :orders, only: [:index, :show, :update]

  end

  # 顧客側のルーティング
  namespace :customers do

    # homesコントローラ
    get '/' => 'homes#top'
    get 'about' => 'homes#about'

    # customersコントローラ-
    # ec_naganoとは違うルーティングを設定しているので注意
    get '/confirm_unsubscribing' => 'customers#confirm_unsubscribing'
    get '/:id' => 'customers#show'

    # shipping_addressesコントローラ
    resources :shipping_addresses, only: [:index, :edit, :update, :destroy, :create]
    #productsコントローラ
    resources :products, only: [:index, :show]
    # cart_itemsコントローラ
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete 'cart_items' => 'cart_items#items_destroy'
    # ordersコントローラ
    post 'orders/cofirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:index, :show, :new, :create]

  end

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
