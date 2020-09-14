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
- has_many :sales

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | string     | null: false                    |
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
- has_one :sale
- has_one :order
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :deli_fee
- belongs_to_active_hash :area
- belongs_to_active_hash :deli_day

## ordersテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| postal     | string     | null: false                    |
| prefect_id | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| tel        | string     | null: false                    |

### Association

- belongs_to :item
- belongs_to_active_hash :prefect

## salesテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
