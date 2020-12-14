class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token, only: [:update, :show, :destroy]
  def create
    user = User.new(user_params)
    if user.save
      render_json 'Successfully Registered', true, user, :created, [:api_v1, user]
    else
      render_json 'Unsuccessfully Registration', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render_json 'Profile', true, user, :ok, [:api_v1, user]
    else
      render_json 'Unable to load user profile', false, { errors: user.errors }, :unauthorized
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      render_json 'Successfully update user Profile', true, user, :accepted, [:api_v1, user]
    else
      render_json 'Unable to update user Profile', false, { errors: user.errors }, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
  end
end
