class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  Devise.setup do |config|
    config.scoped_views = true
  end
  
    has_many :products
    
    has_one :cart, dependent: :destroy
    
    def prepare_cart
      cart || create_cart
    end
end
