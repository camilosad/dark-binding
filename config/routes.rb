Rails.application.routes.draw do
  root to: 'champions#index'
  resources :champions, only: [:index, :show] do
    get 'refresh', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
