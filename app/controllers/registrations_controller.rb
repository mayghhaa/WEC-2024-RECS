class RegistrationsController < ApplicationController
  before_action :set_club
  before_action :authenticate_user!

  def new
    @registration = @club.registrations.new
    @clubs = Club.all  # Ensure @clubs is available for the form dropdown
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.user = current_user  # Associate the registration with the current user
    if @registration.save
      redirect_to clubs_path, notice: 'Successfully registered for recruitment!'
    else
      @clubs = Club.all  # Ensure @clubs is set in case of validation errors
      render :new
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def registration_params
    params.require(:registration).permit(:name, :email, :club_id)
  end
end
