class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for ChatRoom.find(params[:id])
    puts "Connected!"
  end

  def unsubscribed
    puts "Disconnected!"
  end
end
