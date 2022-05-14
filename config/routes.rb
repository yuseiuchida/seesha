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
  resources :combinations, only: %i[index new create show] do
    resources :review_combinations, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
    collection do
      get :bookmarks
      get :finds
    end
  end
  resources :flavors, only: %i[index show]
  resources :categories, only: %i[index new create show]
  resources :searchs, only: %i[index show create]
  get 'rate' => 'searchs#rate'

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :categories, only: %i[index new show create edit update destroy]
    resources :flavors
    resources :users, only: %i[index new create edit update destroy]
    resources :combinations do
      resources :review_combinations, only: %i[destroy]
      resources :coefficients, only: %i[edit update]
    end
    resources :inquiries, only: %i[edit update destroy]
  end
end
