class UserSessionsController < ApplicationController
  skip_authorization_check

  def create
    @user_session = UserSession.new(:email => params[:email],
                                    :password => params[:password],
                                    :remember_me => params[:remember_me])
    if @user_session.save
      render json: @user_session.user.id, callback: params[:callback]
    else
      head :not_found
    end
  end

  def destroy
    if current_user_session
      current_user_session.destroy
    end
    head :no_content
  end
end
