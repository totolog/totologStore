class OrderProduct < ApplicationRecord

    validates :name1, presence: true
    belongs_to :order
    belongs_to :product
end
