class User < ApplicationRecord
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  Devise.setup do |config|
    config.scoped_views = true
  end
  
    has_one :cart, dependent: :destroy
    has_one :purchase_record,dependent: :destroy
    
    def prepare_cart
      cart || create_cart
    end
    
    def prepare_purchase_record
      purchase_record || create_purchase_record
    end
    
    def checkout!(token, product_ids:)
      transaction do
        cart_products = cart.cart_products.where(product_id: product_ids)
        cart_products.each(&:destroy!)
        
        purchase_record = prepare_purchase_record
        ids = product_ids.map{ |id| { product_id: id } }
        purchase_record.purchase_record_products.create!(ids)
      end
    end
    
end
