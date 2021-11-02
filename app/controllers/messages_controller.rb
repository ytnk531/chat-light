class MessagesController < ApplicationController
  def create
    Message.create(message_params.merge(user: current_user, chat_room: ChatRoom.last))
    redirect_to chat_room_path
  end

  private

  def message_params
    params.require(:message)
          .permit(:content)
  end
end
