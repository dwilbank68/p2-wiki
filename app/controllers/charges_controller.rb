class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "BigMoney Membership - #{current_user.name}",
        amount: Amount.default
    }
  end

  def create
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: Amount.default,
        description: "Wiki Membership - #{current_user.email}",
        currency: 'usd'
    )

    flash[:success] = "Thanks for the money, #{current_user.email}!"

    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.save

    redirect_to profile_path, :notice => "Your subscription is active!"



  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  class Amount
    @cost = 4.99
    def self.default
      @cost*100
    end
  end

end








