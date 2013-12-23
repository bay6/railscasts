OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1445057605716906', 'a3e7f849c8e3371eee0f2a6ee62aef11', scope: "email,publish_stream"
end
