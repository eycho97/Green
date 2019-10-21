Rails.application.routes.draw do
  
  resources :categories
  resources :items
  resources :subcats
  resources :users
  resources :starred_items
  resources :subcat_items
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
