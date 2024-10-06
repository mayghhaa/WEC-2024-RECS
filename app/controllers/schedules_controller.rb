class SchedulesController < ApplicationController
  before_action :set_club

  def new
    @schedule = @club.build_schedule
  end

  def create
    @schedule = @club.build_schedule(schedule_params)
    if @schedule.save
      redirect_to @club, notice: 'Recruitment event was successfully created.'
    else
      render :new
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :pre_recruitment_talk_date, :pre_recruitment_talk_venue,
      :tasks_applicable, :tasks_due_date,
      :oa_applicable, :oa_date,
      :interview_start_date, :interview_end_date, :interview_venue,
      :result_date
    )
  end
end
