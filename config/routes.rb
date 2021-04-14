Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/sign_in', to: 'users#sign_in'
  post 'users/sign_in', to: 'users#start_user_session'
  get 'users/logout', to: 'users#end_user_session'
  resources :users, only: [:new, :create, :show]
end
