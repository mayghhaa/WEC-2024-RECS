class SigsController < ApplicationController
  before_action :set_club
  before_action :set_sig, only: [:show, :edit, :update, :destroy, :registered_students]
  before_action :authenticate_user!
  before_action :authorize_convener!

  # GET /clubs/:club_id/sigs
  def index
    @sigs = @club.sigs  # Fetch all SIGs associated with the club
  end

  # GET /clubs/:club_id/sigs/:id
  def show
    # @sig is set by the set_sig before_action
  end

  # GET /clubs/:club_id/sigs/new
  def new
    @sig = @club.sigs.build  # No need to manually find the club again, it's already set by set_club
  end

  # POST /clubs/:club_id/sigs
  def create
    @sig = @club.sigs.build(sig_params)  # Build a new SIG with the provided parameters
    if @sig.save
      redirect_to @club, notice: 'SIG was successfully created.'  # Redirect to club's page on success
    else
      render :new  # Render the new template on failure
    end
  end

  # GET /clubs/:club_id/sigs/:id/edit
  def edit
    # @sig is set by the set_sig before_action
  end

  # PATCH/PUT /clubs/:club_id/sigs/:id
  def update
    if @sig.update(sig_params)
      redirect_to club_sig_path(@club, @sig), notice: 'SIG was successfully updated.'  # Redirect to SIG's show page on success
    else
      render :edit  # Render the edit template on failure
    end
  end

  # DELETE /clubs/:club_id/sigs/:id
  def destroy
    @sig.destroy  # Destroy the SIG
    redirect_to club_sigs_path(@club), notice: 'SIG was successfully destroyed.'  # Redirect to SIG index on success
  end

  def registered_students
    @registrations = Registration.where(club_id: @club.id, sig_id: @sig.id).includes(:user)
  end

  private

  # Set the club based on the club_id parameter
  def set_club
    @club = Club.find(params[:club_id])  # Corrected to find the club by id
  end

  # Set the SIG based on the id parameter within the club context
  def set_sig
    @sig = @club.sigs.find(params[:id])  # Corrected to use find, not find_by
  end

  # Permit the parameters for SIG creation and updating
  def sig_params
    params.require(:sig).permit(:name, :description)
  end

  # Authorize the current user as the convener of the club
  def authorize_convener!
    unless current_user == @club.convener
      redirect_to club_path(@club), alert: 'Only the convener of this club can manage SIGs.'
    end
  end
end
