class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.where(active: true)
    @categories = Category.all
  end
end
