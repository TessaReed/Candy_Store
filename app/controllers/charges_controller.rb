class ChargesController < ApplicationController
before_action :set_item
  def new
  end

  def create
  end

  def charge

      # here we check if they have used stripe before with us
      # if current_user.stripeid.present?
      #   stripe_user = Stripe::Customer.retrieve(current_user.stripeid)
      # else
      @amount = @item.price.to_i

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      current_user.stripeid = customer.id
      current_user.save()

      charge = Stripe::Charge.create(
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'aud',
        :customer    => customer.id,
      )
      @transaction = Charge.create(user_id: current_user.id, item_id: @item.id, stripe_charge_id: charge.id)
      @transaction.save
      # current_user.user_id.charges.stripe_charge_id.save

      redirect_to charge_path
      #



    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

private

def set_item
  @item = Item.find(params[:id])
end

end
