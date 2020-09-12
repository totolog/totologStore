class Product < ApplicationRecord

    validates :name, presence: true
    validates :price, presence: true
    validates :comment, presence: true
    validates :category, presence: true


    has_many :images, inverse_of: :product
    accepts_nested_attributes_for :images

    has_many :cart_items
    has_many :orders

end
