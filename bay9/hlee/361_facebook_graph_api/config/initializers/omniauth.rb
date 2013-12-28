OmniAuth.config.logger = Rails.logger
ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'] = '193619607493774', '23a3dbd040c9833cb9db9e67b704d8bd'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {scope: 'email, publish_stream', provider_ignores_state: true}
end
