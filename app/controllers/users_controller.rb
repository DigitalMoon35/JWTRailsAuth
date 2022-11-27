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

  def login
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :ok
    else
      render json: {error: "Invalid username or password"}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    render json: {users: @users}
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
