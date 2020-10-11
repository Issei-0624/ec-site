class Admin < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :purchase_record_products, through: :products

  
  def sales
    sold_products = self.products.joins(:purchase_record_products)
    sold_products.sum(:price)
  end
  
  def sales_one_month
    sold_products = products.joins(:purchase_record_products).where({ purchase_record_products: {created_at: Time.now.all_month} })
    sold_products.sum(:price)
  end 
  
end
