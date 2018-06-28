class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "room_channel"
    stream_from "room_channel_user_#{survey_owner.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
