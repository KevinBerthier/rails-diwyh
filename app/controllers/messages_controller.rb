class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :authenticate_user! , only: [ :index, :create, :new, :create_first ]
  before_action :authenticate_craftman! , only: [ :index_craftman, :create_craftman, :new_craftman ]

  def index
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @messages = current_user.messages.where(workshop_id: @workshop.id).order(created_at: :asc)
    @message = Message.new
    respond_to  do |format|
      format.html
      format.js
    end

  end

  def index_craftman
    @user = User.find(params[:user_id])
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @messages = current_craftman.messages_for_workshop_and_user(@workshop.id, @user.id)
    @message = Message.new
    @booking = Booking.new
  end

  # GET /messages/new
  def new
    @message = Message.new
    @workshop = Workshop.friendly.find(params[:workshop_id])
  end

  def create_first
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @message = Message.new(message_params)
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

  # POST /messages
  def create
    @message = Message.new(message_params)
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @message.workshop = @workshop
    @message.craftman = @workshop.craftman
    @message.user = current_user
    @message.author_type = :user
    if @message.save
      respond_to do |format|
        format.html { redirect_to workshop_messages_path(@workshop), notice: 'Your message was successfully sent.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js
      end
    end
  end

  def create_craftman
    @message = Message.new(message_params)
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @user = User.find(params[:user_id])

    @message.workshop = @workshop
    @message.craftman = current_craftman
    @message.user = @user
    @message.author_type = :craftman

    if @message.save
      respond_to do |format|
        format.html { redirect_to workshop_user_messages_path, notice: 'Your message was successfully sent.' }
        format.js
      end
    else
      @messages = current_craftman.messages_for_workshop_and_user(@workshop.id, @user.id)
      respond_to do |format|
        format.html { render :index_craftman}
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :date_checkin, :date_checkout)
  end
end
