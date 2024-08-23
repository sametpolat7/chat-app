class Api::V1::ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.includes(:messages).all
    render json: @chat_rooms, include: ['messages'], status: :ok
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find(params[:id])
    render json: @chat_room, include: ['messages'], status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'ChatRoom not found' }, status: :not_found
  end
end
