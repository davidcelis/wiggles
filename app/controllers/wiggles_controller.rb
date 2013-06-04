class WigglesController < ApplicationController
  RECOMMENDABLE_ACTIONS = %w[like unlike dislike undislike bookmark unbookmark hide unhide]
  before_action :set_wiggle, only: [:show, :edit, :update, :destroy] + RECOMMENDABLE_ACTIONS

  # GET /wiggles
  # GET /wiggles.json
  def index
    @wiggles = Wiggle.page(params[:page])
  end

  # GET /wiggles/recommended
  # GET /wiggles/recommended.json
  def recommended
    @wiggles = current_user.recommended_wiggles
    render :index
  end

  # GET /wiggles/liked
  # GET /wiggles/liked.json
  def liked
    @wiggles = current_user.liked_wiggles.page(params[:page])
    render :index
  end

  # GET /wiggles/disliked
  # GET /wiggles/disliked.json
  def disliked
    @wiggles = current_user.disliked_wiggles.page(params[:page])
    render :index
  end

  # GET /wiggles/1
  # GET /wiggles/1.json
  def show
  end

  # GET /wiggles/new
  def new
    @wiggle = Wiggle.new
  end

  # GET /wiggles/1/edit
  def edit
  end

  # POST /wiggles
  # POST /wiggles.json
  def create
    @wiggle = Wiggle.new(wiggle_params)

    respond_to do |format|
      if @wiggle.save
        format.html { redirect_to @wiggle, notice: 'Wiggle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wiggle }
      else
        format.html { render action: 'new' }
        format.json { render json: @wiggle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wiggles/1
  # PATCH/PUT /wiggles/1.json
  def update
    respond_to do |format|
      if @wiggle.update(wiggle_params)
        format.html { redirect_to @wiggle, notice: 'Wiggle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wiggle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wiggles/1
  # DELETE /wiggles/1.json
  def destroy
    @wiggle.destroy
    respond_to do |format|
      format.html { redirect_to wiggles_url }
      format.json { head :no_content }
    end
  end

  # POST /wiggles/1/{like,dislike,bookmark,hide}
  # DELETE /wiggles/1/{like,dislike,bookmark,hide}
  RECOMMENDABLE_ACTIONS.each do |m|
    define_method m do
      if current_user.send(m, @wiggle)
        head :ok
      else
        head :unprocessable_entity
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiggle
      @wiggle = Wiggle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiggle_params
      params.require(:wiggle).permit(:name)
    end
end
