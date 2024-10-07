Rails.application.routes.draw do


  devise_for :users

  resources :clubs do
    resources :schedules, only: [:new, :create]
  end
  root 'clubs#index'
end
