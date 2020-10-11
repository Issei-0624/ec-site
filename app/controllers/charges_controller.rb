class ChargesController < ApplicationController
    def create
      Stripe.api_key = ENV.fetch('STRIPE_SECRET_KEY')
      token = params[:stripeToken]
      product_ids = params[:product_ids].map(&:to_i)
      products = current_user.cart.products.where(id: product_ids)
      total = products.sum(:price)
      current_user.checkout!(token, product_ids: product_ids)
            
      Stripe::Charge.create({
          amount: total,
          currency: 'jpy',
          description: 'Example charge',
          source: token,
      })
      redirect_to root_path, notice: '決済に成功しました'
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path
    end
end