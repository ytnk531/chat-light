class MatchingChannel < ApplicationCable::Channel
  def subscribed
    pp "wait #{current_user.wait_key}"
    stream_from current_user.wait_key
  end
end