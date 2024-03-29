Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  
  resources :products, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }      
      scope '/products' do
        get '/shipping/:id', to: 'products#shipping', as: 'shipping'
      end
      scope '/products' do
        get '/city/:id', to: 'products#city', as:'city'
      end
      scope '/products' do
        get '/buy/:id', to: 'products#buy', as: 'buy'
        get '/serach/', to: 'products#serach', as:'serach'
      end
      get '/buyer/:id' => 'products#buyer'
      post 'purchase/:id', to: 'products#purchase', as: 'purchase'
      scope '/products' do
        get '/destroy/:id', to:'products#destroy', as: 'destroy'
      end
      scope '/products' do
        get '/seller/:id', to:'products#seller',as: 'product'
      end
    end
    resources :comments, only: [:create]
  end

  resources :categories, only: [:index, :show]
  
  resources :users, only: [:index, :edit, :update] do
    collection do 
      scope '/users' do
        get '/:id/seller', to: 'users#seller', as: 'seller'
      end
      scope '/users' do
        get '/:id/buy', to: 'users#buy',as: 'buy'
      end
      scope '/users' do
        get  '/:id/sell', to: 'users#sell', as: 'sell'
      end
      scope '/users' do
        get  '/:id/sold', to: 'users#sold', as: 'sold'
      end
      scope '/users' do
        get '/:id/negotiation',to: 'users#negotiation', as: 'negotiation'
      end
      # scope '/users' do
      #   get '/:id/profile', to: 'users#profile', as: 'profile'
      #   patch ':id/profile_update', to: 'users#profile_update', as: 'profile'
      # end
      get 'person'
      get 'creditcard'
      get 'logout'
      get 'standby'
    end
    member do
      get  'mypage' 
    end
  end

  resources :signup, only: [:create] do
    collection do
      get 'session0'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4'
      get 'session5'
    end
  end

  resources :creditcards, only: [:edit, :update] 
  resources :profiles, only: [:edit, :update]

  resources :image_tests, only: [:index, :create]
  
end
