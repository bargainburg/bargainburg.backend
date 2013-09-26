class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include CanCan::ControllerAdditions

  check_authorization

  protected

  def current_user
    if user = authenticate_with_http_basic {|e, p| auth(e, p) }
      return user
    else
      return nil
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message.to_json, status: :unauthorized, callback: params[:callback]
  end


  private
  def auth(e, p)
    User.find_by_email(e).authenticate(p)
  end
end
