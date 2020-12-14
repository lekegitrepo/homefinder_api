class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_with_token, only: :destroy
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user.valid_password? user_password
      sign_in user
      user.generate_token
      user.save
      session[:user_id] = {
        value: user.id,
        secure: true,
        same_site: 'None'
      }
      render_json 'Signed in', true, user, :ok, [:api_v1, user]
    else
      render_json 'Unable to Signed in: wrong email or password', false, {}, :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    session[:user_id] = ''
    sign_out user
    reset_session
    head :no_content
  end
end
