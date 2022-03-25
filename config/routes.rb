Rails.application.routes.draw do
  resources :kinds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flavors, only: %i[index new create]
  resources :combinations, only: %i[index new create]
end
