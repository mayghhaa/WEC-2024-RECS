class RoundsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club
  before_action :set_sig
  before_action :set_schedule
  before_action :authorize_convener!, only: [:new, :create, :edit, :update, :destroy, :complete_round]

  def index
    @rounds = @schedule.rounds  # Fetch rounds related to this schedule
  end

  def show
    @round = @schedule.rounds.find(params[:id])
  end

  def new
    @round = @schedule.rounds.new  # Initialize a new round for this specific schedule
  end

  def create
    @round = @schedule.rounds.new(round_params)
    @round.club_id = @club.id  # Set club association
    @round.sig_id = @sig.id    # Set SIG association

    if @round.save
      redirect_to club_sig_schedule_rounds_path(@club, @sig, @schedule), notice: "Round was successfully created."
    else
      render :new
    end
  end

  def edit
    @round = @schedule.rounds.find(params[:id])
  end

  def update
    @round = @schedule.rounds.find(params[:id])
    if @round.update(round_params)
      redirect_to club_sig_schedule_rounds_path(@club, @sig, @schedule), notice: "Round was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @round = @schedule.rounds.find(params[:id])
    @round.destroy
    redirect_to club_sig_schedule_rounds_path(@club, @sig, @schedule), notice: "Round was successfully deleted."
  end

  # Completing the round and progressing students
  def complete_round
    @round = @schedule.rounds.find(params[:id])

    # Mark the round as complete
    @round.update(round_completed: true)

    # Progress students to the next round
    next_round = @schedule.rounds.where(round_number: @round.round_number + 1).first
    @round.club.registrations.where(current_round: @round.round_number, moving_forward: true).each do |registration|
      if next_round
        registration.progress_to_next_round(next_round)
      else
        # Final round - mark as selected
        registration.update(status: 'selected')
      end
    end

    redirect_to club_sig_schedule_rounds_path(@club, @sig, @schedule), notice: 'Round completed and students progressed.'
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_sig
    @sig = @club.sigs.find(params[:sig_id])
  end

  def set_schedule
    @schedule = @sig.schedules.find(params[:schedule_id])  # Fix to find schedule by schedule_id
  end

  def authorize_convener!
    unless current_user == @club.convener
      redirect_to club_rounds_path(@club), alert: "You are not authorized to perform this action."
    end
  end

  def round_params
    params.require(:round).permit(:round_name, :round_type, :start_date, :end_date, :link, :venue, :round_number)
  end
end
