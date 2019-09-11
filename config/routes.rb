Rails.application.routes.draw do
  root to: 'main#home'
  get :welcome, to: 'main#welcome'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  #resource :sessions, only: %i[new create destroy]

  resource :user, only: %i[new create] 
  resources :liquors, only: %i[index show]  

  resources :bars, except: %i[edit update] do
    resources :bottles do
      resources :readings, except: %i[edit update]
    end 
  end
end
