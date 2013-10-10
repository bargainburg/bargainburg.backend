class CouponsController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]

  # GET /coupons
  # GET /coupons.json
  def index
    if params[:merchant_id].present?
      @merchant = Merchant.find(params[:merchant_id])
      authorize! :read, @merchant
      @coupons = @merchant.coupons.accessible_by(current_ability)
    end

    render json: @coupons, callback: params[:callback]
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    authorize! :read, @coupon.merchant
    render json: @coupon, callback: params[:callback]
  end

  # POST /coupons
  # POST /coupons.json
  def create
	@coupon = Coupon.new(params[:coupon])
    @coupon.merchant = current_user.merchant
    @coupon.category = current_user.merchant.category
    authorize! :create, @coupon
	
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
