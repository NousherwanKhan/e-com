Rails.application.routes.draw do

  root 'publics#index'

  resources :categories
  resources :sub_categories
  resources :products

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
