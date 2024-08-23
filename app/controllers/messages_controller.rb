class MessagesController < ApplicationController

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      ChatRoomChannel.broadcast_to(@chat_room, {
        content: @message.content,
        user_email: @message.user.email,
        username: @message.user.username
      })
      head :ok
    else
      @messages = @chat_room.messages.order(created_at: :desc)
      render "chat_rooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
