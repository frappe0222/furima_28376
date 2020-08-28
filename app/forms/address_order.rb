class AddressOrder


  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :address, :city, :building_name, :phone_number,:item_id, :token, :user_id


  with_options presence: true do
    
   validates :address
   validates :city
   validates :token

    VALID_POST_CODE = /\A[0-9]{3}-[0-9]{4}\z/
    validates :postal_code, format: {with: VALID_POST_CODE}
    validates :prefecture_id, numericality: { other_than: 1 }
    VALID_PHONE_NUMBER = /\A\d{11}\z/
    validates :phone_number, format: {with: VALID_PHONE_NUMBER}
  end

  def save

    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,address: address, phone_number: phone_number, building_name: building_name, item_id: item_id)
    # 注文の情報を保存
    Order.create(item_id: item_id, user_id: user_id)
  end

end