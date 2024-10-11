class RegistrationsController < ApplicationController
  before_action :set_club
  before_action :authenticate_user!

  def new
    @registration = @club.registrations.new
    @clubs = Club.all  # Ensure @clubs is available for the form dropdown
  end

  def create
    # Iterate over each selected SIG and create a separate registration for each
    sig_ids = registration_params[:sig_ids].reject(&:blank?)  # Get selected SIGs

    if sig_ids.empty?
      flash[:alert] = "Please select at least one SIG to apply for."
      @clubs = Club.all
      render :new and return
    end

    sig_ids.each do |sig_id|
      @registration = @club.registrations.new(
        user: current_user,
        sig_id: sig_id,
        club_id: @club.id
      )
      unless @registration.save
        flash[:alert] = "Error registering for SIG #{Sig.find(sig_id).name}."
        render :new and return
      end
    end

    redirect_to clubs_path, notice: 'Successfully registered for selected SIGs!'
  end


  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def registration_params
    params.require(:registration).permit(:club_id, sig_ids: [])
  end
end
