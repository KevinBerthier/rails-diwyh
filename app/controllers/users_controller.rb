class UsersController < ApplicationController
  before_action :set_user, only: %i(dashboard edit update destroy)

  # GET /users/1
  def dashboard
    @user = current_user
    @threads = @user.messages.includes(:workshop).group_by { |msg| [ msg.workshop, msg.user ] }
    # raise
  end

  # GET /users/1/edit
  def edit; end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Your account has been successfully modified'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Your account has been successfully deleted'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(
      :last_name, :first_name, :phone, :description, :avatar
    )
  end
end
