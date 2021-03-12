# テーブル設計

## usersテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|nickname            |string          |null: false           |
|first_name          |string          |null: false           |
|second_name         |string          |null: false           |
|first_name_furigana |string          |null: false           |
|second_name_furigana|string          |null: false           |
|email               |string          |null: false           |
|encrypted_password  |string          |null: false           |
|birthday            |date            |null: false           |

## Association
- has_many :items
- has_many :orders

## itemsテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|name                |string          |null: false           |
|explanation         |text            |null: false           |
|category_id         |integer         |null: false           |
|state_id            |integer         |null: false           |
|delivery_fee_id     |integer         |null: false           |
|shopping_address_id |integer         |null: false           |
|shopping_day_id     |integer         |null: false           |
|price               |integer         |null: false           |
|user                |references      |foreign_key: true     |

## Association
- belongs_to :user
- has_one :orders

## ordersテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|user                |references      |foreign_key: true     |
|item                |references      |foreign_key: true     |

## Association
- belongs_to :user
- belongs_to :item
- has_one :information

## informationsテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|build               |string          |                      |
|address_number      |string          |null: false           |
|shopping_address_id |integer         |null: false           |
|city                |string          |null: false           |
|address             |string          |null: false           |
|phone_number        |string          |null: false           |
|buyer_id            |integer         |foreign_key: true     |

## Association
- belongs_to :order






