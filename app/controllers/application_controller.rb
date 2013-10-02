class ApplicationController < ActionController::API

  include ActionController::Cookies
  include CanCan::ControllerAdditions

  check_authorization


  helper_method :current_user_session, :current_user

  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: exception.message.to_json, status: :unauthorized, callback: params[:callback]
  end

end
