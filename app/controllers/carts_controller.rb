class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    cart = current_user.prepare_cart
    @product = cart.products
  end
end
