module RequestSpecHelper
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module HeadersHelpers
    def api_authen_header(token)
      request.headers['Authenticate'] = token
    end
  end
end
