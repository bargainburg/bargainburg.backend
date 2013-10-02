class UserSession < Authlogic::Session::Base
  self.verify_password_method = :authenticate
  self.allow_http_basic_auth = false
end
