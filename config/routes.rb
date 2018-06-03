Rails.application.routes.draw do
  root to: 'tests#index'

  resources :users, :sessions, only: :create
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :signout, to: 'sessions#destroy'

  resources :tests, shallow: true do
      post :start, on: :member
      resources :questions, except: [:index] do
      resources :answers, except: :index
    end
  end

  resources :test_passages, only: [:show, :update] do
    get 'result', on: :member
  end
end
