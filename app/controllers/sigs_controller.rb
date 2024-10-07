class SigsController < ApplicationController
  before_action :set_club
  before_action :set_sig, only: [:show]
  before_action :authenticate_user!
  def show
  end
  def new
    @sig = @club.sigs.build
  end

  def create
    @sig = @club.sigs.build(sig_params)
    if @sig.save
      redirect_to @club, notice: 'SIG was successfully created.'
    else
      render :new
    end
  end

  private

  def set_club
    @club = Club.find(params[:club_id])
  end

  def set_sig
    @sig = @club.sigs.find(params[:id])
  end

  def sig_params
    params.require(:sig).permit(:name, :description)
  end
end
