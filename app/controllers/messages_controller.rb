class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Your message was successfully sent.'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
