class UserSession < Authlogic::Session::Base
  self.verify_password_method = :authenticate
end
