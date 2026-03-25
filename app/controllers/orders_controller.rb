class OrdersController < ApplicationController
  before_action :authenticate_user!

  def confirmation
    @order = Order.find(params[:id])
  end
end
