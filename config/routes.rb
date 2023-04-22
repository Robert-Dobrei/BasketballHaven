Rails.application.routes.draw do

  root 'application#hello'

  get 'goodbye', to: 'application#goodbye'

  get 'extra', to: 'application#extra'

  get 'test', to: 'application#test'

  get 'sign_up', to: 'users#new'
end
