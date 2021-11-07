class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(params[:chat_room_id])
    mes = Message.create!(message_params.merge(user: current_user, chat_room: chat_room))
    mes.broadcast_append_to chat_room, :messages, target: 'messages'
  end

  private

  def message_params
    params.require(:message)
          .permit(:content, :chat_room_id)
  end
end
