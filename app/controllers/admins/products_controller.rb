class Admins::ProductsController < Admins::ApplicationController
  def new
    @product = current_admin.products.build
  end
  
  def create
    @product = current_admin.products.build(product_params)
      if @product.save
          flash[:success] = "Productが正常に作成されました"
          redirect_to root_path
      else
          flash.now[:danger] = "Productが正常に再生されませんでした"
          render :new
      end
  end
  
  private
  
  def product_params
      params.require(:product).permit(:name, :description, :price, :image)
  end
end