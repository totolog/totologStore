class Product < ApplicationRecord

    validates :name, presence: true
    validates :price, presence: true
    validates :comment, presence: true
    validates :type, presence: true

    self.inheritance_column = :_type_disabled
    
    mount_uploader :image_name, ImageNameUploader
end
