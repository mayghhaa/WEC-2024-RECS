class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_convener, only: [ :edit, :update]


  def index
    @clubs = Club.all

  end

  def show
    @club = Club.find(params[:id])
  end

  def new

    if current_user.convener?
      @club = current_user.clubs.build
      authorize @club
    else
      redirect_to clubs_path, alert: 'Only conveners can create clubs.'
    end

  end

  def create
    @club = current_user.clubs.build(club_params)
    authorize @club
    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new
    end

  end

  def edit
    @club = Club.find(params[:id])
    authorize @club
  end

  def update
    @club = Club.find(params[:id])
    authorize @club
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit
    end

  end
  # def preference_form
  #   @exclusive_clubs = Club.where(exclusive: true)  # Fetch exclusive clubs
  # end

  private

  def club_params
    params.require(:club).permit(:name, :description, :exclusive,:convener_id)
  end

  def authorize_convener
    @club = Club.find(params[:id])
    unless current_user_convener?(@club)
      redirect_to clubs_path, alert: 'Only the convener can edit club details.'
    end
  end
end
