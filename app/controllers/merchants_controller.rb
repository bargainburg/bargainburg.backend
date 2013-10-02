class MerchantsController < ApplicationController
  load_and_authorize_resource

  # GET /merchants
  # GET /merchants.json
  def index
    if params[:category_id].present?
		@merchants = Merchant.where(:category_id => params[:category_id]).order("name ASC")
	else
		@merchants = Merchant.order("name ASC")
	end

	if (params[:callback].present?)
		render json: @merchants, callback: params[:callback]
	else
		render json: @merchants
	end
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show

	if (params[:callback].present?)
		render json: @merchant, callback: params[:callback]
	else
		render json: @merchant
	end
  end

  # POST /merchants
  # POST /merchants.json
  def create

    if @merchant.save
      render json: @merchant, status: :created, location: @merchant
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update

    if @merchant.update(params[:merchant])
      head :no_content
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy

    @merchant.destroy

    head :no_content
  end
end
