if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_homefinder', domain: 'https://homefinderapi.herokuapp.com/', same_site: :none, secure: true
else
  Rails.application.config.session_store :cookie_store, key: '_homefinder'
end
