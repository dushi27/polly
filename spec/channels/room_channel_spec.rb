require "rails_helper"

RSpec.describe RoomChannel, type: :channel do

  it "subscribes to the stream matching current_user's id" do
    @user = User.new(email: 'user@example.com', id: 1) 
    stub_connection current_user: @user

    subscribe(current_user: 1)

    expect(subscription).to be_confirmed
    expect(streams.first).to include("room_channel_user_1")
  end

  it "should only subscribe to logged in survey owner's stream" do
    @user1 = User.new(email: 'user@example.com', id: 1) 
    @user2 = User.new(email: 'user@example.com', id: 2) 
    stub_connection current_user: @user2

    subscribe(current_user: 1)

    expect(streams.first).not_to include("room_channel_user_1")
    expect(streams.first).to include("room_channel_user_2")
  end
end