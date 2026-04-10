class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.find(params[:order_id])
    @publishable_key = Rails.application.credentials.dig(:stripe, :publishable_key)
  end

  def create
    @order = Order.find(params[:order_id])

    begin
      payment_intent = Stripe::PaymentIntent.create({
        amount: @order.total_cents,
        currency: "cad",
        payment_method: params[:payment_method_id],
        confirm: true,
        return_url: order_confirmation_url(@order),
        metadata: {
          order_id: @order.id,
          user_id: current_user.id
        }
      })

      @order.update!(
        stripe_payment_id: payment_intent.id,
        status: "paid"
      )

      redirect_to order_confirmation_path(@order), notice: "Payment successful! Order confirmed."
    rescue Stripe::CardError => e
      redirect_to new_payment_path(order_id: @order.id), alert: e.message
    rescue Stripe::StripeError => e
      redirect_to new_payment_path(order_id: @order.id), alert: "Payment failed: #{e.message}"
    end
  end
end
