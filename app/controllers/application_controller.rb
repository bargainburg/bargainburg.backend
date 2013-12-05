class ApplicationController < ActionController::API
  include ActionController::Cookies
  include CanCan::ControllerAdditions

  check_authorization :unless => :options_check

  helper_method :current_user_session, :current_user

  def options_check
    #Render and Redirect both cause AbstractController::DoubleRenderError
    #render :text => '', :content_type => 'text/plain' 
    #redirect_to request.original_url

    #method must do something or CanCan::AuthorizationNotPerformed
    #on cross_origin_allow_admin
    p "options_check called"
  end

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
