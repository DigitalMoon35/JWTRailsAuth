class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token }, status: :ok
    else
      render json: {error: "Invalid username or password"}, status: :unprocessable_entity
    end
  end
  def index
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
