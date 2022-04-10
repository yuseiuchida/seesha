Rails.application.routes.draw do
  root to: 'homes#top'
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  resources :users, only: %i[new create]
  resources :combinations, only: %i[index new create show] do
    resources :review_combinations, only: %i[create destroy]
    collection do
      get :likes
    end
  end
  resources :compabilities, only: %i[index new create show] do
    resources :review_compabilities, only: %i[create destroy]
  end
  resources :flavors, only: %i[index new create show]
  resources :categories, only: %i[index new create show]
  resources :likes, only: %i[create destroy]
  resources :searchs, only: %i[index show create]
end
