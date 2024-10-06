Rails.application.routes.draw do
  resources :clubs do
    resources :schedules, only: [:new, :create]
  end
  root 'clubs#index'
end
