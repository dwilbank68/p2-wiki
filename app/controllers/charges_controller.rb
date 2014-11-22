class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Wiki Membership - #{current_user.name}",
        amount: Amount.default
    }

    render :layout => false
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
    now = DateTime.now
    current_user.account_activation = now
    current_user.account_expiration = now + 31.days
    current_user.save

    redirect_to current_user, :notice => "Your subscription is active!"



  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  class Amount
    @cost = 4.99

    def self.default
      (@cost*100).to_i
    end

  end

end








