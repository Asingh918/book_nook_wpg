class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true).includes(:category)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
