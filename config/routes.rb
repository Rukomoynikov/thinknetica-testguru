Rails.application.routes.draw do
  devise_for :users, 
    path: :gurus, 
    path_names: { sign_in: :login, sign_out: :logout }

  root to: 'tests#index'

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
