Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Nested resources for clubs, SIGs, and schedules
  resources :clubs do
    resources :sigs do
      resources :schedules
    end

    # Adding a nested route for registrations under clubs
    resources :registrations, only: [:new, :create]
  end

  # Root path set to clubs index
  root 'clubs#index'
end
