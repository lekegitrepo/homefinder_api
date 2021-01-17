module Authenticate
  # override Devise current_user method
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authenticate'])
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_with_token
    return if user_signed_in?

    render_json 'Not Authenticated',
                false, { errors: 'Unauthorized user please sign in' },
                :unauthorized
  end
end
