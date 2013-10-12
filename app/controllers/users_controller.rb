class UsersController < ApplicationController
  load_and_authorize_resource

  # POST /users
  def create
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

end
