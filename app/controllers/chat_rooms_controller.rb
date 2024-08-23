class ChatRoomsController < ApplicationController
  before_action :authorize_chat_room, only: [:show]

  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    authorize @chat_room

      if @chat_room.save
        redirect_to @chat_room
      else
        render :new
      end
  end

  def show
    set_chat_room
    @message = Message.new
    @messages = @chat_room.messages.all
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def authorize_chat_room
    set_chat_room
    authorize @chat_room
  end

end
