class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def create
    @message = @chat.messages.build(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast "chat_#{@chat.id}_channel",
                                   message: render_message(@message)
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render(partial: 'messages/message', locals: { message: message })
  end
end
