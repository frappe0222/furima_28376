class Item < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one :item_purchases
  has_one_attached :image

  validates :name,:image,:price,:text,:category_id,:status_id,:delivery_burden_id,:shipping_area_id,:estimated_shipping_id, presence: true

end
