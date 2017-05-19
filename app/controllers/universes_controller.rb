class UniversesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_universe, only: [:show]

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_universe
    @universe = Universe.find(params[:id])
  end
end
