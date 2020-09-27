class ProductsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @product = Product.new
  end
  
  def show
    
  end

  def create
      @product = current_user.products.new(product_params)
      if @product.save
          flash[:success] = "Productが正常に投稿されました"
          redirect_to root_path
      else
          flash.now[:danger] = "Productが正常に投稿されませんでした"
          render :new
      end
  end 

  def destroy
  end
end

  private
  
  def product_params
      params.require(:product).permit(:name, :description, :price, :image)
  end
  
  def correct_user
    @product = current_user.products.find_by(hashid: params[:hashid])
    @product.hashid
    unless @product
      redirect_to root_url
    end
  end
