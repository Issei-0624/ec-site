class Product < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    
    validates :name, presence: true
    validates :description, presence: true
end
