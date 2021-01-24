# テーブル設計

## usersテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|nickname            |string          |null: false           |
|email               |string          |null: false           |
|password            |string          |null: false           |
|birthday            |string          |null: false           |

## Association
- has_many :items
- has_many :buyer

## itemsテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|name                |string          |null: false           |
|explanation         |string          |null: false           |
|category            |string          |null: false           |
|state               |string          |null: false           |
|delivery fee        |text            |null: false           |
|shopping address    |string          |null: false           |
|shopping day        |string          |null: false           |

## Association
- belongs_to :users
- has_many :buyer

## buyerテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|users               |references      |                      |
|items               |references      |                      |

## Association
- belongs_to :users
- belongs_to :items

## informationテーブル
|colum               |Type            |option                |
|------------------------------------------------------------|
|card number         |string          |null: false           |
|expiration date     |string          |null: false           |
|security code       |string          |null: false           |
|address number      |string          |null: false           |
|prefectures         |string          |null: false           |
|city                |string          |null: false           |
|address             |string          |null: false           |
|phone number        |string          |null: false           |

## Association
- belongs_to :buyer






