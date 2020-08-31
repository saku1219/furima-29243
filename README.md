# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_reading | string | null: false |
| first_name_reading  | string | null: false |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| image              | text       | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | integer    | null: false                    |
| shipping_payer     | integer    | null: false                    |
| shipping_from_area | integer    | null: false                    |
| shipping_duration  | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| comment            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## Addressed テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| tell               | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

belongs_to :order