class UserSessionsController < ApplicationController
  skip_authorization_check

  def create
    @user_session = UserSession.new(:email => params[:email],
                                    :password => params[:password],
                                    :remember_me => params[:remember_me])
    if @user_session.save
      if @user_session.user.merchant
        render json: {:user_id => @user_session.user.id, :merchant_id => @user_session.user.merchant.id}, callback: params[:callback]
      else
        render json: {:user_id => @user_session.user.id}, callback: params[:callback]
      end
    else
      head :bad_request
    end
  end

  def destroy
    if current_user_session
      current_user_session.destroy
    end
    head :no_content
  end
end
