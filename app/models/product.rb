class Product < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true
    validates :description, presence: true
    
    has_many :cart_products, dependent: :destroy   
    
    has_many :purchase_record_products, dependent: :destroy
 
end
