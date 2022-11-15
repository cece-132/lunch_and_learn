class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.format_user(user), status: 201
    else
      render json: { error: 'Unsuccessful User Creation' }, status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end