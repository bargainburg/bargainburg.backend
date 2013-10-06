class CrossOriginAllowAdmin
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    headers['Access-Control-Allow-Origin'] = 'http://admin.bargainburg.co'

    [status, headers, body]
  end
end
