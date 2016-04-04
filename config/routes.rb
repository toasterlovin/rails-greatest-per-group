Rails.application.routes.draw do
  resources :authors, only: :index do
    collection do
      get :custom_query_methods
      get :scoped_has_one
      get :view_backed_model
    end
  end
end
