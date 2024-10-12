class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :set_clubs_and_sigs, only: [:new, :edit]

  def index
    @announcements = Announcement.all
  end

  def show
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to @announcement, notice: "Announcement successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @announcement.update(announcement_params)
      redirect_to @announcement, notice: "Announcement successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @announcement.destroy
    redirect_to announcements_path, notice: "Announcement successfully deleted!"
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def set_clubs_and_sigs
    @clubs = Club.all
    @sigs = Sig.all
  end

  def announcement_params
    params.require(:announcement).permit(:subject, :content, :club_id, :sig_id)
  end
end
