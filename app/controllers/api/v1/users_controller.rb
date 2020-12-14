class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: {
        msg: 'Successfully Registered',
        user: user, is_success: true
      }, status: :created, location: [:api_v1, user]
    else
      render json: {
        msg: 'Unsuccessfully Registration',
        errors: user.errors, is_success: false
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password, :password_confirmation)
  end
end
