Rails.application.routes.draw do
  get 'home/index'
  post 'home/param_change'
  post 'home/projection_change'
 
  root 'home#index'
end
