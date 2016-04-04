Rails.application.routes.draw do
  resources :authors, only: :index do
    collection do
      get :custom_query_methods
    end
  end
end
