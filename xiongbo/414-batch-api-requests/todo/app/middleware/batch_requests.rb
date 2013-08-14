class BatchRequests
  def initialize(app)
    @app = app
  end

  def call(env) 
    if env["PATH_INFO"] == '/batch'
      request = Rack::Request.new(env.deep_dup)
      responses = JSON.parse(request[:requests]).map do |request|
        process_request(env.deep_dup, request)
      end
      [200, {"Content-Type" => "application/json"}, [{response: responses}.to_json]]
    else 
      @app.call(env) 
    end
  end

  def process_request(env, request) 
    path, query = request['url'].split("?")
    env["REQUEST_METHOD"] = request['method']
    env["PATH_INFO"] = path
    env["QUERY_STRING"] = query
    env["rack.input"] = StringIO.new(request['body'].to_s)
    status, headers, body = @app.call(env) 
    body.close
    {status: status, headers: headers, body: body.join}
  end
end
