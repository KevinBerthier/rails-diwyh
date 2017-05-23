class MessagesController < ApplicationController
  skip_before_action :authenticate_user!
  # A CORRIGER pour athenticate craftman
  # before_action :authenticate_user! , only: [ :index_user, :create_user, :new_user ]
  before_action :authenticate_craftman! , only: [ :index_craftman, :create_craftman, :new_craftman ]

  def index
    @messages = current_user.messages.where(workshop_id: params[:workshop_id])
    @message = Message.new
    @workshop = Workshop.find(params[:workshop_id])
  end

  def index_craftman
    @user = User.find(params[:user_id])
    @workshop = Workshop.find(params[:workshop_id])
    @messages = current_craftman.messages_for_workshop_and_user(@workshop.id, @user.id)
    @message = Message.new
    # raise
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
    @message.author_type = :user
    if @message.save
      redirect_to workshop_messages_path(@workshop), notice: 'Your message was successfully sent.'
    else
      render :new
    end
  end

  def create_craftman
    @message = Message.new(message_params)
    @workshop = Workshop.find(params[:workshop_id])
    @user = User.find(params[:user_id])

    @message.workshop = @workshop
    @message.craftman = current_craftman
    @message.user = @user
    @message.author_type = :craftman

    if @message.save
      redirect_to workshop_user_messages_path, notice: 'Your message was successfully sent.'
    else
      @messages = current_craftman.messages_by_workshop_and_user(@workshop.id, @user.id)
      render :index_craftman
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
