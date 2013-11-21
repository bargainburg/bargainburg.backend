class CategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /categories
  # GET /categories.json
  def index
    if params[:expand_merchants] == "1" && Merchant.count > 0
      merchant_conditions = current_ability.model_adapter(Merchant, :index).conditions
      @categories = @categories.includes(:merchants).where(:merchants => merchant_conditions).order("categories.name ASC, merchants.name ASC").to_json(:include => { merchants: {only: [:name, :id]}})
    else
      @categories = @categories.order("name ASC")
    end

    render json: @categories, callback: params[:callback]
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    render json: @category, callback: params[:callback]
  end

  # POST /categories
  # POST /categories.json
  def create
    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(params[:category])
      head :no_content
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    head :no_content
  end
end
