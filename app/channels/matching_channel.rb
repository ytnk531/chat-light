class MatchingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wait_by_#{current_user.id}"
  end
end