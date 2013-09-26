class CategoriesController < ApplicationController

  # GET /categories
  # GET /categories.json
  def index
	if (params[:expand_merchants].present?) && (params[:expand_merchants] == "1")
		# this line may need to be edited in the futute to remove the to_json
		# so that changes can be made after this if statement but before the render
		@categories = Category.includes(:merchants).to_json(:include => { merchants: {only: [:name, :id]}})
	else
		@categories = Category.all
	end

	if (params[:callback].present?)
		render json: @categories, callback: params[:callback]
	else
		render json: @categories
	end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

	if (params[:callback].present?)
		render json: @category, callback: params[:callback]
	else
		render json: @category
	end
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
