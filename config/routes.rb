Rails.application.routes.draw do
  devise_for :users, 
    path: :gurus, 
    path_names: { sign_in: :login, sign_out: :logout }

  root to: 'tests#index'

  delete :signout, to: 'sessions#destroy'

  resources :tests, only: :index, shallow: true do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get 'result', on: :member
    post :gist, on: :member
  end

  namespace :admin do
    root to: 'tests#index'

    resources :gists, only: :index
    resources :tests, shallow: true do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end
  end

end
