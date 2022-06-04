Rails.application.routes.draw do
  get 'admin/coefficients'
  get 'mypage' => 'homes#mypage'
  get 'terms' => 'homes#terms'
  get 'privacy' => 'homes#privacy'
  get 'inquiry' => 'homes#inquiry'
  post 'inquiry' => 'homes#post'
  root to: 'homes#top'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :users, only: %i[new create edit update]
  get 'users' => 'users#new'
  resources :combinations, only: %i[index new create show destroy] do
    resources :review_combinations, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
    collection do
      get :bookmarks
      get :finds
    end
  end
  resources :flavors, only: %i[index show] do
    resources :gathers, only: %i[create destroy]
  end
  resources :shops do
    resources :stocks, only: %i[create destroy] do
      collection do
        post :fixed
        delete :unfixed
      end
    end
    resources :shop_images, only: %i[new create destroy]
    member do
      get :flavors
      get :gacha
      post :gachagacha
      get :pon
    end
  end
  resources :categories, only: %i[index new create show]
  resources :searchs, only: %i[index show create]
  get 'sorry', to: 'searchs#sorry'
  resources :gacha, only: %i[index create new]
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :categories
    resources :flavors do
      member do
        get :gathers
      end
    end
    resources :hints
    resources :shops do
      resources :shop_images, only: %i[create destroy]
      member do
        get :flavors
        get :images
      end
    end
    resources :users, only: %i[index new create edit update destroy]
    resources :combinations do
      resources :review_combinations, only: %i[destroy]
      resources :coefficients, only: %i[edit update]
    end
    resources :inquiries, only: %i[edit update destroy]
  end
end
