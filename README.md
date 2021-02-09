# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_one  :order

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         |            | ActiveStorageで実装            |
| title         | string     | null: false                    |
| description   | string     | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| category      |            | ActiveHashで実装               |
| status        |            | ActiveHashで実装               |
| shopping_cost |            | ActiveHashで実装               |
| shopping_area |            | ActiveHashで実装               |
| shopping_days |            | ActiveHashで実装               |

### Association

- belong_to :user
- has_one   :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one   :address

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone_number | integer    | null: false                    |
| postal_code  |            | ActiveHashで実装               |
| prefectures  |            | ActiveHashで実装               |
| city         |            | ActiveHashで実装               |
| block        |            | ActiveHashで実装               |
| build        |            | ActiveHashで実装               |
| orders       | references | null: false, foreign_key: true |

### Association

- belong_to :order