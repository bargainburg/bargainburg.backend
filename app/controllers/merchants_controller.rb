class MerchantsController < ApplicationController
  load_and_authorize_resource 

  # GET /merchants
  # GET /merchants.json
  def index
    if params[:category_id].present?
      @merchants = @merchants.where(:category_id => params[:category_id])
    end

    @merchants = @merchants.order("name ASC")

    if params[:only_names] == '1'
      @merchants = @merchants.as_json(only: [:name, :id])
    end


    render json: @merchants, callback: params[:callback]
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    if params[:expand_coupons] == '1'
      @coupons = @merchant.coupons.accessible_by(current_ability)
      @merchant = @merchant.as_json.merge(:coupons => @coupons.as_json(only: [:id, :name]))
    end
    render json: @merchant, callback: params[:callback]
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
