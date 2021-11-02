class ChatRoomsController < ApplicationController
  def show
    if !(ChatRoom.count > 0)
      ChatRoom.create!
    end
    @chat_room = ChatRoom.last
    @messages = @chat_room.messages
    @message = Message.new
  end

  private
    def chat_room_params
      params.fetch(:chat_room, {})
    end
end
