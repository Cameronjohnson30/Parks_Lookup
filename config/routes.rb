Rails.application.routes.draw do
  resources :parks
  root to: 'parks#index'
end
