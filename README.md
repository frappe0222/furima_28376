# テーブル設計

## users テーブル

| Column              | Type        | Options          |
| ------------------- | ----------- | ---------------- |
| nickname            | string      | null: false      |
| username_family     | string      | null: false      |
| username_first      | string      | null: false      |
| username kana_family| string      | null: false      |
| username kana_first | string      | null: false      |
| email               | string      | null: false      |
| passwaord           | string      | null: false      |
| birth               | date        | null: false      |

### Association

- has_many :item
- has_many :order
- has_many :transaction

## items テーブル

| Column               | Type         | Options                             |
| -------------------- | ------------ | ----------------------------------- |
| user                 | references   | null: false, foreign_key: true      |
| item_name            | string       | null: false                         |
| item_price           | integer      | null: false                         |
| item_text            | text         | null: false                         |
| item_category        | string       | null: false                         |
| item_status          | string       | null: false                         |
| item_imege           | string       | null: false                         |
| delivery_burden      | string       | null: false                         |
| shipping_area        | string       | null: false                         |
| Estimated_shipping   | string       | null: false                         |

### Association

- belongs_to :user
- has_one :order
- has_many :transaction

## orders テーブル

| Column                           | Type        | Options                            |
| -------------------------------- | ----------- | ---------------------------------- |
| user                             | references  | null: false, foreign_key: true     |
| item                             | references  | null: false, foreign_key: true     |
| shipping address_postal code     | integer     | null: false                        |
| Prefectures_id                   | string      | null: false                        |
| shipping address_city            | string      | null: false                        |
| shipping address_address         | string      | null: false                        |
| shipping address_building name   | string      |                                    |
| shipping address_phone numbe     | string      | null: false                        |

### Association

- belongs_to :user
- belongs_to :item

## transactions テーブル

| Column                           | Type        | Options                            |
| -------------------------------- | ----------- | ---------------------------------- |
| user                             | references  | null: false, foreign_key: true     |
| item                             | references  | null: false, foreign_key: true     |
| message                          | text        | null: false                        |

### Association

- belongs_to :user
- belongs_to :item