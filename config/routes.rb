Rails.application.routes.draw do
  root to: 'homes#top'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :users, only: %i[new create]
  resources :combinations, only: %i[index new create show] do
    resources :review_combinations, only: %i[new create show]
    resources :compabilities, only: %i[new create] do
      resources :review_compabilities, only: %i[new create show]
    end
    collection do
      get :likes
    end
  end
  resources :flavors, only: %i[index new create show]
  resources :categories, only: %i[index new create show]
  resources :likes, only: %i[create destroy]
  get 'search' => 'searchs#index'
end
