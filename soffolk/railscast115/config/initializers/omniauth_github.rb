Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    # callback is point to http://mission.rubyunion.com
    provider :github, '1c8a8217f053c12d7e79', '405b009e1a191f6053b8217343e798c97654ebc5'
    # callback is point to http://thawing-basin-6896.herokuapp.com on heroku
    #provider :github, '857fff6a73997e787d5a', '277c4102c65e7598e190c089397a66aba18e4534'
  elsif Rails.env.development?
    # callback is point to http://localhost:3000
    # if you want to auth in local, make sure your port is 3000
    provider :github, 'ede8c008b96247d0336b', '34cffe39db5f76f7fadcd71692454acebf1a7d25'
  end
end
