class User < ActiveRecord::Base
  has_one :merchant
  has_secure_password


  acts_as_authentic do |c|
    c.login_field = :email
    c.validate_login_field = false
    c.validate_email_field = false
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  validates_presence_of [:password_confirmation, :password, :email], :on => :create

  # change this to a db validation if using sharding
  validates :email, uniqeness: true
end
