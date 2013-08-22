class BatchRequests
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/batch"
      env["REQUEST_METHOD"] = "GET"
      env["PATH_INFO"] = "/tasks.json"
      env["QUERY_STRING"] = ""
      env["rack.input"] = StringIO.new("")
      status, headers, body = @app.call(env)
      body.close if body.respond_to? :close
      response = {status: status, headers: headers, body: body}
      [200, {"Content-Type" => "application/json"}, [{responses: [response]}.to_json]]
    else
      @app.call(env)
    end
  end
end
