class Product < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :comment, presence: true
    validates :category, presence: true


    has_many :images, inverse_of: :product
    accepts_nested_attributes_for :images
    
    has_many :cart_items
    
    has_many :orders
    
    # has_many :sizes
    # has_many :order_products
    # accepts_nested_attributes_for :images, :sizes

    def self.search(search)
        if search
            where(["name LIKE ?", "%#{search}"])
        else
            all
        end
    end

end
