class SchedulesController < ApplicationController
  before_action :set_club
  before_action :set_sig
  before_action :authenticate_user!

  def new
    @schedule = @sig.build_schedule  # Corrected to use build_schedule
  end

  def create
    @schedule = @sig.build_schedule(schedule_params)  # Corrected to use build_schedule
    if @schedule.save
      redirect_to club_sig_path(@club, @sig), notice: 'Recruitment event created successfully.'
    else
      render :new
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_sig
    @sig = @club.sigs.find(params[:sig_id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :pre_recruitment_talk_date,
      :pre_recruitment_talk_venue,
      :tasks_applicable,
      :tasks_due_date,
      :oa_applicable,
      :oa_date,
      :interview_start_date,
      :interview_end_date,
      :interview_venue,
      :result_date
    )
  end
end
