class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
    @clubs = Club.all
    @sigs = Sig.all
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_path, notice: "Announcement successfully created!"
    else
      render :new
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:subject, :content, :club_id, :sig_id)
  end
end
