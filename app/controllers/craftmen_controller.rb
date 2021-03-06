class CraftmenController < ApplicationController
  before_action :set_craftman, only: %i(dashboard edit update destroy)
  skip_before_action :authenticate_user!
  before_action :authenticate_craftman!


  def dashboard
    @user = current_craftman
    @threads = @user.messages.includes(:workshop).group_by { |msg| [ msg.workshop, msg.user ] }
  end

  def edit; end

  def update
    if @craftman.update(craftman_params)
      redirect_to root_path, notice: 'Your account has been successfully modified'
    else
      render :edit
    end
  end

  # DELETE /craftmans/1
  def destroy
    @craftman.destroy
    redirect_to root_path, notice: 'Your account has been successfully deleted'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_craftman
    @craftman = current_craftman
  end

  # Only allow a trusted parameter "white list" through.
  def craftman_params
    params.require(:craftman).permit(
      :last_name, :first_name, :phone, :description,
      :avatar, :adress, :lat, :lng, :birth_date
    )
  end
end
