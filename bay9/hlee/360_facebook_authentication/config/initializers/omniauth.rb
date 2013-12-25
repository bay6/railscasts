OmniAuth.config.logger = Rails.logger
ENV['FACEBOOK_APP_ID'] = '1445057605716906'
ENV['FACEBOOK_SECRET'] = 'a3e7f849c8e3371eee0f2a6ee62aef11'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end
