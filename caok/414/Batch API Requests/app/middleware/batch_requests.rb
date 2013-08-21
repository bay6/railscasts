class BatchRequests
  def initialize(app)
    @app = app
  end

  #def call(env)
    #if env["PATH_INFO"] == "/batch"
      #[200, {"Content-Type" => "application/json"}, [env.inspect]]
    #else
      #@app.call(env)
    #end
  #end
end
