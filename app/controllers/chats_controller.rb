class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: [:show, :create_message]

  def index
    @chats = Chat.all
  end

  def show
    @message = Message.new
    @messages = @chat.messages.order(created_at: :asc)
  end

  def new
    @chat = Chat.new
    @chat.post_id = params[:post_id] if params[:post_id]
  end

  def create
    @chat = current_user.chats.build(chat_params)

    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new
    end
  end

  def create_message
    @message = @chat.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to @chat, notice: 'Message was successfully sent.'
    else
      render :show
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:title, :post_id)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
