class ChargesController < ApplicationController
  def new
  end

  # rubocop:disable all
  def create
    @amount_cents = 500

    @customer = Stripe::Customer.create(
      email:         'example@stripe.com',
      card:          params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @amount_cents,
      description:  'Rails Stripe customer',
      currency:     'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  # rubocop:enable all
end

