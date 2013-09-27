class MerchantsController < ApplicationController
  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.all

	if (params[:callback].present?)
		render json: @merchants, callback: params[:callback]
	else
		render json: @merchants
	end
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    @merchant = Merchant.find(params[:id])

    if params[:expand_coupons] == '1'
      @merchant = @merchant.as_json(:include => :coupons)
    end

	if (params[:callback].present?)
		render json: @merchant, callback: params[:callback]
	else
		render json: @merchant
	end
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(params[:merchant])

    if @merchant.save
      render json: @merchant, status: :created, location: @merchant
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update(params[:merchant])
      head :no_content
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    head :no_content
  end
end
