class Item < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one :item_purchases
  has_one_attached :image
end
