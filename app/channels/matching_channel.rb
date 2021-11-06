class MatchingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wait"

    Redis.current.rpush('wait', params[:id])
    # broadcast_to "wait", "ok"
  end
end