Rails.application.routes.draw do
  get 'home/index'
  post 'home/param_change'
 
  root 'home#index'
end
