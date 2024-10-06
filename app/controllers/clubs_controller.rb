class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end
  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.save
      redirect_to @club, notice: 'Club was successfully created. You can now add recruitment events.'
    else
      render :new
    end
  end

  def show
    @club = Club.find(params[:id])
  end
  private

  def club_params
    params.require(:club).permit(:name, :description, schedule_attributes: [:pre_recruitment_talk_date, :pre_recruitment_talk_venue, :tasks_applicable, :tasks_due_date, :oa_applicable, :oa_date, :interview_start_date, :interview_end_date, :interview_venue, :result_date])
  end
end
