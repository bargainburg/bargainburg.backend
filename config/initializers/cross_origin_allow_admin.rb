class CrossOriginAllowAdmin
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    headers['Access-Control-Allow-Origin'] = 'http://dev.bargainburg.co, http://bargainburg.co'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*, x-requested-with, content-type, accept, origin, referer, user-agent'
    headers['Access-Control-Allow-Credentials'] = 'true'

    [status, headers, body]
  end
end
