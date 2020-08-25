class AddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :Prefectures_id, :address, :city, :building_name, :phone_number,:item_id,:user_id

  with_options presence: true do :address, :city

    VALID_POST_CODE = /\A[0-9]{3}-[0-9]{4}\z/
    validates :postal_code, format: {with: VALID_POST_CODE, message: "is invalid. Include hyphen(-)"}
    validates :Prefectures_id, numericality: { other_than: 1 }
    VALID_PHONE_NUMBER = /^\d{11}$/
    validates :phone_number, format: {with: VALID_PHONE_NUMBER, message:"ハイフンなしで登録してください"}
  end

  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, item_id: item.id)
    # 注文の情報を保存
    Donation.create(item_id: item.id, user_id: user.id)
  end

end