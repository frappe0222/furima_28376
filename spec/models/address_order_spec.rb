require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '注文情報の保存' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @address_order.postal_code = ""
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeはハイフン(-)を含む正しい形式でないと保存できないこと' do
      @address_order.postal_code = '1234567'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @address_order.prefecture_id = "1"
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @address_order.city = ""
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @address_order.address = ""
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_order.phone_number = ""
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberハイフン(-)を含まない11桁以内でないと保存できないこと' do
      @address_order.phone_number = '012-3456-7890'
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが含まれてないと保存できない' do
      @address_order.token = ""
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end