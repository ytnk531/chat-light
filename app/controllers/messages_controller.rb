class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.last
    mes = Message.create(message_params.merge(user: current_user, chat_room: chat_room))
    mes.broadcast_append_to chat_room, :messages, target: 'messages'
    # redirect_to chat_room_path
  end

  private

  def message_params
    params.require(:message)
          .permit(:content)
  end
end
