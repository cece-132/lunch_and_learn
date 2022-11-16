class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.format_user(user), status: 201
    else
      render json: { error: 'Unsuccessful User Creation' }, status: 404
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.format_user(user)
  end

  def index
    users = User.all
    render json: UserSerializer.format_all(users)
  end

  def update
    if User.exists?(params[:id])
      user = User.find(params[:id])
      if user.update(user_params)
        render json: UserSerializer.format_user(user), status: 202
      else
        render json: { error: 'Unsuccessful update' }, status: 404
      end
    else
      render json: { error: 'User Not Found' }, status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      User.destroy(params[:id])
    else
      render json: { error: 'No User Found' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end