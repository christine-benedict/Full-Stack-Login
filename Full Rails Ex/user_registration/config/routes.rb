Rails.application.routes.draw do
  root 'users#index'
  get 'users/register'
  get 'users/login'
  get 'users/login_submit'
  get 'users/dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
