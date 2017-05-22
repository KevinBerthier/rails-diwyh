class WorkshopsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_craftman!, only: [ :new, :create]
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]

  # GET /workshops
  def index

    @universe = Universe.friendly.find(params[:universe_id])
    @workshops = @universe.workshops

    #geocoder
    @craftmen = Craftman.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@craftmen) do |craftman, marker|
      marker.lat craftman.latitude
      marker.lng craftman.longitude
    end

  end

  # GET /workshops/1
  def show
    #geocoder
    @craftman = @workshop.craftman

    @hash = Gmaps4rails.build_markers(@craftman) do |craftman, marker|
      marker.lat craftman.latitude
      marker.lng craftman.longitude
    end
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  def create
    @workshop = Workshop.new(workshop_params)

    if @workshop.save
      redirect_to @workshop, notice: 'Your workshop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workshops/1
  def update
    if @workshop.update(workshop_params)
      redirect_to @workshop, notice: 'Your workshop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workshops/1
  def destroy
    @workshop.destroy
    redirect_to workshops_url, notice: 'Your workshop was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workshop_params
      params.require(:workshop).permit(:title, :description, :photos, :price)
    end

end
