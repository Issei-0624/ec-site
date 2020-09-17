class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if signed_in?
      @products = Product.order(id: :desc).page(params[:page]).per(10)
    end
  end
end
