class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.json
  def index
	if params[:merchant_id].present?
		@coupons = Coupon.where(:merchant_id => params[:merchant_id])
	else
		@coupons = Coupon.all
	end

	if (params[:callback].present?)
		render json: @coupons, callback: params[:callback]
	else
		render json: @coupons
	end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    @coupon = Coupon.find(params[:id])

	if (params[:callback].present?)
		render json: @coupon, callback: params[:callback]
	else
		render json: @coupon
	end
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(params[:coupon])

    if @coupon.save
      render json: @coupon, status: :created, location: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    @coupon = Coupon.find(params[:id])

    if @coupon.update(params[:coupon])
      head :no_content
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    head :no_content
  end
end
