class ChatRoomsController < ApplicationController
  def show
    if !(ChatRoom.count > 0)
      ChatRoom.create!
    end
    @chat_room = ChatRoom.last
    @messages = @chat_room.messages.includes(:user)
    @message = Message.new
  end

  def new
    waiting_channel = Redis.current.rpop('wait')
    if waiting_channel
      room = ChatRoom.create!
      ActionCable.server.broadcast waiting_channel, room
      redirect_to chat_room_path(room)
    else
      Redis.current.rpush('wait', "wait_by_#{params[:id]}")
      render 'waiting'
    end
  end

  private
    def chat_room_params
      params.fetch(:chat_room, {})
    end
end
