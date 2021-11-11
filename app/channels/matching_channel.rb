class MatchingChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from current_user.wait_key
  end

  def unsubscribed
    stop_all_streams
  end
end