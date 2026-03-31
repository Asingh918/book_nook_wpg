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

    case params[:filter]
    when 'on_sale'
      @products = @products.where(on_sale: true)
    when 'new'
      # Shows books created in last 3 days
      @products = @products.where("created_at >= ?", 3.days.ago)
    when 'recently_updated'
      # Shows books updated in last 3 days but NOT new ones
      @products = @products.where(
        "updated_at >= ? AND created_at < ?",
        3.days.ago, 3.days.ago
      )
    end

    @selected_category = params[:category_id].to_i
    @search_term = params[:search]
    @active_filter = params[:filter]
    @products = @products.page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end
end
