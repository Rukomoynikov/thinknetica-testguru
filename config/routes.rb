Rails.application.routes.draw do
  resources :tests do
    resources :questions do
      get :delete, on: :member
    end
  end
end
