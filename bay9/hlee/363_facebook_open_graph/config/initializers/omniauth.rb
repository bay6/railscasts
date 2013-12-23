OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '425072827621438', 'c1943c93005c4fad7753247398605a72', scope: "email,publish_stream"
end
