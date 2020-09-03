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

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| name           | string  | null: false, unique: true      |
| email          | string  | null: false, unique: true      |
| password       | string  | null: false                    |
| first_name     | string  | null: false                    |
| last_name      | string  | null: false                    |
| fist_name_kana | string  | null: false                    |
| last_name_kana | string  | null: false                    |
| birth          | date    | null: false                    |

### Association

- has_many :items

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| detail         | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| deli_fee_id    | integer    | null: false                    |
| area_id        | integer    | null: false                    |
| deli_day_id    | integer    | null: false                    |
| price          | integer    | null: false                    |
| like           | integer    |                                |

### Association

- belongs_to :user
- has_one :buyer
- has_one :sale
- has_one_attached :image
- belongs_to_active_hash :item_state
- belongs_to_active_hash :deliver

## customersテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| postal     | integer    | null: false                    |
| prefect_id | integer    | null: false                    |
| city       | string     | null: false                    |
| adress     | string     | null: false                    |
| building   | string     |                                |
| tel        | integer    | null: false                    |

### Association

- belongs_to :item
- belongs_to_active_hash :prefect

## salesテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| sold       | boolean    |                                |

### Association

- belongs_to :item