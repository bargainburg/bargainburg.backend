class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
	p params
	if (params[:expand_merchants].present?) && (params[:expand_merchants] == "1")
		@categories = Category.includes(:merchants).as_json(:include => { merchants: {only: [:name, :id]}})
		p @categories
	else
		@categories = Category.all
	end

    render json: @categories
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    render json: @category
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    if @category.update(params[:category])
      head :no_content
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    head :no_content
  end
end
