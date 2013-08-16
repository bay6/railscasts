class BatchRequests
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/batch'
      #[200, {'Content-Type' => 'application/json'}, [env.inspect]]
      env['REQUEST_METHOD'] = 'GET'
      env['PATH_INFO'] = '/tasks.json'
      env['QUERY_STRING'] = ''
      env['rack.input'] = StringIO.new('')
      @app.call(env)
    else
      @app.call(env)
    end
  end

end
