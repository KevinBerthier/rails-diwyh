class UniversesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_universe, only: [:show]

  def show
    @first_craftman =  @universe.craftmen.first
    @second_craftman =  @universe.craftmen.second
    @third_craftman = @universe.craftmen.third
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_universe
    @universe = Universe.friendly.find(params[:id])
  end
end
