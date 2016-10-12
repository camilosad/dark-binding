Rails.application.routes.draw do
  root to: 'champions#index'
  resources :champions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
