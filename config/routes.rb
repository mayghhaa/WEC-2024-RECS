Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Nested resources for clubs, SIGs, schedules, and rounds
  resources :clubs do
    resources :sigs do
      member do
        get 'registered_students'  # Adds a route like /clubs/:id/registered_students
      end
      resources :schedules do # This is correctly nested within SIGs
        resources :rounds do
          # Custom route to complete a round within a SIG
          patch :complete_round, on: :member
        end
      end
    end

    resources :rounds do
      # Custom route to complete a round
      patch :complete_round, on: :member
    end

    # Adding a nested route for registrations under clubs
    resources :registrations, only: [:new, :create]


  end

  resources :announcements

  # Root path set to clubs index
  root 'clubs#index'
end
