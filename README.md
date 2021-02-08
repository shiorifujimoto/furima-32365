# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | string     | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :orders

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| credit_card_number | integer    | null: false                    |
| exp_month          | integer    | null: false                    |
| exp_year           | integer    | null: false                    |
| approval_code      | integer    | null: false                    |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item