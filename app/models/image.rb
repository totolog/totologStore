class Image < ApplicationRecord
    validates :name1, presence: true
    belongs_to :product, inverse_of: :images

    mount_uploader :name1, Name1Uploader
    mount_uploader :name2, Name2Uploader
    mount_uploader :name3, Name3Uploader
    mount_uploader :name4, Name4Uploader
end
