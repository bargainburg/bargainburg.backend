class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  protected

  def current_user
    if user = authenticate_or_request_with_http_basic {|e, p| auth(e, p) }
      return user
    else
      return nil
    end
  end

  def require_authentication
    head :unauthorized if current_user.nil?
  end

  private
  def auth(e, p)
    User.find_by_email(e).authenticate(p)
  end
end
