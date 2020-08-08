# テーブル設計

## users テーブル

| Column              | Type        | Options          |
| ------------------- | ----------- | ---------------- |
| nickname            | string      | null: false      |
| name_family         | string      | null: false      |
| name_first          | string      | null: false      |
| kana_name_family    | string      | null: false      |
| kana_name_first     | string      | null: false      |
| email               | string      | null: false      |
| passwaord           | string      | null: false      |
| birth               | date        | null: false      |

### Association

- has_many :item_purchases
- has_many :item

## items テーブル

| Column               | Type         | Options                             |
| -------------------- | ------------ | ----------------------------------- |
| user                 | references   | null: false, foreign_key: true      |
| name                 | string       | null: false                         |
| price                | integer      | null: false                         |
| text                 | text         | null: false                         |
| category_id          | integer      | null: false                         |
| status_id            | integer      | null: false                         |
| imege                | string       | null: false                         |
| delivery_burden_id   | integer      | null: false                         |
| shipping_area_id     | integer      | null: false                         |
| Estimated_shipping_id| integer      | null: false                         |

### Association

- belongs_to :user
- has_one :address
- has_one :item_purchases

## addresses テーブル

| Column                           | Type        | Options                            |
| -------------------------------- | ----------- | ---------------------------------- |
| item                             | references  | null: false, foreign_key: true     |
| postal_code                      | string      | null: false                        |
| Prefectures_id                   | integer     | null: false                        |
| city                             | string      | null: false                        |
| address                          | string      | null: false                        |
| building_name                    | string      |                                    |
| phone_numbe                      | string      | null: false                        |

### Association

- belongs_to :item

## item_purchases テーブル

| Column                           | Type        | Options                            |
| -------------------------------- | ----------- | ---------------------------------- |
| user                             | references  | null: false, foreign_key: true     |
| item                             | references  | null: false, foreign_key: true     |

### Association

- belongs_to :user
- belongs_to :item