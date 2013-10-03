class CouponsController < ApplicationController
  load_and_authorize_resource

  # GET /coupons
  # GET /coupons.json
  def index
    if params[:merchant_id].present?
      @coupons = @coupons.where(:merchant_id => params[:merchant_id])
    end

    render json: @coupons, callback: params[:callback]
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    render json: @coupon, callback: params[:callback]
  end

  # POST /coupons
  # POST /coupons.json
  def create
    if @coupon.save
      render json: @coupon, status: :created, location: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    if @coupon.update(params[:coupon])
      head :no_content
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    head :no_content
  end
end
