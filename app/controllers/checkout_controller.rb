class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart_items = get_cart_items
    @provinces  = Province.all.order(:name)
    @province   = Province.find_by(code: 'MB') || Province.first
    calculate_totals(@province)
  end

  def update_province
    @cart_items = get_cart_items
    @provinces  = Province.all.order(:name)
    @province   = Province.find(params[:province_id])
    calculate_totals(@province)
    render :new
  end

  def create
    @cart_items = get_cart_items
    @province   = Province.find(params[:province_id])
    calculate_totals(@province)

    order = Order.new(
      user:           current_user,
      province:       @province,
      status:         'pending',
      subtotal_cents: @subtotal,
      tax_cents:      @tax,
      total_cents:    @total,
      street:         params[:street],
      city:           params[:city],
      postal_code:    params[:postal_code]
    )

    if order.save
      @cart_items.each do |item|
        tax_rate = @province.hst > 0 ? @province.hst : (@province.gst + @province.pst)
        order.order_items.create!(
          product:          item[:product],
          quantity:         item[:quantity],
          unit_price_cents: item[:product].price_cents,
          tax_rate:         tax_rate
        )
      end
      session[:cart] = {}
      redirect_to order_confirmation_path(order), notice: "Order placed successfully!"
    else
      @provinces = Province.all.order(:name)
      render :new
    end
  end

  private

  def get_cart_items
    return [] if session[:cart].blank?
    session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      { product: product, quantity: quantity } if product
    end.compact
  end

  def calculate_totals(province)
    return if province.nil?
    @subtotal = get_cart_items.sum { |i| i[:product].price_cents * i[:quantity] }
    tax_rate  = province.hst > 0 ? province.hst : (province.gst + province.pst)
    @tax      = (@subtotal * tax_rate).round
    @total    = @subtotal + @tax
  end
end
