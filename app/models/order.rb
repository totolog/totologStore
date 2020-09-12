class Order < ApplicationRecord
    belongs_to :address
    belongs_to :product
end
