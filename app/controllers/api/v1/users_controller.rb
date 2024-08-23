class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok and return
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end
end
