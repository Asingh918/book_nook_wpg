class CartController < ApplicationController
  def show
    @cart_items = get_cart_items
    @total = @cart_items.sum { |item| item[:product].price_cents * item[:quantity] }
  end

  def add
    session[:cart] ||= {}
    product_id = params[:product_id].to_s
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1
    redirect_to cart_path, notice: "Book added to cart!"
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:product_id].to_s)
    redirect_to cart_path, notice: "Book removed from cart."
  end

  def update
    session[:cart] ||= {}
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart].delete(product_id)
    end
    redirect_to cart_path, notice: "Cart updated!"
  end

  private

  def get_cart_items
    return [] if session[:cart].blank?
    items = []
    session[:cart].each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      items << { product: product, quantity: quantity } if product
    end
    items
  end
end
