class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories
  def index
    @categories_json = Category.all.map do |category|
      category.format_products
    end

    render json: @categories_json
  end

  # GET /categories/1
  def show
    render json: @category.format_products
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      if Category.where(id: params[:id]).exists?
        @category = Category.find(params[:id])
      elsif 
        render json: { error: "Category id not found" }, status: 404
      end
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.fetch(:category).require(:name)
    end
end
