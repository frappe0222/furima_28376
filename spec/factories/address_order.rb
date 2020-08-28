FactoryBot.define do
  factory :address_order do
   
    token {'h63yrtkb'}
    item_id {'8'}
    postal_code { '557-0012' }
    prefecture_id { '3' }
    city { '大阪市西成区聖天下' }
    address { '2-6-12' }
    building_name { '大葉マンション' }
    phone_number { '08061211282' }
  end
end