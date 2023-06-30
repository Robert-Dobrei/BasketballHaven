Rails.application.routes.draw do
  resources :credit_cards
  resources :orders
  resources :categories
  resources :products
  resources :addresses
  resources :credit_cards
  devise_for :users , controllers: { registrations: 'user/registrations' }

  root 'home#home'

  get 'goodbye', to: 'application#goodbye'

  get 'extra', to: 'application#extra'

  get 'test', to: 'application#test'

  get 'log_out', to: 'extra#new'

  get 'accounts', to: 'users#index', as: 'users'

  get 'profile', to: 'users#show'

end
