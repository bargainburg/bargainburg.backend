class UsersController < ApplicationController
  skip_authorization_check

  # POST /users
  def create
    current_user_session.destroy
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

end
