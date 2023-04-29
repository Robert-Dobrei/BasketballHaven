Rails.application.routes.draw do
  devise_for :users

  root 'application#hello'

  get 'goodbye', to: 'application#goodbye'

  get 'extra', to: 'application#extra'

  get 'test', to: 'application#test'

  get 'log_out', to: 'extra#new'
  #get 'sign_up', to: 'users#new'
end
