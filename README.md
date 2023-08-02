# README

## users

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|last_name          |string |null: false               |
|first_name         |string |null: false               |
|last_name_kana     |string |null: false               |
|first_name_kana    |string |null: false               |
|birth_date         |date   |null: false               |

### Association
- has_many :items
- has_many :orders


## items

|Column            |Type       |Options                        |
|------------------|-----------|-------------------------------|
|user_id           |references |null: false, foreign_key: true |
|name              |string     |null: false                    |
|description       |text       |null: false                    |
|category_id       |integer    |null: false                    |
|item_condition_id |integer    |null: false                    |
|shipping_cost_id  |integer    |null: false                    |
|prefecture_id     |integer    |null: false                    |
|shipping_date_id  |integer    |null: false                    |
|price             |integer    |null: false                    |

### Association
- belongs_to :user
- has_one :order


## orders

|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user_id |references |null: false, foreign_key: true |
|item_id |references |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|order_id      |references |null: false, foreign_key: true|
|postal_code   |integer    |null: false                   |
|prefecture_id |integer    |null: false                   |
|city          |string     |null: false                   | 
|addresses     |string     |null: false                   |
|building      |string     |                              |
|phone_number  |string     |null: false                   |

### Association
belongs_to :order