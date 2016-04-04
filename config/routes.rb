Rails.application.routes.draw do
  resources :authors, only: :index
end
