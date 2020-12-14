module JsonResponse
  def render_json(msg, success, user, status, loc = nil)
    render json: {
      user: user,
      message: msg,
      is_success: success
    }, status: status, location: loc
  end

  def home_json(msg, success, user, status, loc = nil)
    render json: {
      home: user,
      message: msg,
      is_success: success
    }, status: status, location: loc
  end
end
