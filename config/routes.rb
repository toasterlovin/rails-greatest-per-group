Rails.application.routes.draw do
  root to: redirect("/authors")

  resources :authors, only: :index do
    collection do
      get :custom_query_methods
      get :scoped_has_one
      get :view_backed_model
    end
  end
end
