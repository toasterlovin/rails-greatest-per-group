Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: redirect("/authors")

  resources :authors, only: :index do
    collection do
      get :custom_query_methods
      get :scoped_has_one
      get :view_backed_model
    end
  end
end
