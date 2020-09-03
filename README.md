# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| name        | string  | null: false, unique: true      |
| email       | string  | null: false, unique: true      |
| password    | string  | null: false                    |
| first_name  | string  | null: false                    |
| last_name   | string  | null: false                    |
| fist_kana   | string  | null: false                    |
| last_kana   | string  | null: false                    |
| year_id     | integer | null: false                    |
| month_id    | integer | null: false                    |
| day_id      | integer | null: false                    |

### Association

- has_many :items
- has_many :comments
- belongs_to_active_hash :birth

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| users_id       | references | null: false, foreign_key: true |
| image          | text       | null: false                    |
| detail         | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| deli_fee_id    | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| deli_day_id    | integer    | null: false                    |
| favorite       | integer    |                                |
| sold           | boolean    |                                |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer
- has_one_attached :image
- belongs_to_active_hash :item_state
- belongs_to_active_hash :deliver

## commentsテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyersテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| items_id   | references | null: false, foreign_key: true |
| postal     | integer    | null: false                    |
| prefect_id | integer    | null: false                    |
| city       | string     | null: false                    |
| adress     | string     | null: false                    |
| building   | string     |                                |
| tel        | integer    | null: false                    |

### Association

- belongs_to :item
- has_one :credit
- belongs_to_active_hash :prefect

## creditテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| buyers_id    | references | null: false, foreign_key: true |
| credit_num   | integer    | null: false                    |
| exp_month_id | integer    | null: false                    |
| exp_year_id  | integer    | null: false                    |
| pin          | integer    | null: false                    |

### Association

- belongs_to :byer
- belongs_to_active_hash :expire