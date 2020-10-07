class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    cart = current_user.prepare_cart
    @products = cart.products
  end
end