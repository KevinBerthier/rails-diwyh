class MessagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user! || :authenticate_craftman!

  def index
    @user =
    if current_user
      current_user
    else
      current_craftman
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
    @workshop = Workshop.find(params[:workshop_id])
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @workshop = Workshop.find(params[:workshop_id])
    @message.workshop = @workshop
    @message.craftman = @workshop.craftman
    @message.user = current_user
    @message.author_type =
    :user if current_user
    :craftman if current_craftman

    if @message.save
      redirect_to dashboard_path, notice: 'Your message was successfully sent.'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
