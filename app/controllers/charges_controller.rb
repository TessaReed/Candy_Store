class ChargesController < ApplicationController
  def new
end

def create
  # Amount in cents

  @amount = @item.price


  # here we check if they have used stripe before with us
  if current_user.stripeid.present?
    customer = Stripe::Customer.id
  else
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  #   current_user.stripeid = customer.id
  # end

  stripe_charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  # redirect_to charge_path

  # Here we backup to local our charge/receipt thing
    if 

    @item = item_id
    @charge = Charge.new(price: @amount)
    @charge = current_user
    @charge.user_id = charge.id
    if @charge.save
      redirect_to charge_path(@charge)
    else
      redirect_to item_path(@item)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
