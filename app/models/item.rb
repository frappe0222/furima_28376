class Item < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one :item_purchases
  has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_burden
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :estimated_shipping

  #空の投稿を保存できないようにする
  validates :name,:image,:price,:text,:category,:status,:delivery_burden,:shipping_area,:estimated_shipping, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:status_id,:delivery_burden_id,:shipping_area_id,:estimated_shipping_id, numericality: { other_than: 1 } 

  #価格が￥300〜¥9,999,999の間であること
  validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999
   }

end
