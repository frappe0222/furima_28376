require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
      before do
        @item = FactoryBot.build(:item, :with_imege)
        @item.image = fixture_file_upload('public/images/test.png')
      end


      it '全てカラムが存在してると登録できる'do
        expect(@item).to be_valid
      end

      it "値段が300より小さかった時に出品できないこと" do
        @item.price="299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
  
      it "値段が9999999より大きかった時に出品できないこと" do
        @item.price="10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it "nameが空では登録できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "priceが空では登録できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "category_idが空では登録できないこと" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "textが空では登録できないこと" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "status_idが空では登録できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "delivery_burden_idが空では登録できないこと" do
        @item.delivery_burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it "shipping_area_idが空では登録できないこと" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "estimated_shipping_idが空では登録できないこと" do
        @item.estimated_shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
      end

      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "アクティブハッシュのidが1ではでは登録できないこと" do
        @item.estimated_shipping_id = "1"
        @item.shipping_area_id = "1"
        @item.delivery_burden_id = "1"
        @item.category_id = "1"
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1", "Status must be other than 1", "Delivery burden must be other than 1", "Shipping area must be other than 1", "Estimated shipping must be other than 1")
      end
  end
end