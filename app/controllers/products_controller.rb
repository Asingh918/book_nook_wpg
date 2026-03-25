class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.where(active: true).includes(:category)

    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @products = @products.where(
        "LOWER(title) LIKE ? OR LOWER(description) LIKE ?",
        search_term, search_term
      )
    end

    if params[:category_id].present? && params[:category_id] != "0"
      @products = @products.where(category_id: params[:category_id])
    end

    @selected_category = params[:category_id].to_i
    @search_term = params[:search]
  end

  def show
    @product = Product.find(params[:id])
  end
end
