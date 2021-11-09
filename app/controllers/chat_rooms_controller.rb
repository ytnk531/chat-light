class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages.includes(:user)
    @message = Message.new
  end

  # def new
  #   return render 'wait' if already_waiting(current_user)

  #   pp Redis.current.smembers('wait')
  #   waiting_channel = Redis.current.spop('wait')
  #   if waiting_channel
  #     room = ChatRoom.create!
  #     ActionCable.server.broadcast waiting_channel, chat_room_path(room)
  #     redirect_to chat_room_path(room)
  #   else
  #     Redis.current.sadd('wait', current_user.wait_key)
  #     render 'wait'
  #   end
  #   pp Redis.current.smembers('wait')
  # end

  def new
    room = ChatRoom.last
    if room.waiting?
      room.broadcast('go to room')
    else
      room = ChatRoom.create!

    end
  end

  private

  def chat_room_params
    params.fetch(:chat_room, {})
  end

  def already_waiting(user)
    Redis.current.sismember("wait", current_user.wait_key)
  end
end
