FactoryBot.define do

  factory :item do
    user_id                  {'1'}
    name                     {'ワンピース'}
    price                    {'5000'}
    text                     {'白色のワンピ'}
    category_id              {'2'}
    status_id                {'2'}
    delivery_burden_id       {'2'}
    shipping_area_id         {'2'}
    estimated_shipping_id    {'2'}
    trait :with_imege do
      image { fixture_file_upload Rails.root.join('public', 'images', 'test.png'), 'image/png' }
    end
    association :user

  end
end
