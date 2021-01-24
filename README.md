# テーブル設計

## usersテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|first_name          |string          |null: false           |
|second_name         |string          |null: false           |
|first_name_furigana |string          |null: false           |
|second_name_furigana|string          |null: false           |
|email               |string          |null: false           |
|encrypted_password  |string          |null: false           |
|birthday            |date            |null: false           |

## Association
- has_many :items
- has_many :buyers

## itemsテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|name                |string          |null: false           |
|explanation         |string          |null: false           |
|category            |string          |null: false           |
|state_id            |integer         |null: false           |
|delivery_fee_id     |integer         |null: false           |
|shopping_address_id |integer         |null: false           |
|shopping_day_id     |integer         |null: false           |

## Association
- belongs_to :users
- has_one :buyer

## buyersテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|users               |references      |                      |
|items               |references      |                      |

## Association
- belongs_to :users
- belongs_to :items

## informationsテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|address_number      |string          |null: false           |
|shopping_address_id |integer         |null: false           |
|city                |string          |null: false           |
|address             |string          |null: false           |
|phone_number        |string          |null: false           |

## Association
- belongs_to :buyer






