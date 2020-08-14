class Item < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one :item_purchases
  has_one_attached :image
  belongs_to_active_hash :category

  #空の投稿を保存できないようにする
  validates :name,:image,:price,:text,:category,:status,:delivery_burden,:shipping_area,:estimated_shipping, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
end

end
