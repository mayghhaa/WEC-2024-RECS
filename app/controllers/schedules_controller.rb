class SchedulesController < ApplicationController
  before_action :set_club
  before_action :set_sig
  before_action :authenticate_user!
  before_action :authorize_convener!, only: [:new, :create]

  # Set the schedule only for actions that need it
  before_action :set_schedule, only: [:show]

  def show
    # Ensure @schedule is set correctly to display the schedule details and its associated rounds
  end

  def new
    @schedule = @sig.schedules.new  # Initialize a new schedule for the selected SIG
  end

  def create
    @schedule = @sig.schedules.new(schedule_params.merge(club_id: @club.id))

    if @schedule.save
      redirect_to club_sig_path(@club, @sig), notice: 'Schedule was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_sig
    @sig = @club.sigs.find(params[:sig_id])  # Find the specific SIG using params
  end

  def set_schedule
    @schedule = @sig.schedules.find_by(id: params[:id])
    unless @schedule
      redirect_to new_club_sig_schedule_path(@club, @sig), alert: "No schedule found. Please create a new schedule." and return
    end
  end

  def schedule_params
    params.require(:schedule).permit(:name, :sig_id)  # Ensure sig_id is included
  end

  def authorize_convener!
    unless current_user == @club.convener
      redirect_to club_path(@club), alert: 'Only the convener of this club can manage schedules.'
    end
  end
end
