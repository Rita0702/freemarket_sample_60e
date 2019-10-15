Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  
  resources :products, only: [:index] do
    collection do
      get 'buy'
      get 'show'
      get 'show2'
    end
  end
  
  resources :users, only: [:index] do
    collection do
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4'
      get 'session5'
    end
  end
  resources :image_tests, only: [:index, :create]

  resources :signup, only: [:index, :create] do
    collection do
      get 'index'
      get 'session1'
      get 'session2'
      get 'session3'
      get 'session4'
      get 'session5'
      post 'session5'
    end
  end
  
end
