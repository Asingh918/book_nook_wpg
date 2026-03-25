class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user: current_user).includes(:order_items, :province).order(created_at: :desc)
  end

  def confirmation
    @order = Order.find(params[:id])
  end
end
