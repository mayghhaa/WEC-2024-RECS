Rails.application.routes.draw do


  devise_for :users

  resources :clubs do
    resources :sigs do
      resources :schedules
    end
  end

  root 'clubs#index'
end
