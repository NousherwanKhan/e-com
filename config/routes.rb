Rails.application.routes.draw do
  root 'publics#index'


  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get 'carts/empty_all', to: 'carts#delete_all', as: 'delete_cart'
  resources :carts

  # get '/', to: 'categories#search', as: 'search'
  resources :categories
  resources :products

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
