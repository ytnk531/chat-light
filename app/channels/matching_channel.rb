class MatchingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wait_by_#{params[:id]}"
  end
end