FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    name_family           {'平野'}
    name_first            {'颯太'}
    kana_name_family      {'ヒラ'}
    kana_name_first       {'ソウ'}  
    birth                 {'1935-03-03'}
    password = '1a'+ Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
